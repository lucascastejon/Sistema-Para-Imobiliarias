unit FrmLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, jpeg, StdCtrls, DBCtrls, ComCtrls, Buttons,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StrUtils;

type
  TFrmAuditoria = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    EditId_registro: TEdit;
    Image2: TImage;
    EditFormulario: TEdit;
    Label2: TLabel;
    EditUsuario: TEdit;
    Label3: TLabel;
    EditMaquina: TEdit;
    Label4: TLabel;
    EditIp: TEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    EditAcao: TEdit;
    Label6: TLabel;
    EditVersao: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditCampos: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EditId_log: TEdit;
    EditData: TDateTimePicker;
    BitBtn1: TBitBtn;
    Zsql: TZQuery;
    DS: TDataSource;
    Label11: TLabel;
    EditFIRST: TEdit;
    Label12: TLabel;
    EditSKIP: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAuditoria: TFrmAuditoria;

implementation

uses FrmPrincipal, unUtilitario;

{$R *.dfm}

procedure TFrmAuditoria.BitBtn1Click(Sender: TObject);
begin

     Zsql.Close;
     Zsql.SQL.Clear;
     
     PRINCIPAL.Conexao_log.Disconnect;
     Sleep(3000);
     PRINCIPAL.Conexao_log.Connect;

     Zsql.SQL.Add('select ');
     
     if Length(Trim(EditFIRST.Text)) > 0 then
        if verificaStringInt(Trim(EditFIRST.Text)) then
           Zsql.SQL.Add(' FIRST '+Trim(EditFIRST.Text)+' ')
        else
        Begin
            setMensagem('Entre somente com números no campo BUSCAR ou deixe em branco!','erro');
            Exit;
        end;

     if Length(Trim(EditSKIP.Text)) > 0 then
        if verificaStringInt(Trim(EditSKIP.Text)) then
           Zsql.SQL.Add(' SKIP '+Trim(EditSKIP.Text)+' ')
        else
        Begin
            setMensagem('Entre somente com números no campo PULAR ou deixe em branco!','erro');
            Exit;
        end;

     Zsql.SQL.Add(' l.* , cast(substring(l.campos from 1 for 200) as varchar(200)) as NOVOCAMPOS from logs l where ');

     if Length(Trim(EditId_registro.Text)) > 0 then
        Zsql.SQL.Add(' L.Id_registros like ''%'+EditId_registro.Text + '%'' AND ');

     if Length(Trim(EditFormulario.Text)) > 0 then
        Zsql.SQL.Add(' lower(L.Formulario) like lower(''%'+EditFormulario.Text + '%'') AND ');

     if Length(Trim(EditUsuario.Text)) > 0 then
        Zsql.SQL.Add(' lower(L.Usuario) like lower(''%'+EditUsuario.Text + '%'') AND ');

     if Length(Trim(EditMaquina.Text)) > 0 then
        Zsql.SQL.Add(' lower(L.Maquina) like lower(''%'+EditMaquina.Text + '%'') AND ');

     if Length(Trim(EditIp.Text)) > 0 then
        Zsql.SQL.Add(' L.ip like ''%'+EditIp.Text + '%'' AND ');

     if Length(Trim(EditAcao.Text)) > 0 then
        Zsql.SQL.Add(' lower(L.acao) like lower(''%'+EditAcao.Text + '%'') AND ');

     if Length(Trim(EditVersao.Text)) > 0 then
        Zsql.SQL.Add(' L.Versao like ''%'+EditVersao.Text + '%'' AND ');

     if Length(Trim(EditCampos.Text)) > 0 then
        Zsql.SQL.Add(' lower(L.Campos) like lower(''%'+EditCampos.Text + '%'') AND ');

     if Length(Trim(EditId_log.Text)) > 0 then
        Zsql.SQL.Add(' L.Id_logs like ''%'+EditId_log.Text + '%'' AND');

     if EditData.Checked then
        Zsql.SQL.Add(' cast(L.data as date) = '''+formataDataSQL(DateToStr(EditData.Date))+''' AND ');

      Zsql.SQL.Add(' 1=1 ');

     Zsql.SQL.Add(' ORDER BY L.DATA DESC ');

     Zsql.Open;

     PRINCIPAL.setMensagem('Registros encontrados conforme filtro: '+IntToStr(Zsql.RecordCount));
end;

procedure TFrmAuditoria.FormCreate(Sender: TObject);
begin
     EditData.Date := Date;
     EditData.Checked := False;

end;

procedure TFrmAuditoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of VK_RETURN:
       BitBtn1Click(Sender);
  end;
end;

end.
