unit FrmLOGIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DB, DBClient, SimpleDS,
  jpeg, ZAbstractRODataset, ZAbstractDataset, ZDataset, Provider, ZConnection,
  ShellAPI, DateUtils, unSeguranca, unConfiguracao;

type
  TLogin = class(TForm)
    Image2: TImage;
    BtnFechar: TSpeedButton;
    BtnLogin: TSpeedButton;
    Label1: TLabel;
    Valor_Servidor: TEdit;
    Label2: TLabel;
    Valor_Usuario: TEdit;
    Label3: TLabel;
    Valor_Senha: TEdit;
    Label4: TLabel;
    Label_Caps: TLabel;
    Label_Num: TLabel;
    SpeedButton12: TSpeedButton;
    labelVersao: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label5: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    //procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Valor_ServidorChange(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
        procedure conectaBanco(Banco, Servidor, Usuario, Senha: String);
    { Public declarations }
  end;

var
  Login: TLogin;
  //Tentativas : Integer;
  //Fundo: String;

implementation

uses FrmSPLASH, FrmDM_Cadastro, FrmPrincipal, unUtilitario, unINI;

{$R *.dfm}

procedure TLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  Case Key of
  VK_NUMLOCK:
              Begin
                   If Label_Num.Visible = true Then
                      Label_Num.Visible := False
                      Else
                      Label_Num.Visible := True;
              End;

  VK_CAPITAL:
              Begin
                   If Label_Caps.Visible = true Then
                      Label_Caps.Visible := False
                      Else
                      Label_Caps.Visible := True;
              End;

  VK_RETURN: BtnLoginClick(Sender);
  End;
end;

procedure TLogin.BtnFecharClick(Sender: TObject);
begin
     PRINCIPAL.Close;
     //Application.Terminate(); //FECHA A APLICAÇÃO.
end;

procedure TLogin.BtnLoginClick(Sender: TObject);
var varSQL: TZQuery;
    data: tDate;
begin

     Valor_Servidor.Text := Trim(Valor_Servidor.Text);
     Valor_Usuario.Text := Trim(Valor_Usuario.Text);
     Valor_Senha.Text := Trim(Valor_Senha.Text);

     IF (Length(Valor_Servidor.Text) = 0) OR (Length(Valor_Senha.Text) = 0) OR (Length(Valor_Usuario.Text) = 0) then
     Begin
          unUtilitario.setMensagem('Faltando Informações.','informa');
          exit;
     End;

     Login.Visible := False;

     //BANCO SISTEMA
     //firebirdAlias = BANCO ANTIGO
     //firebirdAlias+2 = BANCO NOVO

     conectaBanco(firebirdAlias+'2', Valor_Servidor.Text, firebirdUsuario, firebirdSenha);

     //BANCO DE LOG - MONITORAMENTO
     PRINCIPAL.Conexao_log.Connected := False;

     PRINCIPAL.Conexao_log.Database := firebirdAliasLOG;
     //PRINCIPAL.Conexao_log.Database := 'logs';
     PRINCIPAL.Conexao_log.HostName := StringReplace(Valor_Servidor.Text,'_','',[rfReplaceAll]);
     PRINCIPAL.Conexao_log.User := firebirdUsuario;
     PRINCIPAL.Conexao_log.Password := firebirdSenha;

     try

     //PRINCIPAL.SERIAL := '';
     //unSeguranca.buscaEmpresaMysql();

        principal.Caption := 'Verificando a data e hora deste computador junto aos servidores...';
        VarSQL := TZQuery.Create(self);
        VarSQL.SQL.Clear;
        conectaMySQL(mysqlImoveisBanco, mysqlImoveisServidor, mysqlImoveisUsuario, mysqlImoveisSenha);
        VarSQL.Connection := PRINCIPAL.MySQL;
        VarSQL.SQL.Add('SELECT CURDATE() AS DATA');
        VarSQL.Open;
        data := VarSQL.FieldByName('DATA').AsDateTime;
        VarSQL.Close;
        PRINCIPAL.MySQL.Disconnect;

        //VarSQL.Connection := PRINCIPAL.Conexao;
        VarSQL := unUtilitario.getSelect('select current_date AS DATA from RDB$DATABASE');

        if data <> VarSQL.FieldByName('DATA').AsDateTime then
           unUtilitario.setMensagem('A DATA do SERVIDOR está ERRADA! Favor arrume antes de usar o sistema!','erro');

        VarSQL.Close;

        if data <> DateOf(Now()) then
           unUtilitario.setMensagem('A DATA deste COMPUTADOR está ERRADA! Favor arrume antes de usar o sistema!','erro');

     EXCEPT
     ON E: Exception DO
     Begin
          if Pos('Unknown MySQL server host',e.Message) > 0 then
             unUtilitario.setMensagem('Parece que você não está na Internet.'+#13+'Caso queira, conecte-se para poder atualizar o sistema entre outras vantagens.'+#13+e.Message,'erro')
          else
          if Pos('connect to MySQL server on',e.Message) > 0 then
             unUtilitario.setMensagem('(VOCÊ ESTÁ SEM INTERNET!) Erro de verificação de data/hora do computador com a internet. Parece que você não está na Internet.'+#13+'Caso queira, conecte-se para poder atualizar o sistema entre outras vantagens.'+#13+e.Message,'erro')
          else
              unUtilitario.setMensagem(e.Message,'erro');

          FreeAndNil(varSQL);
     end;
     end;

     FreeAndNil(varSQL);
     
     Application.CreateForm(TSplash, Splash);
     Splash.ShowModal;

     Login.Visible := True;
end;

procedure TLogin.conectaBanco(Banco, Servidor, Usuario, Senha: String);
Begin
     PRINCIPAL.Conexao.Connected := False;

     if POS('_',Servidor) = 0 then
     BEGIN
          PRINCIPAL.SpeedBackup.Visible := False;
          PRINCIPAL.Conexao.Database := firebirdAlias;
          PRINCIPAL.Conexao.HostName := StringReplace(Servidor,'_','',[rfReplaceAll]);
          PRINCIPAL.Conexao.User := Usuario;
          PRINCIPAL.Conexao.Password := Senha;
          PRINCIPAL.Fundo_MenuOriginal.Visible := True;
     END
     ELSE
     BEGIN
          PRINCIPAL.SpeedBackup.Visible := True;
          PRINCIPAL.Conexao.Database := Banco;
          PRINCIPAL.Conexao.HostName := StringReplace(Servidor,'_','',[rfReplaceAll]);
          PRINCIPAL.Conexao.User := Usuario;
          PRINCIPAL.Conexao.Password := Senha;
          PRINCIPAL.Fundo_MenuOriginal.Visible := False;
     END;

     try
        PRINCIPAL.Conexao.Connect;
     except
           unUtilitario.setMensagem('Erro ao tentar estabelecer uma conexão com o servidor. Verifique o nome do servidor. (Atenção para o _ )','erro');
           PRINCIPAL.Close;
     end;
end;

procedure TLogin.FormCreate(Sender: TObject);
begin

   PRINCIPAL.leitorMensagem.Enabled := False;
   PRINCIPAL.ExportarWeb.Enabled := False;
   PRINCIPAL.checaConexao.Enabled := False;

If getkeystate(vk_numlock) = 0 then // Num lock
   Label_Num.Visible := False
   Else
   Label_Num.Visible := True;

If getkeystate(vk_CAPITAL) = 0 then // Caps lock
   Label_Caps.Visible := False
   Else
   Label_Caps.Visible := True;

   if getUser('LOGIN_SERVIDOR') = 'NULO' then
      Valor_Servidor.Text := ''
   else
       Valor_Servidor.Text := getUser('LOGIN_SERVIDOR');
       
   if getUser('USUARIO') = 'NULO' then
      Valor_Usuario.Text := ''
   else
       Valor_Usuario.Text := getUser('USUARIO');

   labelVersao.Caption := 'Versão: '+ GetVersaoSistema()+'   '+celulaTelefone;
       
end;

procedure TLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TLogin.FormShow(Sender: TObject);
begin

     Valor_ServidorChange(Sender);
     Login.Valor_Senha.Text := '';
     Login.Valor_Senha.SetFocus;

end;

procedure TLogin.SpeedButton12Click(Sender: TObject);
begin

     If unUtilitario.setMensagem('Deseja trocar a imagem de fundo?','confirma') = IDYES Then
     Begin
          PRINCIPAL.Imagem.Execute;

          IF PRINCIPAL.Imagem.FileName <> '' THEN
          Begin
               setUser('WALLPAPER',PRINCIPAL.Imagem.FileName);
               PRINCIPAL.Fundo.Picture.LoadFromFile(PRINCIPAL.Imagem.FileName);
               unUtilitario.setMensagem('A imagem foi trocada com sucesso.','informa')
          End
          ELSE
              setUser('WALLPAPER','NULO');
     End;
end;

procedure TLogin.SpeedButton1Click(Sender: TObject);
begin
     ShellExecute(GetDesktopWindow,'open',pchar('http://celuladigital.com.br/www/wiki/doku.php?id=instalacao_acesso_remoto'),nil,nil,sw_ShowNormal);
end;

procedure TLogin.SpeedButton2Click(Sender: TObject);
begin
     ShellExecute(GetDesktopWindow,'open',pchar('http://celuladigital.com.br/www/wiki/doku.php?id=problemas_login'),nil,nil,sw_ShowNormal);
end;
procedure TLogin.SpeedButton3Click(Sender: TObject);
var sql: TZQuery;
begin
// ESTE PROCESSO EVITA QUE O SISTEMA SEJA ABERTO VÁRIAS VEZES.
     unUtilitario.setMensagem('Em caso de falha na rede que trave os logins do sistema. Apenas uma conta de Administrador do sistema poderá liberar o acesso dos usuários.'+#13+'Digite seu nome de usuário(a) e sua senha nos campos correspondentes e clique neste ícone para liberar os logins da equipe.','informa');

     Valor_Servidor.Text := Trim(Valor_Servidor.Text);
     Valor_Usuario.Text := Trim(Valor_Usuario.Text);
     Valor_Senha.Text := Trim(Valor_Senha.Text);

     if Length(Valor_Servidor.Text) <= 0 then
     Begin
          unUtilitario.setMensagem('Informe o servidor.','erro');
          Exit;
     end;

     if Length(Valor_Usuario.Text) <= 0 then
     Begin
          unUtilitario.setMensagem('Informe o nome do usuário(a).','erro');
          Exit;
     end;

     if Length(Valor_Senha.Text) <= 0 then
     Begin
          unUtilitario.setMensagem('Informe a senha para login.','erro');
          Exit;
     end;

     conectaBanco(firebirdAlias+'2', Valor_Servidor.Text, firebirdUsuario, firebirdSenha);
     sql := getSelect('select * from usuario where nome = '''+Valor_Usuario.Text+''' and senha = '''+Valor_Senha.Text+''' and ATIVO = ''SIM''');

     if sql.FieldByName('ADMINISTRADOR').AsString = 'SIM' then
     Begin
          sql := getSQL('delete from tabela where NOMETEC = ''LOGIN'' and OBS = ''LOGIN >> BLOQUEADO'' ');
          sql.ApplyUpdates;
          unUtilitario.setMensagem('Processo concluído! Os usuários bloqueados podem acessar o sistema novamente.','informa');
          PRINCIPAL.Conexao.Disconnect;
     end
     else
     Begin
          PRINCIPAL.Conexao.Disconnect;
          unUtilitario.setMensagem('Seu usuário não é ADMINISTRADOR(A) do sistema. Favor chamar um GERENTE ou ADMINISTRADOR(A) do sistema.','erro');
          Exit;
     end;
end;

procedure TLogin.Valor_ServidorChange(Sender: TObject);
begin
     if Length(Trim(Valor_Servidor.Text)) > 0 then
        if Pos('_',Valor_Servidor.Text) > 0 then
        Begin
             Valor_Servidor.Color := clBlack;
             Valor_Servidor.Font.Color := clWhite;
        end
        else
        Begin
             Valor_Servidor.Color := clWhite;
             Valor_Servidor.Font.Color := clBlack;
        end;
end;

end.
