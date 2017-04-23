unit FrmDM_ADMIN;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZSqlUpdate, ZSqlMonitor;

type
  TDM_ADMIN = class(TDataModule)
    Z_ALUGUEL: TZQuery;
    Z_ALUGUELID_CONTRATO: TIntegerField;
    Z_ALUGUELID_IMOVEL: TIntegerField;
    Z_ALUGUELTIPO_CONTRATO: TStringField;
    Z_ALUGUELVALOR: TFloatField;
    Z_ALUGUELVALOR_REAJUSTE: TFloatField;
    Z_ALUGUELVENCIMENTO: TDateField;
    Z_ALUGUELTARIFA: TFloatField;
    Z_ALUGUELVIGENCIA: TSmallintField;
    Z_ALUGUELREPASSE: TStringField;
    Z_ALUGUELCORRESPONDENCIA: TStringField;
    Z_ALUGUELMORADORES: TSmallintField;
    Z_ALUGUELFINALIDADE: TStringField;
    Z_ALUGUELMULTA: TFloatField;
    Z_ALUGUELMULTA_APOS: TSmallintField;
    f: TFloatField;
    Z_ALUGUELJUROS_APOS: TSmallintField;
    Z_ALUGUELHONORARIO: TFloatField;
    Z_ALUGUELHONORARIO_APOS: TSmallintField;
    Z_ALUGUELREAJUSTE: TStringField;
    Z_ALUGUELREAJUSTE_APOS: TSmallintField;
    Z_ALUGUELDESCONTO: TFloatField;
    Z_ALUGUELDESCONTO_ATE: TSmallintField;
    Z_ALUGUELISENTO_CPMF: TStringField;
    Z_ALUGUELHONORARIO_1ALUGUEL: TStringField;
    Z_ALUGUELHONORARIO_ADMIN: TStringField;
    Z_ALUGUELHONORARIO_REPASSE: TStringField;
    Z_ALUGUELPARCELADO_EM: TSmallintField;
    Z_ALUGUELCOMISSAO_LOCACAO: TFloatField;
    Z_ALUGUELCOMISSAO_CAPTACAO: TFloatField;
    Z_ALUGUELCOMISSAO_DESPESAS: TFloatField;
    Z_ALUGUELCOMISSAO_INDICACAO: TFloatField;
    Z_ALUGUELRENTA_ALUGUEL: TFloatField;
    Z_ALUGUELRENTA_EFETIVADO: TFloatField;
    Z_ALUGUELRENTA_HONOR_ALUGUEL: TFloatField;
    Z_ALUGUELRENTA_HONOR_ADMIN: TFloatField;
    Z_ALUGUELRES_INADIM_OCP: TStringField;
    Z_ALUGUELRES_INADIM_DES: TStringField;
    Z_ALUGUELRES_ANTECIP_OCP: TStringField;
    Z_ALUGUELRES_ANTECIP_DES: TStringField;
    Z_ALUGUELRES_MOTIVO: TStringField;
    Z_ALUGUELFOTO: TStringField;
    Z_ALUGUELDATA: TDateField;
    Z_PESSOA_CONTRATO: TZQuery;
    DS_PESSOA_CONTRATO: TDataSource;
    UP_PESSOA_CONTRATO: TZUpdateSQL;
    Z_ALUGUELATIVO: TStringField;
    Z_ALUGUELMULTA_MORA: TFloatField;
    Z_ALUGUELMULTA_MORA_APOS: TSmallintField;
    Z_GARANTIA_CONTRATO: TZQuery;
    Z_GARANTIA_CONTRATOID_CONTRATO_GARANTIA: TIntegerField;
    Z_GARANTIA_CONTRATOID_CONTRATO: TIntegerField;
    Z_GARANTIA_CONTRATOID_IMOVEL: TIntegerField;
    Z_GARANTIA_CONTRATODEP_VALOR: TFloatField;
    Z_GARANTIA_CONTRATODEP_PARCELADO: TStringField;
    Z_GARANTIA_CONTRATOSEG_SEGURADORA: TStringField;
    Z_GARANTIA_CONTRATOSEG_NUM: TStringField;
    Z_GARANTIA_CONTRATOSEG_PRAZO: TSmallintField;
    Z_GARANTIA_CONTRATOSEG_MESES: TSmallintField;
    Z_GARANTIA_CONTRATOSEG_PREMIO: TFloatField;
    Z_GARANTIA_CONTRATOSEG_CAPITAL: TFloatField;
    Z_GARANTIA_CONTRATOCAL_TIPO: TStringField;
    Z_GARANTIA_CONTRATOCAL_VALOR: TFloatField;
    Z_GARANTIA_CONTRATOCAL_DESCRICAO: TMemoField;
    Z_GARANTIA_CONTRATOANEXO: TBlobField;
    Z_GARANTIA_CONTRATOANEXO_OBS: TStringField;
    Z_GARANTIA_CONTRATOOBS: TStringField;
    DS_GARANTIA_CONTRATO: TDataSource;
    DS_CONTA: TDataSource;
    Z_CONTA: TZQuery;
    Z_GARANTIA_CONTRATODEP_DESTINO: TStringField;
    Z_CURINGA_01: TZQuery;
    DS_CURINGA_01: TDataSource;
    Z_ANUNCIO: TZQuery;
    Z_ANUNCIOID_ANUNCIO: TIntegerField;
    Z_ANUNCIOID_IMOVEL: TIntegerField;
    Z_ANUNCIOMEIO: TStringField;
    Z_ANUNCIODATA_INICIO: TDateField;
    Z_ANUNCIODATA_FIM: TDateField;
    Z_ANUNCIOVALOR: TFloatField;
    Z_ANUNCIODESCRICAO: TMemoField;
    Z_ANUNCIOOBS: TStringField;
    Z_ANUNCIOATIVO: TStringField;
    Z_ANUNCIOXCODIGO: TIntegerField;
    Z_ANUNCIOXNUMERO: TIntegerField;
    Z_ANUNCIOXVALORVENDA: TFloatField;
    Z_ANUNCIOXVALORALUGUEL: TFloatField;
    Z_ANUNCIOXSTATUS: TStringField;
    Z_ANUNCIOXFINALIDADE: TStringField;
    Z_ANUNCIOXTIPO: TStringField;
    Z_ANUNCIOXSUBTIPO: TStringField;
    UP_ANUNCIO: TZUpdateSQL;
    Z_ANUNCIOIMPRIMIR: TStringField;
    Z_PESSOA_CONTRATOID_PESSOA: TIntegerField;
    Z_PESSOA_CONTRATOID_CONTRATO: TIntegerField;
    Z_PESSOA_CONTRATOID_IMOVEL: TIntegerField;
    Z_PESSOA_CONTRATOTIPO: TStringField;
    Z_PESSOA_CONTRATOPORCENTAGEM: TFloatField;
    Z_PESSOA_CONTRATOXCODIGO: TIntegerField;
    Z_PESSOA_CONTRATOXNOME: TStringField;
    Z_PESSOA_CONTRATOXCPF: TStringField;
    Z_PESSOA_CONTRATOXFOTO: TStringField;
    Z_ALUGUELID_REFERENCIA: TLargeintField;
    Z_ALUGUELALTERACAO_FUNC: TIntegerField;
    Z_ALUGUELALTERACAO_DATA: TDateTimeField;
    Z_ALUGUELOBS: TMemoField;
    Z_ALUGUELINQUILINO: TStringField;
    UPZ_Aluguel: TZUpdateSQL;
    Z_ALUGUELPROPRIETARIO: TStringField;
    ZLog: TZQuery;
    ZLogID_LOG: TIntegerField;
    ZLogACAO: TStringField;
    ZLogCOMPONENTE: TStringField;
    ZLogCAMPOS: TMemoField;
    ZLogDATA: TDateTimeField;
    ZLogID_FUNC: TIntegerField;
    ZLogID_CONTA: TIntegerField;
    ZLogOBS: TStringField;
    ZLogATIVO: TStringField;
    Z_ALUGUELINFO_1: TStringField;
    Z_ALUGUELINFO_2: TStringField;
    Z_ALUGUELINFO_3: TStringField;
    Z_ALUGUELINFO_4: TStringField;
    DSAnuncio: TDataSource;
    Z_Caixa_Sis: TZQuery;
    Z_Caixa_SisID_CAIXA_SIS: TIntegerField;
    Z_Caixa_SisTIPO: TStringField;
    Z_Caixa_SisNOME: TStringField;
    Z_Caixa_SisCOL1: TStringField;
    Z_Caixa_SisCOL2: TStringField;
    Z_Caixa_SisCOL3: TStringField;
    Z_Caixa_SisCOL4: TStringField;
    Z_Caixa_SisANOTACAO: TMemoField;
    Z_Caixa_SisPADRAO: TStringField;
    Z_Caixa_SisATIVO: TStringField;
    Z_Sistema: TZQuery;
    Z_SistemaTIPO: TStringField;
    Z_SistemaVALOR: TStringField;
    Z_ALUGUELCOMPLEMENTO: TStringField;
    Z_ALUGUELLOGRADOURO: TStringField;
    Z_ALUGUELDATAFINAL: TStringField;
    Z_ALUGUELNUMERO: TIntegerField;
    procedure Z_ALUGUELCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
        Valor_Contrato: Double;
    function ProcuraSelect(texto: String): BOOLEAN;
    function ProcuraTransaction(texto: String): boolean;
    function TrataSql(texto: String): String;
  end;

var
  DM_ADMIN: TDM_ADMIN;

implementation

uses FrmPrincipal, ZDbcLogging, unUtilitario;

{$R *.dfm}

function TDM_ADMIN.ProcuraSelect(texto: String): Boolean;
var procurado, achei: string;
    i, j: integer;
begin
  texto := lowercase(texto);
  achei := 'NAO';
  procurado := '';

  for i:=1 to Length(texto) do
    begin
      if texto[i] = 's' then
        begin
          for j := 0 to 5 do
            procurado := procurado + texto[i+j];

          if procurado = 'select' then
            achei := 'SIM'
          else
            procurado := '';
        end;

    end;

  if achei = 'SIM' then
    result := true
  else
    result := false;
end;


function TDM_ADMIN.ProcuraTransaction(texto: String): boolean;
var procurado, achei: string;
    i, j: integer;

begin
  texto := lowercase(texto);
  achei := 'NAO';
  procurado := '';

  for i:=1 to Length(texto) do
    begin
      if texto[i] = 't' then
        begin
          for j := 0 to 10 do
            procurado := procurado + texto[i+j];

          if procurado = 'transaction' then
            achei := 'SIM'
          else
            procurado := '';
        end;

    end;

  if achei = 'SIM' then
    result := true
  else
    result := false;
end;

function TDM_ADMIN.TrataSql(texto: String): String;
var i: integer;
begin
 for i := 0 to 59 do
   texto[i] := ' ';

 result := texto;
end;

procedure TDM_ADMIN.Z_ALUGUELCalcFields(DataSet: TDataSet);
begin
     DM_ADMIN.Z_ALUGUELDATAFINAL.AsString := DateToStr(IncMonth(DM_ADMIN.Z_ALUGUELVENCIMENTO.AsDateTime, DM_ADMIN.Z_ALUGUELVIGENCIA.AsInteger - 1));
end;

end.
