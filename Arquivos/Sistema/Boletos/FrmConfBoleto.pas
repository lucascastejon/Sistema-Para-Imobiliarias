unit FrmConfBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, gbCobranca, ZDataset, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ComCtrls, Buttons, ShellAPI, FileCtrl,
  StrUtils;

type
  TFormConfBoleto = class(TForm)
    PageControlBoleto: TPageControl;
    tabConfBoleto: TTabSheet;
    tabRemessa: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    CampoCarteira: TLabeledEdit;
    CampoAceite: TComboBox;
    CampoAgencia: TLabeledEdit;
    CampoAgenciaDigito: TLabeledEdit;
    CampoContaDigito: TLabeledEdit;
    CampoNome: TLabeledEdit;
    CampoConta: TLabeledEdit;
    CampoBanco: TComboBox;
    CampoNumeroCodigo: TLabeledEdit;
    CampoBairro: TLabeledEdit;
    CampoCEP: TLabeledEdit;
    CampoCidade: TLabeledEdit;
    CampoComplemento: TLabeledEdit;
    CampoEmail: TLabeledEdit;
    CampoUF: TLabeledEdit;
    CampoNumero: TLabeledEdit;
    CampoRua: TLabeledEdit;
    CampoRemetente: TLabeledEdit;
    CampoCPF: TLabeledEdit;
    CampoInscricao: TComboBox;
    CampoEmissao: TComboBox;
    CampoLinha1: TLabeledEdit;
    CampoLinha2: TLabeledEdit;
    CampoLinha3: TLabeledEdit;
    CampoLinha4: TLabeledEdit;
    CampoLocal: TLabeledEdit;
    CampoNossoNumero: TLabeledEdit;
    CheckBoletoMini: TCheckBox;
    CampoContrato: TLabeledEdit;
    CampoCarteiraVariacao: TLabeledEdit;
    CampoConvenio: TLabeledEdit;
    CheckCobrebem: TCheckBox;
    LabelOperacao: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    CampoRemessa: TEdit;
    boletoDataInicial: TDateTimePicker;
    boletoDataFinal: TDateTimePicker;
    CheckTeste: TCheckBox;
    DSBoletos: TDataSource;
    ZBoletos: TZQuery;
    tabRetorno: TTabSheet;
    CampoRetorno: TEdit;
    btnGerarRemessa: TSpeedButton;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    btnProcessaBoletos: TSpeedButton;
    lblTotalRegistros: TLabel;
    btnLocalArquivo: TSpeedButton;
    gbxConfig: TGroupBox;
    CampoCaminhoRemessa: TLabeledEdit;
    btnSelecionaPastaRemessa: TSpeedButton;
    btnSelecionaPastaRetorno: TSpeedButton;
    CampoCaminhoRetorno: TLabeledEdit;
    CampoCaminhoRelRemessa: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    CampoCaminhoRelRetorno: TLabeledEdit;
    SpeedButton2: TSpeedButton;
    ZRetorno: TZQuery;
    Label8: TLabel;
    btnProcessaBaixa: TSpeedButton;
    CaminhoRel: TEdit;
    Label9: TLabel;
    ProgressBar: TProgressBar;
    mmTitulos: TMemo;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    CampoDigitoCodigo: TLabeledEdit;
    SpeedButton5: TSpeedButton;
    CampoTolerancia: TLabeledEdit;
    totalBoletosRemessa: TLabel;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnProcessaBaixaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSelecionaPastaRetornoClick(Sender: TObject);
    procedure btnSelecionaPastaRemessaClick(Sender: TObject);
    procedure btnLocalArquivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcessaBoletosClick(Sender: TObject);
    procedure btnGerarRemessaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function BarraInvert(value:string):string;
  end;

const
   SELDIRHELP = 1000;

var
  FormConfBoleto: TFormConfBoleto;

implementation

uses unINI, unUtilitario, FrmPrincipal, unLog;

{$R *.dfm}

function TFormConfBoleto.BarraInvert(value: string): string;
var
   i : Integer;
begin
     for I := length(value) downto 1 do
     begin
          if (value[i]<>'\') then
          begin
               result := value + '\';
               Break;
          end
          else
              begin
                   result := value;
                   Break;
              end;
     end;
end;

procedure TFormConfBoleto.btnGerarRemessaClick(Sender: TObject);
var layout: String;
    NUMEROARQUIVO, I: Integer;
    resposta : String; //sCaminho
    contas: TStringList;
begin

   if btnGerarRemessa.Tag = 0 then
   Begin
        PRINCIPAL.RemessaRetorno.Titulos.Clear;
        PRINCIPAL.deixaDocumento.FileName := getBoleto('CampoCaminhoRemessa') + 'REMESSA_' + getBoleto('NUMEROARQUIVO') + '.REM';
        CampoRemessa.Text := PRINCIPAL.deixaDocumento.FileName;

        if trim(CampoRemessa.Text) = '' then
           if PRINCIPAL.deixaDocumento.Execute then
              CampoRemessa.Text := PRINCIPAL.deixaDocumento.FileName
           else
               Exit;

        PRINCIPAL.RemessaRetorno.DataArquivo := Now();

        if getBoleto('LAYOUTARQUIVO') = 'NULO' then
        Begin
             layout := InputBox('Definir Layout do Arquivo:','O sistema não identificou o Layout do arquivo.'+#13+'Favor entre com um modelo:'+#13'1) laCNAB240'+#13+'2) laCNAB400'+#13+'3) Outros','1');

             if verificaStringInt(layout) then
                setBoleto('LAYOUTARQUIVO',layout)
             else
             begin
                  setMensagem('Favor entrar com uma opção numérica para o Layout do boleto. Se caso não souber, pergunte ao seu correspondente bancário.','erro');
                  exit
             end;
        end;


        if getBoleto('LAYOUTARQUIVO') = '1' then
           PRINCIPAL.RemessaRetorno.LayoutArquivo := laCNAB240
        else
        if getBoleto('LAYOUTARQUIVO') = '2' then
           PRINCIPAL.RemessaRetorno.LayoutArquivo := laCNAB400
        else
            PRINCIPAL.RemessaRetorno.LayoutArquivo := laOutro;


        PRINCIPAL.RemessaRetorno.NumeroArquivo := 1;
        
        if Length(Trim(getBoleto('NUMEROARQUIVO'))) > 0 then
           if getBoleto('NUMEROARQUIVO') <> 'NULO' then
              PRINCIPAL.RemessaRetorno.NumeroArquivo := StrToInt(getBoleto('NUMEROARQUIVO'));

        PRINCIPAL.RemessaRetorno.NomeArquivo := CampoRemessa.Text;

        contas := TStringList.Create;

        zBoletos.First;
        while not zBoletos.Eof do
        Begin
             if ZBoletos.FieldByName('ID_SUBTIPO').AsInteger = 3 then
             Begin
                  contas.Add(ZBoletos.FieldByName('id_caixa').AsString);
             end;
             ZBoletos.Next;
        end;

        if contas.Count <= 0  then
           if zBoletos.RecordCount > 0 then
           Begin
                resposta := InputBox('AVISO IMPORTANTE!','O sistema não encontrou nenhuma conta de MENSALIDADE/ALUGUEL (Subtipo cód 3) na seleção. Mas encontrou '+IntToStr(zBoletos.RecordCount)+' conta(s) no processamento. Deseja realizar qual operação?'+#13+'1 - Gerar boletos dessas contas mesmo assim.'+#13+'2 - Cancelar operação.', '2');

                if StrToInt(Trim(resposta)) >= 2 then
                   exit;

                if StrToInt(Trim(resposta)) < 1 then
                   exit;
           end
           else
           Begin
                setMensagem('Não foi encontrado nenhum boleto para gerar a Remessa. Processo cancelado.','erro');
                exit;
           end;

        zBoletos.First;
        PRINCIPAL.SELECAO.clear;
        if contas.Count > 0 then //CONTAS NORMAIS PARA GERAR OS BOLETOS
        Begin
             for I := 0 to contas.Count - 1 do
             Begin
                  PRINCIPAL.SELECAO.Add(contas[I]);
                  PRINCIPAL.RemessaRetorno.Titulos.Add(PRINCIPAL.preparaBoleto(StrToInt(contas[I]), False, True));
             end;
        end
        else
        Begin
             if zBoletos.RecordCount > 0 then  //CONTAS ADICIONAIS
             Begin
                  while not zBoletos.Eof do
                  Begin
                       PRINCIPAL.SELECAO.Add(ZBoletos.FieldByName('id_caixa').AsString);
                       PRINCIPAL.RemessaRetorno.Titulos.Add(PRINCIPAL.preparaBoleto(ZBoletos.FieldByName('id_caixa').AsInteger, False, True));
                       ZBoletos.Next;
                  end;
             end;
        end;

        if CheckTeste.Checked then
           PRINCIPAL.RemessaRetorno.TipoMovimento := tmRemessaTeste
        else
            PRINCIPAL.RemessaRetorno.TipoMovimento := tmRemessa;

        PRINCIPAL.RemessaRetorno.GerarRemessa;

        PRINCIPAL.RemessaRetorno.Relatorio.SaveToFile(UpperCase('RELATORIO_REMESSA.TXT'));

        if getBoleto('NUMEROARQUIVO') = 'NULO' then
        Begin
             setBoleto('NUMEROARQUIVO','1');
             NUMEROARQUIVO := StrToInt(getBoleto('NUMEROARQUIVO')); // NUMEROARQUIVO é usado na parte inferior.
        end
        else
        Begin
             NUMEROARQUIVO := StrToInt(getBoleto('NUMEROARQUIVO'));
             NUMEROARQUIVO := NUMEROARQUIVO+1;
             setBoleto('NUMEROARQUIVO',IntToStr(NUMEROARQUIVO));
        end;

        contas.Clear;
        if PRINCIPAL.RemessaRetorno.Titulos.Count > 0 then
        Begin
           for I := 0 to PRINCIPAL.RemessaRetorno.Titulos.Count - 1 do
               contas.Add(PRINCIPAL.RemessaRetorno.Titulos[I].NumeroDocumento);

           zBoletos := unUtilitario.getSQL('update caixa_entrada set operacao = operacao || '' [REMESSA_BOLETO]'' where id_caixa in (0,'+alinhaStringlist(contas)+')');
        end;

        setBoleto('ULTIMAREMESSA', DateToStr(Date)+' '+TimeToStr(Time));
        setLog(getBoleto('NUMEROARQUIVO'), 'REMESSA', Self.Caption, ZBoletos);
        ZBoletos.Close;
        unUtilitario.setMensagem('Verifique os boletos que serão enviados para o arquivo de remessa no relatório gerado junto com a remessa.'+#13+'Se caso desejar retirar alguma conta da listagem, vá até o formulário de contratos e desmarque a opção de Boletos.'+#13+'Se caso achar necessário voltar, basta remarcar a opção Boletos no contrato.','informa');
        LabelOperacao.Caption := 'Remessa(Número: '+getBoleto('NUMEROARQUIVO')+' Data: '+getBoleto('ULTIMAREMESSA')+')';

   end;
end;

procedure TFormConfBoleto.btnLocalArquivoClick(Sender: TObject);
begin
     ShellExecute(Application.HANDLE, 'open', PChar(ExtractFilePath(CampoRemessa.Text)),nil,nil,SW_SHOWNORMAL);
end;

procedure TFormConfBoleto.btnProcessaBaixaClick(Sender: TObject);
var
   i : Integer;
   sCaminho : String;
   fValorTTCobrado, fValorTTConta, fValorDiferenca, fValorTotalContas : Real;
   vlrTolerancia: Double;
   varSQL, varSQLOutros: TZQuery; //varSQLCalculado
   s_ext: String; // select, sql, textoSaida
begin
       //Colocar para mostrar os alertas na grid e dividir o juros e multa com o proprietario.
     PRINCIPAL.SELECAO.Clear;
   PRINCIPAL.RemessaRetorno.Titulos.Clear;
   PRINCIPAL.pegaDocumento.InitialDir := getBoleto('CampoCaminhoRetorno');
   PRINCIPAL.pegaDocumento.FilterIndex := 6;   //.RET
   if PRINCIPAL.pegaDocumento.Execute then
   begin
     sCaminho := getBoleto('CampoCaminhoRetorno') + ExtractFileName(PRINCIPAL.pegaDocumento.FileName);
     s_ext := ExtractFileExt(PRINCIPAL.pegaDocumento.FileName);
     CampoRetorno.Text :=  sCaminho;
     CaminhoRel.Text := getBoleto('CampoCaminhoRetorno') + StringReplace(ExtractFileName(sCaminho),s_ext,'',[])+ '.RELATORIO.RETORNO.txt'
   end
   else
      begin
        PRINCIPAL.setMensagem('Caminho do arquivo retorno não encontrado. Verifique na aba Configuração do Boleto.');
        Exit;
      end;

   PRINCIPAL.RemessaRetorno.NomeArquivo := CampoRetorno.Text;
   PRINCIPAL.RemessaRetorno.LerRetorno;

   ProgressBar.Position := 0;
   ProgressBar.Max := PRINCIPAL.RemessaRetorno.Titulos.Count;
   ProgressBar.Min := 0;

   for I := 0 to PRINCIPAL.RemessaRetorno.Titulos.Count - 1 do
   begin
        if Length(Trim(PRINCIPAL.RemessaRetorno.Titulos.Items[I].NossoNumero)) = 0 then
        Begin
             ShowMessage('Existe uma conta de R$'+CurrToStr(PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorDocumento)+' que não possui "Nosso Número", ou seja, ela não poderá ser processada. Verifique no relatório de retorno. O processo continua normalmente para as demais contas.');
             Continue;
        end;

        if NOT AnsiContainsStr(PRINCIPAL.RemessaRetorno.Titulos.Items[I].OcorrenciaOriginal, '06') then
        Begin
             ShowMessage('Existe uma conta ('+PRINCIPAL.RemessaRetorno.Titulos.Items[I].NossoNumero+') de R$'+CurrToStr(PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorDocumento)+' que NÃO foi quitada pelo banco. Verifique no Relatório de Retorno os campos "Tipo ocorrência" e "Ocorrência original"');
             Continue;
        end;

        ZRetorno.Close;
        ZRetorno.Params[0].AsInteger := StrToInt(PRINCIPAL.RemessaRetorno.Titulos.Items[I].NossoNumero);
        ZRetorno.Open;
        if ZRetorno.RecordCount > 0 then
        begin
             PRINCIPAL.SELECAO.Clear;
             fValorTotalContas := 0;
              //VALOR DE TOLERANCIA PARA INSERIR AJUSTE DE CONTA
              vlrTolerancia := StrToFloat(getBoleto('CampoTolerNovaConta'));

              //VERIFICA SE HOUVE DIFERENÇA ENTRE O VALOR PAGO E O VALOR DA COBRANÇA, SE HOUVER ATUALIZA O VALOR DO PRÓXIMO MES
              varSQL := unUtilitario.getSelect('select ce.*, (select result from spvalorcobranca1('+getConf('EMPRESA_CALCULO')+', ce.data_ref, ce.data_pgto, ce.valor, ce.valor_juros, ce.valor_multa, ce.valor_desconto)) as VALORCALCULADO from caixa_entrada ce where data_pgto is null and ativo = ''SIM'' and pendente = ''NAO'' and ce.id_caixa = '+ZRetorno.Params[0].asString);

              if varSQL.RecordCount = 0 then
              Begin
                   setMensagem('A conta '+ZRetorno.Params[0].asString+' não foi encontrada no seu banco de dados ou encontra-se JÁ QUITADA! Anote e verifique isso no Caixa Composto! As outras contas serão processadas. Vc poderá processar este arquivo novamente depois de arrumado o erro, caso houver.','erro');
                   Continue;
              end;

              if varSQL.FieldByName('id_pessoa').IsNull then
                 varSQLOutros := unUtilitario.getSelect('select ID_CAIXA, (select result from spvalorcobranca1('+getConf('EMPRESA_CALCULO')+', data_ref, '''+formataDataSQL(DateToStr(PRINCIPAL.RemessaRetorno.Titulos.Items[I].DataOcorrencia))+''', valor, valor_juros, valor_multa, valor_desconto)) as VALORCALCULADO from caixa_entrada where ativo = ''SIM'' and pendente = ''NAO'' and data_pgto is null and id_caixa = '+varSQL.FieldByName('id_caixa').AsString+' ')
              else
                  varSQLOutros := unUtilitario.getSelect('select ID_CAIXA, (select result from spvalorcobranca1('+getConf('EMPRESA_CALCULO')+', data_ref, '''+formataDataSQL(DateToStr(PRINCIPAL.RemessaRetorno.Titulos.Items[I].DataOcorrencia))+''', valor, valor_juros, valor_multa, valor_desconto)) as VALORCALCULADO from caixa_entrada where ativo = ''SIM'' and pendente = ''NAO'' and id_pessoa = '+varSQL.FieldByName('id_pessoa').AsString+' and data_pgto is null and id_imovel = '+varSQL.FieldByName('id_imovel').AsString+' and data_ref = '''+unUtilitario.formataDataSQL(varSQL.FieldByName('data_ref').AsString)+' '' ');

              if varSQLOutros.RecordCount > 0 then
              Begin
                   while not varSQLOutros.Eof do
                   Begin
                        PRINCIPAL.SELECAO.Add(varSQLOutros.FieldByName('ID_CAIXA').AsString);
                        fValorTotalContas := fValorTotalContas + varSQLOutros.FieldByName('VALORCALCULADO').AsCurrency;
                        varSQLOutros.Next;
                   end;
              end
              else
                  Continue;
                  
              varSQLOutros.Close;

              fValorTTCobrado := (PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorDocumento + PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorMoraJuros) - PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorDesconto;

              fValorTTConta := fValorTotalContas;
              fValorDiferenca := fValorTTConta - fValorTTCobrado;
              //CHECA SE LANÇA A DIFERENÇA PAGO A MENOR PELO LOCATARIO
                 if (fValorTTCobrado < fValorTTConta ) and (vlrTolerancia < fValorDiferenca) Then
                 begin
                      setMensagem('Foi encontrado uma diferença de R$ '+FloatToStr(fValorDiferenca)+' para a conta '+ZRetorno.Params[0].asString+'. Valor pago no boleto R$'+CurrToStr(fValorTTCobrado)+' e valor esperado pelo sistema R$'+CurrToStr(fValorTTConta)+' . Tolerância R$'+CurrToStr(vlrTolerancia)+'','informa');


                   varSQL := unUtilitario.getSQL('insert into caixa_entrada (   '+
                   '       id_categoria, id_tipo, id_subtipo, id_pessoa,id_imovel, '+
                   '       id_contrato,id_funcionario,id_entrada,id_saida,data_ref, '+
                   '       data_cad,data_alt,documento,operacao,valor,valor_juros, '+
                   '       valor_multa,valor_desconto,parcela,pendente,ativo,garantido) '+
                   '       select ce.id_categoria, '+
                   '       ce.id_tipo, '+
                   '       ce.id_subtipo, '+
                   '       ce.id_pessoa, '+
                   '       ce.id_imovel, '+
                   '       ce.id_contrato, '+
                   '       ce.id_funcionario, '+
                   '       ce.id_entrada, '+
                   '       ce.id_saida, '+
                   '       dateadd (month, 1, cast(extract(day from ce.data_ref)||''.''||extract(month from current_date)||''.''||extract(year from current_date) as date)) as data_ref, '+
                   '       ce.data_cad, '+
                   '       ce.data_alt, '+
                   '       ''DIFERENCA BAIXA BOLETO MES ''||extract(day from data_ref)||''/''||lpad(extract(month from current_date),2,''0'')||''/''||extract(year from current_date) AS documento, '+
                   '       ''[BOLETO_DIFERENCA] CONTA CRIADA PELA DIFERENCA DO RECEBIMENTO DE '+CurrToStr(fValorTTConta)+' DO BOLETO '+ZRetorno.Params[0].asString+' '' AS OPERACAO, '+
                   '       '+formataDinheiroSQL(FloatToStr(fValorDiferenca))+', '+
                   '       0, '+
                   '       0, '+
                   '       0, '+
                   '       1, '+
                   '       ce.PENDENTE, '+
                   '       ce.ativo, '+
                   '       ce.garantido '+
                   'from caixa_entrada ce where ce.id_caixa = '+ZRetorno.Params[0].asString);
                   varSQL.ApplyUpdates;
                 end;

                      //ATUALIZA O REGISTRO COM OS DADOS DO TITULO RETORNADO
                      varSQL := unUtilitario.getSQL('update caixa_entrada set '+
                             'DATA_ALT = current_date, '+
                             'DOCUMENTO = DOCUMENTO || ''VALOR RECEBIDO TOTAL R$'+formataDinheiroSQL(CurrToStr(fValorTotalContas))+' CONTAS: '+alinhaStringlist(PRINCIPAL.SELECAO)+' '','+
                             'ID_FUNCIONARIO = '+ getUser('CODIGO_USUARIO')+
                             //', DATA_PGTO = '+QuotedStr(formataDataSQL(DateToStr(PRINCIPAL.RemessaRetorno.Titulos.Items[I].DataOcorrencia)))+ ESSE EU COMENTEI PARA EVITAR PROBLEMAS DA CASANOVA COM QUITACAO ESTRANHA
                             //', VALOR_DESCONTO = '+formataDinheiroSQL(FloatToStr(PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorDesconto))+
                             //', VALOR_MULTA = '+formataDinheiroSQL(FloatToStr(PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorMoraJuros))+
                             //', PENDENTE = ''NAO'' '+
                             ', OPERACAO = OPERACAO || '' [BOLETO_RETORNO]'' '+
                             ' where DATA_PGTO is null AND id_caixa in ('+alinhaStringlist(PRINCIPAL.SELECAO)+')');
                      varSQL.SQL.Text;
                      varSQL.ApplyUpdates;

   


             {PRINCIPAL.RemessaRetorno.Titulos.Items[I].SeuNumero;
             PRINCIPAL.RemessaRetorno.Titulos.Items[I].NossoNumero
             PRINCIPAL.RemessaRetorno.Titulos.Items[I].Carteira
             PRINCIPAL.RemessaRetorno.Titulos.Items[I].DataVencimento
             PRINCIPAL.RemessaRetorno.Titulos.Items[I].DataCredito
             PRINCIPAL.RemessaRetorno.Titulos.Items[I].DataOcorrencia
             PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorDocumento
             PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorDesconto
             PRINCIPAL.RemessaRetorno.Titulos.Items[I].ValorMoraJuros}
        end;
        ProgressBar.Position := ProgressBar.Position + 1;
        Application.ProcessMessages;
   end;
   PRINCIPAL.RemessaRetorno.Relatorio.SaveToFile(CaminhoRel.Text);

   setMensagem('Processo Concluído. Se caso desejar, veja agora o relatório de recebimento.', 'informa');
   ShellExecute(Handle, nil, PChar(CaminhoRel.Text), nil, nil, SW_SHOWNORMAL)
end;

procedure TFormConfBoleto.btnProcessaBoletosClick(Sender: TObject);
begin
     DBGrid1.DataSource.DataSet.Close;
     DBGrid1.Repaint;
     DSBoletos.DataSet.Close;
     ZBoletos.Close;
     ZBoletos.sql.clear;
     ZBoletos.sql.Add('SELECT CE.*, P.NOME, '+
     ' I.ID_IMOVEL, L.TIPO, L.NOME, I.NUMERO, I.COMPLEMENTO, B.NOME AS BAIRRO, '+
     ' CI.NOME AS CIDADE, S.SIGLA AS UF '+
     ' FROM CAIXA_ENTRADA CE '+
     ' LEFT JOIN CONTRATO C ON C.ID_CONTRATO = CE.ID_CONTRATO '+
     ' LEFT JOIN PESSOA P ON CE.ID_PESSOA = P.ID_PESSOA '+
     ' LEFT JOIN IMOVEL I ON CE.ID_IMOVEL = I.ID_IMOVEL '+
     ' LEFT JOIN LOGRADOURO L ON I.ID_LOGRADOURO = L.ID_LOGRADOURO '+
     ' LEFT JOIN UF S ON L.ID_SIGLA = S.ID_SIGLA '+
     ' LEFT JOIN BAIRRO B ON L.ID_BAIRRO = B.ID_BAIRRO '+
     ' LEFT JOIN CIDADE CI ON L.ID_CIDADE = CI.ID_CIDADE '+
     ' WHERE CE.DATA_REF >= '''+FORMATADATASQL(DATETOSTR(BOLETODATAINICIAL.DATE))+
     ''' AND CE.DATA_REF <= '''+FORMATADATASQL(DATETOSTR(BOLETODATAFINAL.DATE))+''''+
     ' AND CE.ATIVO = ''SIM'' AND CE.PENDENTE = ''NAO'' AND CE.DATA_PGTO IS NULL '+
     ' AND CE.OPERACAO LIKE ''%BOLETO_EMITIDO%'' '+
     ' AND CE.OPERACAO NOT LIKE ''%REMESSA_BOLETO%'' '+
     ' AND 0 = (select count(1) '+
     ' from caixa_entrada as X where X.id_pessoa = CE.id_pessoa and (X.id_imovel = CE.id_imovel '+
     ' or X.id_imovel is null) and X.data_ref = CE.data_ref and X.pendente = ''NAO'' and X.ativo  '+
     ' = ''SIM'' and X.id_caixa <> CE.id_caixa and X.data_pgto is null and X.OPERACAO LIKE ''%REMESSA_BOLETO%'' ) '+
     ' ORDER BY CE.DATA_REF');
     ZBoletos.Open;
     DBGrid1.Repaint;
     lblTotalRegistros.Caption := 'Total de Boletos: '+IntToStr(ZBoletos.RecordCount);
     totalBoletosRemessa.Caption := 'Total de Boletos: '+IntToStr(ZBoletos.RecordCount);

end;

procedure TFormConfBoleto.btnSelecionaPastaRemessaClick(Sender: TObject);
var
   vDir : String;
begin
     if SelectDirectory('Selecione o diretório:','C:\', vDir) then
        CampoCaminhoRemessa.Text := BarraInvert(vDir);
end;

procedure TFormConfBoleto.btnSelecionaPastaRetornoClick(Sender: TObject);
var
   vDir : String;
begin
     if SelectDirectory('Selecione o diretório:','C:\', vDir) then
        CampoCaminhoRetorno.Text := BarraInvert(vDir);
end;

procedure TFormConfBoleto.Button1Click(Sender: TObject);
begin
     unUtilitario.setMensagem('Lembramos para NÃO usar o caractere " = " em nenhuma das entradas.','informa');
     setBoleto('CampoCarteira', CampoCarteira.Text);
     setBoleto('CampoAceite', CampoAceite.Text);
     setBoleto('CampoAgencia', CampoAgencia.Text);
     setBoleto('CampoAgenciaDigito', CampoAgenciaDigito.Text);
     setBoleto('CampoContaDigito', CampoContaDigito.Text);
     setBoleto('CampoNome', CampoNome.Text);
     setBoleto('CampoConta', CampoConta.Text);
     setBoleto('CampoBanco', CampoBanco.Text);

     //PODE DAR MERDA EM ALGUNS CLIENTES ANTIGOS, POIS NAO TINHA ESSE CAMPO
     setBoleto('CampoCodigoCedente', CampoNumeroCodigo.Text);
     setBoleto('CampoDigitoCodigo', CampoDigitoCodigo.Text);

     setBoleto('CampoTolerNovaConta', CampoTolerancia.Text);
     setBoleto('CampoBairro', CampoBairro.Text);
     setBoleto('CampoCEP', CampoCEP.Text);
     setBoleto('CampoCidade', CampoCidade.Text);
     setBoleto('CampoComplemento', CampoComplemento.Text);
     setBoleto('CampoEmail', CampoEmail.Text);
     setBoleto('CampoUF', CampoUF.Text);
     setBoleto('CampoNumero', CampoNumero.Text);
     setBoleto('CampoRua', CampoRua.Text);
     setBoleto('CampoRemetente', CampoRemetente.Text);
     setBoleto('CampoCPF', CampoCPF.Text);
     setBoleto('CampoInscricao', CampoInscricao.Text);
     setBoleto('CampoEmissao', CampoEmissao.Text);
     setBoleto('CampoLinha1', CampoLinha1.Text);
     setBoleto('CampoLinha2', CampoLinha2.Text);
     setBoleto('CampoLinha3', CampoLinha3.Text);
     setBoleto('CampoLinha4', CampoLinha4.Text);
     setBoleto('CampoLocal', CampoLocal.Text);
     setBoleto('CampoNossoNumero', CampoNossoNumero.Text);

     //setBoleto('CampoSeqNumRemessa', '0');  VALOR DE REMESSA PARA COLOCAR NA TELA. ESTA SENDO USADO PARA SER O SEGUENCIAL PARA A CALIXTO
     // ESTA AQUI MARCANDO A POSICAO PQ EU TENHO QUE COLOCAR NA TELA PARA EFEITO INFORMATIVO.
     // NAO SOBREPOR< APENAS INFORMAR, POIS E GERADO SEGUENCIAL NA REMESSA

     setBoleto('CampoCarteiraVariacao', CampoCarteiraVariacao.Text);
     setBoleto('CampoContrato', CampoContrato.Text);
     setBoleto('CampoConvenio', CampoConvenio.Text);

     setBoleto('CampoCaminhoRemessa', CampoCaminhoRemessa.Text);
     setBoleto('CampoCaminhoRetorno', CampoCaminhoRetorno.Text);
     setBoleto('CampoCaminhoRelRemessa', CampoCaminhoRelRemessa.Text);
     setBoleto('CampoCaminhoRelRetorno', CampoCaminhoRelRetorno.Text);

     if CheckBoletoMini.Checked Then
        setBoleto('BoletoMini','SIM')
     else
         setBoleto('BoletoMini','NAO');

     if CheckCobrebem.Checked Then
        setBoleto('CobreBem','SIM')
     else
         setBoleto('CobreBem','NAO');

     PRINCIPAL.setMensagem('A configuração foi salva...');
end;

procedure TFormConfBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormConfBoleto.FormCreate(Sender: TObject);
begin

     CampoTolerancia.Text := getBoleto('CampoTolerNovaConta');
     CampoCarteira.Text := getBoleto('CampoCarteira');
     CampoAceite.Text := getBoleto('CampoAceite');
     CampoAgencia.Text := getBoleto('CampoAgencia');
     CampoAgenciaDigito.Text := getBoleto('CampoAgenciaDigito');
     CampoContaDigito.Text := getBoleto('CampoContaDigito');
     CampoNome.Text := getBoleto('CampoNome');
     CampoConta.Text := getBoleto('CampoConta');
     CampoBanco.Text := getBoleto('CampoBanco');

     CampoDigitoCodigo.Text := getBoleto('CampoDigitoCodigo');
     CampoNumeroCodigo.Text := getBoleto('CampoCodigoCedente');

     CampoBairro.Text := getBoleto('CampoBairro');
     CampoCEP.Text := getBoleto('CampoCEP');
     CampoCidade.Text := getBoleto('CampoCidade');
     CampoComplemento.Text := getBoleto('CampoComplemento');
     CampoEmail.Text := getBoleto('CampoEmail');
     CampoUF.Text := getBoleto('CampoUF');
     CampoNumero.Text := getBoleto('CampoNumero');
     CampoRua.Text := getBoleto('CampoRua');
     CampoRemetente.Text := getBoleto('CampoRemetente');
     CampoCPF.Text := getBoleto('CampoCPF');
     CampoInscricao.Text := getBoleto('CampoInscricao');
     CampoEmissao.Text := getBoleto('CampoEmissao');
     CampoLinha1.Text := getBoleto('CampoLinha1');
     CampoLinha2.Text := getBoleto('CampoLinha2');
     CampoLinha3.Text := getBoleto('CampoLinha3');
     CampoLinha4.Text := getBoleto('CampoLinha4');
     CampoLocal.Text := getBoleto('CampoLocal');
     CampoNossoNumero.Text := getBoleto('CampoNossoNumero');

     CampoCarteiraVariacao.Text := getBoleto('CampoCarteiraVariacao');
     CampoContrato.Text := getBoleto('CampoContrato');
     CampoConvenio.Text := getBoleto('CampoConvenio');

     CampoCaminhoRemessa.Text := getBoleto('CampoCaminhoRemessa');
     CampoCaminhoRetorno.Text := getBoleto('CampoCaminhoRetorno');
     CampoCaminhoRelRemessa.Text := getBoleto('CampoCaminhoRelRemessa');
     CampoCaminhoRelRetorno.Text := getBoleto('CampoCaminhoRelRetorno');

     if getBoleto('BoletoMini') = 'SIM' Then
        CheckBoletoMini.Checked := True
     else
         CheckBoletoMini.Checked := false;

     if getBoleto('CobreBem') = 'SIM' Then
        CheckCobrebem.Checked := True
     else
         CheckCobrebem.Checked := false;

     boletoDataFinal.Date := Date();
     boletoDataInicial.Date := Date();
     LabelOperacao.Caption := 'Remessa(Número: '+getBoleto('NUMEROARQUIVO')+' Data: '+getBoleto('ULTIMAREMESSA')+')';
end;

procedure TFormConfBoleto.FormShow(Sender: TObject);
begin
     PageControlBoleto.ActivePage := tabConfBoleto;

     //tabRetorno.TabVisible := False;
end;

procedure TFormConfBoleto.SpeedButton1Click(Sender: TObject);
var
   vDir : String;
begin
     if SelectDirectory('Selecione o diretório:','C:\', vDir) then
        CampoCaminhoRelRemessa.Text := BarraInvert(vDir);
end;

procedure TFormConfBoleto.SpeedButton2Click(Sender: TObject);
var
   vDir : String;
begin
     if SelectDirectory('Selecione o diretório:','C:\', vDir) then
        CampoCaminhoRelRetorno.Text := BarraInvert(vDir);
end;

procedure TFormConfBoleto.SpeedButton3Click(Sender: TObject);
begin
     ShellExecute(Application.HANDLE, 'open', PChar(ExtractFilePath(CampoRetorno.Text)),nil,nil,SW_SHOWNORMAL);
end;

procedure TFormConfBoleto.SpeedButton4Click(Sender: TObject);
begin
     ShellExecute(Application.HANDLE, 'open', PChar(ExtractFilePath(CaminhoRel.Text)),nil,nil,SW_SHOWNORMAL);
end;

procedure TFormConfBoleto.SpeedButton5Click(Sender: TObject);
var
   //i : Integer;
   sCaminho : String;
   //fValorTTCobrado  : Real;  //fValorTTConta, fValorTotalContas, fValorDiferenca
   //vlrTolerancia: Double;
   //varSQL: TZQuery; //varSQLOutros, varSQLCalculado
   s_ext: String; //sql, textoSaida
begin

   PRINCIPAL.RemessaRetorno.Titulos.Clear;
   PRINCIPAL.pegaDocumento.InitialDir := getBoleto('CampoCaminhoRetorno');
   PRINCIPAL.pegaDocumento.FilterIndex := 6;
   if PRINCIPAL.pegaDocumento.Execute then
   begin
     sCaminho := getBoleto('CampoCaminhoRetorno') + ExtractFileName(PRINCIPAL.pegaDocumento.FileName);
     s_ext := ExtractFileExt(PRINCIPAL.pegaDocumento.FileName);
     CampoRetorno.Text :=  sCaminho;
     CaminhoRel.Text := getBoleto('CampoCaminhoRetorno') + StringReplace(ExtractFileName(sCaminho),s_ext,'',[])+ '.RELATORIO.RETORNO.txt'
   end
   else
      begin
        PRINCIPAL.setMensagem('Caminho do arquivo retorno não encontrado. Verifique na aba Configuração do Boleto.');
        Exit;
      end;

   PRINCIPAL.RemessaRetorno.NomeArquivo := CampoRetorno.Text;
   PRINCIPAL.RemessaRetorno.LerRetorno;

   PRINCIPAL.RemessaRetorno.Relatorio.SaveToFile(CaminhoRel.Text);
   ShellExecute(Handle, nil, PChar(CaminhoRel.Text), nil, nil, SW_SHOWNORMAL)
end;

end.
