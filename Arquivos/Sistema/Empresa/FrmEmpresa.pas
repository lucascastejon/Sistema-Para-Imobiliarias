unit FrmEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, DBCtrls, Mask, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_Empresa = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBMemo1: TDBMemo;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit23: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit8Exit(Sender: TObject);
    procedure IMG_FundoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure IMG_LogoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit23MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_Empresa: TCAD_Empresa;

implementation

uses unCamposBusca, FrmDM_Cadastro, FrmPrincipal, unMsg, unImagem, unValidacao;

{$R *.dfm}

procedure TCAD_Empresa.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  If DM_Cadastro.Z_Curinga_02.Active Then
     DM_Cadastro.Z_Curinga_02.Close;

     DM_Cadastro.Z_Curinga_02.SQL.Clear;
     DM_Cadastro.Z_Curinga_02.SQL.Add('select ID from SP_GEN_EMPRESA_ID');
     DM_Cadastro.Z_Curinga_02.Open;

     DM_Cadastro.Z_EmpresaID_EMPRESA.Value := DM_Cadastro.Z_Curinga_02.FieldByName('ID').Value;

     DM_Cadastro.Z_Curinga_02.Close;

     DM_Cadastro.Z_EmpresaATIVO.Value := 'SIM';
     DBEdit2.SetFocus;
end;

procedure TCAD_Empresa.Btn_GravarClick(Sender: TObject);
begin
     If DM_Cadastro.Z_EmpresaLOGO.Value = '' Then
        DM_Cadastro.Z_EmpresaLOGO.Value := 'X_Foto.jpg';

     If DM_Cadastro.Z_EmpresaFUNDO.Value = '' Then
        DM_Cadastro.Z_EmpresaFUNDO.Value := 'X_Foto.jpg';

  inherited;

end;

procedure TCAD_Empresa.DBEdit2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  Principal.setMensagem('Código inicial de registros usado para esta empresa.');
end;

procedure TCAD_Empresa.DBEdit3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
Principal.setMensagem('Código final/máximo que poderá ser atribuído para esta empresa.');
end;

procedure TCAD_Empresa.DBEdit4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
Principal.setMensagem('Endereço local de rede do servidor, ex: \\192.168.1.1');
end;

procedure TCAD_Empresa.DBEdit5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
Principal.setMensagem('Endereço remoto do servidor, ex: http:// ou ftp://');
end;

procedure TCAD_Empresa.DBEdit11MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
PRINCIPAL.setMensagem('Informe o e-mail da empresa.');
end;

procedure TCAD_Empresa.DBEdit12MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
principal.setMensagem('Informe a data de registro legal da empresa.');
end;

procedure TCAD_Empresa.DBEdit23MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
principal.setMensagem('Data em que a empresa foi cadastrada no sistema.');
end;

procedure TCAD_Empresa.IMG_LogoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
PRINCIPAL.setMensagem('Logotipo da empresa. (Relatórios & Cia)');
end;

procedure TCAD_Empresa.IMG_FundoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
PRINCIPAL.setMensagem('Funco de tela do sistema. (Para todos os sis. da rede)');
end;

procedure TCAD_Empresa.DBEdit8Exit(Sender: TObject);
begin
  inherited;
Try
if DBEdit8.Text <> '' Then
  If unValidacao.cnpj(DBEdit8.Text) Then
     Label8.Color := clBlue
  else
     Label8.Color := clRed;
except
      ShowMessage('Somente números para validar a consulta e/ou faltando dados!!');
end;
end;

procedure TCAD_Empresa.DBEdit8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
PRINCIPAL.setMensagem('Somente números neste campo para validar a consulta!');
end;

procedure TCAD_Empresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
Cad_Empresa := nil;
end;

procedure TCAD_Empresa.FormCreate(Sender: TObject);
begin
  inherited;

  DM_Cadastro.Z_Empresa.SQL.Clear;
  DM_Cadastro.Z_Empresa.SQL.Add('select * from empresa where id_empresa = 1');
  DM_Cadastro.Z_Empresa.Open;

  DS.DataSet := DM_Cadastro.Z_Empresa;
end;

end.
