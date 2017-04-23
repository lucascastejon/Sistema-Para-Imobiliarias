unit FrmCaixasConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls, jpeg, DBCtrls, Mask;

type
  TCAD_CaixasConfig = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox2: TDBCheckBox;
    ComboBoxTipo: TDBComboBox;
    Label9: TLabel;
    procedure Tab_PesquisaShow(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Tab_InformacoesShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_NovoClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_CaixasConfig: TCAD_CaixasConfig;

implementation

uses FrmDM_ADMIN, FrmPrincipal, unUtilitario, unCamposBusca, unINI,
  FrmDM_Cadastro, unMsg;

{$R *.dfm}

procedure TCAD_CaixasConfig.Btn_CancelarClick(Sender: TObject);
begin
  inherited;
  ComboBoxTipo.Enabled := False;
end;

procedure TCAD_CaixasConfig.Btn_ExcluirClick(Sender: TObject);
begin
     IF DM_ADMIN.Z_Caixa_SisPADRAO.AsString = 'NAO' Then
     Begin
          inherited;
          ComboBoxTipo.Enabled := false;
     end
     else
         unUtilitario.setMensagem('Este registro é padrão do sistema!'+#13+'Não pode ser removido.','informa');

     Tab_Pesquisa.Show;
end;

procedure TCAD_CaixasConfig.Btn_GravarClick(Sender: TObject);
begin
     ds.DataSet.Edit;
     ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString,'-',' ',[rfReplaceAll,rfIgnoreCase]);
     ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString,'/',' ',[rfReplaceAll,rfIgnoreCase]);
     ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString,'''',' ',[rfReplaceAll,rfIgnoreCase]);
     ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString,'"',' ',[rfReplaceAll,rfIgnoreCase]);
     ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString,'\',' ',[rfReplaceAll,rfIgnoreCase]);
     ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString,':',' ',[rfReplaceAll,rfIgnoreCase]);
     ds.DataSet.FieldByName('NOME').AsString := StringReplace(ds.DataSet.FieldByName('NOME').AsString,'|',' ',[rfReplaceAll,rfIgnoreCase]);

  inherited;
  ComboBoxTipo.Enabled := false;
end;

procedure TCAD_CaixasConfig.Btn_NovoClick(Sender: TObject);
begin

  inherited;
  PRINCIPAL.setID(DM_ADMIN.Z_Caixa_Sis, 'ID_CAIXA_SIS', 'CAIXA_SIS');
  DM_ADMIN.Z_Caixa_SisPADRAO.AsString := 'NAO';
  DM_ADMIN.Z_Caixa_SisATIVO.AsString := 'SIM';
  ComboBoxTipo.Enabled := true;
end;

procedure TCAD_CaixasConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TCAD_CaixasConfig.FormCreate(Sender: TObject);
begin
  inherited;

  DM_ADMIN.Z_Caixa_Sis.Close;
  DM_ADMIN.Z_Caixa_Sis.SQL.Clear;
  DM_ADMIN.Z_Caixa_Sis.SQL.Add('select * from Caixa_Sis where ativo <> ''XXX'' order by tipo, nome');
  DM_ADMIN.Z_Caixa_Sis.Open;

  DS.DataSet := DM_ADMIN.Z_Caixa_Sis;

end;

procedure TCAD_CaixasConfig.Tab_InformacoesShow(Sender: TObject);
var varSQL: TZQuery;
begin
  inherited;

  varsql := unUtilitario.getSelect('select distinct(tipo) from caixa_sis order by tipo');

  while NOT varSQL.Eof Do
  Begin
       ComboBoxTipo.Items.Add(varsql.Fields[0].AsString);
       varSQL.Next;
  End;  

  FreeAndNil(varSQL);
end;

procedure TCAD_CaixasConfig.Tab_PesquisaShow(Sender: TObject);
begin
  inherited;
  DM_ADMIN.Z_Caixa_Sis.Refresh;
end;

end.
