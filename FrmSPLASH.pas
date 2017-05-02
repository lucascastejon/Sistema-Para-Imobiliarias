unit FrmSPLASH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ZDataset, Menus, IdBaseComponent,
  IdComponent, IdIPWatch, ShellAPI, unConfiguracao;

type
  TSplash = class(TForm)
    Splash: TImage;
    Info: TLabel;
    Tempo: TTimer;
    IP: TIdIPWatch;
    procedure FormShow(Sender: TObject);
    procedure TempoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash: TSplash;

implementation

uses FrmLOGIN, FrmDM_Cadastro, FrmPrincipal, ZAbstractDataset, DB, unUtilitario,
  unINI;

{$R *.dfm}

procedure TSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TSplash.TempoTimer(Sender: TObject);
begin
     FrmSPLASH.Splash.Close;
end;

procedure TSplash.FormShow(Sender: TObject);
Var varSQL: TZQuery;
Begin
     Application.Title := 'Processando...';
     self.Show;
     self.Repaint;

     TRY
     Info.Caption := 'Procurando servidor...';
     Info.Repaint;
     PRINCIPAL.Conexao.Properties.Text := 'codepage=ISO8859_1';
     PRINCIPAL.Conexao.Connected := True;
     PRINCIPAL.Conexao_log.Connected := True;

     If PRINCIPAL.Conexao.Connected = True Then
     Begin
          Info.Caption := 'Conexão efetuada...';
          Info.Repaint;
     end;

     Info.Caption := 'Validando usuário...';
     Info.Repaint;
     varSQL := getSelect('select * from usuario where nome = '''+Login.Valor_Usuario.Text+''' and senha = '''+Login.Valor_Senha.Text+''' and ATIVO = ''SIM''');

      If varSQL.RecordCount <> 1 Then
      Begin
           Info.Caption := 'Dados não encontrados!';
           Info.Repaint;
           Tempo.Enabled := true;
           Login.Visible := True;
           exit;
      end
      else
      Begin
          Info.Caption := 'Resgatando configurações...';
          Info.Repaint;
          criaArquivoConfiguracao();

          setUser('SERVIDOR', StringReplace(Login.Valor_Servidor.Text,'_','',[rfReplaceAll]));
          setUser('LOGIN_SERVIDOR', Login.Valor_Servidor.Text);
          //setConf('EMPRESA_IP_LOCAL', StringReplace(Login.Valor_Servidor.Text,'_','',[rfReplaceAll]));
          setConf('MAQUINA_SERVIDORA', Login.Valor_Servidor.Text);
          setUser('USUARIO', Login.Valor_Usuario.Text);
          setUser('EMAIL', varSQL.FieldByName('EMAIL').AsString);
          setUser('CODIGO_USUARIO', varSQL.FieldByName('ID_USUARIO').AsString);
          setUser('ADMINISTRADOR', varSQL.FieldByName('ADMINISTRADOR').AsString);
          setUser('ULTIMO_LOGIN', DateTimeToStr(Date + Time));
          setUser('MAQUINA', getNomeComputador());
          setUser('IP', IP.LocalIP);
          setUser('HD', getNumeroHD());
          setUser('EMAIL', varSQL.FieldByName('EMAIL').AsString);

          Info.Caption := 'Verificando 3º Backup...';
          Info.Repaint;
          if ((getBackupBanco('BKP_DESTINO3') = 'NULO') OR (getBackupBanco('BKP_DESTINO3') = 'C:\IMOBILIARIA.CDS')) and ((getUser('IP') = getConf('MAQUINA_SERVIDORA')) or (getUser('IP') = getUser('SERVIDOR'))) then
          Begin
               unUtilitario.setMensagem('Chame o suporte técnico '+celulaNome+' para configurar o "BKP_DESTINO3"...'+#13+
               'Informações ao suporte: (BANCO 1) Altere as configurações do Firebird "aliases.conf" para:'+#13+
               firebirdAlias+' = C:\IMOBILIARIA.CDS','informa');
               setBackupBanco('BKP_DESTINO3', 'C:\IMOBILIARIA.CDS');
          end;

          Info.Caption := 'Verificando status do banco...';
          Info.Repaint;
          PRINCIPAL.verificarBanco();

          FrmLOGIN.Login.Close;
          Info.Caption := 'Login efetuado com sucesso. Realizando backup...';
          Info.Repaint;
          PRINCIPAL.LabelUsuario.Caption := getUser('USUARIO') + ' (Cód: '+ getUser('CODIGO_USUARIO')+') (IP: '+getUser('IP')+')';
          PRINCIPAL.setMensagem('BEM-VINDO AO SISTEMA CÉLULA IMOBILIÁRIA '+getUser('USUARIO')+', SEU CÓDIGO INTERNO É O '+getUser('CODIGO_USUARIO')+' .');

          Info.Caption := 'Verificando backup...';
          Info.Repaint;
          setBackup();

          Info.Caption := 'Verificando atualização...';
          Info.Repaint;
          verificaAtualizacao();

          {
          //RETIRAR DEPOIS DE UM TEMPO DE USO PARA O SISTEMA FICAR MAIS RÁPIDO!
          //ISSO É PARA AJUSTAR O FORMATO DOS CONTRATOS.
          varSQL := unUtilitario.getSelect('select FIRST 1 1 as resultado from contrato where reajuste like ''%(%''  ');
          if varSQL.FieldByName('resultado').IsNull then
          Begin
               varSQL.Close;

               varSQL :=unUtilitario.getSQL('update contrato set reajuste = ''IGP-DI (FGV)'' where reajuste = ''IGP/FGV'' ');
               varSQL.ApplyUpdates;
               varSQL.Close;

               varSQL :=unUtilitario.getSQL('update contrato set reajuste = ''IGP-M (FGV)'' where reajuste = ''IGPM/FGV'' ');
               varSQL.ApplyUpdates;
               varSQL.Close;

               varSQL :=unUtilitario.getSQL('update contrato set reajuste = ''IGP-M (FGV)'' where reajuste = ''IGPM'' ');
               varSQL.ApplyUpdates;
               varSQL.Close;

               varSQL :=unUtilitario.getSQL('update contrato set reajuste = ''IPC (FIPE)'' where reajuste = ''IPC/FIPE'' ');
               varSQL.ApplyUpdates;
               varSQL.Close;

               varSQL :=unUtilitario.getSQL('update contrato set reajuste = ''IPCA (IBGE)'' where reajuste = ''IPCA/IBGE'' ');
               varSQL.ApplyUpdates;
               varSQL.Close;

               varSQL :=unUtilitario.getSQL('update contrato set reajuste = ''INPC (IBGE)'' where reajuste = ''INPC/IBGE'' ');
               varSQL.ApplyUpdates;
               varSQL.Close;


          end;
          }

          //Info.Caption := 'Verificando wallpaper...'; //PQ ESSE É O QUE MOSTRA MAIS LENTO
          Info.Caption := 'Resgatando configurações. . .';
          Info.Repaint;

          if usuarioLogadoVerifica() then
          Begin
               ShellExecute(0, 'open', 'http://celuladigital.com.br/sistemas/suporte/kb/faq.php?id=3&lang=pt_br', nil, nil, SW_SHOWNORMAL);
               unUtilitario.setMensagem('O seu usuário já encontra-se logado no sistema em outro computador ou em outra janela do sistema.'+#13+'Se caso isso for um engano, favor chamar o seu Gerente ou o Suporte Técnico do sistema.'+#13+'Existe um botão na tela de login (cadeado aberto) para liberar os acessos.'+#13+'Se o Windows abrir uma janela APÓS ESSA, clique em CANCELAR/DEBUGAR para fechar.','informa');
               Application.Terminate;
          end
          else
              usuarioLogadoColoca();

          try
             if getUser('WALLPAPER') <> 'NULO' then
                PRINCIPAL.Fundo.Picture.LoadFromFile(getUser('WALLPAPER'));
          except
                Info.Caption := 'Imagem de fundo não encontrada!';
                Info.Repaint;
                setUser('WALLPAPER','NULO');
          end;

          End;


     EXCEPT
                ON E: Exception DO
                Begin

                     if StrPos(pchar(E.Message),'Your user name and password are not defined') <> nil Then
                        info.Caption := 'Login do Banco com Problema! Chame o Suporte Técnico!'
                     else
                     if StrPos(pchar(E.Message),'Unable to complete network request to host') <> nil then
                        info.Caption := 'Servidor não encontrado OU fora do ar!'
                     else
                     if StrPos(pchar(E.Message),'Error while trying to open file') <> nil then
                     Begin
                          unUtilitario.setMensagem(e.Message,'erro');
                          info.Caption := 'Erro ao abrir arquivo do banco, tente mais uma vez!';
                          setUser('LOGIN_SERVIDOR', StringReplace(getUser('LOGIN_SERVIDOR'),'_','',[rfReplaceAll]));
                     end
                     else
                     if Pos('Unknown MySQL server host',e.Message) > 0 then
                        unUtilitario.setMensagem('Parece que você não está na Internet.'+#13+'Caso queira, conecte-se para poder atualizar o sistema entre outras vantagens.'+#13+e.Message,'erro')
                     else
                     if Pos('connect to MySQL server on',e.Message) > 0 then
                        unUtilitario.setMensagem('"VOCÊ ESTÁ SEM INTERNET!"'+#13+' Erro de verificação de data/hora do computador com a internet. Parece que você não está na Internet.'+#13+'Caso queira, conecte-se para poder atualizar o sistema entre outras vantagens.'+#13+e.Message,'erro')
                     else
                     begin
                         unUtilitario.setMensagem(e.Message,'erro');
                         Info.Caption := 'ERRO! '+Info.Caption;
                         Info.Repaint;
                         Application.Title := 'ERRO!';
                     end;

                     //espera(2,'Foi encontrado um erro no momento do login...');

                     Tempo.Enabled := true;
                     Login.Visible := true;
                     Application.Title := Titulo;
                     Exit;
                End;
          end;

     varSQL.Close;
    FreeAndNil(varSQL);
    Application.Title := Titulo;

    PRINCIPAL.leitorMensagem.Enabled := True;
    PRINCIPAL.ExportarWeb.Enabled := True;
    PRINCIPAL.checaConexao.Enabled := True;

    Tempo.Enabled := true;
end;


end.             
