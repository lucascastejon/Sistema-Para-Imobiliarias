unit unLog;

interface

uses unINI, ZDataset, FrmPrincipal, DB, unUtilitario, SysUtils;

//Log de registros normails. Formulários individuais.
procedure setLog(ID, ACAO, FORMULARIO: String; ComponenteSQL: TZQuery);
procedure setLogSQL(ID, ACAO, FORMULARIO, SQL: String);
procedure setLogInterno(ID, ACAO, COMPONENTE, OBS: String);

implementation

procedure setLogSQL(ID, ACAO, FORMULARIO, SQL: String);
Var varSQL: TZQuery;
Begin
TRY             
     varSQL := TZQuery.Create(PRINCIPAL);
     varSQL.Connection := PRINCIPAL.Conexao_log;

     varSQL.SQL.Add('INSERT INTO LOGS (ID_REGISTROS, FORMULARIO, USUARIO, MAQUINA, IP, ACAO, VERSAO, CAMPOS) VALUES ('''+StringReplace(StringReplace(ID,'''','-',[rfReplaceAll]),',',' ',[rfReplaceAll])+''', '''+UpperCase(FORMULARIO)+''', '''+getUser('CODIGO_USUARIO')+'-'+getUser('USUARIO')+''', '''+getUser('MAQUINA')+''', '''+getUser('IP')+''', '''+ACAO+''','''+GetVersaoSistema()+''' , '''+StringReplace(SQL,'''','-',[rfReplaceAll])+''')');
     varSQL.ExecSQL;
     varSQL.ApplyUpdates;

     FreeAndNil(varSQL);
EXCEPT
      PRINCIPAL.setMensagem('AVISO: Erro ao gerar LOG do evento.');
      FreeAndNil(varSQL);
end;
end;

procedure setLog(ID, ACAO, FORMULARIO: String; ComponenteSQL: TZQuery);
Var I: Integer;
    varSQL: TZQuery;
    Campos: string;
Begin
TRY
     for I := 0 to ComponenteSQL.FieldCount - 1 do
     Begin
          Campos := Campos +' | '+ ComponenteSQL.Fields[I].FieldName +': '+ StringReplace(ComponenteSQL.Fields[I].AsString,'''','-',[rfReplaceAll]);
     end;

     varSQL := TZQuery.Create(PRINCIPAL);
     varSQL.Connection := PRINCIPAL.Conexao_log;

     varSQL.SQL.Add('INSERT INTO LOGS (ID_REGISTROS, FORMULARIO, USUARIO, MAQUINA, IP, ACAO, VERSAO, CAMPOS) VALUES ('''+ID+''', '''+UpperCase(FORMULARIO)+''', '''+getUser('CODIGO_USUARIO')+'-'+getUser('USUARIO')+''', '''+getUser('MAQUINA')+''', '''+getUser('IP')+''', '''+ACAO+''','''+GetVersaoSistema()+''' , '''+Campos+''')');
     varSQL.ExecSQL;
     varSQL.ApplyUpdates;

     FreeAndNil(varSQL);
EXCEPT
      PRINCIPAL.setMensagem('AVISO: Erro ao gerar LOG do evento.');
      FreeAndNil(varSQL);
end;

end;


procedure setLogInterno(ID, ACAO, COMPONENTE, OBS: String);
Var varSQL: TZQuery;
Begin
     //LDC = LOG DE COBRANÇAS (do fluxo de caixa)

TRY
     varSQL := TZQuery.Create(PRINCIPAL);
     varSQL.Connection := PRINCIPAL.Conexao;

     varSQL.SQL.Add('INSERT INTO LOG (ACAO, COMPONENTE, DATA, ID_FUNC, ID_CONTA, OBS, ATIVO) VALUES ('''+Trim(UpperCase(ACAO))+''', '''+trim(UpperCase(COMPONENTE))+''', current_timestamp, '+getUser('CODIGO_USUARIO')+', '+ID+', '''+unUtilitario.formataTextoSQL(Copy(trim(OBS),0,250))+''', ''SIM'')');
     varSQL.ExecSQL;
     varSQL.ApplyUpdates;

     FreeAndNil(varSQL);
EXCEPT
      PRINCIPAL.setMensagem('AVISO: Erro ao gerar LOG INTERNO do evento.');
      FreeAndNil(varSQL);
end;

end;



end.
