unit thrContratos;

//THREAD QUE RECUPERA AS OBSERVAÇÕES DOS CONTRATOS

interface

uses
  ZDataset, SysUtils, Controls, Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF};

type
  threadContratos = class(TThread)
  private
         tipo, mensagem, codigo: String;
         contador: integer;
         procedure SetName;
         procedure setMensagem();
         //procedure limpaComponentes();
         procedure contadorMsg();
  protected
           procedure Execute; override;
  end;

implementation

uses unUtilitario, FrmPrincipal, unINI, DB;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure threadContratos.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{$IFDEF MSWINDOWS}
type
  TThreadNameInfo = record
    FType: LongWord;     // must be 0x1000
    FName: PChar;        // pointer to name (in user address space)
    FThreadID: LongWord; // thread ID (-1 indicates caller thread)
    FFlags: LongWord;    // reserved for future use, must be zero
  end;
{$ENDIF}

{ threadContratos }

procedure threadContratos.SetName;
{$IFDEF MSWINDOWS}
var
  ThreadNameInfo: TThreadNameInfo;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := 'threadContratos';
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;

  try
    RaiseException( $406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo );
  except
  end;
{$ENDIF}
end;

procedure threadContratos.setMensagem();
Begin
     PRINCIPAL.criaAlerta(tipo, mensagem, codigo);
end;

{procedure threadContratos.limpaComponentes();
Var
   Instance : Tcontrol;
   i: integer;
Begin
  //APAGAR COMPONENTES ANTIGOS
  i := PRINCIPAL.abaAlertas.ControlCount;

  while i <> 0 do
  begin
       if
       (0 = PRINCIPAL.abaAlertas.Controls[i-1].Tag) or
       (1 = PRINCIPAL.abaAlertas.Controls[i-1].Tag) or
       (2 = PRINCIPAL.abaAlertas.Controls[i-1].Tag) or
       (3 = PRINCIPAL.abaAlertas.Controls[i-1].Tag) or
       (4 = PRINCIPAL.abaAlertas.Controls[i-1].Tag)
       Then
       Begin
            Instance := PRINCIPAL.abaAlertas.Controls[i-1];
            FreeAndNil(Instance);
            //PRINCIPAL.abaAlertas.RemoveControl(Instance);
            Instance.Destroy;
            i := PRINCIPAL.abaAlertas.ControlCount;
       end;
  end;

  //while i <> 0 do begin
      //if (3 = PRINCIPAL.abaAlertas.Controls[i].Tag) Then begin
         //objeto := PRINCIPAL.abaAlertas.Controls[i];
         //PRINCIPAL.abaAlertas.RemoveControl(objeto);
         //objeto.Destroy;
         //FreeAndNil(objeto);
      //end;
      //i := i - 1;
  //end;
end;
}

procedure threadContratos.contadorMsg();
Begin
     PRINCIPAL.labelQtdeMensagem.Caption := IntToStr(contador);
end;

procedure threadContratos.Execute;
var varSQL: TZQuery;
begin
  SetName;
  FreeOnTerminate := True;

  //Synchronize(limpaComponentes);

  //sleep(3000);

  tipo := 'opcaoMensagem';
  //TROCA DE MSG INTERNA
  VarSQL := unUtilitario.getSelect('select l.*, r.nome as remetente, '+
     ' case l.componente when ''FUNCIONARIO'' then '+
     ' (select nome from usuario where id_usuario = l.id_conta) '+
     ' when ''PESSOA'' then (select nome from pessoa where id_pessoa = l.id_conta) '+
     ' else ''NÃO INFORMADO'' '+
     ' end as destinatario from log l '+
     ' inner join usuario r on r.id_usuario = l.id_func '+
     ' where l.ativo = ''SIM'' and l.acao = ''MSN'' and l.id_conta = '+getUser('CODIGO_USUARIO')+' order by l.data desc, l.obs desc');

     contador := VarSQL.RecordCount;

     Synchronize(contadorMsg);

     while NOT VarSQL.Eof do
     Begin
          //memoPendencias.Items.Add('('+ZRecados.FieldByName('DATA').AsString +') de '+ZRecados.FieldByName('REMETENTE').AsString+ ': '+ ZRecados.FieldByName('CAMPOS').AsString+'-'+ZRecados.FieldByName('ID_LOG').AsString);
          //VarSQL.Next;
          mensagem := VarSQL.FieldByName('remetente').AsString+': '+VarSQL.FieldByName('campos').AsString;
          codigo := VarSQL.FieldByName('ID_LOG').AsString;
          Synchronize(setMensagem);
          VarSQL.Next;
     end;

  VarSQL.Close;

  tipo := 'opcaoContrato';
  //CONTRATOS COM VALOR "0":
  VarSQL := unUtilitario.getSelect('select id_contrato from contrato where valor <= 0 and ativo = ''SIM'' and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
          mensagem := 'O contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+' que você alterou está com o seu valor igual à 0.';
          codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
          Synchronize(setMensagem);
          VarSQL.Next;
     end;

  VarSQL.Close;

  //CONTRATOS COM DATA SUSPEITA:
  VarSQL := unUtilitario.getSelect('select id_contrato from contrato where VENCIMENTO <= ''01.01.2000'' and ativo = ''SIM'' and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
          mensagem := 'Verifique a data de vencimento do contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+'.';
          codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
          Synchronize(setMensagem);
          VarSQL.Next;
     end;

  VarSQL.Close;

  //CONTRATOS SEM VALOR DE TAXA:
  VarSQL := unUtilitario.getSelect('select id_contrato from contrato where (tarifa <= 0 or tarifa is null) and tipo_contrato = ''LOCAÇÃO'' and ativo = ''SIM'' and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
          mensagem := 'O contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+' que você manipulou está com o valor da taxa "0".';
          codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
          Synchronize(setMensagem);
          VarSQL.Next;
     end;

  VarSQL.Close;

  //CONTRATOS SEM VALOR DE MULTA:
  VarSQL := unUtilitario.getSelect('select id_contrato from contrato where (multa <= 0 or multa is null) and tipo_contrato = ''LOCAÇÃO'' and ativo = ''SIM'' and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
          mensagem := 'O contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+' que você manipulou está com o valor de multa "0".';
          codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
          Synchronize(setMensagem);
          VarSQL.Next;
     end;

  VarSQL.Close;

  //CONTRATOS SEM VALOR DE JUROS:
  VarSQL := unUtilitario.getSelect('select id_contrato from contrato where (multa_mora <= 0 or multa_mora is null) and tipo_contrato = ''LOCAÇÃO'' and ativo = ''SIM'' and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
          mensagem := 'O contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+' que você manipulou está com o valor de juros "0".';
          codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
          Synchronize(setMensagem);
          VarSQL.Next;
     end;

  VarSQL.Close;

  //CONTRATOS PRÓXIMO DO TÉRMINO:
  VarSQL := unUtilitario.getSelect('select id_contrato, vencimento, vigencia  from contrato where ativo = ''SIM'' and current_date between (vencimento + (vigencia*22)) and (vencimento + ((vigencia-1)*30)) and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
          mensagem := 'O contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+' está próximo do seu término '+DateToStr(IncMonth(VarSQL.FieldByName('VENCIMENTO').AsDateTime, VarSQL.FieldByName('VIGENCIA').AsInteger-1))+'.';
          codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
          Synchronize(setMensagem);
          VarSQL.Next;
     end;

  VarSQL.Close;

  //CONTRATO VENCENDO HOJE
  VarSQL := unUtilitario.getSelect('select id_contrato, vencimento, vigencia  from contrato where ativo = ''SIM'' and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
           if Date() = IncMonth(VarSQL.FieldByName('VENCIMENTO').AsDateTime, VarSQL.FieldByName('VIGENCIA').AsInteger-1) then begin
              mensagem := 'O contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+' está vencendo hoje! Lembre-se re renovar!';
              codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
              Synchronize(setMensagem);
           end;
          VarSQL.Next;
     end;

  VarSQL.Close;


  //CONTRATOS A RENOVAR:
  VarSQL := unUtilitario.getSelect('select distinct(id_contrato) from caixa_entrada ce where ( parcela = 12 or parcela = 24 or parcela = 36 or'+' parcela = 48 or parcela = 60 or parcela = 72 or parcela = 84 or parcela = 96 '+'or parcela = 108 or parcela = 120 or parcela = 132 or parcela = 144 ) and ativo = ''SIM'' and data_ref = current_date and not data_ref = (select max(data_ref) from caixa_entrada where id_contrato = ce.id_contrato) and ce.ID_FUNCIONARIO = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
           mensagem := 'Verifique se o contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+' deverá ser renovado!';
           codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
           Synchronize(setMensagem);
           VarSQL.Next;
     end;

  VarSQL.Close;
                        
  //CONTRATOS VENCIDOS:
  VarSQL := unUtilitario.getSelect('select id_contrato from contrato where vencimento + (vigencia*30) <= current_date and ativo = ''SIM'' and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
           mensagem := 'Verifique se o contrato '+VarSQL.FieldByName('ID_CONTRATO').AsString+' já está vencido ou vencendo! (Lembre-se de reajusta-lo!)';
           codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
           Synchronize(setMensagem);
          VarSQL.Next;
     end;

  VarSQL.Close;

  //CONTRATOS DE MORADIA COM MAIS DE 30 MESES
  VarSQL := unUtilitario.getSelect('select C.id_contrato from contrato C where C.finalidade like ''%MORADIA%'' and C.vigencia > 30 and C.ativo = ''SIM'' and ALTERACAO_FUNC = '+getUser('CODIGO_USUARIO'));
  if VarSQL.RecordCount > 0 then
     while not VarSQL.Eof do Begin
           mensagem := 'Atenção, você criou o contrato residencial '+VarSQL.FieldByName('ID_CONTRATO').AsString+' com mais de 30 meses! Legalmente isto não é recomendado.';
           codigo := VarSQL.FieldByName('ID_CONTRATO').AsString;
           Synchronize(setMensagem);
           VarSQL.Next;
     end;

  VarSQL.Close;
  FreeAndNil(Varsql);
end;

end.
