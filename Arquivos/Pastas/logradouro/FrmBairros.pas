unit FrmBairros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, Mask, DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_Bairro = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    comboQuadrante: TComboBox;
    TabQuadrantes: TTabSheet;
    listaQuadrante1: TListBox;
    Label4: TLabel;
    Label5: TLabel;
    listaQuadrante2: TListBox;
    listaQuadrante3: TListBox;
    Label6: TLabel;
    listaQuadrante4: TListBox;
    Label7: TLabel;
    listaQuadrante0: TListBox;
    Label8: TLabel;
    procedure listaQuadrante0Click(Sender: TObject);
    procedure listaQuadrante1DblClick(Sender: TObject);
    procedure listaQuadrante0DblClick(Sender: TObject);
    procedure Tab_CadastroShow(Sender: TObject);
    procedure Tab_InformacoesShow(Sender: TObject);
    procedure listaQuadrante4DblClick(Sender: TObject);
    procedure listaQuadrante3DblClick(Sender: TObject);
    procedure listaQuadrante2DblClick(Sender: TObject);
    procedure TabQuadrantesShow(Sender: TObject);
    procedure comboQuadranteCloseUp(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar();
  end;

var
  CAD_Bairro: TCAD_Bairro;

implementation

uses FrmDM_Cadastro, FrmPrincipal, unCamposBusca, unMsg, FrmLogradouro,
  unUtilitario, unLog;

{$R *.dfm}

procedure TCAD_Bairro.FormCreate(Sender: TObject);
begin
  inherited;

  DS.DataSet := DM_Cadastro.Z_Bairro;

  // Padrão de tela 1024X768
  //Self.Height := 387;
  //SELF.Width := 435;
end;


procedure TCAD_Bairro.listaQuadrante2DblClick(Sender: TObject);
begin
Tab_Pesquisa.Show;
  Valor.Text := listaQuadrante2.Items[listaQuadrante2.ItemIndex];
  Pesquisar();

end;

procedure TCAD_Bairro.listaQuadrante3DblClick(Sender: TObject);
begin
Tab_Pesquisa.Show;
  Valor.Text := listaQuadrante3.Items[listaQuadrante3.ItemIndex];
  Pesquisar();

end;

procedure TCAD_Bairro.listaQuadrante4DblClick(Sender: TObject);
begin
     Tab_Pesquisa.Show;
  Valor.Text := listaQuadrante4.Items[listaQuadrante4.ItemIndex];
  Pesquisar();

end;

procedure TCAD_Bairro.listaQuadrante0Click(Sender: TObject);
begin
     Tab_Pesquisa.Show;
  Valor.Text := listaQuadrante0.Items[listaQuadrante0.ItemIndex];
  Pesquisar();
end;

procedure TCAD_Bairro.listaQuadrante0DblClick(Sender: TObject);
begin
     Tab_Pesquisa.Show;
  Valor.Text := listaQuadrante0.Items[listaQuadrante0.ItemIndex];
  Pesquisar();

end;

procedure TCAD_Bairro.listaQuadrante1DblClick(Sender: TObject);
begin
     Tab_Pesquisa.Show;
  Valor.Text := listaQuadrante1.Items[listaQuadrante1.ItemIndex];
  Pesquisar();

end;

procedure TCAD_Bairro.Pesquisar();
Var
    BUSCA_VALOR: string;
begin

     //Trata completamente a string, removendo caracteres especiais e trocando palavras
    BUSCA_VALOR := tratarBusca(Valor.Text);

    if BUSCA_VALOR = 'false' then
       exit
    else
    if (BUSCA_VALOR = 'TUDO') or (BUSCA_VALOR = 'TODOS') or (BUSCA_VALOR = 'TODO')  then
       BUSCA_VALOR := ' ( CURRENT_DATE = CURRENT_DATE ) '
    else
    if verificaStringInt(BUSCA_VALOR) then
       BUSCA_VALOR := ' ( ID_BAIRRO = '+BUSCA_VALOR+' ) '
    else
       BUSCA_VALOR := ' ( Mv_Soundex(NOME) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' ) ';

    finalizaPesquisa('select * from BAIRRO where '+BUSCA_VALOR);
end;


procedure TCAD_Bairro.TabQuadrantesShow(Sender: TObject);
var sql :TZQuery;
begin

     sql := unUtilitario.getSelect('select nome from bairro where nome like ''%[Q0]%'' order by nome');
     listaQuadrante0.Items.Clear;
     while not sql.Eof do
     Begin
          listaQuadrante0.Items.Add(sql.FieldByName('nome').AsString);
          sql.Next;
     end;

     sql := unUtilitario.getSelect('select nome from bairro where nome like ''%[Q1]%'' order by nome');
     listaQuadrante1.Items.Clear;
     while not sql.Eof do
     Begin
          listaQuadrante1.Items.Add(sql.FieldByName('nome').AsString);
          sql.Next;
     end;

     sql := unUtilitario.getSelect('select nome from bairro where nome like ''%[Q2]%'' order by nome');
     listaQuadrante2.Items.Clear;
     while not sql.Eof do
     Begin
          listaQuadrante2.Items.Add(sql.FieldByName('nome').AsString);
          sql.Next;
     end;

     sql := unUtilitario.getSelect('select nome from bairro where nome like ''%[Q3]%'' order by nome');
     listaQuadrante3.Items.Clear;
     while not sql.Eof do
     Begin
          listaQuadrante3.Items.Add(sql.FieldByName('nome').AsString);
          sql.Next;
     end;

     sql := unUtilitario.getSelect('select nome from bairro where nome like ''%[Q4]%'' order by nome');
     listaQuadrante4.Items.Clear;
     while not sql.Eof do
     Begin
          listaQuadrante4.Items.Add(sql.FieldByName('nome').AsString);
          sql.Next;
     end;

     sql.Close;
     FreeAndNil(sql);
end;

procedure TCAD_Bairro.Tab_CadastroShow(Sender: TObject);
begin
  inherited;
  comboQuadrante.ClearSelection;
end;

procedure TCAD_Bairro.Tab_InformacoesShow(Sender: TObject);
begin
  inherited;
   comboQuadrante.ClearSelection;
end;

procedure TCAD_Bairro.Btn_GravarClick(Sender: TObject);
begin
     if verificaDuplicidade('BAIRRO', 'ID_BAIRRO', DS.DataSet.FieldByName('ID_BAIRRO').AsString, 'NOME LIKE '''+DS.DataSet.FieldByName('NOME').AsString+'''') then
     Begin
          inherited;
     end;
end;

procedure TCAD_Bairro.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setID(DM_CADASTRO.Z_Bairro, 'ID_BAIRRO', 'BAIRRO');
end;

procedure TCAD_Bairro.comboQuadranteCloseUp(Sender: TObject);
var item: String;
begin
  inherited;

  item := comboQuadrante.Items[comboQuadrante.ItemIndex];

  if Length(Trim(item)) > 1 then
  Begin
       ds.DataSet.Edit;

       ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString, '[Q0]', '', [rfIgnoreCase,rfReplaceAll]);
       ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString, '[Q1]', '', [rfIgnoreCase,rfReplaceAll]);
       ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString, '[Q2]', '', [rfIgnoreCase,rfReplaceAll]);
       ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString, '[Q3]', '', [rfIgnoreCase,rfReplaceAll]);
       ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString, '[Q4]', '', [rfIgnoreCase,rfReplaceAll]);

       if item = 'Quadrante Centro' then
          ds.DataSet.FieldByName('NOME').AsString := Trim(ds.DataSet.FieldByName('NOME').AsString)+' [Q0]';
       if item = 'Quadrante 1' then
          ds.DataSet.FieldByName('NOME').AsString := Trim(ds.DataSet.FieldByName('NOME').AsString)+' [Q1]';
       if item = 'Quadrante 2' then
          ds.DataSet.FieldByName('NOME').AsString := Trim(ds.DataSet.FieldByName('NOME').AsString)+' [Q2]';
       if item = 'Quadrante 3' then
          ds.DataSet.FieldByName('NOME').AsString := Trim(ds.DataSet.FieldByName('NOME').AsString)+' [Q3]';
       if item = 'Quadrante 4' then
          ds.DataSet.FieldByName('NOME').AsString := Trim(ds.DataSet.FieldByName('NOME').AsString)+' [Q4]';
  end;
end;

procedure TCAD_Bairro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
CAD_Bairro := nil;
end;

end.
