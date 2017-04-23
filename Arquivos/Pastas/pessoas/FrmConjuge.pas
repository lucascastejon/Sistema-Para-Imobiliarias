unit FrmConjuge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmNoMatriz, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, STRUTILS;

type
  TCAD_CONJUGE = class(TCAD_NOMATRIZ)
    Panel1: TPanel;
    Label1: TLabel;
    txtBusca: TEdit;
    btnPesquisa: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    ZConjuge: TZQuery;
    ZConjugeID_PESSOA: TIntegerField;
    ZConjugeID_PESSOA_TIPO: TIntegerField;
    ZConjugeID_USUARIO: TIntegerField;
    ZConjugeID_OCUPACAO: TIntegerField;
    ZConjugePESSOA_FISICA: TStringField;
    ZConjugeNOME: TStringField;
    ZConjugeNOME_FANTASIA: TStringField;
    ZConjugeCPF_CNPJ: TStringField;
    ZConjugeRG_IE: TStringField;
    ZConjugeRG_EMISSAO: TDateField;
    ZConjugeRG_ORGAO: TStringField;
    ZConjugeIM: TStringField;
    ZConjugeSEXO: TStringField;
    ZConjugePAI: TStringField;
    ZConjugeMAE: TStringField;
    ZConjugeCONJUGE: TStringField;
    ZConjugeNACIONALIDADE: TStringField;
    ZConjugeESTADO_CIVIL: TStringField;
    ZConjugeEMPRESA: TStringField;
    ZConjugeEMPRESA_CARGO: TStringField;
    ZConjugeEMPRESA_RENDA: TFloatField;
    ZConjugeEMPRESA_TEMPO: TDateField;
    ZConjugeCONSULTA_SPC: TStringField;
    ZConjugeCONSULTA_CERASA: TStringField;
    ZConjugeCONSULTA_TELEFONE: TStringField;
    ZConjugeCONSULTA_OUTROS: TStringField;
    ZConjugeCONSULTA_DADOS: TMemoField;
    ZConjugeCREDITO: TFloatField;
    ZConjugeCREDITO_VAL: TDateField;
    ZConjugeCREDITO_VAL_ATIVO: TStringField;
    ZConjugeNOTA: TSmallintField;
    ZConjugeNASCIMENTO: TDateField;
    ZConjugeCOMISSAO: TFloatField;
    ZConjugeDESCONTO: TFloatField;
    ZConjugeFILHOS: TStringField;
    ZConjugeFOTO: TStringField;
    ZConjugeEMAIL: TStringField;
    ZConjugeMSN: TStringField;
    ZConjugeICQ: TStringField;
    ZConjugeYAHOO: TStringField;
    ZConjugeAIM: TStringField;
    ZConjugeMALADIRETA: TStringField;
    ZConjugeDATA: TDateTimeField;
    ZConjugeOBS: TStringField;
    ZConjugeATIVO: TStringField;
    ZConjugeALTERACAO_FUNC: TSmallintField;
    ZConjugeALTERACAO_DATA: TDateField;
    ZConjugeIMPRIMIR: TStringField;
    ZConjugePESSOA_RESPONSAVEL: TIntegerField;
    ZConjugeSENHA: TStringField;
    DsConjuge: TDataSource;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAD_CONJUGE: TCAD_CONJUGE;

implementation
uses FrmPrincipal, FrmPessoa, FrmDM_Cadastro;

{$R *.dfm}

procedure TCAD_CONJUGE.BitBtn1Click(Sender: TObject);
VAR PESSOA: STRING;
begin
  IF not ZCONJUGE.FieldByName('ID_PESSOA').IsNull THEN
    begin
      DM_Cadastro.Z_Pessoa.FieldByName('CONJUGE').AsInteger := ZCONJUGE.FieldByName('ID_PESSOA').AsInteger;

      PESSOA := zconjuge.FieldByName('ID_PESSOA').asstring + ' - ' + zconjuge.FieldByName('NOME').asSTRING;
      //Zconjuge.Edit;
      //zconjuge.FieldByName('CONJUGE').asinteger := DM_Cadastro.Z_Pessoa.FieldByName('ID_PESSOA').AsInteger;
      //zconjuge.post;
      //zconjuge.ApplyUpdates;
      //zconjuge.close;

      principal.DestroiForm(FormCriatura, FormCriador, PESSOA, 1);
      close;
    end
  else
    application.MessageBox('Selecione o Cônjuge!', 'Aviso Célula Digital', mb_ok);
end;

procedure TCAD_CONJUGE.btnPesquisaClick(Sender: TObject);
begin
  zconjuge.Close;
  zconjuge.Params[0].AsString :=  AnsiReplaceStr(txtBusca.text,'*','%');
  zconjuge.Open;

  If ZConjuge.RecordCount > 0 Then
    DBGRID1.SetFocus;
end;

procedure TCAD_CONJUGE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CAD_CONJUGE := NIL;
  ACTION := CAFREE;
end;

end.
