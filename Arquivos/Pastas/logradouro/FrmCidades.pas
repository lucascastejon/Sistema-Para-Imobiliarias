unit FrmCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, Mask, DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_Cidade = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SpeedButton1: TSpeedButton;
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar();
  end;

var
  CAD_Cidade: TCAD_Cidade;

implementation

uses FrmDM_Cadastro, FrmPrincipal, unCamposBusca, unMsg, FrmLogradouro, unUtilitario;

{$R *.dfm}

procedure TCAD_Cidade.Pesquisar();
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
       BUSCA_VALOR := ' ( ID_CIDADE = '+BUSCA_VALOR+' ) '
    else
       BUSCA_VALOR := ' ( Mv_Soundex(NOME) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' ) ';

    finalizaPesquisa('select * from CIDADE where '+BUSCA_VALOR);
end;

procedure TCAD_Cidade.FormCreate(Sender: TObject);
begin
  inherited;

  DS.DataSet := DM_Cadastro.Z_Cidade;

  // Padrão de tela 1024X768
  Self.Height := 345;
  SELF.Width := 389;
end;

procedure TCAD_Cidade.Btn_GravarClick(Sender: TObject);
begin
  if ds.state in [dsinsert] then
    begin
      if (ds.dataset.fieldbyname('nome').AsString <> '') then
        begin
             if verificaDuplicidade('CIDADE', 'ID_CIDADE', DS.DataSet.FieldByName('ID_CIDADE').AsString, 'NOME LIKE '''+TROCA_LETRA(DS.DataSet.FieldByName('NOME').AsString)+'''') then
             begin
                  inherited;
             end
        end
        else
          begin
            application.messagebox('Digite o nome da cidade!', 'Aviso', mb_ok);
            ds.dataset.FieldByName('nome').FocusControl;
          end;
    end
  else
    begin
      inherited;
    end;
end;

procedure TCAD_Cidade.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setID(DM_CADASTRO.Z_Cidade, 'ID_CIDADE', 'CIDADE');
end;

procedure TCAD_Cidade.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  PRINCIPAL.SITE('http://www.correios.com.br/servicos/dnec/menuAction.do?Metodo=menuFaixaCep');
  PRINCIPAL.setMensagem('Dica: Use CTRL+C para copiar e CTRL+V para colar as informações da web...');
end;

procedure TCAD_Cidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
CAD_Cidade := nil;
end;



end.
