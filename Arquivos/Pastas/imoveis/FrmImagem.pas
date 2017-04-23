unit FrmImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OleCtrls, SHDocVw, ComCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, StrUtils;

type
  TImagem = class(TForm)
    Menu: TPageControl;
    TabEstatico: TTabSheet;
    tabDinamico: TTabSheet;
    Imagem: TImage;
    NavPostal: TWebBrowser;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    NavSimples: TWebBrowser;
    NavMural: TWebBrowser;
    NavSlide: TWebBrowser;
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet3Hide(Sender: TObject);
    procedure TabSheet2Hide(Sender: TObject);
    procedure TabSheet1Hide(Sender: TObject);
    procedure tabDinamicoHide(Sender: TObject);
    procedure ImagemDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tabDinamicoShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Imagem: TImagem;
  ZqFoto: TZQuery;

implementation

uses FrmPrincipal, FrmDM_Cadastro, unINI, unImagem;

{$R *.dfm}

procedure TImagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := cafree;
end;

procedure TImagem.FormCreate(Sender: TObject);
begin
  zqfoto := TZquery.Create(self);
  zqfoto.Connection := principal.conexao;
  self.Caption := getConf('EMPRESA_FANTASIA')+ ' - Galeria';
  Self.Width := 900;
  Self.Height := 700;
  MENU.TabIndex := 0;
end;

procedure TImagem.ImagemDblClick(Sender: TObject);
begin
     Close;
end;

procedure TImagem.tabDinamicoHide(Sender: TObject);
begin
     NavPostal.Stop;
end;

procedure TImagem.tabDinamicoShow(Sender: TObject);
begin
    
     galeriaPostal(DM_Cadastro.Z_Imovel.FieldByName('ID_IMOVEL').ASSTRING);
     NavPostal.Navigate('file:///'+ExtractFilePath(ParamStr(0))+'REL/postal/index.html');

end;

procedure TImagem.TabSheet1Hide(Sender: TObject);
begin
     NavSimples.Stop;
end;

procedure TImagem.TabSheet1Show(Sender: TObject);
begin
     //galeriaSimples(DM_Cadastro.Z_Imovel.FieldByName('ID_IMOVEL').ASSTRING);
     //NavSimples.Navigate('file:///'+ExtractFilePath(ParamStr(0))+'REL/simples/index.html');
end;

procedure TImagem.TabSheet2Hide(Sender: TObject);
begin
     NavMural.Stop;
end;

procedure TImagem.TabSheet2Show(Sender: TObject);
begin
     galeriaMural(DM_Cadastro.Z_Imovel.FieldByName('ID_IMOVEL').ASSTRING);
     NavMural.Navigate('file:///'+ExtractFilePath(ParamStr(0))+'REL/mural/index.html');
end;

procedure TImagem.TabSheet3Hide(Sender: TObject);
begin
     NavSlide.Stop;
end;

procedure TImagem.TabSheet3Show(Sender: TObject);
begin
     galeriaSlide(DM_Cadastro.Z_Imovel.FieldByName('ID_IMOVEL').ASSTRING);
     NavSlide.Navigate('file:///'+ExtractFilePath(ParamStr(0))+'REL/slide/index.html');
end;

end.
