unit FrmDM_REL;

interface

uses
  SysUtils, Classes, RpDefine, RpRave, RpBase, RpSystem, RpCon, RpConDS,
  RpRender, RpRenderPDF, RpRenderRTF, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, RpConBDE, RpRenderHTML, RpRenderText, DBClient;

type
  TDM_REL = class(TDataModule)
    RV_IMPRESSAO: TRvProject;
    RV_SYS: TRvSystem;
    RV_ANUNCIO: TRvDataSetConnection;
    RV_RENDER_PDF: TRvRenderPDF;
    RV_RENDER_RTF: TRvRenderRTF;
    RV_IMOVEL: TRvDataSetConnection;
    RV_Contrato: TRvDataSetConnection;
    ZQUERY1: TZQuery;
    RV_Query: TRvDataSetConnection;
    ZQUERY2: TZQuery;
    RV_Query2: TRvDataSetConnection;
    ZQUERY3: TZQuery;
    ZQUERY4: TZQuery;
    RV_Query3: TRvDataSetConnection;
    RV_Query4: TRvDataSetConnection;
    RV_Query5: TRvDataSetConnection;
    ZQUERY5: TZQuery;
    TabelaVirtual_Contas: TClientDataSet;
    TabelaVirtual_ContasID_IMOVEL: TIntegerField;
    TabelaVirtual_ContasALUGUEL: TCurrencyField;
    TabelaVirtual_ContasTAXA: TCurrencyField;
    TabelaVirtual_ContasIPTU: TCurrencyField;
    TabelaVirtual_ContasCONDOMINIO: TCurrencyField;
    TabelaVirtual_ContasENERGIA: TCurrencyField;
    TabelaVirtual_ContasAGUA: TCurrencyField;
    TabelaVirtual_ContasGAS: TCurrencyField;
    TabelaVirtual_ContasOUTROS: TCurrencyField;
    TabelaVirtual_ContasLIQUIDO: TCurrencyField;
    TabelaVirtual_ContasMES: TStringField;
    TabelaVirtual_ContasMEDIA: TStringField;
    RV_RENDER_HTML: TRvRenderHTML;
    RV_RENDER_TXT: TRvRenderText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_REL: TDM_REL;

implementation

uses FrmDM_ADMIN, FrmDM_Cadastro;

{$R *.dfm}

end.
