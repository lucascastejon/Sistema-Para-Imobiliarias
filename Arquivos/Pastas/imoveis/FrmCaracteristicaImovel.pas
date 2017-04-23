unit FrmCaracteristicaImovel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, DBCtrls, Mask, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_CaracteristicaImovel = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_CaracteristicaImovel: TCAD_CaracteristicaImovel;

implementation

uses FrmDM_Cadastro, FrmPrincipal, unCamposBusca, unMsg;

{$R *.dfm}

procedure TCAD_CaracteristicaImovel.FormCreate(Sender: TObject);
begin
  inherited;
  DM_Cadastro.Z_Imovel_Caracteristica.Close;
  DM_Cadastro.Z_Imovel_Caracteristica.SQL.Clear;
  DM_Cadastro.Z_Imovel_Caracteristica.SQL.Add('select id_caracteristicas, nome, obs, padrao, ativo from caracteristicas where ATIVO <> ''XXX'' ORDER BY NOME ');
  DM_Cadastro.Z_Imovel_Caracteristica.Open;

  DS.DataSet := DM_Cadastro.Z_Imovel_Caracteristica;
end;

procedure TCAD_CaracteristicaImovel.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setID(DM_CADASTRO.Z_Imovel_Caracteristica, 'ID_CARACTERISTICAS', 'CARACTERISTICAS');
  
  DM_Cadastro.Z_Imovel_Caracteristica.FieldByName('ATIVO').Value := 'SIM';
  DM_Cadastro.Z_Imovel_Caracteristica.FieldByName('PADRAO').Value := 'NAO';
  DBEdit2.SetFocus;
end;

procedure TCAD_CaracteristicaImovel.Btn_ExcluirClick(Sender: TObject);
begin

     if DM_Cadastro.Z_Imovel_CaracteristicaPADRAO.Value = 'NAO' Then
       inherited
     else
       PRINCIPAL.setMensagem('Valores padrões não podem ser excluídos.');

end;

procedure TCAD_CaracteristicaImovel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
CAD_CaracteristicaImovel := nil;
end;

end.
