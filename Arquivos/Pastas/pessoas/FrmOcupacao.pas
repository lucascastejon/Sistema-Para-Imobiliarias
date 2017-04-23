unit FrmOcupacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, Mask, DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_Ocupacao = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    procedure Btn_NovoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar();
  end;

var
  CAD_Ocupacao: TCAD_Ocupacao;

implementation

uses FrmDM_Cadastro, FrmPrincipal, unCamposBusca, unMsg, FrmPessoa,
  unUtilitario;

{$R *.dfm}

procedure TCAD_Ocupacao.Pesquisar();
Var
    BUSCA_VALOR: string;
begin

     //Trata completamente a string, removendo caracteres especiais e trocando palavras
    BUSCA_VALOR := tratarBusca(Valor.Text);

    if BUSCA_VALOR = 'false' then
       exit
    else
    if (BUSCA_VALOR = 'TUDO') or (BUSCA_VALOR = 'TODOS') or (BUSCA_VALOR = 'TODO')  then
       BUSCA_VALOR := ' ( CURRENT_DATE = CURRENT_DATE ) '
    else
    if verificaStringInt(BUSCA_VALOR) then
       BUSCA_VALOR := ' ( ID_OCUPACAO = '+BUSCA_VALOR+' ) '
    else
    if POS('.',BUSCA_VALOR) > 0 then
       BUSCA_VALOR := ' ( CBO like '''+BUSCA_VALOR+'%'' ) '
    else
    Begin
       BUSCA_VALOR := ' ( Mv_Soundex(NOME) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' ) ';
    end;

    finalizaPesquisa('select id_ocupacao, cbo, nome, obs from ocupacao where '+BUSCA_VALOR+' order by NOME ');
end;

procedure TCAD_Ocupacao.FormCreate(Sender: TObject);
begin

  inherited;

  DS.DataSet := DM_Cadastro.Z_Ocupacao;
end;

procedure TCAD_Ocupacao.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setID(DM_Cadastro.Z_Ocupacao, 'ID_OCUPACAO', 'OCUPACAO');

end;

procedure TCAD_Ocupacao.BitBtn1Click(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setMensagem('Você está sendo enviado para o site do MT.');
  PRINCIPAL.SITE('http://www.mtecbo.gov.br/cbosite/pages/pesquisas/BuscaPorTitulo.jsf');
end;

end.
