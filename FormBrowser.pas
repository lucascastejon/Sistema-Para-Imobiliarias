unit FormBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, OleCtrls, SHDocVw;

type
  TFrmBrowser = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image19: TImage;
    Image18: TImage;
    Image17: TImage;
    btnNavegar: TImage;
    Image4: TImage;
    Image5: TImage;
    ComboEndereco: TComboBox;
    Label1: TLabel;
    WebBrowser1: TWebBrowser;
    Image2: TImage;
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure btnNavegarClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setSite(endereco: String);
  end;

var
  FrmBrowser: TFrmBrowser;

implementation

{$R *.dfm}

procedure TFrmBrowser.setSite(endereco: String);
Begin

     WebBrowser1.Navigate(endereco);
     ComboEndereco.Text := endereco;
     ComboEndereco.Items.Add(endereco);

End;

procedure TFrmBrowser.ComboEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
          btnNavegarClick(Sender);
          
end;

procedure TFrmBrowser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFrmBrowser.FormCreate(Sender: TObject);
begin

  // Padrão de tela 1024X768
  Self.Height := 525;
  SELF.Width := 936;
end;

procedure TFrmBrowser.Image17Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmBrowser.Image18Click(Sender: TObject);
begin
     If self.WindowState = wsMaximized Then
        Self.WindowState := wsNormal
     else
         Self.WindowState := wsMaximized;
end;

procedure TFrmBrowser.Image19Click(Sender: TObject);
begin
     self.WindowState := wsMinimized;
end;

procedure TFrmBrowser.Image2Click(Sender: TObject);
var
   vIn, vOut: OleVariant;
begin
     WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

procedure TFrmBrowser.btnNavegarClick(Sender: TObject);
begin
     WebBrowser1.Navigate(ComboEndereco.Text);
     ComboEndereco.Items.Add(ComboEndereco.Text);
end;

procedure TFrmBrowser.Image4Click(Sender: TObject);
begin
     WebBrowser1.GoForward;
end;

procedure TFrmBrowser.Image5Click(Sender: TObject);
begin
     WebBrowser1.GoBack;
end;

end.
