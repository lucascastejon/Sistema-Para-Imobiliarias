unit FrmCaixasItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, DBCtrls, Mask, ZDataset;

type
  TCAD_Caixas_Item = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Bevel1: TBevel;
    Btn_Gravar: TBitBtn;
    Btn_Cancelar: TBitBtn;
    Btn_Fechar: TBitBtn;
    BtnCaixaSaida: TSpeedButton;
    BtnCaixaEntrada: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CampoParcela: TEdit;
    CampoDataVenc: TMaskEdit;
    CampoValorBase: TMaskEdit;
    Label6: TLabel;
    Bevel2: TBevel;
    CampoDocumento: TEdit;
    Label7: TLabel;
    CampoMulta: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    CampoMultaPorc: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CampoJuros: TMaskEdit;
    CampoJurosPorc: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    CampoDesconto: TMaskEdit;
    CampoDescontoPorc: TMaskEdit;
    Label16: TLabel;
    Label17: TLabel;
    CampoValorFinal: TMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    CampoAnotacao: TMemo;
    Label20: TLabel;
    CampoSubgrupo: TComboBox;
    CampoGrupo: TComboBox;
    CampoCategoria: TComboBox;
    checkGarantido: TCheckBox;
    procedure BtnCaixaSaidaClick(Sender: TObject);
    procedure BtnCaixaEntradaClick(Sender: TObject);
    procedure Btn_FecharClick(Sender: TObject);
    procedure CampoDescontoPorcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CampoDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CampoJurosPorcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CampoJurosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CampoMultaPorcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CampoMultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CampoValorBaseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CampoDescontoChange(Sender: TObject);
    procedure CampoDescontoPorcChange(Sender: TObject);
    procedure CampoJurosPorcChange(Sender: TObject);
    procedure CampoJurosChange(Sender: TObject);
    procedure CampoMultaPorcChange(Sender: TObject);
    procedure CampoMultaChange(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    caixaLocal, caixaInformado, codImovel, codContrato: String;
    codCaixa, codPessoa, codFuncionario, codCalculo: Integer;
  public
    { Public declarations }
    procedure setCaixa(Caixa: String);
    procedure setInformacao(caixa, id_imovel, id_contrato: String; id_caixa, id_pessoa, id_funcionario, baseCalculo: Integer);
    procedure setGravarConta();
  end;

var
  CAD_Caixas_Item: TCAD_Caixas_Item;

implementation

uses FrmDM_FINANCEIRO, unFinanceiro, unUtilitario, unLog;

{$R *.dfm}

procedure TCAD_Caixas_Item.setGravarConta();
var varSQL: TZQuery;
    garantido: String;
Begin

     if (Length(codImovel) = 0) Then
        codImovel := 'NULL';

     if (Length(codContrato) = 0) then
        codContrato := 'NULL';

     if (checkGarantido.State = cbChecked) then
        garantido := 'SIM'
     else
         garantido  := 'NAO';

     try
        varSQL := unUtilitario.getSQL('INSERT INTO CAIXA_'+CaixaLOCAL+' (ID_IMOVEL, ID_CONTRATO, ID_CATEGORIA, ID_TIPO, ID_SUBTIPO, ID_PESSOA,'+' ID_FUNCIONARIO, ID_ENTRADA, ID_SAIDA, DATA_REF, DATA_ALT, DATA_PGTO, HORA_PGTO, DOCUMENTO, OPERACAO, VALOR, VALOR_JUROS, VALOR_MULTA, VALOR_DESCONTO, PARCELA, PENDENTE, GARANTIDO, ATIVO) '+
        'VALUES ('+ codImovel +', '+ codContrato + ', '+IntToStr(unUtilitario.IDCampo(CampoCategoria.Text))+', '+IntToStr(unUtilitario.IDCampo(CampoGrupo.Text))+', '+IntToStr(unUtilitario.IDCampo(CampoSubgrupo.Text))+', '+IntToStr(codPessoa)+', '+IntToStr(codFuncionario)+', '+IntToStr(codCaixa)+', NULL, '''+StringReplace(CampoDataVenc.Text,'/','.',[rfReplaceAll])+''', '''+StringReplace(DateToStr(Date()),'/','.',[rfReplaceAll])+''', NULL, NULL, '''+CampoGrupo.Text +' / '+ CampoSubgrupo.Text +': '+ CampoDocumento.Text+''', ''CONTA GERADA COMO ÍTEM E INSERIDA MANUALMENTE.'', '+formataDinheiroSQL(CurrToStr(unUtilitario.getStrToCurr(CampoValorBase.text)))+', '+formataDinheiroSQL(CurrToStr(unUtilitario.getStrToCurr(CampoJurosPorc.text)))+', '+formataDinheiroSQL(CurrToStr(unUtilitario.getStrToCurr(CampoMultaPorc.text)))+', '+formataDinheiroSQL(CurrToStr(unUtilitario.getStrToCurr(CampoDesconto.text)))+', '+CampoParcela.Text+', ''NAO'','''+garantido+''' , ''SIM'')');

        varSQL.ApplyUpdates;

        setLogSQL('SQL INSERT', 'SQL', 'RASTREAMENTO DE COMANDOS', varSQL.SQL.Text);
     except
     on e: Exception do
        unUtilitario.setMensagem('Erro ao gravar a conta!'+#13+e.Message,'erro');

     end;

     unUtilitario.setMensagem('Conta inserida com sucesso!','informa');

     FreeAndNil(varSQL);
     Self.Close;
end;

procedure TCAD_Caixas_Item.BtnCaixaEntradaClick(Sender: TObject);
begin
     setCaixa('ENTRADA');
end;

procedure TCAD_Caixas_Item.BtnCaixaSaidaClick(Sender: TObject);
begin
     setCaixa('SAIDA');
end;

procedure TCAD_Caixas_Item.Btn_CancelarClick(Sender: TObject);
begin
     if unUtilitario.setMensagem('Deseja CANCELAR a conta?','confirma') = IDYES then
        setInformacao(caixaInformado, codImovel, codContrato, codCaixa, codPessoa, codFuncionario, codCalculo);
end;

procedure TCAD_Caixas_Item.Btn_FecharClick(Sender: TObject);
begin
     Close;
end;

procedure TCAD_Caixas_Item.Btn_GravarClick(Sender: TObject);
begin
     if unUtilitario.setMensagem('Deseja GRAVAR a conta?','confirma') = IDYES then
        setGravarConta();
     
end;

procedure TCAD_Caixas_Item.CampoDescontoChange(Sender: TObject);
begin
     if CampoDesconto.Focused then
        CampoDescontoPorc.Text := CurrToStr(unFinanceiro.getPorcToDinh(CampoDesconto.Text,CampoValorBase.Text));
end;

procedure TCAD_Caixas_Item.CampoDescontoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     CampoMultaKeyDown(Sender, Key,Shift);
end;

procedure TCAD_Caixas_Item.CampoDescontoPorcChange(Sender: TObject);
begin
     if CampoDescontoPorc.Focused then
        CampoDesconto.Text := CurrToStr(unFinanceiro.getPorcToDinh(CampoDescontoPorc.Text,CampoValorBase.Text));
end;

procedure TCAD_Caixas_Item.CampoDescontoPorcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     CampoMultaKeyDown(Sender, Key,Shift);
end;

procedure TCAD_Caixas_Item.CampoJurosChange(Sender: TObject);
begin
     if CampoJuros.Focused then
        CampoJurosPorc.Text := CurrToStr(unFinanceiro.getPorcToDinh(CampoJuros.Text,CampoValorBase.Text));
end;

procedure TCAD_Caixas_Item.CampoJurosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     CampoMultaKeyDown(Sender, Key,Shift);
end;

procedure TCAD_Caixas_Item.CampoJurosPorcChange(Sender: TObject);
begin
     if CampoJurosPorc.Focused then
        CampoJuros.Text := CurrToStr(unFinanceiro.getDinhToPorc(CampoJurosPorc.Text,CampoValorBase.Text));
end;

procedure TCAD_Caixas_Item.CampoJurosPorcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     CampoMultaKeyDown(Sender, Key,Shift);
end;

procedure TCAD_Caixas_Item.CampoMultaChange(Sender: TObject);
begin
     if CampoMulta.Focused then
        CampoMultaPorc.Text := CurrToStr(unFinanceiro.getDinhToPorc(CampoMulta.Text,CampoValorBase.Text));
end;

procedure TCAD_Caixas_Item.CampoMultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_RETURN then
        CampoValorFinal.Text := FormatFloat('###,###,###,##0.00',unFinanceiro.getDinheiroTotal(CampoValorBase.Text,CampoJurosPorc.Text, CampoMultaPorc.Text, CampoDesconto.Text, CampoDataVenc.Text, DateToStr(Date()), IntToStr(codCalculo)));
end;

procedure TCAD_Caixas_Item.CampoMultaPorcChange(Sender: TObject);
begin
     if CampoMultaPorc.Focused then
        CampoMulta.Text := CurrToStr(unFinanceiro.getPorcToDinh(CampoMultaPorc.Text,CampoValorBase.Text));
end;

procedure TCAD_Caixas_Item.CampoMultaPorcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     CampoMultaKeyDown(Sender, Key,Shift);
end;

procedure TCAD_Caixas_Item.CampoValorBaseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_RETURN then
        CampoValorFinal.Text := CurrToStr(unFinanceiro.getDinheiroTotal(CampoValorBase.Text,CampoJurosPorc.Text, CampoMultaPorc.Text, CampoDesconto.Text, CampoDataVenc.Text, DateToStr(Date()), IntToStr(codCalculo)));
end;

procedure TCAD_Caixas_Item.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TCAD_Caixas_Item.FormCreate(Sender: TObject);
begin
     setCaixa('ENTRADA');
     CampoCategoria.Items.AddStrings(unUtilitario.getComboBox('select cs.nome ||''-''|| cs.id_caixa_sis from caixa_sis cs where cs.tipo = ''CATEGORIA'' and cs.ativo = ''SIM'' order by cs.nome'));
     CampoGrupo.Items.AddStrings(unUtilitario.getComboBox('select cs.nome ||''-''|| cs.id_caixa_sis from caixa_sis cs where cs.tipo = ''GRUPO'' and cs.ativo = ''SIM'' order by cs.nome'));
     CampoSubgrupo.Items.AddStrings(unUtilitario.getComboBox('select cs.nome ||''-''|| cs.id_caixa_sis from caixa_sis cs where cs.tipo = ''SUBGRUPO'' and cs.ativo = ''SIM'' order by cs.nome'));

end;

procedure TCAD_Caixas_Item.setInformacao(caixa, id_imovel, id_contrato: String; id_caixa, id_pessoa, id_funcionario, baseCalculo: Integer);
Begin
     
     if (id_caixa <= 0) then
     begin
          unUtilitario.setMensagem('Erro ao buscar registro.'+#13+'Primeiro escolha um registro para servir de base.'+#13+'Esta janela será fechada.','erro');
          Close;
          exit;
     end;

     caixaInformado := Caixa;
     codCaixa := id_caixa;
     codPessoa := id_pessoa;
     codFuncionario := id_funcionario;
     codImovel := id_imovel;
     codCalculo := baseCalculo;
     codContrato := id_contrato;

     CampoParcela.Text := '0';
     CampoDataVenc.Text := DateToStr(Date());
     CampoValorBase.Text := '0,00';
     CampoDocumento.Text := '';
     CampoMulta.Text := '0,00';
     CampoMultaPorc.Text := '0,00';
     CampoJuros.Text := '0,00';
     CampoJurosPorc.Text := '0,00';
     CampoDesconto.Text := '0,00';
     CampoDescontoPorc.Text := '0,00';
     CampoValorFinal.Text := '0,00';
     CampoAnotacao.Lines.Clear;
end;

procedure TCAD_Caixas_Item.setCaixa(Caixa: String);
Begin

     if Caixa = 'ENTRADA' then
     begin
          CaixaLOCAL := 'ENTRADA';
          BtnCaixaEntrada.Flat := FALSE;
          BtnCaixaSaida.Flat := TRUE;
          BtnCaixaEntrada.Transparent := FALSE;
          BtnCaixaSaida.Transparent := TRUE;
          BtnCaixaEntrada.Font.Color := clGreen;
          BtnCaixaSaida.Font.Color := clBlack;
     end
     Else
     begin
          CaixaLOCAL := 'SAIDA';
          BtnCaixaEntrada.Flat := TRUE;
          BtnCaixaSaida.Flat := FALSE;
          BtnCaixaEntrada.Transparent := TRUE;
          BtnCaixaSaida.Transparent := FALSE;
          BtnCaixaEntrada.Font.Color := clBlack;
          BtnCaixaSaida.Font.Color := clBlue;
     end;

end;


end.
