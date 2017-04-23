unit FrmCentralSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ComObj;

type
  TFrmSQL = class(TForm)
    Panel1: TPanel;
    TextoSQL: TMemo;
    TextoResultado: TMemo;
    DBGrid1: TDBGrid;
    DS: TDataSource;
    ZSQL: TZQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboTabelas: TComboBox;
    CheckSelect: TCheckBox;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TextoSQLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSQL: TFrmSQL;

implementation

uses FrmPrincipal, unUtilitario, unINI, unWord, unLog;

{$R *.dfm}

procedure TFrmSQL.BitBtn1Click(Sender: TObject);
Var varSQL: TZQuery;
begin
//LOG
TRY
     ZSQL.Close;
     ZSQL.SQL.Clear;
     ZSQL.SQL.Add(TextoSQL.Lines.Text);

     try
        if CheckSelect.Checked Then
        begin
           ZSQL.Open;
           TextoResultado.Lines.Add('>>SQL: '+ZSQL.SQL.Text+'  >>RESULTADOS: '+IntToStr(ZSQL.RecordCount));
        end
        else
        begin
            ZSQL.ExecSQL;
            TextoResultado.Lines.Add('>>SQL: '+ZSQL.SQL.Text+'  >>RESULTADOS: EXECUTADO');
        end;

        setLogSQL('ADMINISTRAÇÃO', 'SQL', Self.Caption, ZSQL.SQL.Text);
     Except
           on e: Exception do
           Begin
                TextoResultado.Lines.Add('>>ERRO: '+e.Message);
                ZSQL.Close;
           End;
     end;
FINALLY
       FreeAndNil(varSQL);
END;

end;

procedure TFrmSQL.BitBtn2Click(Sender: TObject);
begin
     if unUtilitario.setMensagem('Deseja gravar definitivamente a sua SQL no banco?', 'confirma') = IDYES Then
     Begin
          ZSQL.ApplyUpdates;
          ZSQL.Connection.Commit;
          TextoResultado.Lines.Add('>> Commit! <<');
     End;
end;

procedure TFrmSQL.BitBtn3Click(Sender: TObject);
begin
     setWord(ZSQL,'- RELATÓRIO MANUAL -');
end;

procedure TFrmSQL.BitBtn4Click(Sender: TObject);
begin
     ZSQL.Cancel;
     ZSQL.CancelUpdates;
     ZSQL.Close;
     TextoResultado.Lines.Add('>> Rollback! <<');
end;

procedure TFrmSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ZSQL.Cancel;
     ZSQL.CancelUpdates;
     ZSQL.Connection.Rollback;
     PRINCIPAL.Conexao.AutoCommit := True;
     Action := caFree;
end;

procedure TFrmSQL.FormCreate(Sender: TObject);
var varSQL: TZQuery;
begin

     varSQL := unUtilitario.getSelect('Select rdb$relation_name from rdb$relations'+
     ' where ((rdb$system_flag=0) or (rdb$system_flag is null)) and '+
     ' (rdb$view_source is null) order by rdb$relation_name ');

     ComboTabelas.Items.Clear;
     
     while NOT varSQL.Eof do
     Begin
          ComboTabelas.Items.Add(varSQL.Fields[0].AsString);
          varSQL.Next;
     End;

     FreeAndNil(varSQL);

     PRINCIPAL.Conexao.AutoCommit := False;

end;

procedure TFrmSQL.TextoSQLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN Then
        if ssCtrl in Shift then
           BitBtn1Click(Sender);
end;

end.
