unit untfrmconfigurar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, Buttons;

type
  Tfrmconfigurar = class(TForm)
    editftp: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edusuario: TEdit;
    edsenha: TEdit;
    checkpassivo: TCheckBox;
    Label4: TLabel;
    edsalvar: TEdit;
    edarquivo: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    procedure BmsXPButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconfigurar: Tfrmconfigurar;

implementation

{$R *.dfm}

procedure Tfrmconfigurar.BmsXPButton1Click(Sender: TObject);
var
  ServerIni: TIniFile;
  passivo: string;
begin
  if checkpassivo.Checked then   passivo:='S'
  else passivo:='N';
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'proutupdate.ini');
  ServerIni.WriteString('CONEXAO','FTP',editftp.text);
  ServerIni.WriteString('CONEXAO','USUARIO',edusuario.text);
  ServerIni.WriteString('CONEXAO','PASSWD',edsenha.text);
  ServerIni.WriteString('CONEXAO','PASSIVO',passivo);
  ServerIni.WriteString('CONEXAO','SALVAR',edsalvar.text);
  ServerIni.WriteString('CONEXAO','ARQUIVO',edarquivo.Text);
  ServerIni.UpdateFile;
  ServerIni.Free;
  close;
end;

procedure Tfrmconfigurar.FormShow(Sender: TObject);
var
  ServerIni: TIniFile;
  passivo:string ;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'proutupdate.ini');
  EDITFTP.Text := ServerIni.ReadString('CONEXAO','FTP','');
  edusuario.Text := ServerIni.ReadString('CONEXAO','USUARIO','');
  edsenha.text := ServerIni.ReadString('CONEXAO','PASSWD','');
  passivo := ServerIni.ReadString('CONEXAO','PASSIVO','');
  edsalvar.text := ServerIni.ReadString('CONEXAO','SALVAR','');
  edarquivo.Text:= ServerIni.ReadString('CONEXAO','ARQUIVO','');
   if passivo='S' then checkpassivo.Checked:=true
   else checkpassivo.Checked:=false;
  ServerIni.Free;
end;

end.
