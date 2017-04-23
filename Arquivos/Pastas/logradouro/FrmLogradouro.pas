unit FrmLogradouro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, DBCtrls, Mask, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCAD_Logradouro = class(TCAD_MATRIZ)
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBEdit10: TDBEdit;
    ZTipoLogradouro: TZQuery;
    DSTipo: TDataSource;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    comboBairro: TComboBox;
    Label16: TLabel;
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure DBEdit10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
  CAD_Logradouro: TCAD_Logradouro;

implementation

uses FrmDM_Cadastro, FrmPrincipal, unMsg, unCamposBusca, FrmBairros, FrmCidades,
  FrmEstados, FrmPessoa, FrmImovel, unUtilitario;

{$R *.dfm}


procedure TCAD_Logradouro.Pesquisar();
Var
    BUSCA_VALOR: string;
begin

     //Trata completamente a string, removendo caracteres especiais e trocando palavras
    BUSCA_VALOR := tratarBusca(Valor.Text);

    //ORDENAÇÃO DA GRID
  If Ordenacao = '' Then
     Ordenacao := 'U.nome, C.nome, B.nome, L.nome'
     Else
     Begin
          If (POS('.',Ordenacao) = 0) AND (Ordenacao <> 'B.nome') AND (Ordenacao <> 'C.nome') and (Ordenacao <> 'U.nome') and (Ordenacao <> 'U.sigla') Then
             Ordenacao := 'L.'+Ordenacao;

          If Ordenacao = '' Then
             Ordenacao := '';

          If Ordenacao = 'L.XBAIRRO' Then
             Ordenacao := 'B.nome';

          If Ordenacao = 'L.XCIDADE' Then
             Ordenacao := 'C.nome';

          If Ordenacao = 'L.XESTADO' Then
             Ordenacao := 'U.nome';

          If Ordenacao = 'L.XSIGLA' Then
             Ordenacao := 'U.sigla';

  End;

    if BUSCA_VALOR = 'false' then
       exit
    else
    if (BUSCA_VALOR = 'TUDO') or (BUSCA_VALOR = 'TODOS') or (BUSCA_VALOR = 'TODO')  then
       BUSCA_VALOR := ' ( CURRENT_DATE = CURRENT_DATE ) '
    else
    if verificaStringInt(BUSCA_VALOR) then
       BUSCA_VALOR := ' ( ID_LOGRADOURO = '+BUSCA_VALOR+' ) '
    else
    if POS('-',BUSCA_VALOR) > 0 then
       BUSCA_VALOR := ' ( L.cep = '''+BUSCA_VALOR+''' ) '
    else
    Begin
       BUSCA_VALOR := ' ( '+
       ' Mv_Soundex(L.tipo) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or '+
       ' Mv_Soundex(L.nome) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or '+
       ' Mv_Soundex(B.nome) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or '+
       ' Mv_Soundex(C.nome) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or '+
       ' Mv_Soundex(U.nome) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' )';
    end;

    if Length(Trim(comboBairro.Text)) > 0 then
         BUSCA_VALOR := BUSCA_VALOR + ' AND (B.id_bairro = '+IntToStr(IDCampo(comboBairro.Text))+') ';

    finalizaPesquisa('select L.*, B.nome AS XBAIRRO, C.nome AS XCIDADE, U.nome AS XESTADO, U.sigla AS XSIGLA FROM logradouro L inner join bairro B on B.id_bairro = L.id_bairro inner join cidade C on C.id_cidade = L.id_cidade inner join uf U on U.id_sigla = L.id_sigla where '+BUSCA_VALOR+' order by '+Ordenacao);
end;


procedure TCAD_Logradouro.FormCreate(Sender: TObject);
VAR varSQL: TZQuery;
begin

  inherited;

  DS.DataSet := DM_Cadastro.Z_Logradouro;

  If ZTipoLogradouro.Active Then
     ZTipoLogradouro.Close;
     
  ZTipoLogradouro.SQL.Clear;
  ZTipoLogradouro.SQL.Add('select distinct(tipo) from logradouro order by tipo');
  ZTipoLogradouro.Open;

  varSQL := unUtilitario.getSelect('select b.nome ||''-''|| b.id_bairro from bairro b order by b.nome');

  comboBairro.Items.Clear;
  comboBairro.Items.Add('');
  while NOT varSQL.Eof do
  begin
       comboBairro.Items.Add(varSQL.Fields[0].AsString);
       varSQL.Next;
  end;

  // Padrão de tela 1024X768
  Self.Height := 323;
  SELF.Width := 863;
end;

procedure TCAD_Logradouro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ZTipoLogradouro.Close;
     inherited;
     Cad_Logradouro := nil;
End;

procedure TCAD_Logradouro.Btn_GravarClick(Sender: TObject);
begin

     if verificaDuplicidade('LOGRADOURO', 'ID_LOGRADOURO', DS.DataSet.FieldByName('ID_LOGRADOURO').AsString, 'id_cidade = '+DS.DataSet.FieldByName('id_cidade').AsString+' and id_sigla = '+DS.DataSet.FieldByName('id_sigla').AsString+' and id_bairro = '+DS.DataSet.FieldByName('id_bairro').AsString+' and nome like '''+TROCA_LETRA(DS.DataSet.FieldByName('nome').AsString)+''' ') then
        inherited;

end;

procedure TCAD_Logradouro.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setMensagem('Espere um momento, o sistema está carregando os tipos...');

  If ZTipoLogradouro.Active Then
     ZTipoLogradouro.Close;
     
     ZTipoLogradouro.SQL.Clear;
     ZTipoLogradouro.SQL.Add('select distinct(tipo) from logradouro order by tipo');
     ZTipoLogradouro.Open;

     PRINCIPAL.setID(DM_Cadastro.Z_Logradouro, 'ID_LOGRADOURO', 'LOGRADOURO');

  DBEdit5.SetFocus;
end;

procedure TCAD_Logradouro.BitBtn1Click(Sender: TObject);
begin

  PRINCIPAL.CriarForm(TCAD_Estados, self, '1');

end;

procedure TCAD_Logradouro.BitBtn2Click(Sender: TObject);
begin

 PRINCIPAL.CriarForm(TCAD_Cidade, self, '1');

end;

procedure TCAD_Logradouro.BitBtn3Click(Sender: TObject);
begin

PRINCIPAL.CriarForm(TCAD_Bairro, self, '1');

end;

procedure TCAD_Logradouro.Image3Click(Sender: TObject);
begin
  inherited;
  principal.SITE('http://www.buscacep.correios.com.br/servicos/dnec/menuAction.do?Metodo=menuEndereco');
end;

procedure TCAD_Logradouro.Image4Click(Sender: TObject);
begin
  inherited;
  if not DM_CADASTRO.Z_LogradouroID_LOGRADOURO.IsNull then
     principal.SITE('http://maps.google.com/maps?hl=pt-BR&ie=UTF8&z=16&q='+unUtilitario.RemoveAcentos(StringReplace(DM_CADASTRO.Z_LogradouroTIPO.AsString,' ','+',[rfReplaceAll,rfIgnoreCase]))+'+'+unUtilitario.RemoveAcentos(StringReplace(DM_CADASTRO.Z_LogradouroNOME.AsString,' ','+',[rfReplaceAll,rfIgnoreCase]))+'+-+'+unUtilitario.RemoveAcentos(StringReplace(DM_CADASTRO.Z_LogradouroXBAIRRO.AsString,' ','+',[rfReplaceAll,rfIgnoreCase]))+',+'+unUtilitario.RemoveAcentos(StringReplace(DM_CADASTRO.Z_LogradouroXCIDADE.AsString,' ','+',[rfReplaceAll,rfIgnoreCase]))+'+-+'+unUtilitario.RemoveAcentos(StringReplace(DM_CADASTRO.Z_LogradouroXESTADO.AsString,' ','+',[rfReplaceAll,rfIgnoreCase]))+',+BRA');

end;

procedure TCAD_Logradouro.Image5Click(Sender: TObject);
begin
  inherited;
  if not DM_CADASTRO.Z_LogradouroID_LOGRADOURO.IsNull then
     principal.SITE('http://www.celuladigital.com.br/sistemas/imobiliaria/cep.php?busca='+DM_CADASTRO.Z_LogradouroCEP.AsString);

end;

procedure TCAD_Logradouro.DBEdit10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
principal.setMensagem('Caso não tenha nenhum tipo registrado, crie um agora.');
end;

end.
