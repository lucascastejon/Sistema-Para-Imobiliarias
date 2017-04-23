unit FrmSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls, jpeg, Mask, DBCtrls;

type
  TCAD_Sistema = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SpeedButton1: TSpeedButton;
    procedure Btn_FecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_Sistema: TCAD_Sistema;

implementation

uses FrmDM_ADMIN, unCamposBusca, unUtilitario, FrmPrincipal, unMsg, unLog,
  unINI;

{$R *.dfm}

procedure TCAD_Sistema.Btn_CancelarClick(Sender: TObject);
begin
     If DS.DataSet.Active Then
        Begin
             DS.DataSet.Cancel;
             (DS.DataSet as TZQuery).CancelUpdates;
        End;

     Tab_Pesquisa.Show;

end;

procedure TCAD_Sistema.Btn_FecharClick(Sender: TObject);
begin

     criaArquivoConfiguracao();

     inherited;

end;

procedure TCAD_Sistema.Btn_GravarClick(Sender: TObject);
begin
  //inherited;

  If DS.DataSet.Active Then
  Begin
       Try
          DS.DataSet.Post;
          (DS.DataSet as TZQuery).ApplyUpdates;

          setLog('0', 'ALTERAÇÃO', Self.Caption, (DS.DataSet as TZQuery));

          unMsg.INFORMA(1);
       Except
             unMsg.ERRO(10);
       End;
       DS.DataSet.Edit;
  End
  Else
      unMsg.ERRO(13);
end;

procedure TCAD_Sistema.Btn_ImprimirClick(Sender: TObject);
begin
  inherited;
  unUtilitario.setMensagem('Este recurso está em fase final de testes.','informa');
end;

procedure TCAD_Sistema.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TCAD_Sistema.FormCreate(Sender: TObject);
begin
  inherited;
  DM_ADMIN.Z_Sistema.Close;
  DM_ADMIN.Z_Sistema.SQL.Clear;
  DM_ADMIN.Z_Sistema.SQL.Add('select * from sistema order by tipo');
  DM_ADMIN.Z_Sistema.Open;

  DS.DataSet := DM_ADMIN.Z_Sistema;
end;

procedure TCAD_Sistema.SpeedButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PRINCIPAL.setMensagem('Atualizar as configurações de sistema junto à base de dados online da Célula Digital. Esta opção sobrepõe as configurações atuais. INFORME-SE ANTES!');
end;

end.
