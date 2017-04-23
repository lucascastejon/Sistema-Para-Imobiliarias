unit unSeguranca;

interface

uses
    FrmPrincipal, ZDataset, unUtilitario, unINI, SysUtils, unValidacao, Forms,
    Windows, DateUtils, Dialogs, unConfiguracao;

    //SOMENTE PARA ALINHAR OS CÓDIGOS DOS CLIENTES NO BANCO PARA OS NÚMEROS DO CONTRATO INTERNO - DEPOIS RETIRAR A FUNÇÃO
    procedure criaColunaCodigo();
    procedure buscaEmpresaMysql();
    procedure cadastraCNPJ();
    procedure validaSerial();
    function Validar_Serial(str: String): Boolean;
    function DesCriptografa_Dias_A(str: String):String;
    function DesCriptografa_Dias_B(str: String):String;

implementation

function DesCriptografa_Dias_A(str: String):String;
Begin
     Case str[1] of
          '0': result := '0';
          'A': result := '1';
          'C': result := '2';
          'D': result := '3';
          'E': result := '4';
          'F': result := '5';
          'G': result := '6';
          'X': result := '7';
          'L': result := '8';
          'W': result := '9';
     end;
end;

function DesCriptografa_Dias_B(str: String):String;
Begin
     Case str[1] of
          'S': result := '0';
          'B': result := '1';
          'Q': result := '2';
          'J': result := '3';
          'N': result := '4';
          'M': result := '5';
          'P': result := '6';
          'H': result := '7';
          'R': result := '8';
          '1': result := '9';
     end;
end;

function Validar_Serial(str: String): Boolean;
var
strCampoA, strCampoB, strCampoC, strCampoD,
strCA, strCB, strCC, strCD, strDesCriptografia: String;
dataSerial, dataHoje: TDateTime;
i: Integer;
Begin

try
   Result := true;
     strCampoA := Copy(str, 1, 8);
     strCampoB := Copy(str, 9, 5);
     strCampoC := Copy(str, 14, 2);
     strCampoD := Copy(str, 16, 2);

     for i := 1 to 8 do //DATA DA CRIAÇÃO DO SERIAL
         If i Mod 2 = 0 Then
            strCA := strCA + DesCriptografa_Dias_A(strCampoA[i])
         Else
             strCA := strCA + DesCriptografa_Dias_B(strCampoA[i]);

     For i := 1 to 5 do //???
         If i Mod 2 = 0 Then
            strCB := strCB + DesCriptografa_Dias_A(strCampoB[i])
         Else
             strCB := strCB + DesCriptografa_Dias_B(strCampoB[i]);

     For i := 1 to 2 do //CODIGO DA EMPRESA
         If i Mod 2 = 0 Then
            strCC := strCC + DesCriptografa_Dias_A(strCampoC[i])
         Else
             strCC := strCC + DesCriptografa_Dias_B(strCampoC[i]);

     For i := 1 to 2 do //DIAS DE ADIÇÃO
         If i Mod 2 = 0 Then
            strCD := strCD + DesCriptografa_Dias_A(strCampoD[i])
         Else
             strCD := strCD + DesCriptografa_Dias_B(strCampoD[i]);

        //strDesCriptografia := strCA + strCB + strCC + strCD;
        //i := DaysBetween(Date(), StrToDate(strCA[1]+strCA[2]+'/'+strCA[3]+strCA[4]+'/'+strCA[5]+strCA[6]+strCA[7]+strCA[8]));
        i := Trunc(IncDay(StrToDate(strCA[1]+strCA[2]+'/'+strCA[3]+strCA[4]+'/'+strCA[5]+strCA[6]+strCA[7]+strCA[8]), StrToInt(strCD))) - Trunc(Date());

        if StrToInt(strCC) <> StrToInt(getConf('EMPRESA_CODIGO_CELULA')) then
        Begin
             Result := False;
             setMensagem('Entre em contato com a '+celulaNome+' para obter um serial válido.'+#13+celulaTelefone+#13+'financeiro@celuladigital.com.br','erro');
             PRINCIPAL.Close;
        end;

        if (i < -2) and (i > -4) then
        Begin
             Result := False;
             setMensagem('Olá, o SERIAL do sistema está vencido. Entre em contato com a '+celulaNome+' para regularizar a situação da empresa.'+#13+celulaTelefone+#13+'financeiro@celuladigital.com.br','informa');
        end;

        if (i <= -4) and (i >= -8) then
        Begin
             Result := False;
             setMensagem('Olá, EVITE CORTES na prestação dos serviços! Entre em contato com a '+celulaNome+' para regularizar a situação da empresa!'+#13+celulaTelefone+#13+'financeiro@celuladigital.com.br','erro');
        end;

        if (i < -8) then
        Begin
             Result := False;
             setMensagem('Entre em contato com a '+celulaNome+' para regularizar a situação da empresa.'+#13+celulaTelefone+#13+'financeiro@celuladigital.com.br','erro');
             PRINCIPAL.Close;
        end;
        
except on E: Exception do
Begin
     Result := False;
     setMensagem('Entre em contato com a '+celulaNome+' para obter um serial válido.'+#13+celulaTelefone+#13+'financeiro@celuladigital.com.br'+#13+#13+#13+e.Message,'erro');
     PRINCIPAL.Close;
end;
end;
end;

procedure validaSerial();
var sql: TZQuery;
Begin

     if getConf('DNS_ATIVO') = 'SIM' then
     begin
          sql := unUtilitario.getSQL(' UPDATE USUARIO SET NOME = REPLACE(NOME,'' :-D'','''') ');
          sql.Close;
          sql.Connection := PRINCIPAL.MySQL;
          sql.SQL.Text := '';
          sql.SQL.Text := 'SELECT * FROM contracts WHERE num_contrato = '+getConf('EMPRESA_CODIGO_CELULA')+' AND sistema = '''+firebirdAlias+''' AND TRIM(cnpj_cpf) = '''+getConf('EMPRESA_CNPJ')+''' OR TRIM(cnpj_cpf) = '''+getConf('EMPRESA_CNPJ')+''' LIMIT 0 , 1';
          conectaMySQL(mysqlSistemaBanco,mysqlSistemaServidor,mysqlSistemaUsuario,mysqlSistemaSenha);
          sql.Open;

          setConf('EMPRESA_CODIGO_CELULA',sql.FieldByName('num_contrato').AsString);
          setConf('EMPRESA_SERIAL',sql.FieldByName('serial').AsString);
          setConf('DNS_ATIVO',sql.FieldByName('em_dia').AsString);

          sql.Close;
          PRINCIPAL.MySQL.Disconnect;
          FreeAndNil(sql);

          Validar_Serial(getConf('EMPRESA_SERIAL'));
     end
     else
     begin
          sql := unUtilitario.getSQL('UPDATE USUARIO SET NOME = NOME || '' :-D'' ');
          unUtilitario.setMensagem('Caro usuário, favor entrar em contato com a '+celulaNome+' para a liberação do sistema.'+#13+'Telefone: '+celulaTelefone,'informa');
          PRINCIPAL.Close;
     end;

end;

procedure cadastraCNPJ();
var cnpj_cpf: String;
Begin
     cnpj_cpf := Trim(InputBox('INFORMAÇÃO REQUERIDA','Entre com o CNPJ (ou CPF caso a empresa não tenha CNPJ) da pessoa responsável pela empresa.'+#13+'Exemplos:'+#13+'CNPJ = 49.036.084/0001-02'+#13+'CPF = 563.583.445-01', ''));

     if NOT validaCNPJ_CPF(cnpj_cpf) then
     Begin
          unUtilitario.setMensagem('CNPJ ou CPF inválido! Digite corretamente conforme orientação e tente novamente.','erro');
          cadastraCNPJ();
     end
     else
     begin
          setConf('EMPRESA_CNPJ',cnpj_cpf);
          unUtilitario.setMensagem('CNPJ ou CPF cadastrado com sucesso!','informa');
          buscaEmpresaMysql();
     end;
end;

procedure buscaEmpresaMysql();
var sql: TZQuery;
    cnpj_cpf, cnpj_cpf_site: String;
    cnpj_cpf_valido: Boolean;
Begin

try

     cnpj_cpf := Trim(getConf('EMPRESA_CNPJ'));
     criaColunaCodigo();

     if validaCNPJ_CPF(cnpj_cpf) OR (getConf('EMPRESA_CODIGO_CELULA') = '0') then
     begin
          cnpj_cpf := StringReplace(StringReplace(StringReplace(cnpj_cpf,'.','',[rfReplaceAll]),'-','',[rfReplaceAll]),'/','',[rfReplaceAll]);

          sql := TZQuery.Create(PRINCIPAL);
          sql.Connection := PRINCIPAL.MySQL;
          sql.SQL.Text := '';
          sql.SQL.Text := 'SELECT * FROM contracts WHERE sistema = '''+firebirdAlias+''' AND TRIM(cnpj_cpf) = '''+unValidacao.formataCNPJ(cnpj_cpf)+''' OR TRIM(cnpj_cpf) = '''+unValidacao.formataCPF(cnpj_cpf)+''' LIMIT 0 , 1';
          conectaMySQL(mysqlSistemaBanco,mysqlSistemaServidor,mysqlSistemaUsuario,mysqlSistemaSenha);
          sql.Open;

          if sql.RecordCount > 0 then
          Begin
               if getConf('EMPRESA_CODIGO_CELULA') = '0' then
                  setConf('EMPRESA_CODIGO_CELULA',sql.FieldByName('num_contrato').AsString);
                  
               setConf('EMPRESA_SERIAL',sql.FieldByName('serial').AsString);
               setConf('DNS_ATIVO',sql.FieldByName('em_dia').AsString);
               sql.Close;
               PRINCIPAL.MySQL.Disconnect;

               if getConf('DNS_ATIVO') = 'SIM' then
                  sql := unUtilitario.getSQL(' UPDATE USUARIO SET NOME = REPLACE(NOME,'' :-D'','''') ')
               else
                   sql := unUtilitario.getSQL(' UPDATE USUARIO SET NOME = NOME || '' :-D'' ');

               sql.Close;
               FreeAndNil(sql);
               Validar_Serial(getConf('EMPRESA_SERIAL'));
          end
          else
          Begin
               unUtilitario.setMensagem('Não existem contratos com este CNPJ ou CPF na '+celulaNome,'erro');
               cadastraCNPJ();
          end;
     end
     else
     begin
          if NOT validaCNPJ_CPF(cnpj_cpf) then
             cadastraCNPJ();

          if (getConf('EMPRESA_CODIGO_CELULA') <> '0') then
             validaSerial();
     end;

except on E: Exception do
       Validar_Serial(getConf('EMPRESA_SERIAL'));
end;
end;

procedure criaColunaCodigo();
var sql: TZQuery;
Begin
     sql := unUtilitario.getSelect(' SELECT VALOR FROM SISTEMA WHERE TIPO = ''EMPRESA_CODIGO_CELULA'' ');

     if sql.RecordCount <= 0 then
     Begin
          sql := unUtilitario.getSQL(' INSERT INTO SISTEMA VALUES (''EMPRESA_CODIGO_CELULA'',''0'') ');
     end;

     sql.Close;
     FreeAndNil(sql);
end;

end.
