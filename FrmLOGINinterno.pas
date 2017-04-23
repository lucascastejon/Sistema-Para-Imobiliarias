unit FrmLOGINinterno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TLoginInterno = class(TForm)
    Image2: TImage;
    Label1: TLabel;
    Valor_Usuario: TEdit;
    Label3: TLabel;
    Valor_Senha: TEdit;
    Label4: TLabel;
    BtnLogin: TSpeedButton;
    BtnFechar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginInterno: TLoginInterno;

implementation

uses unINI;

{$R *.dfm}

procedure TLoginInterno.BtnLoginClick(Sender: TObject);
begin
//Verifica o Login
end;

procedure TLoginInterno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TLoginInterno.FormCreate(Sender: TObject);
begin
     Valor_Usuario.Text := getUser('USUARIO');
end;

procedure TLoginInterno.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
       VK_RETURN: BtnLoginClick(Sender);
  End;


end;

end.
