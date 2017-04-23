unit FrmEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, Mask, DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_Estados = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar();
  end;

var
  CAD_Estados: TCAD_Estados;

implementation

uses unCamposBusca, unImagem, FrmDM_Cadastro, FrmPrincipal, unMsg,
  FrmLogradouro, unUtilitario;

{$R *.dfm}

procedure TCAD_Estados.Pesquisar();
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
       BUSCA_VALOR := ' ( ID_SIGLA = '+BUSCA_VALOR+' ) '
    else
       BUSCA_VALOR := ' ( Mv_Soundex(NOME) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' ) or '+
       ' (SIGLA LIKE ''%'+BUSCA_VALOR+'%'')';

    finalizaPesquisa('select * from UF where '+BUSCA_VALOR);
end;

procedure TCAD_Estados.FormCreate(Sender: TObject);
begin
  inherited;
  DS.DataSet := DM_Cadastro.Z_Estado;

  // Padrão de tela 1024X768
  Self.Height := 345;
  SELF.Width := 405;
end;

procedure TCAD_Estados.Btn_GravarClick(Sender: TObject);
begin
     if verificaDuplicidade('UF', 'ID_SIGLA', DS.DataSet.FieldByName('ID_SIGLA').AsString, 'NOME LIKE '''+TROCA_LETRA(DS.DataSet.FieldByName('NOME').AsString)+'''') then
     Begin
          inherited;
     End;
end;

procedure TCAD_Estados.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setID(DM_CADASTRO.Z_Estado, 'ID_SIGLA', 'UF');
end;

procedure TCAD_Estados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
Cad_Estados := nil;
end;

end.
