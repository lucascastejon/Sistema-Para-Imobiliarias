unit FrmPermUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls,
  StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TFRMPERMUSERS = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    ZQUser: TZQuery;
    DSUSER: TDataSource;
    DSPERM: TDataSource;
    ZPERM: TZQuery;
    List: TListView;
    ZList: TZQuery;
    todos: TCheckBox;
    zcheck: TZQuery;
    ListIncluir: TListView;
    ListAlterar: TListView;
    ListExcluir: TListView;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox2: TGroupBox;
    ListView1: TListView;
    Label1: TLabel;
    ListView2: TListView;
    Label2: TLabel;
    ListView3: TListView;
    Label3: TLabel;
    Panel6: TPanel;
    administrador: TCheckBox;
    Image1: TImage;
    Memo1: TMemo;
    Label4: TLabel;
    procedure todosClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMPERMUSERS: TFRMPERMUSERS;

implementation

uses FrmPrincipal;

{$R *.dfm}

procedure TFRMPERMUSERS.todosClick(Sender: TObject);
var x: integer;
begin
  if todos.State = cbChecked then
    for X := 0 to LIST.Items.Count - 1 do
      list.Items[x].Checked := true
  else
    for X := 0 to LIST.Items.Count - 1 do
      list.Items[x].Checked := false;
end;

procedure TFRMPERMUSERS.CheckBox1Click(Sender: TObject);
var x:integer;
begin
  if CheckBox1.State = cbChecked then
    for X := 0 to LIST.Items.Count - 1 do
      ListIncluir.Items[x].Checked := true
  else
    for X := 0 to LIST.Items.Count - 1 do
      listincluir.Items[x].Checked := false;
end;

procedure TFRMPERMUSERS.CheckBox2Click(Sender: TObject);
var x: integer;
begin
  if CheckBox2.State = cbChecked then
    for X := 0 to LIST.Items.Count - 1 do
      ListAlterar.Items[x].Checked := true
  else
    for X := 0 to LIST.Items.Count - 1 do
      ListAlterar.Items[x].Checked := false;
end;

procedure TFRMPERMUSERS.CheckBox3Click(Sender: TObject);
var x: integer;
begin
  if CheckBox3.State = cbChecked then
    for X := 0 to LIST.Items.Count - 1 do
      ListExcluir.Items[x].Checked := true
  else
    for X := 0 to LIST.Items.Count - 1 do
      ListExcluir.Items[x].Checked := false;
end;

procedure TFRMPERMUSERS.DBLookupComboBox1Click(Sender: TObject);
var
  X: Integer;
begin
  IF not ZQUser.FieldByName('ID_USUARIO').IsNull then
    begin
      zperm.Close;
      zperm.SQL.Clear;
      zperm.SQL.Add('select administrador from usuario where id_usuario = ' + ZQUser.FieldByName('id_usuario').AsString + '');
      zperm.Open;
      zperm.First;

      if (zperm.FieldByName('administrador').AsString = 'SIM') then
        administrador.Checked := true
      else
        administrador.Checked := false;
    end;



  for X := 0 to List.Items.Count - 1 do
    begin
      list.Items[x].Checked := false;
      ListIncluir.Items[x].checked := false;
      ListExcluir.Items[x].Checked := false;
      ListAlterar.Items[x].Checked := false;
    end;


  ZPERM.Close;
  zperm.SQL.Clear;
  zperm.SQL.Add('select * from autorizacao where id_usuario = ' + zquser.fieldbyname('ID_USUARIO').AsString + ' order by ID_USUARIO, ID_TABELA');
  ZPERM.Open;

  ZPERM.First;

  while not zperm.eof do
    BEGIN
      list.Items[zperm.FieldByName('ID_TABELA').AsInteger - 1].Checked := true;

      if zperm.FieldByName('XDELETE').asstring = 'SIM' then
        ListExcluir.Items[zperm.FieldByName('ID_TABELA').AsInteger - 1].Checked := true;

      if zperm.FieldByName('XINSERT').asstring = 'SIM' then
        ListIncluir.Items[zperm.FieldByName('ID_TABELA').AsInteger - 1].Checked := true;

      if zperm.FieldByName('XUPDATE').asstring = 'SIM' then
        ListAlterar.Items[zperm.FieldByName('ID_TABELA').AsInteger - 1].Checked := true;

      zperm.Next;
    end;

  TODOS.Checked := FALSE;

end;

procedure TFRMPERMUSERS.FormCreate(Sender: TObject);
//var Listitem : TListItem;
begin
{  label4.caption := 'Administrador' + #13 + 'do Sistema Célula';

  zLIST.Open;
  ZList.First;

  DSUSER.DATASET.OPEN;


  while NOT (Zlist.Eof) do
  begin
    ListItem := List.Items.Add;
    listitem.Caption := zlist.FieldByName('NOME').AsString;

    ListItem := ListIncluir.Items.Add;
    ListItem := ListAlterar.Items.Add;
    ListItem := Listexcluir.Items.Add;

    Zlist.Next;
  end;
}

end;

procedure TFRMPERMUSERS.Label4Click(Sender: TObject);
begin
  if administrador.State = cbUnchecked then
    administrador.Checked := true
  else
    administrador.checked := false;
end;

procedure TFRMPERMUSERS.SpeedButton1Click(Sender: TObject);
var
  x, tabela: Integer;
  incluir, alterar, excluir: String;

begin
  if administrador.State = cbChecked then
    begin
      zperm.Close;
      zperm.SQL.Clear;
      zperm.SQL.Add('update usuario set administrador = ''SIM'' where id_usuario = ' + ZQUser.FieldByName('id_usuario').AsString + '');

      try
         zperm.ExecSQL;
      Except
        application.MessageBox('Não foi possível marcá-lo como Administrador!', 'Aviso Célula Digital', MB_OK);
        administrador.Checked := false;
      end;
      zperm.Close;
    end
  else if administrador.State = cbUnchecked then
    begin
      zperm.Close;
      zperm.SQL.Clear;
      zperm.SQL.Add('update usuario set administrador = ''NAO'' where id_usuario = ' + ZQUser.FieldByName('id_usuario').AsString + '');

      try
        zperm.ExecSQL;
      Except
        application.MessageBox('Erro ao desmarcá-lo como Administrador!', 'Aviso Célula Digital', MB_OK);
        administrador.Checked := true;
      end;
      zperm.Close;
    end;


  tabela := 0;

  for x := 0 to list.items.count - 1 do
    begin
      tabela := x + 1;

      zperm.SQL.Clear;
      if list.Items[x].Checked = true then
        begin

          if ListIncluir.Items[x].Checked = true then
            incluir := 'SIM'
          else
            incluir := 'NAO';

          if ListAlterar.Items[x].Checked = true then
            alterar := 'SIM'
          else
            alterar := 'NAO';

          if ListExcluir.Items[x].Checked = true then
            excluir := 'SIM'
          else
            excluir := 'NAO';

          zperm.Close;
          zperm.sql.clear;
          zperm.SQL.Add('delete from autorizacao where id_usuario = ' + zquser.FieldByName('ID_USUARIO').AsString + ' and id_tabela = ' + inttostr(tabela) + '');
          zperm.ExecSQL;
          ZPERM.ApplyUpdates;

          zperm.Close;
          zperm.SQL.Clear;
          zperm.SQL.Add('insert into autorizacao values(' + zquser.FieldByName('ID_USUARIO').AsString +', ' +  inttostr(tabela) + ', ''SIM'', '''+excluir+''', '''+incluir+''', '''+alterar+''')');
          zperm.ExecSQL;
          ZPERM.ApplyUpdates;
          zPERM.Close;
        end

      else
        BEGIN
          zperm.Close;
          zperm.sql.clear;
          zperm.SQL.Add('delete from autorizacao where id_usuario = ' + zquser.FieldByName('ID_USUARIO').AsString + ' and id_tabela = ' + inttostr(tabela) + '');
          zperm.ExecSQL;
          ZPERM.ApplyUpdates;
          ZPERM.Close;
        end;
    end;

  APPLICATION.MessageBox('As alterações foram salvas!','Aviso Célula Digital',mb_ok);
  DBLookupComboBox1.SetFocus;
end;

procedure TFRMPERMUSERS.SpeedButton2Click(Sender: TObject);
begin
  CLOSE;
end;

end.
