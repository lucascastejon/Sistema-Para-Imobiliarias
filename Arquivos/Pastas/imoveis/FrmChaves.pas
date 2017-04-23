unit FrmChaves;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  ComCtrls, Grids, DBGrids, DBCtrls, Buttons, STRUTILS;

type
  TCAD_CHAVES = class(TForm)
    DsImoveis: TDataSource;
    ZqImoveis: TZQuery;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    lbChaves: TLabel;
    DBText1: TDBText;
    btnChave: TSpeedButton;
    ZqPI: TZQuery;
    ZqAux: TZQuery;
    Label3: TLabel;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label4: TLabel;
    lbPessoa: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbData_hora: TLabel;
    lbDocumentos: TLabel;
    lbFuncionario: TLabel;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    ZReg: TZQuery;
    DsReg: TDataSource;
    ZRegID_PESSOA: TIntegerField;
    ZRegDATA_INICIAL: TDateField;
    ZRegHORA_INICIAL: TTimeField;
    ZRegDATA_FINAL: TDateField;
    ZRegHORA_FINAL: TTimeField;
    ZRegGARANTIA: TStringField;
    ZRegOBS: TStringField;

    procedure DevolverChave();
    procedure VerificarChave();
    procedure buscarpessoa();
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DsImoveisDataChange(Sender: TObject; Field: TField);
    procedure btnChaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_CHAVES: TCAD_CHAVES;

implementation

uses FrmPrincipal, FrmImovel, FrmPessoa, unUtilitario, unLog;

{$R *.dfm}

procedure TCAD_CHAVES.btnChaveClick(Sender: TObject);
begin
  if btnchave.Caption = 'Emprestar' then
    begin
         PRINCIPAL.CriarForm(TCAD_Pessoa, self, '1');
    end
  else if btnchave.caption = 'Devolver' then
    begin
         DEVOLVERCHAVE();
    end;
       
end;

procedure TCAD_CHAVES.buscarpessoa;
begin
  zqpi.close;
  zqpi.SQL.Clear;
  zqpi.SQL.Add('SELECT PI.id_pessoa, pi.garantia, pi.id_usuario, pi.data_inicial, pi.hora_inicial, p.nome from pessoa_imovel pi left join pessoa p on pi.id_pessoa = p.id_pessoa where pi.ativo = ''EMP'' and pi.id_imovel = ' + zqimoveis.FieldByName('CODIGO').AsString);
  zqpi.Open;

  lbPessoa.Caption := zqpi.FieldByName('id_pessoa').AsString + ' - ' + zqpi.FieldByName('nome').AsString;
  lbData_hora.Caption := zqpi.FieldByName('data_inicial').AsString + ' ' + zqpi.FieldByName('hora_inicial').AsString;
  lbDocumentos.Caption := zqpi.FieldByName('garantia').ASSTRING;
  lbFuncionario.Caption := zqpi.FieldByName('id_usuario').ASSTRING;
end;

procedure TCAD_CHAVES.DevolverChave;
begin

     IF unUtilitario.setMensagem('Deseja DEVOLVER a chave?','confirma') = IDNO Then
        exit;

  zqaux.Close;
  zqaux.SQL.Clear;


  if (zqimoveis.FieldByName('codigo').IsNull) or (zqPI.FieldByName('id_pessoa').IsNull) then
    BEGIN
      application.MessageBox('Erro! Não foi possível realizar a operação!','Aviso Célula Digital',mb_ok);
      exit;
    END;

  zqaux.SQL.add('select * from pessoa_imovel where id_imovel = ' + zqimoveis.FieldByName('CODIGO').AsString + ' and id_pessoa = ' + zqpi.FieldByName('ID_PESSOA').AsString +' and id_pessoa_tipo = 15 and ativo = ''EMP'' ');
  zqaux.Open;
  zqaux.SQL.Text;

  zqaux.edit;
  ZQAUX.FieldByName('data_final').AsDateTime := date;
  ZQAUX.FieldByName('hora_final').AsDateTime := time;
  ZQAUX.FieldByName('ativo').asstring := 'SIM';

  zqaux.fieldbyname('obs').AsString := inputbox('Célula Digital Software','Digite as OBSERVAÇÕES do interessado em relação ao Imóvel visitado:','');

  if Length(Trim(zqaux.fieldbyname('OBS').AsString)) = 0 then
    zqaux.FieldByName('OBS').AsString := 'SEM COMENTARIOS';

  try
    zqaux.Post;
    zqaux.ApplyUpdates;
  except
    application.MessageBox('Erro! Não foi possível realizar a operação!','Aviso Célula Digital',mb_ok);
  end;

  //voltando as chaves do imovel para disponível
  zqaux.Close;
  zqaux.SQL.clear;
  zqaux.SQL.add('update imovel set chave= ''SIM'' where id_imovel = ' + zqimoveis.FieldByName('codigo').asstring + ' ');

  try
    zqaux.ExecSQL;
    zqaux.ApplyUpdates;
    setLogSQL('SQL UPDATE', 'SQL', 'RASTREAMENTO DE COMANDOS', zqaux.SQL.Text);
  except
    application.MessageBox('Erro! Não foi possível realizar a operação!','Aviso Célula Digital',mb_ok);
  end;

  //atualizando a grid
  ZQIMOVEIS.Close;
  ZQIMOVEIS.Open;
end;

procedure TCAD_CHAVES.DsImoveisDataChange(Sender: TObject; Field: TField);
begin
  verificarChave();
end;

procedure TCAD_CHAVES.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  zqimoveis.Close;
  zqpi.Close;
  zqaux.Close;
  Zreg.Close;

  CAD_CHAVES := NIL;
  ACTION := CAFREE;
end;

procedure TCAD_CHAVES.FormCreate(Sender: TObject);
var i: integer;
begin
  ZqImoveis.Close;
  ZqImoveis.SQL.Clear;
  ZqImoveis.SQL.Add('select im.chave, im.id_imovel as CODIGO, (lg.tipo || '' '' || lg.nome) as ENDERECO, im.numero as NUMERO, br.nome as BAIRRO from imovel im left join logradouro lg ' + 'on lg.id_logradouro = im.id_logradouro left join bairro br on br.id_bairro = lg.id_bairro where id_imovel in (');

  for i := 0 to principal.selecao.Count - 1 do
    zqImoveis.SQL.add(inttostr(strtoint(principal.SELECAO.Strings[i])) + ', ');

  zqimoveis.SQL.Add(' 0)');
  zqimoveis.Open;
end;

procedure TCAD_CHAVES.FormShow(Sender: TObject);
begin
  VerificarChave();
end;

procedure TCAD_CHAVES.TabSheet3Show(Sender: TObject);
begin
  zreg.Close;
  zreg.ParamByName('pimovel').AsInteger := zqimoveis.FieldByName('codigo').AsInteger;
  zreg.Open;
end;

procedure TCAD_CHAVES.VerificarChave;
begin
  if ZqImoveis.FieldByName('CHAVE').AsString = 'SIM' then
    begin
      lbchaves.Font.Color := clGreen;
      lbchaves.Caption := 'Disponível';
      btnchave.visible := true;
      btnchave.Font.Color := clGreen;
      btnChave.Caption := 'Emprestar';
      lbPessoa.Caption := '';
      lbData_hora.Caption := '';
      lbDocumentos.Caption := '';
      lbFuncionario.caption := '';


    end
  else if ZqImoveis.FieldByName('CHAVE').AsString = 'EMP' then
    begin
      lbchaves.Font.Color := clRed;
      lbchaves.Caption := 'Emprestadas';
      btnchave.visible := true;
      btnchave.Font.Color := clRed;
      btnChave.Caption := 'Devolver';

      // buscando quem está com a chave
      buscarpessoa();
    end
  else if ZqImoveis.FieldByName('CHAVE').AsString = 'NAO' then
    begin
      lbchaves.Font.Color := clRed;
      lbchaves.Caption := 'Não Disponível';
      btnchave.visible := false;
      lbPessoa.Caption := '';
      lbData_hora.Caption := '';
      lbDocumentos.Caption := '';
      lbFuncionario.caption := '';
    end;
end;

end.
