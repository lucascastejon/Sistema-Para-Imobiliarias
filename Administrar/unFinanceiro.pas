unit unFinanceiro;

interface

uses ZDataset, SysUtils, Classes, unUtilitario, DateUtils, DB, Math;

function getPeriodoConta(codigoConta: Integer): String;
function getDinheiroTotal(valor, juros, multa, desconto, dataVenc, dataPgto, codCalculo: String): Currency;
function getPorcToDinh(porcentagem, total: String): Currency;
function getDinhToPorc(dinheiro, total: String): Currency;
function converteValorPorcentagem(valor, total: String; porcentagem: boolean): string;


procedure cadastraConta(CAIXA, ID_CAIXA, ID_CATEGORIA, ID_SUBTIPO, ID_TIPO, ID_PESSOA, ID_IMOVEL, ID_CONTRATO, ID_FUNCIONARIO, ID_ENTRADA, ID_SAIDA, DATA_REF, DATA_CAD, DATA_ALT, DOCUMENTO, OPERACAO, VALOR, VALOR_JUROS, VALOR_MULTA, VALOR_DESCONTO, PARCELA, PENDENTE, ATIVO, GARANTIDO: String);

implementation

uses FrmPrincipal, unLog;

var
  UltimoCodigo: integer;

function converteValorPorcentagem(valor, total: String; porcentagem: boolean): string;
begin

Result := '0';

Try
   if StrToCurr(valor) <= 0 then
      Exit;

   if StrToCurr(total) <= 0 then
      Exit;

   if porcentagem then //É PORCENTAGEM
        result := FloatToStr(getPorcToDinh(valor, total))
   else
        result := FloatToStr(getDinhToPorc(valor, total));
   
Except
      Result := '0';
end;

end;

//Cadastra uma conta no financeiro
procedure cadastraConta(CAIXA, ID_CAIXA, ID_CATEGORIA, ID_SUBTIPO, ID_TIPO, ID_PESSOA, ID_IMOVEL, ID_CONTRATO, ID_FUNCIONARIO, ID_ENTRADA, ID_SAIDA, DATA_REF, DATA_CAD, DATA_ALT, DOCUMENTO, OPERACAO, VALOR, VALOR_JUROS, VALOR_MULTA, VALOR_DESCONTO, PARCELA, PENDENTE, ATIVO, GARANTIDO: String);
Var varSQL: TZQuery;
Begin
     IF Length(ID_CAIXA) = 0 Then
        ID_CAIXA := '0';
        
     if (StrToInt(ID_CAIXA) <= 0) Then
     Begin
           varSQL := unUtilitario.getSelect('SELECT ID FROM sp_gen_CAIXA_'+CAIXA+'_id');
           ID_CAIXA := varSQL.Fields[0].AsString;
           //varSQL.Close;
     End;

     UltimoCodigo := StrToInt(ID_CAIXA);

     if (StrToInt(ID_CATEGORIA) <= 0) Then
     Begin
          PRINCIPAL.setMensagem('Parâmetro errado! cadastraConta() ID_CATEGORIA - Favor escolher uma Categoria.');
          ID_CATEGORIA := '1';
     End;

     if (StrToInt(ID_TIPO) <= 0) Then
     Begin
          PRINCIPAL.setMensagem('Parâmetro errado! cadastraConta() ID_TIPO - Favor escolher um tipo.');
          ID_TIPO := '2';
     End;

     if (StrToInt(ID_SUBTIPO) <= 0) Then
     Begin
          PRINCIPAL.setMensagem('Parâmetro errado! cadastraConta() ID_SUBTIPO - Favor escolher um subtipo.');
          ID_SUBTIPO := '36';
     End;

     if (StrToInt(ID_PESSOA) <= 0) Then
     Begin
          PRINCIPAL.setMensagem('Parâmetro errado! cadastraConta() ID_SUBTIPO - Favor escolher um subtipo.');
          ID_PESSOA := '0';
     End;

     if (StrToInt(ID_FUNCIONARIO) <= 0) Then
     Begin
          PRINCIPAL.setMensagem('Parâmetro errado! cadastraConta() ID_FUNCIONARIO - Não foi possível receber o código do usuário.');
          Exit;
     End;

     //Acabar de fazer as verificações aqui!

     try
        varSQL := unUtilitario.getSQL('INSERT INTO CAIXA_'+CAIXA+' (ID_CAIXA, ID_CATEGORIA, ID_SUBTIPO, ID_TIPO, ID_PESSOA, ID_IMOVEL, ID_CONTRATO, ID_FUNCIONARIO, ID_ENTRADA, ID_SAIDA, DATA_REF, DATA_CAD, DATA_ALT, DOCUMENTO,'+' OPERACAO, VALOR, VALOR_JUROS, VALOR_MULTA, VALOR_DESCONTO, PARCELA, PENDENTE, ATIVO, GARANTIDO) VALUES '+
        ' ('+ID_CAIXA+', '+ID_CATEGORIA+', '+ID_SUBTIPO+', '+ID_TIPO+', '+ID_PESSOA+', '+ID_IMOVEL+', '+ID_CONTRATO+', '+ID_FUNCIONARIO+', '+ID_ENTRADA+', '+ID_SAIDA+', '''+unUtilitario.formataDataSQL(DATA_REF)+''', '''+unUtilitario.formataDataSQL(DATA_CAD)+''', '''+unUtilitario.formataDataSQL(DATA_ALT)+''', '''+DOCUMENTO+''', '''+OPERACAO+''', '+unUtilitario.formataDinheiroSQL(VALOR)+', '+unUtilitario.formataDinheiroSQL(VALOR_JUROS)+', '+unUtilitario.formataDinheiroSQL(VALOR_MULTA)+', '+unUtilitario.formataDinheiroSQL(VALOR_DESCONTO)+', '+PARCELA+', '''+PENDENTE+''', '''+ATIVO+''', '''+GARANTIDO+''')');
        varSQL.ApplyUpdates;

        setLogSQL(ID_CAIXA, 'INSERÇÃO', 'cadastraConta', varSQL.SQL.Text);

     Except
           on e: Exception do
           begin
                unUtilitario.setMensagem(e.Message,'erro');
                PRINCIPAL.setMensagem('Erro ao inserir uma conta no caixa! Função cadastraConta().');
           end;
     end;
End;

//Retorna o periodo da conta informada
function getPeriodoConta(codigoConta: Integer): String;
Var ano, mes, dia: Word;
    dataAntiga: TDateTime;
    varSQL: TZQuery;
Begin
     varSQL := unUtilitario.getSelect('select first 1 data_ref from caixa_entrada where ativo = ''SIM'' and id_caixa = '+IntToStr(codigoConta)+' order by data_ref desc ');

     if varSQL.Fields[0].IsNull then
     Begin
          result := 'NÃO IDENTIFICADO';
     End
     else
     Begin
          dataAntiga :=  IncMonth(varSQL.Fields[0].AsDateTime,-1);
          DecodeDate(dataAntiga, ano, mes, dia);

          result := IntToStr(dia) +'/'+ IntToStr(mes) +' A ';

          DecodeDate(varSQL.Fields[0].AsDateTime, ano, mes, dia);

          result := result + IntToStr(dia) +'/'+ IntToStr(mes);
     End;
End;


//Retorna um valor em dinheiro
function getPorcToDinh(porcentagem, total: String): Currency;
Begin
     if getStrToCurr(porcentagem) <= 0  then
     Begin
          result := 0;
          Exit;
     end;

     if getStrToCurr(total) <= 0  then
     Begin
          result := 0;
          Exit;
     end;

     porcentagem := StringReplace(porcentagem,'.','',[rfReplaceAll]);
     total := StringReplace(total,'.','',[rfReplaceAll]);

     SetRoundMode(rmNearest);
     result := SimpleRoundTo((getStrToCurr(total) * getStrToCurr(porcentagem))/100,-2);
End;

//Retorna um valor em porcentagem
function getDinhToPorc(dinheiro, total: String): Currency;
Begin
     if getStrToCurr(dinheiro) <= 0  then
     Begin
          result := 0;
          Exit;
     end;

     if getStrToCurr(total) <= 0  then
     Begin
          result := 0;
          Exit;
     end;

     SetRoundMode(rmNearest);
     Result := SimpleRoundTo((getStrToCurr(dinheiro) * 100)/getStrToCurr(total),-3);
End;

//retorna o valor total calculado com o banco de dados
function getDinheiroTotal(valor, juros, multa, desconto, dataVenc, dataPgto, codCalculo: String): Currency;
Var varSQL: TZQuery;
V, J, M, D: Currency;
Begin
     SetRoundMode(rmNearest);
     V := getStrToCurr(valor);
     J := StrToCurr(FormatFloat('#########,###0.000', SimpleRoundTo(StrToFloat(juros),-3)));
     M := getStrToCurr(multa);
     D := getStrToCurr(desconto);

     if Length(dataVenc) <= 0 then
        dataVenc := DateToStr(Date());

     if Length(dataPgto) <= 0 then
        dataPgto := DateToStr(Date());

     varSQL := getSelect('select result as resultado from spvalorcobranca1('+CodCalculo+', '''+ formataDataSQL(dataVenc)+''', '''+formataDataSQL(dataPgto)+''', '+ formataDinheiroSQL(CurrToStr(V)) +', '+ formataDinheiroSQL(CurrToStr(J)) +', '+ formataDinheiroSQL(CurrToStr(M)) +', '+ formataDinheiroSQL(CurrToStr(D)) +')');
     
     if varSQL.RecordCount > 0 then
        result := varSQL.Fields[0].AsCurrency
     else
         result := 0;

End;


end.
