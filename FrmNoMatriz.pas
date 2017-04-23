unit FrmNoMatriz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TCAD_NOMATRIZ = class(TForm)
  private
    { Private declarations }
  public
  FormCriador: TForm;
  FormCriadorConteudo: String;
  FormCriatura: TFormClass;
    { Public declarations }
  end;

var
  CAD_NOMATRIZ: TCAD_NOMATRIZ;
  Fechar : Smallint;
implementation

{$R *.dfm}

end.
