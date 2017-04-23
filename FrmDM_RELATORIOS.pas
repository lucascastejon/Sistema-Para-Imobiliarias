unit FrmDM_RELATORIOS;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RpRenderRTF, RpRender, RpRenderPDF, RpDefine, RpRave, RpCon, RpConDS, RpBase,
  RpSystem;     

type
  TDM_RELATORIOS = class(TDataModule)
    SQL1: TZQuery;
    DS1: TDataSource;
    SQL2: TZQuery;
    DS2: TDataSource;
    SQL3: TZQuery;
    DS3: TDataSource;
    Rave: TRvProject;
    DSC_1: TRvDataSetConnection;
    DSC_2: TRvDataSetConnection;
    DSC_3: TRvDataSetConnection;
    Rave_System: TRvSystem;
    DSC_4: TRvDataSetConnection;
    SQL4: TZQuery;
    DS4: TDataSource;
    ZQuery_Bairro_Imovel: TZQuery;
    DS_Bairro_Imovel: TDataSource;
    RV_Bairro_Imovel: TRvDataSetConnection;
    ZQuery_Anuncio_Imovel: TZQuery;
    DS_Anuncio_Imove: TDataSource;
    Rv_Anuncio_Imove: TRvDataSetConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_RELATORIOS: TDM_RELATORIOS;

implementation

uses FrmPrincipal;

{$R *.dfm}

end.
