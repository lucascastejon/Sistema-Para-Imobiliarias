unit FrmTipoPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, DBCtrls, Mask, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_TipoPessoa = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_NovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_TipoPessoa: TCAD_TipoPessoa;

implementation

uses FrmDM_Cadastro, FrmPrincipal, unCamposBusca, unMsg, FrmPessoa;

{$R *.dfm}

procedure TCAD_TipoPessoa.FormCreate(Sender: TObject);
begin
  inherited;

  DM_Cadastro.Z_Pessoa_Tipo.Close;
  DM_Cadastro.Z_Pessoa_Tipo.SQL.Clear;
  DM_Cadastro.Z_Pessoa_Tipo.SQL.Add('select * from pessoa_tipo WHERE ATIVO <> ''XXX'' ORDER BY NOME');
  DM_Cadastro.Z_Pessoa_Tipo.Open;

  DS.DataSet := DM_Cadastro.Z_Pessoa_Tipo;

end;

procedure TCAD_TipoPessoa.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setID(DM_CADASTRO.Z_Pessoa_Tipo, 'ID_pessoa_tipo', 'PESSOA_TIPO');
  DM_Cadastro.Z_Pessoa_Tipo.FieldByName('ATIVO').Value := 'SIM';
  DM_Cadastro.Z_Pessoa_Tipo.FieldByName('PADRAO').Value := 'NAO';
  DBEdit2.SetFocus;

end;

procedure TCAD_TipoPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Cad_TipoPEssoa := nil;
end;

end.
