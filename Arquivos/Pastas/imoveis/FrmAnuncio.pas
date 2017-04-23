unit FrmAnuncio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg;

type
  TCAD_Anuncio = class(TCAD_MATRIZ)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_Anuncio: TCAD_Anuncio;

implementation

{$R *.dfm}

end.
