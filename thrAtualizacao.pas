unit thrAtualizacao;

interface

uses
  ZDataset, SysUtils, unConfiguracao, Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF};

type
  threadAtualizacao = class(TThread)
  private
    procedure SetName;
  protected
    procedure Execute; override;
  end;

implementation

uses unUtilitario, FrmPrincipal, unINI, DB;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure thrAtualizacao.UpdateCaption;
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

{ thrAtualizacao }

procedure threadAtualizacao.SetName;
{$IFDEF MSWINDOWS}
var
  ThreadNameInfo: TThreadNameInfo;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := 'thrAtualizacao';
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;

  try
    RaiseException( $406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo );
  except
  end;
{$ENDIF}
end;

procedure threadAtualizacao.Execute;
Var varSQL, varBloqueio: TZQuery;
    validacao: boolean;
begin
     SetName;
     FreeOnTerminate := True;
     validacao := True;

     try
     conectaMySQL(mysqlSistemaBanco,mysqlSistemaServidor,mysqlSistemaUsuario, mysqlSistemaSenha);
     varBloqueio := TZQuery.Create(PRINCIPAL);
     varBloqueio.Connection := PRINCIPAL.MySQL;
     varBloqueio.SQL.Add('SELECT BLOQUEADO FROM sistema_liberacao WHERE cliente = '''+getConf('CLIENTE')+''' limit 1');
     varBloqueio.Open;

     if varBloqueio.FieldByName('BLOQUEADO').IsNull then
     Begin
          varBloqueio.Close;
          varBloqueio.SQL.Clear;
          varBloqueio.SQL.Add('INSERT INTO sistema_liberacao values(null, '''+getConf('CLIENTE')+''', '''+getUser('USUARIO')+' '+getUser('EMAIL')+''', CURRENT_TIMESTAMP, ''NAO'')');
          varBloqueio.ExecSQL;
     end
     else
     Begin
          if varBloqueio.FieldByName('BLOQUEADO').AsString = 'SIM' then
          Begin
             PRINCIPAL.bloqueado := True;
             Synchronize(PRINCIPAL.mostraAvisoBloqueio);
          end
          else
              PRINCIPAL.bloqueado := False;

          varBloqueio.Close;
          varBloqueio.SQL.Clear;
          varBloqueio.SQL.Add('UPDATE sistema_liberacao set usuario_ultimo_login = '''+getUser('USUARIO')+' '+getUser('EMAIL')+''', data_ultimo_login = CURRENT_TIMESTAMP where cliente = '''+getConf('CLIENTE')+''' ');
          varBloqueio.ExecSQL;
     end;

     varBloqueio.Close;
     FreeAndNil(varBloqueio);
     except
           begin
             setMensagem('Não foi possível validar o usuário, o sistema será fechado. Verifique a sua conexão com a internet.','erro');
             PRINCIPAL.Close; 
           end;
     end;

     if getConf('ATUALIZACAO_ATIVO') = 'NAO' Then
     Begin
          PRINCIPAL.criaAlerta('configurar', 'As atualizações para a sua empresa estão inativas neste momento. Mude esta opção em Arquivos>Sistema>Configurações.', 'Arquivos>Sistema>Configurações.');
          validacao := false;
          Terminate;
     End;

     if validacao then //Valida quanto a configuração da Thread
     Begin

          Try
             Try
                PRINCIPAL.SpeedAtualizacao.Visible := False;

                conectaMySQL(mysqlSistemaBanco,mysqlSistemaServidor,mysqlSistemaUsuario, mysqlSistemaSenha);
                varSQL := TZQuery.Create(PRINCIPAL);
                varSQL.Connection := PRINCIPAL.MySQL;
                varSQL.SQL.Add(' SELECT trim(versao) FROM sistema_atualizacao WHERE sistema = "'+firebirdAlias+'" and ativo = "SIM" ');
                varSQL.Open;

                if varSQL.RecordCount = 0 then
                Begin
                     PRINCIPAL.setMensagem('MySQL = Ocorreu um erro ao tentar verificar a versão do sistema para a atualização! Verifique a sua internet.');
                     PRINCIPAL.criaAlerta('configurar', 'Não foi encontrada as informações de atualização no banco remoto. Chame o suporte técnico!', celulaTelefone);
                     Exit;
                End
                else
                Begin
                     if varSQL.Fields[0].AsString <> GetVersaoSistema()  then
                     Begin
                          PRINCIPAL.SpeedAtualizacao.Visible := true;
                          PRINCIPAL.SpeedAtualizacao.Hint := 'Atualização '+varSQL.Fields[0].AsString;
                     End;
                end;
             Except
                   PRINCIPAL.setMensagem('Ocorreu um erro ao tentar verificar a versão do sistema para a atualização! Verifique a sua internet.');
             End;
          Finally
                 varSQL.Close;
                 FreeAndNil(varSQL);
                 PRINCIPAL.MySQL.Disconnect;
                 Terminate;
          end;

  end;

end;


end.
