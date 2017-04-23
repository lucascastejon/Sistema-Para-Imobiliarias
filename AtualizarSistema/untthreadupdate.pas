unit untthreadupdate;

interface

uses
  Classes, sysutils, IniFiles, Dialogs, Windows, Forms, unConfiguracao;

type
  threadupdate = class(TThread)
  private

    { Private declarations }
  protected
    procedure Execute; override;
  public
    procedure conectar();
    procedure fechaPrograma();
    procedure espera();
  end;


implementation

uses untfrmproutupdate, unINI, FrmPrincipal, unUtilitario;

procedure threadupdate.fechaPrograma();
begin
  PRINCIPAL.fechaPrograma();
end;

procedure threadupdate.espera();
begin
  unUtilitario.espera(3,'Reiniciando...');
end;

procedure threadupdate.conectar;
var
  Destino: String;
begin

try

  frmproutupdate.batualizar.Enabled := False;
  frmproutupdate.bfechar.Enabled := False;

  while not terminated do
  begin

    with frmproutupdate do
    begin
      //Baixando a atualização.
      ftpupdate.Host := ftpImoveisServidor;
      ftpupdate.Username := ftpImoveisUsuario;
      ftpupdate.Password := ftpImoveisSenha;
      Destino := ExtractFilePath(ParamStr(0)) + ftpAtualizacaoArquivoRar;
      ftpupdate.Passive:=true;

      ftpupdate.Connect();
      ftpupdate.changedir(ftpAtualizacaoCaminho);
      BytesToTransfer := ftpupdate.Size(ftpAtualizacaoArquivoRar);
      ftpupdate.Get(ftpAtualizacaoCaminho + ftpAtualizacaoArquivoRar, Destino,True,false);
      ftpupdate.Disconnect;
             
      //Descompactando o arquivo.
      if FileExists(Destino) then
      begin

        DeleteFile(PChar(ExtractFilePath(ParamStr(0))+'\'+ftpAtualizacaoArquivoExe+'.ANTIGO'));

        if NOT RenameFile(ExtractFilePath(ParamStr(0))+'\'+ftpAtualizacaoArquivoExe,ExtractFilePath(ParamStr(0))+'\'+ftpAtualizacaoArquivoExe+'.ANTIGO') Then
          unUtilitario.setMensagem('Erro ao tentar renomear o executável como  '+ftpAtualizacaoArquivoExe+'.ANTIGO. Entre em contato com o suporte técnico!' ,'erro');
                    
          WinExec(PChar(ExtractFilePath(ParamStr(0))+'Rar.exe x -o+ "'+Destino+'" "'+ExtractFilePath(ParamStr(0))+'"'), SW_SHOWNORMAL);

          StatusBar1.Panels[0].Text := 'Pronto! O sistema está reiniciando...';
          Synchronize(Self.espera);
          Synchronize(fechaPrograma);

      end
      else
      Begin
        StatusBar1.Panels[0].Text := 'A atualização não foi baixada corretamente!';
        frmproutupdate.batualizar.Enabled := true;
        frmproutupdate.bfechar.Enabled := true;        
      end;
    End;

    Terminate;

  end;

  except
    DeleteFile(Pchar(Destino));
    setMensagem('ERRO AO BAIXAR ATUALIZAÇÃO! '+#13+'Verifique a sua conexão com a internet e tente atualizar novamente mais tarde...','erro');
    Synchronize(fechaPrograma);
    Terminate;
  end;
  
end;

procedure threadupdate.Execute;
begin
     FreeOnTerminate := True;
     conectar();
end;

end.
