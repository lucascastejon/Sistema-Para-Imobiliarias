unit FrmTipoImovel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, Mask, DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, unConfiguracao;

type
  TCAD_TipoImovel = class(TCAD_MATRIZ)
    Label1: TLabel;
    Edit_Codigo: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    btnadd_subtipo: TBitBtn;
    btnCancel_subtipo: TBitBtn;
    btnGravar_subtipo: TBitBtn;
    btnExcluir_subtipo: TBitBtn;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    comboTiposDestino: TComboBox;
    comboSubtiposDestino: TComboBox;
    labelDestinoTotal: TLabel;
    Button1: TButton;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    labelOrigemTotal: TLabel;
    comboTipos: TComboBox;
    comboSubtipos: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure comboSubtiposDestinoCloseUp(Sender: TObject);
    procedure comboSubtiposCloseUp(Sender: TObject);
    procedure comboTiposDestinoCloseUp(Sender: TObject);
    procedure comboTiposCloseUp(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Tab_InformacoesShow(Sender: TObject);
    procedure DBCheckBox3Click(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_EsquerdaClick(Sender: TObject);
    procedure Btn_DireitaClick(Sender: TObject);
    procedure Tab_CadastroShow(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnadd_subtipoClick(Sender: TObject);
    procedure btnCancel_subtipoClick(Sender: TObject);
    procedure btnGravar_subtipoClick(Sender: TObject);
    procedure btnExcluir_subtipoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_TipoImovel: TCAD_TipoImovel;

implementation

uses FrmDM_Cadastro, FrmPrincipal, unCamposBusca, unMsg, unLog, unUtilitario;

{$R *.dfm}

procedure TCAD_TipoImovel.FormCreate(Sender: TObject);
begin
  inherited;
  unCamposBusca.BUSCA(DM_Cadastro.Z_Imovel_Tipo, 'select * from imovel_tipo where id_imovel_tipo = :CODIGO ORDER BY NOME');
  unCamposBusca.BUSCA(DM_Cadastro.Z_Imovel_Subtipo, 'select * from imovel_subtipo where padrao <> ''XXX'' and id_imovel_tipo = :TIPO order by nome');

  DM_Cadastro.Z_Imovel_Tipo.Close;
  DM_Cadastro.Z_Imovel_Tipo.SQL.Clear;
  DM_Cadastro.Z_Imovel_Tipo.SQL.Add('select * from imovel_tipo where ATIVO <> ''XXX'' ORDER BY NOME');
  DM_Cadastro.Z_Imovel_Tipo.Open;

  DS.DataSet := DM_Cadastro.Z_Imovel_Tipo;
end;

procedure TCAD_TipoImovel.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  DM_Cadastro.Z_Imovel_Tipo.FieldByName('ATIVO').Value := 'SIM';
  DM_Cadastro.Z_Imovel_Tipo.FieldByName('PADRAO').Value := 'NAO';
  DM_CADASTRO.Z_Imovel_Tipo.FieldByName('COMERCIAL').Value := 'NAO';

  unCamposBusca.BUSCA(DM_Cadastro.Z_Curinga_02, 'select ID from SP_GEN_IMOVEL_TIPO_ID ');

  DM_Cadastro.Z_Imovel_Tipo.FieldByName('ID_IMOVEL_TIPO').Value := DM_Cadastro.Z_Curinga_02.FieldByName('ID').Value;

  DM_Cadastro.Z_Curinga_02.Close;

Tab_CadastroShow(Sender);

DBEdit2.SetFocus;

end;

procedure TCAD_TipoImovel.Button1Click(Sender: TObject);
var sql: TZQuery;
origemTipo, origemSubtipo, destinoTipo, destinoSubtipo: string;
begin

     origemTipo := comboTipos.Items[comboTipos.ItemIndex];
     origemSubtipo := comboSubtipos.Items[comboSubtipos.ItemIndex];
     destinoTipo := comboTiposDestino.Items[comboTiposDestino.ItemIndex];
     destinoSubtipo := comboSubtiposDestino.Items[comboSubtiposDestino.ItemIndex];

     if Length(Trim(origemTipo)) = 0 then
     Begin
          unUtilitario.setMensagem('Falta o Tipo - Origem.','informa');
          exit;
     end;

     if Length(Trim(origemSubtipo)) = 0 then
     Begin
          unUtilitario.setMensagem('Falta o Subtipo - Origem.','informa');
          exit;
     end;

     if Length(Trim(destinoTipo)) = 0 then
     Begin
          unUtilitario.setMensagem('Falta o Tipo - Destino.','informa');
          exit;
     end;

     if Length(Trim(destinoSubtipo)) = 0 then
     Begin
          unUtilitario.setMensagem('Falta o Subtipo - Destino.','informa');
          exit;
     end;

     origemTipo := IDCampoSTR(origemTipo);
     origemSubtipo := IDCampoSTR(origemSubtipo);
     destinoTipo := IDCampoSTR(destinoTipo);
     destinoSubtipo := IDCampoSTR(destinoSubtipo);

     sql := unUtilitario.getSQL('update imovel set id_imovel_tipo = '+destinoTipo+', id_imovel_subtipo = '+destinoSubtipo+' where ativo = ''SIM'' and id_imovel_tipo = '+origemTipo+' and id_imovel_subtipo = '+origemSubtipo+'  ');

     unUtilitario.setMensagem('Processo concluído. Verifique no cadastro de imóveis.','informa');
     comboSubtiposCloseUp(Sender);
     comboSubtiposDestinoCloseUp(Sender);
end;

procedure TCAD_TipoImovel.comboSubtiposCloseUp(Sender: TObject);
var sql: TZQuery;
id, tipo: string;
begin

     id := comboSubtipos.Items[comboSubtipos.ItemIndex];

     if Length(Trim(id)) > 0 then
     Begin
          id := unUtilitario.IDCampoSTR(id);

          if Length(Trim(id)) > 0 then
          Begin
               sql := unUtilitario.getSelect('select count(1) as total from imovel where id_imovel_tipo = '+IDCampoSTR(comboTipos.Items[comboTipos.ItemIndex])+' and id_imovel_subtipo = '+id+' and ativo = ''SIM'' ');

               labelOrigemTotal.Caption := sql.FieldByName('total').AsString+' Imóveis.';

               sql.Close;
               FreeAndNil(sql);
          end;
     end;

end;

procedure TCAD_TipoImovel.comboSubtiposDestinoCloseUp(Sender: TObject);
var sql: TZQuery;
id, tipo: string;
begin

     id := comboSubtiposDestino.Items[comboSubtiposDestino.ItemIndex];

     if Length(Trim(id)) > 0 then
     Begin
          id := unUtilitario.IDCampoSTR(id);

          if Length(Trim(id)) > 0 then
          Begin
               sql := unUtilitario.getSelect('select count(1) as total from imovel where id_imovel_tipo = '+IDCampoSTR(comboTiposDestino.Items[comboTiposDestino.ItemIndex])+' and id_imovel_subtipo = '+id+' and ativo = ''SIM'' ');

               labelDestinoTotal.Caption := sql.FieldByName('total').AsString+' Imóveis.';

               sql.Close;
               FreeAndNil(sql);
          end;
     end;
end;

procedure TCAD_TipoImovel.comboTiposCloseUp(Sender: TObject);
var sql: TZQuery;
id: string;
begin

     id := comboTipos.Items[comboTipos.ItemIndex];

     if Length(Trim(id)) > 0 then
     Begin
          id := unUtilitario.IDCampoSTR(id);

          if Length(Trim(id)) > 0 then
          Begin

               sql := unUtilitario.getSelect('select id_imovel_subtipo, nome from imovel_subtipo where id_imovel_tipo = '+id+' order by nome');

               comboSubtipos.Items.Clear;
               while not sql.Eof do
               Begin
                    comboSubtipos.Items.Add(sql.FieldByName('nome').AsString+'-'+sql.FieldByName('id_imovel_subtipo').AsString);
                    sql.Next;
               end;

               sql.Close;
               FreeAndNil(sql);
               labelOrigemTotal.Caption := '0 Imóveis.';
          end;
     end;

end;

procedure TCAD_TipoImovel.comboTiposDestinoCloseUp(Sender: TObject);
var sql: TZQuery;
id: string;
begin

     id := comboTiposDestino.Items[comboTiposDestino.ItemIndex];

     if Length(Trim(id)) > 0 then
     Begin
          id := unUtilitario.IDCampoSTR(id);

          if Length(Trim(id)) > 0 then
          Begin

               sql := unUtilitario.getSelect('select id_imovel_subtipo, nome from imovel_subtipo where id_imovel_tipo = '+id+' order by nome');

               comboSubtiposDestino.Items.Clear;
               while not sql.Eof do
               Begin
                    comboSubtiposDestino.Items.Add(sql.FieldByName('nome').AsString+'-'+sql.FieldByName('id_imovel_subtipo').AsString);
                    sql.Next;
               end;

               sql.Close;
               FreeAndNil(sql);
               labelDestinoTotal.Caption := '0 Imóveis.';
          end;
     end;
end;

procedure TCAD_TipoImovel.Btn_GravarClick(Sender: TObject);
begin
  inherited;
  IF DM_Cadastro.Z_Imovel_Subtipo.Active tHEN
  BEGIN
  //DM_Cadastro.Z_Imovel_Subtipo.Edit;
  DM_Cadastro.Z_Imovel_Subtipo.ApplyUpdates;
  END
  ELSE
      DM_Cadastro.Z_Imovel_Subtipo.Open;

end;

procedure TCAD_TipoImovel.btnadd_subtipoClick(Sender: TObject);
begin
  if dm_cadastro.Z_Imovel_Tipo.FieldByName('id_imovel_tipo').IsNull then
    begin
      application.MessageBox('Não existe nenhum Tipo selecionado!', 'Aviso '+celulaNome, mb_ok);
      exit;
    end;

  IF NOT DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Active THEN
    DM_CADASTRO.DS_Imovel_Subtipo.DataSet.open;

  DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Append;

  btnadd_subtipo.Enabled := false;
  btnGravar_subtipo.enabled := true;
  btnExcluir_subtipo.Enabled := false;

  //DBGRID1.ReadOnly := FALSE;
  //DBGRID1.Options := [DGEDITING, dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete];

  principal.setID(DM_CADASTRO.Z_Imovel_Subtipo, 'id_imovel_subTipo', 'imovel_subtipo');
  DM_CADASTRO.DS_Imovel_Subtipo.DataSet.FieldByName('nome').FocusControl;

  DM_CADASTRO.DS_Imovel_Subtipo.DataSet.fieldbyname('id_imovel_tipo').AsInteger := dm_cadastro.Z_Imovel_Tipo.FieldByName('id_imovel_tipo').asinteger;
  DM_CADASTRO.DS_Imovel_Subtipo.DataSet.fieldbyname('PADRAO').ASSTRING := 'NAO';

end;

procedure TCAD_TipoImovel.btnCancel_subtipoClick(Sender: TObject);
begin
  DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Cancel;

  btnadd_subtipo.Enabled := true;
  //btnGravar_subtipo.enabled := false;
  btnExcluir_subtipo.Enabled := true;

  //DBGRID1.ReadOnly := TRUE;
  //DBGRID1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs, dgRowSelect];
end;

procedure TCAD_TipoImovel.btnExcluir_subtipoClick(Sender: TObject);
begin
  if not DM_CADASTRO.DS_Imovel_Subtipo.DataSet.fieldbyname('id_imovel_subTipo').IsNull then
    if application.messagebox('Deseja excluir o Subtipo selecionado?', 'Aviso '+celulaNome, mb_yesno) = mryes then
      BEGIN
        //TRY
           DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Edit;
           DM_CADASTRO.DS_Imovel_Subtipo.DataSet.fieldbyname('padrao').ASSTRING := 'XXX';
           DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Post;
           DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Refresh;
           DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Edit;
           setLog(DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Fields[0].AsString, 'EXCLUSÃO', Self.Caption, (DM_CADASTRO.DS_Imovel_Subtipo.DataSet as TZQuery));
          //DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Delete;
          btnadd_subtipo.Enabled := true;
          //btnGravar_subtipo.enabled := false;
          btnExcluir_subtipo.Enabled := true;
          //DBGRID1.ReadOnly := TRUE;
          //DBGRID1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs, dgRowSelect];
       // EXCEPT
       //   APPLICATION.MESSAGEBOX('Não foi possível excluir o registro selecionado!', 'Aviso '+celulaNome, mb_ok);
       //   btnCancel_subtipoClick(sender);
       // END;
      END;
end;

procedure TCAD_TipoImovel.btnGravar_subtipoClick(Sender: TObject);
begin
  try
     DM_CADASTRO.DS_Imovel_Subtipo.DataSet.fieldbyname('NOME').ASSTRING := UpperCase(DM_CADASTRO.DS_Imovel_Subtipo.DataSet.fieldbyname('NOME').ASSTRING);
     DM_CADASTRO.DS_Imovel_Subtipo.DataSet.fieldbyname('OBS').ASSTRING := UpperCase(DM_CADASTRO.DS_Imovel_Subtipo.DataSet.fieldbyname('OBS').ASSTRING);
     DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Post;
     DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Refresh;
     DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Edit;

    setLog(DM_CADASTRO.DS_Imovel_Subtipo.DataSet.Fields[0].AsString, 'ALTERAÇÃO', Self.Caption, (DM_CADASTRO.DS_Imovel_Subtipo.dataset as TZQuery));

    btnadd_subtipo.Enabled := true;
    //btnGravar_subtipo.enabled := false;
    btnExcluir_subtipo.Enabled := true;

    //DBGRID1.ReadOnly := TRUE;
    //DBGRID1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs, dgRowSelect];
  except
    application.messagebox('Não foi possível gravar esse registro!', 'Aviso '+celulaNome, mb_ok);
    btnCancel_subtipoClick(SENDER);
  end;
end;

procedure TCAD_TipoImovel.Btn_CancelarClick(Sender: TObject);
begin
  inherited;
  DM_Cadastro.Z_Imovel_Subtipo.Cancel;
  DM_Cadastro.Z_Imovel_Subtipo.CancelUpdates;
end;

procedure TCAD_TipoImovel.DBCheckBox3Click(Sender: TObject);
begin
  inherited;
  If DBCheckBox3.Checked Then
     DBCheckBox3.Caption := 'Comercial'
  Else
      DBCheckBox3.Caption := 'Residencial';
end;

procedure TCAD_TipoImovel.TabSheet1Show(Sender: TObject);
VAR sql: TZQuery;
begin
     sql := unUtilitario.getSelect('select id_imovel_tipo, nome from imovel_tipo order by nome');

     comboTipos.Items.Clear;
     comboTiposDestino.Items.Clear;
     comboSubtipos.Items.Clear;
     comboSubtiposDestino.Items.Clear;
     while not sql.Eof do
     Begin
          comboTipos.Items.Add(sql.FieldByName('nome').AsString+'-'+sql.FieldByName('id_imovel_tipo').AsString);
          comboTiposDestino.Items.Add(sql.FieldByName('nome').AsString+'-'+sql.FieldByName('id_imovel_tipo').AsString);
          sql.Next;
     end;

     sql.Close;
     FreeAndNil(sql);
end;

procedure TCAD_TipoImovel.Tab_CadastroShow(Sender: TObject);
begin
  inherited;
  If Edit_Codigo.Text <> '' Then
  Begin
       If DM_Cadastro.Z_Imovel_Subtipo.Active Then
          DM_Cadastro.Z_Imovel_Subtipo.Close;

          DM_Cadastro.Z_Imovel_Subtipo.ParamByName('TIPO').AsInteger := StrToInt(Edit_Codigo.Text);

          DM_Cadastro.Z_Imovel_Subtipo.Open;
  End;
end;

procedure TCAD_TipoImovel.Tab_InformacoesShow(Sender: TObject);
begin
  inherited;
  If DBCheckBox3.Checked Then
     DBCheckBox3.Caption := 'Comercial'
  Else
      DBCheckBox3.Caption := 'Residencial';
end;

procedure TCAD_TipoImovel.Btn_DireitaClick(Sender: TObject);
begin
  inherited;
Tab_CadastroShow(Sender);

end;

procedure TCAD_TipoImovel.Btn_EsquerdaClick(Sender: TObject);
begin
  inherited;
Tab_CadastroShow(Sender);
end;

procedure TCAD_TipoImovel.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  inherited;
  If Key = VK_DELETE Then
     If MessageDlg('Deseja excluir esse Sub-Tipo?',mtConfirmation,[mbyes,mbno],0) = mryes Then
        DBGrid1.DataSource.DataSet.Delete;
}
end;

procedure TCAD_TipoImovel.Btn_ExcluirClick(Sender: TObject);
begin
If DM_Cadastro.Z_Imovel_Tipo.FieldByName('PADRAO').Value = 'NAO' then
Begin
  Tab_CadastroShow(Sender);

  DM_Cadastro.Z_Imovel_Subtipo.First;

  WHILE NOT DM_Cadastro.Z_Imovel_Subtipo.Eof do
  BEGIN
       DM_Cadastro.Z_Imovel_Subtipo.Delete;
  END;

  DM_Cadastro.Z_Imovel_Subtipo.ApplyUpdates;

  inherited;
End;

end;

procedure TCAD_TipoImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if DM_Cadastro.Z_Imovel_Subtipo.Active Then
        DM_Cadastro.Z_Imovel_Subtipo.Close;

     inherited;

     Cad_TipoImovel := nil;
end;

procedure TCAD_TipoImovel.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  principal.setMensagem('Subtipos cadastrados para este tipo.');
end;

end.
