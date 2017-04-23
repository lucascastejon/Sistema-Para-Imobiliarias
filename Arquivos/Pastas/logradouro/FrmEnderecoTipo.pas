unit FrmEnderecoTipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, DBCtrls, Mask, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_Endereco_Tipo = class(TCAD_MATRIZ)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBCheckBox2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBCheckBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Btn_NovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar();
  end;

var
  CAD_Endereco_Tipo: TCAD_Endereco_Tipo;

implementation

uses FrmDM_Cadastro, FrmPrincipal, unCamposBusca, unMsg, unUtilitario;

{$R *.dfm}

procedure TCAD_Endereco_Tipo.Pesquisar();
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
       BUSCA_VALOR := ' ( ID_ENDERECO_TIPO = '+BUSCA_VALOR+' ) '
    else
       BUSCA_VALOR := ' ( Mv_Soundex(TIPO) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' ) ';

    finalizaPesquisa('select * from ENDERECO_TIPO where '+BUSCA_VALOR);
end;

procedure TCAD_Endereco_Tipo.FormCreate(Sender: TObject);
begin
  inherited;

  // Padrão de tela 1024X768
  Self.Height := 345;
  SELF.Width := 441;
  
  DS.DataSet := DM_Cadastro.Z_Endereco_Tipo;
end;

procedure TCAD_Endereco_Tipo.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setID(DM_CADASTRO.Z_Endereco_Tipo, 'ID_ENDERECO_TIPO', 'ENDERECO_TIPO');
  DM_CADASTRO.Z_Endereco_Tipo.FieldByName('ENDERECO').Value := 'SIM';
  DM_CADASTRO.Z_Endereco_Tipo.FieldByName('TELEFONE').Value := 'SIM';
  PRINCIPAL.setMensagem('Marque a opção ''Telefone'' e ''Endereço'', se o Tipo for acessível a estes cadastros.');
  DBEdit2.SetFocus;
end;

procedure TCAD_Endereco_Tipo.DBCheckBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  principal.setMensagem('Será mostrado somente no cadastro de telefones.');
end;

procedure TCAD_Endereco_Tipo.DBCheckBox2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  principal.setMensagem('Será mostrado somente no cadastro de logradouros.');
end;

procedure TCAD_Endereco_Tipo.DBEdit2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  principal.setMensagem('Tipo de entedeço para refinar os cadastros do sistema.');
end;

procedure TCAD_Endereco_Tipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Cad_Endereco_Tipo := nil;
end;

end.
