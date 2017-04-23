unit FrmUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, DBCtrls, Mask, ExtDlgs, ZDataset, ZAbstractRODataset, ZAbstractDataset, unConfiguracao;

type
  TCAD_Usuario = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DS_Autorizacao: TDataSource; 
    ZAutorizacao: TZQuery;
    Label6: TLabel;
    EditSenha: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Label8Click(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure ZAutorizacaoNewRecord(DataSet: TDataSet);
    procedure Tab_CadastroShow(Sender: TObject);
    procedure Tab_InformacoesShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
        alterouSenha: boolean;
    { Public declarations }
  end;

var
  CAD_Usuario: TCAD_Usuario;

implementation

uses unCamposBusca, FrmDM_Cadastro, unMsg, FrmPrincipal, unImagem, unUtilitario,
  unLog, FrmPainel;

{$R *.dfm}

procedure TCAD_Usuario.FormCreate(Sender: TObject);
begin
  inherited;   
                
  DM_Cadastro.Z_Usuario.SQL.Clear;
  DM_Cadastro.Z_Usuario.SQL.Add('select * from usuario where ativo <> ''XXX'' and id_usuario <> 1 order by nome');
  DM_Cadastro.Z_Usuario.Open;

  DS.DataSet := DM_Cadastro.Z_Usuario;

  alterouSenha := False;
  DM_Cadastro.Z_Usuario.Edit;
end;

procedure TCAD_Usuario.Label8Click(Sender: TObject);
begin
     Application.CreateForm(TPainel,Painel);
end;

procedure TCAD_Usuario.Tab_CadastroShow(Sender: TObject);
begin
  inherited;
  Tab_InformacoesShow(Sender);
end;

procedure TCAD_Usuario.Tab_InformacoesShow(Sender: TObject);
begin
  inherited;
  ZAutorizacao.Close;
  ZAutorizacao.Params[0].AsInteger := ds.DataSet.FieldByName('ID_USUARIO').AsInteger;
  ZAutorizacao.Open;
  ZAutorizacao.Edit;
end;

procedure TCAD_Usuario.ZAutorizacaoNewRecord(DataSet: TDataSet);
begin
  inherited;

  if ds.DataSet.FieldByName('ID_USUARIO').AsInteger = 1 then
  Begin
       unUtilitario.setMensagem('Não é permitido editar, em nenhum sentido, o registro de ADMINISTRADOR.'+#13+'Este usuário é usado pela '+celulaNome+' para efetuar manutenção no sistema.','informa');
       close;
  end;

  if ds.DataSet.Active then
     if NOT ds.DataSet.FieldByName('ID_USUARIO').IsNull then
     Begin
          ZAutorizacao.FieldByName('ID_USUARIO').AsString := ds.DataSet.FieldByName('ID_USUARIO').AsString;
     end;
end;

procedure TCAD_Usuario.Btn_NovoClick(Sender: TObject);
begin
  inherited;

    If DM_Cadastro.Z_Curinga_02.Active Then
     DM_Cadastro.Z_Curinga_02.Close;

     DM_Cadastro.Z_Curinga_02.SQL.Clear;
     DM_Cadastro.Z_Curinga_02.SQL.Add('select ID from SP_GEN_USUARIO_ID');
     DM_Cadastro.Z_Curinga_02.Open;

     DM_Cadastro.Z_UsuarioID_USUARIO.Value := DM_Cadastro.Z_Curinga_02.FieldByName('ID').Value;

     DM_Cadastro.Z_Curinga_02.Close;

  DM_Cadastro.Z_UsuarioATIVO.Value := 'SIM';
  DM_Cadastro.Z_UsuarioADMINISTRADOR.Value := 'NAO';

  DBEdit2.SetFocus;
end;

procedure TCAD_Usuario.DBEdit3Change(Sender: TObject);
begin

  if DBEdit3.Focused then
     alterouSenha := True
  else
      alterouSenha := False;
      
end;

procedure TCAD_Usuario.Btn_ExcluirClick(Sender: TObject);
begin
     unUtilitario.setMensagem('Recomendamos NÃO excluir nenhum usuário do sistema, apenas desative-o.'+#13+'(Isso dificulta o gerente da empresa a identificar alguns registros posteriormente.)','informa');
  IF application.messagebox('Excluir este usuário?', 'Aviso '+celulaNome, MB_YESNO) = mryes then
    begin
      DS.Edit;
      ds.DataSet.FieldByName('ATIVO').AsString := 'XXX';
      DS.DataSet.Post;

      setLog(DS.DataSet.Fields[0].AsString, 'EXCLUSÃO', Self.Caption, (DS.DataSet as TZQuery));

      Tab_Pesquisa.Show;

      unMsg.INFORMA(2);
      Btn_Novo.Enabled := True;
    end;


end;

procedure TCAD_Usuario.Btn_GravarClick(Sender: TObject);
begin

  if ds.DataSet.FieldByName('ID_USUARIO').AsInteger = 1 then
  Begin
       unUtilitario.setMensagem('Não é permitido editar, em nenhum sentido, o registro de ADMINISTRADOR.'+#13+'Este usuário é usado pela Célula Digital Software para efetuar manutenção no sistema.','informa');
       close;
  end;

  if Length(trim(dbedit3.Text)) = 0 Then
  Begin
       unUtilitario.setMensagem('Entre com uma senha!','erro');
       exit;
  end;

  if alterouSenha then
     if dbedit3.Text <> EditSenha.Text then
     Begin
          unUtilitario.setMensagem('As senhas não são iguais!','erro');
          exit;
     end;
     
     

  if Length(trim(dbedit2.Text)) < 2 then
    begin
      messagedlg('Nome de usuário deve conter no mínimo 2 caracteres!', mtError, [mbOK],0);
      dbedit2.SetFocus;
      exit;
    end;
  if Length(trim(dbedit3.Text)) < 2 then
    begin
      messagedlg('A senha deve conter no mínimo 2 caracteres!', mtError, [mbOK],0);
      dbedit3.SetFocus;
      exit;
    end;     

     If DM_Cadastro.Z_UsuarioFUNDO.Value = '' Then
        DM_Cadastro.Z_UsuarioFUNDO.Value := 'X_Foto.jpg';

  inherited;

  try
     ZAutorizacao.Edit;
     ZAutorizacao.Post;
     ZAutorizacao.ApplyUpdates;
  Except
        ZAutorizacao.Cancel;
        ZAutorizacao.CancelUpdates;
  end;

  EditSenha.Text := '';
  alterouSenha := False;

end;

procedure TCAD_Usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
CAD_Usuario := nil;
end;

end.
