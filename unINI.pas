unit unINI;

interface

uses inifiles, unUtilitario, ZDataset, SysUtils;

var arquivoINI: TIniFile;

procedure criaArquivoConfiguracao();
procedure usaArquivoConfiguracao();
procedure pegaConfiguracaoSistema();
procedure setConf(tipo, valor: String);
function getConf(tipo: String): String;
procedure setUser(tipo, valor: String);
function getUser(tipo: String): String;
procedure setTela(tipo, valor: String);
function getTela(tipo: String): String;
procedure setBoleto(tipo, valor: String);
function getBoleto(tipo: String): String;
function getBackupBanco(tipo: String): String;
procedure setBackupBanco(tipo, valor: String);

implementation

procedure criaArquivoConfiguracao();
begin
     arquivoINI := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Configuracao.ini');
     pegaConfiguracaoSistema();
end;

procedure usaArquivoConfiguracao();
begin
     arquivoINI := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Configuracao.ini');

     //EM CASO DE VERIFICAR MELHOR SE ESTÁ RETORNANDO DADOS
     //if arquivoINI.readString('CONF','FIREBIRD_BANCO', 'NULO') = 'NULO' Then
     //   unUtilitario.setMensagem('Problemas ao recuperar as configurações do sistema!'+#13+'Feche o sistema e abra-o novamente antes de continuar.','erro');
end;

procedure pegaConfiguracaoSistema();
var varSQL: TZQuery;
Begin     
     arquivoINI.EraseSection('CONF');

     varSQL := unUtilitario.getSelect('SELECT * FROM SISTEMA');

     while NOT varSQL.Eof do
     Begin
          if NOT varSQL.Fields[0].IsNull then
             if Length(Trim(varSQL.Fields[0].AsString)) > 0 then
                arquivoINI.WriteString('CONF',varSQL.Fields[0].AsString, StringReplace(varSQL.Fields[1].AsString,'=','-',[rfReplaceAll,rfIgnoreCase]));
          varSQL.Next;
     End;

     FreeAndNil(varSQL);
End;

function getConf(tipo: String): String;
Begin
     usaArquivoConfiguracao();
     result := Trim(arquivoINI.readString('CONF',tipo, 'NULO'));

     if tipo = 'EMPRESA_HOMEPAGE' then
        result := StringReplace(StringReplace(LowerCase(result), 'http://', '', [rfReplaceAll,rfIgnoreCase]), 'https://', '', [rfReplaceAll,rfIgnoreCase]);

End;

procedure setConf(tipo, valor: String);
var sql: TZQuery;
Begin
     sql := unUtilitario.getSelect('select count(1) as resultado from sistema where TIPO = '''+tipo+''' ');

     valor := StringReplace(valor, '''', '', [rfReplaceAll]);
     valor := StringReplace(valor, '=', '', [rfReplaceAll]);

     if sql.FieldByName('resultado').AsInteger = 1 then
        sql := unUtilitario.getSQL('update sistema set valor = '''+Trim(valor)+''' where tipo = '''+Trim(tipo)+''' ');

     usaArquivoConfiguracao();
     arquivoINI.WriteString('CONF',Trim(tipo), Trim(valor));
     sql.Close;
     FreeAndNil(sql);
End;

function getUser(tipo: String): String;
Begin
     usaArquivoConfiguracao();
     result := arquivoINI.readString('USER',tipo, 'NULO');

     try
        if Length(trim(result)) = 0  then
           result := 'NULO';
     except
           setUser(tipo,'NULO');
           result := 'NULO';
     end;
     
End;

procedure setUser(tipo, valor: String);
Begin
     usaArquivoConfiguracao();
     arquivoINI.WriteString('USER',tipo, valor);
End;

function getBoleto(tipo: String): String;
Begin
     usaArquivoConfiguracao();
     result := arquivoINI.readString('BOLETO',tipo, 'NULO');
End;

procedure setBoleto(tipo, valor: String);
Begin
     usaArquivoConfiguracao();
     arquivoINI.WriteString('BOLETO',tipo, valor);
End;

procedure setBackupBanco(tipo, valor: String);
Begin
     usaArquivoConfiguracao();
     arquivoINI.WriteString('BACKUP',tipo, valor);
End;

function getBackupBanco(tipo: String): String;
Begin
     usaArquivoConfiguracao();
     result := arquivoINI.readString('BACKUP',tipo, 'NULO');
End;

function getTela(tipo: String): String;
Begin
     usaArquivoConfiguracao();
     result := arquivoINI.readString('TELA',tipo, 'NULO');
End;

procedure setTela(tipo, valor: String);
Begin
     usaArquivoConfiguracao();
     arquivoINI.WriteString('TELA',tipo, valor);
End;

procedure limpaConfiguracaoSistema();
Begin
     usaArquivoConfiguracao();

     //CONFGURAÇÕES DO SISTEMA
     arquivoINI.EraseSection('CONF');

     //CONFIGURAÇÕES DO USUÁRIO
     arquivoINI.EraseSection('USER');

     //CONFIGURAÇÕES DO BOLETO
     arquivoINI.EraseSection('BOLETO');
End;

end.
