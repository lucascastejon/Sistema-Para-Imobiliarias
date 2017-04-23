unit FrmPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, DBCtrls, Mask, ZDataset, ZAbstractRODataset, ZAbstractDataset, Menus,
  ActnPopup, DateUtils;

type
  TCAD_Pessoa = class(TCAD_MATRIZ)
    Tab_Complemento: TTabSheet;
    Tab_Contato: TTabSheet;
    Tab_Obs: TTabSheet;
    Tab_InfAdicional: TTabSheet;
    ScrollBoxComplemento: TScrollBox;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    GroupBoxInformacao: TGroupBox;
    GroupBoxDadosFamilia: TGroupBox;
    GroupBoxTrabalho: TGroupBox;
    GroupBoxIdentificacao: TGroupBox;
    Panel3: TPanel;
    GroupBox6: TGroupBox;
    PanelEndereco: TPanel;
    GroupBox7: TGroupBox;
    PanelTelefone: TPanel;
    GroupBox8: TGroupBox;
    GroupBoxContatos: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    Label1: TLabel;
    Edit_Codigo: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    IMG_Foto: TImage;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    GroupBox14: TGroupBox;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    editConjuje: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    Label35: TLabel;
    DBEdit35: TDBEdit;
    Label36: TLabel;
    DBEdit36: TDBEdit;
    Label38: TLabel;
    DBEdit38: TDBEdit;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    Btn_Endereco_Excluir: TBitBtn;
    Btn_Endereco_Gravar: TBitBtn;
    Btn_Endereco_Cancelar: TBitBtn;
    Btn_Endereco_Novo: TBitBtn;
    Btn_Telefone_Excluir: TBitBtn;
    Btn_Telefone_Gravar: TBitBtn;
    Btn_Telefone_Cancelar: TBitBtn;
    Btn_Telefone_Novo: TBitBtn;
    Label31: TLabel;
    DBEdit31: TDBEdit;
    Label40: TLabel;
    DBEdit40: TDBEdit;
    DBCheckBox11: TDBCheckBox;
    Label41: TLabel;
    DBEdit41: TDBEdit;
    Label42: TLabel;
    DBEdit42: TDBEdit;
    Label43: TLabel;
    DBEdit43: TDBEdit;
    Label44: TLabel;
    DBEdit44: TDBEdit;
    Label45: TLabel;
    DBEdit45: TDBEdit;
    Label46: TLabel;
    DBEdit46: TDBEdit;
    Label47: TLabel;
    DBEdit47: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label48: TLabel;
    Label49: TLabel;
    DBEdit1: TDBEdit;
    Label50: TLabel;
    DBEdit48: TDBEdit;
    Label51: TLabel;
    DBEdit49: TDBEdit;
    Label52: TLabel;
    DBEdit50: TDBEdit;
    DBCheckBox12: TDBCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label53: TLabel;
    GroupBox17: TGroupBox;
    Memo_DadosConsulta: TDBMemo;
    DBCheckBox15: TDBCheckBox;
    GroupBox21: TGroupBox;
    EditSenha: TDBEdit;
    Label68: TLabel;
    btn_relatorios: TSpeedButton;
    lb_menor: TLabel;
    lb_maior: TLabel;
    DBText1: TDBText;
    lbConjuge: TLabel;
    Bevel2: TBevel;
    Valor_Tipo: TComboBox;
    PopupRelatorio: TPopupActionBar;
    Etiquetas1: TMenuItem;
    EndereoResidencial1: TMenuItem;
    Etiqueta1: TMenuItem;
    Simples1: TMenuItem;
    N1: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox20: TGroupBox;
    DBEdit37: TDBEdit;
    Label37: TLabel;
    DBEdit39: TDBEdit;
    Label39: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    GroupBox15: TGroupBox;
    DBEdit33: TDBEdit;
    Label33: TLabel;
    GroupBox16: TGroupBox;
    DBEdit34: TDBEdit;
    Label34: TLabel;
    GroupBox18: TGroupBox;
    GroupBox22: TGroupBox;
    GroupBox23: TGroupBox;
    EstrelaCheia: TImage;
    EstrelaVazia: TImage;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    labelEntradaQuitadas: TLabel;
    labelEntradaNaoQuitadas: TLabel;
    labelSaidaQuitadas: TLabel;
    labelSaidaNaoQuitadas: TLabel;
    memoEntrada: TListBox;
    memoSaida: TListBox;
    memoImovel: TListBox;
    memoPessoa: TListBox;
    memoPendencias: TListBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DSResponsavel: TDataSource;
    DBEdit7: TDBEdit;
    DBText2: TDBText;
    DBEdit13: TDBEdit;
    SpeedButton3: TSpeedButton;
    Textos: TMenuItem;
    ImpressodeTelefones1: TMenuItem;
    ImpressodeEndereos1: TMenuItem;
    DadosdeConsultaOutrasObservaes1: TMenuItem;
    FuncionrioResponsvel1: TMenuItem;
    DadosBancrios1: TMenuItem;
    radioConjugeSimples: TRadioButton;
    radioConjugeCompleto: TRadioButton;
    comboConjujeBusca: TComboBox;
    ObservaesdeConsultas1: TMenuItem;
    SCPC1: TMenuItem;
    Serasa1: TMenuItem;
    elefone1: TMenuItem;
    OutrasConsultas1: TMenuItem;
    Emails1: TMenuItem;
    Contratos_Ativos: TCheckBox;
    MenuGrid: TPopupActionBar;
    AdicionarRegistos1: TMenuItem;
    VerSeleo1: TMenuItem;
    LimparSeleo1: TMenuItem;
    Etiqueta30254x667PolifixENDEREO1: TMenuItem;
    InformaesGeraisdasPessoas1: TMenuItem;
    Tab_HistoricoVisita: TTabSheet;
    GroupBox2: TGroupBox;
    DBGrid8: TDBGrid;
    GroupBox3: TGroupBox;
    Label30: TLabel;
    DSPessoasInteressadas: TDataSource;
    ZqInteressados: TZQuery;
    Label57: TLabel;
    PainelRodape: TPanel;
    btnAvancarGrid: TBitBtn;
    BitBtn4: TBitBtn;
    btn_buscaPaginada: TCheckBox;
    procedure btn_buscaPaginadaClick(Sender: TObject);
    procedure btnAvancarGrid2Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Tab_HistoricoVisitaExit(Sender: TObject);
    procedure Tab_HistoricoVisitaShow(Sender: TObject);
    procedure InformaesGeraisdasPessoas1Click(Sender: TObject);
    procedure DBEdit49Exit(Sender: TObject);
    procedure Etiqueta30254x667PolifixENDEREO1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LimparSeleo1Click(Sender: TObject);
    procedure VerSeleo1Click(Sender: TObject);
    procedure AdicionarRegistos1Click(Sender: TObject);
    procedure memoPendenciasDblClick(Sender: TObject);
    procedure Etiqueta1Click(Sender: TObject);
    procedure Emails1Click(Sender: TObject);
    procedure OutrasConsultas1Click(Sender: TObject);
    procedure elefone1Click(Sender: TObject);
    procedure Serasa1Click(Sender: TObject);
    procedure SCPC1Click(Sender: TObject);
    procedure Btn_FecharClick(Sender: TObject);
    procedure comboConjujeBuscaExit(Sender: TObject);
    procedure comboConjujeBuscaDropDown(Sender: TObject);
    procedure radioConjugeCompletoClick(Sender: TObject);
    procedure radioConjugeSimplesClick(Sender: TObject);
    procedure DadosBancrios1Click(Sender: TObject);
    procedure FuncionrioResponsvel1Click(Sender: TObject);
    procedure DadosdeConsultaOutrasObservaes1Click(Sender: TObject);
    procedure ImpressodeEndereos1Click(Sender: TObject);
    procedure ImpressodeTelefones1Click(Sender: TObject);
    procedure DBEdit8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit13Change(Sender: TObject);
    procedure memoPessoaDblClick(Sender: TObject);
    procedure memoImovelDblClick(Sender: TObject);
    procedure memoSaidaDblClick(Sender: TObject);
    procedure memoEntradaDblClick(Sender: TObject);
    procedure Grid_BuscaDblClick(Sender: TObject);
    procedure EstrelaCheiaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EstrelaVaziaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBEdit49MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit1Change(Sender: TObject);
    procedure Simples1Click(Sender: TObject);
    procedure Btn_ImprimirClick(Sender: TObject);
    procedure EndereoResidencial1Click(Sender: TObject);
    procedure Grid_BuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditSenhaDblClick(Sender: TObject);
    procedure Tab_ComplementoShow(Sender: TObject);
    procedure CodigoPessoaResponsavelExit(Sender: TObject);
    procedure editConjujeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Tab_CadastroShow(Sender: TObject);
    procedure cClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit16MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit16Exit(Sender: TObject);
    procedure Tab_InfAdicionalShow(Sender: TObject);
    procedure Btn_Telefone_ExcluirClick(Sender: TObject);
    procedure Btn_Telefone_GravarClick(Sender: TObject);
    procedure Btn_Telefone_CancelarClick(Sender: TObject);
    procedure Btn_Telefone_NovoClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Btn_Endereco_ExcluirClick(Sender: TObject);
    procedure Btn_Endereco_GravarClick(Sender: TObject);
    procedure Btn_Endereco_CancelarClick(Sender: TObject);
    procedure Btn_Endereco_NovoClick(Sender: TObject);
    procedure Tab_ContatoShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Tab_InformacoesShow(Sender: TObject);
    procedure Btn_EsquerdaClick(Sender: TObject);
    procedure Btn_DireitaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Tab_ComplementoExit(Sender: TObject);
    //procedure rb2Click(Sender: TObject);
    //procedure rb1Click(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure Btn_RetornoClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
        procedure buscaIndividual(Codigo: Integer);
        procedure Pesquisar();
        procedure ajustarTelefonesBloqueia();
        procedure ajustarTelefonesLibera();
    { Public declarations }
  end;
  

implementation

uses FrmDM_Cadastro, FrmPrincipal, unCamposBusca, unImagem, unMsg,
  FrmLogradouro, FrmOcupacao, FrmTipoPessoa, FrmImovel, unValidacao, FrmDM_REL
  , FrmConjuge, unINI, unUtilitario, unWord, FrmDM_RELATORIOS,
  FrmCaixas, unLog, frmThread, FrmMensagem, unPaginacao;

var
  CAD_Pessoa: TCAD_Pessoa;
  NovoRegistro: Smallint;
  SelecaoPessoa : TStringList;
  conjuge: boolean;
  pagina: TPaginacao;

{$R *.dfm}

procedure TCAD_Pessoa.ajustarTelefonesBloqueia();
begin
     //Ajusta delefones para bloquear e liberar os campos
     DBEdit1.Enabled := False;
     DBEdit1.Color := cl3DLight;
     DBEdit49.Enabled := False;
     DBEdit49.Color := cl3DLight;
     DBEdit48.Enabled := False;
     DBLookupComboBox2.Enabled := False;
     DBEdit50.Enabled := False;
     DBCheckBox12.Enabled := False;
     Btn_Telefone_Gravar.Enabled := False;
     Btn_Telefone_Cancelar.Enabled := False;
     Btn_Telefone_Novo.Enabled := True;
end;

procedure TCAD_Pessoa.ajustarTelefonesLibera();
begin
     //Ajusta delefones para bloquear e liberar os campos
     DBEdit1.Enabled := True;
     DBEdit1.Color := clWindow;
     DBEdit1.SetFocus;
     DBEdit49.Enabled := True;
     DBEdit49.Color := clWindow;
     DBEdit48.Enabled := True;
     DBLookupComboBox2.Enabled := True;
     DBEdit50.Enabled := True;
     DBCheckBox12.Enabled := True;
     Btn_Telefone_Gravar.Enabled := True;
     Btn_Telefone_Cancelar.Enabled := True;
     Btn_Telefone_Novo.Enabled := False;
end;

procedure TCAD_Pessoa.FormCreate(Sender: TObject);
VAR
   varSql: TZQuery;
begin
  inherited;

  DS.DataSet := DM_Cadastro.Z_Pessoa;

  ZqBusca.Open;

  Data_Maior.Date := DATE;
  Data_Menor.Date := DATE;
  CONJUGE := TRUE; //Isso estava no OnShow e movi para cá.

  // Padrão de tela 1024X768
  Self.Height := 525;
  SELF.Width := 936;

  varSql := unUtilitario.getSelect('select distinct(tipo) from pessoa_contrato order by tipo');

  // Alimentando o dropdown
  Valor_Tipo.Items.Clear;
  Valor_Tipo.Items.Add('');
  Valor_Tipo.Items.Add('PROPRIETARIO');

  while not varSQL.eof do
  Begin
       Valor_Tipo.Items.Add(varSql.Fields[0].AsString);
       varSql.Next;
  end;

  SelecaoPessoa := TStringList.Create;
  Grid_Busca := unUtilitario.pegaGrid(Self.Name, Grid_Busca);

  pagina := TPaginacao.create();
  pagina.Mostrar := 30;
end;

procedure TCAD_Pessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if (DBEdit39.Focused AND (key = 13))  then
        Tab_Complemento.Show;

     if (DBEdit24.Focused AND (key = 13))  then
        Tab_Contato.Show;

     if (DBEdit36.Focused AND (key = 13))  then
        Tab_Obs.Show;


  inherited;

end;

procedure TCAD_Pessoa.FuncionrioResponsvel1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Carteira_Responsavel.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE CLIENTES COM A SUA CARTEIRA. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT P.id_pessoa, P.nome, CASE WHEN U.nome IS NULL THEN ''_________________________'' ELSE U.nome END AS FUNC FROM PESSOA P LEFT JOIN USUARIO U ON U.id_usuario = P.pessoa_responsavel WHERE P.id_pessoa IN ('+alinhaStringlist(SelecaoPessoa)+') ORDER BY U.nome, P.nome');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,#9+varSQL.FieldByName('NOME').AsString+' CÓD '+varSQL.FieldByName('ID_PESSOA').AsString+'  ('+varSQL.FieldByName('FUNC').AsString+')');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);
end;

procedure TCAD_Pessoa.Pesquisar();
Var quantidadeFiltros, i: integer;
    tamanhoString: Smallint;
    BUSCA_VALOR, troca, Where, consultaFinal: string;
begin

     //Trata completamente a string, removendo caracteres especiais e trocando palavras
    BUSCA_VALOR := tratarBusca(Valor.Text);

    if BUSCA_VALOR = 'false' then
       exit;

    //Ver qual é a quantidade de filtros usadas para refinar a busca
    quantidadeFiltros := contarPalavras(BUSCA_VALOR, 'AND') + contarPalavras(BUSCA_VALOR, 'OR');

    //ORDENAÇÃO DA GRID
    If Ordenacao = '' Then
       Ordenacao := 'P.nome'
    Else
    Begin
         If (POS('.',Ordenacao) = 0) AND (Ordenacao <> 'PT.nome') AND (Ordenacao <> 'O.nome') Then
            Ordenacao := 'P.'+Ordenacao;

         If Ordenacao = 'P.OCUPACAO' Then
            Ordenacao := 'O.nome';

         If Ordenacao = 'P.TIPO' Then
            Ordenacao := 'PT.nome';
    End;

    TamanhoString := Length(BUSCA_VALOR); //Verifica se foi alterado ou não

    //Trocar as palavras e elaborar a SQL
    for i := 0 to quantidadeFiltros do
    Begin
         If (Pos('P.ID_PESSOA BETWEEN',BUSCA_VALOR) = 0) AND ((Pos('CODIGO DE ',BUSCA_VALOR) <> 0) OR (Pos('CODIGO ENTRE ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' P.ID_PESSOA BETWEEN ';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'CODIGO DE ', troca,[rfReplaceAll]);
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'CODIGO ENTRE ', troca,[rfReplaceAll]);
         end
         else
         If (Pos('ID_PESSOA',BUSCA_VALOR) = 0) AND ((Pos('CODIGO ',BUSCA_VALOR) <> 0)) then
         Begin
              if varAte > 0 then
              Begin
                   BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'CODIGO', 'CODIGO DE',[rfReplaceAll]);
                   quantidadeFiltros := quantidadeFiltros + 1;
              end
              else
              Begin
                   troca := ' P.ID_PESSOA = ';
                   BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'CODIGO', troca,[rfReplaceAll]);
              end;
         end
         else
         If (Pos('P.PESSOA_RESPONSAVEL',BUSCA_VALOR) = 0) AND ((Pos('CARTEIRA ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' (res.NOME LIKE ''%''||trim(''';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'CARTEIRA', troca,[rfReplaceAll]);
              BUSCA_VALOR := descobrirPalavra(troca, BUSCA_VALOR);
         end
         else
         If (Pos('P.NACIONALIDADE',BUSCA_VALOR) = 0) AND ((Pos('TAG ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' (P.NACIONALIDADE LIKE ''%''||trim(''';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'TAG', troca,[rfReplaceAll]);
              BUSCA_VALOR := descobrirPalavra(troca, BUSCA_VALOR);
         end
         else
         If (Pos('ID_USUARIO',BUSCA_VALOR) = 0) AND ((Pos('USUARIO ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' P.ID_USUARIO = ';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'USUARIO', troca,[rfReplaceAll]);
         end
         else
         If (Pos('P.NOTA',BUSCA_VALOR) = 0) AND ((Pos('AVALIACAO ',BUSCA_VALOR) <> 0) or (Pos('NOTA ',BUSCA_VALOR) <> 0)) then
         Begin

              If (Pos('AVALIACAO DE ',BUSCA_VALOR) <> 0) OR (Pos('NOTA DE ',BUSCA_VALOR) <> 0) then
              Begin
                   troca := ' P.NOTA BETWEEN ';
                   BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'AVALIACAO DE ', troca,[rfReplaceAll]);
                   BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'NOTA DE ', troca,[rfReplaceAll]);
              end
              else
              begin
                   troca := ' P.NOTA = ';
                   BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'AVALIACAO', troca,[rfReplaceAll]);
                   BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'NOTA', troca,[rfReplaceAll]);
              end;
         end
         else
         If (Pos('p.id_pessoa in (select t.id_pessoa from telefone t where t.numero',BUSCA_VALOR) = 0) AND ((Pos('TELEFONE ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' p.id_pessoa in (select t.id_pessoa from telefone t where REPLACE(t.numero,''-'','''') like ''%''||trim(''';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, '-','',[rfReplaceAll]);
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'TELEFONE', troca,[rfReplaceAll]);
              BUSCA_VALOR := descobrirPalavra(troca, BUSCA_VALOR);
         end
         else
         If (Pos('TUDO',BUSCA_VALOR) <> 0) OR (Pos('TODOS',BUSCA_VALOR) <> 0) OR (Pos('TODO',BUSCA_VALOR) <> 0) then
         Begin
              BUSCA_VALOR := ' 1 = 1 '; //Só para passar sem parâmetros mesmo...
         end
         else
         If (Pos('(P.NOME LIKE',BUSCA_VALOR) = 0) AND ((Pos('NOME ',BUSCA_VALOR) <> 0) OR (Pos('NOMES ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' (P.NOME LIKE ''%''||trim(''';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'NOME ', troca,[rfReplaceAll]);
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'NOMES ', troca,[rfReplaceAll]);
              BUSCA_VALOR := descobrirPalavra(troca, BUSCA_VALOR);
         end
         else
         If (Pos('Soundex(P.NOME_FANTASIA) LIKE',BUSCA_VALOR) = 0) AND (Pos('FANTASIA ',BUSCA_VALOR) <> 0) then
         Begin
              troca := ' (Mv_Soundex(P.NOME_FANTASIA) LIKE ''%''||Mv_Soundex(''';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'FANTASIA ', troca,[rfReplaceAll]);
              BUSCA_VALOR := descobrirPalavra(troca, BUSCA_VALOR);
         end
         else
         If (Pos('CADASTRO',BUSCA_VALOR) <> 0) then
         Begin
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'CADASTRO',' P.DATA between '''+formataDataSQL(DateToStr(Data_Menor.Date))+''' AND '''+formataDataSQL(DateToStr(Data_Maior.Date))+''' ',[rfReplaceAll]);
         end
         else
         If (Pos('(extract(month from p.nascimento)',BUSCA_VALOR) = 0) AND ((Pos('ANIVERSÁRIO',BUSCA_VALOR) <> 0) or (Pos('ANIVERSÁRIOS',BUSCA_VALOR) <> 0) or (Pos('ANIVERSARIO',BUSCA_VALOR) <> 0) or (Pos('ANIVERSARIOS',BUSCA_VALOR) <> 0) or (Pos('ANIVERSARIANTES',BUSCA_VALOR) <> 0)) then
         Begin
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'ANIVERSÁRIOS',' extract(month from p.nascimento) between '+IntToStr(MonthOf(Data_Menor.Date))+' AND '+IntToStr(MonthOf(Data_Maior.Date)),[rfReplaceAll]);
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'ANIVERSARIOS',' extract(month from p.nascimento) between '+IntToStr(MonthOf(Data_Menor.Date))+' AND '+IntToStr(MonthOf(Data_Maior.Date)),[rfReplaceAll]);
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'ANIVERSÁRIO',' extract(month from p.nascimento) between '+IntToStr(MonthOf(Data_Menor.Date))+' AND '+IntToStr(MonthOf(Data_Maior.Date)),[rfReplaceAll]);
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'ANIVERSARIO',' extract(month from p.nascimento) between '+IntToStr(MonthOf(Data_Menor.Date))+' AND '+IntToStr(MonthOf(Data_Maior.Date)),[rfReplaceAll]);
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'ANIVERSARIANTES',' extract(month from p.nascimento) between '+IntToStr(MonthOf(Data_Menor.Date))+' AND '+IntToStr(MonthOf(Data_Maior.Date)),[rfReplaceAll]);
         end;
    end;

    if (Length(BUSCA_VALOR) = TamanhoString) and verificaStringInt(BUSCA_VALOR) then
    Begin
              BUSCA_VALOR := ' ( P.ID_PESSOA LIKE ''%'+BUSCA_VALOR+''' ) ';
    end;

    if (Length(BUSCA_VALOR) = TamanhoString) then
    Begin
              BUSCA_VALOR := ' ( '+
              ' Mv_Soundex(P.NOME) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or'+
              ' Mv_Soundex(P.NOME_FANTASIA) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or'+
              ' Mv_Soundex(P.EMPRESA) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or'+
              ' Mv_Soundex(P.PAI) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or'+
              ' P.OBS LIKE ''%'+BUSCA_VALOR+'%'' or'+
              ' Mv_Soundex(P.EMPRESA_CARGO) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or'+
              ' Mv_Soundex(P.EMPRESA) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or'+
              ' Mv_Soundex(P.AIM) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' or'+
              ' P.CPF_CNPJ LIKE ''%'+BUSCA_VALOR+'%'' or'+
              ' P.RG_IE LIKE ''%'+BUSCA_VALOR+'%'' or'+
              ' Mv_Soundex(P.MAE) LIKE ''%''||Mv_Soundex('''+BUSCA_VALOR+''')||''%'' ) ';
    end;

    //BUSCA DOS COMPONENTES VISUAIS
    If Valor_Ativo.Checked Then
       Where := BUSCA_VALOR +  ' AND (P.ativo = ''SIM'') '
    else
        Where := BUSCA_VALOR + ' AND (P.ativo = ''NAO'') ';

    if Length(Trim(Valor_Tipo.Text)) > 0 then
       if Valor_Tipo.Text = 'PROPRIETARIO' then
       Begin
              if (Pos('LOCAÇÃO',Valor.Text) <> 0) OR (Pos('LOCACAO',Valor.Text) <> 0) OR (Pos('ALUGUEL',Valor.Text) <> 0) then
                 Where := Where + ' AND (select count(pi.id_pessoa) from pessoa_imovel pi inner join contrato c on c.id_imovel = pi.id_imovel and c.tipo_contrato = ''LOCAÇÃO'' where pi.id_pessoa = p.id_pessoa and pi.status = '''+Valor_Tipo.Text+''') > 0 '
              ELSE
              if (Pos('VENDA',Valor.Text) <> 0) OR (Pos('COMPRA',Valor.Text) <> 0) then
                 Where := Where + ' AND (select count(pi.id_pessoa) from pessoa_imovel pi join contrato c on c.id_imovel = pi.id_imovel and c.tipo_contrato = ''VENDA'' where pi.id_pessoa = p.id_pessoa and pi.status = '''+Valor_Tipo.Text+''') > 0 '
              ELSE
                  Where := Where + ' AND (select count(pi.id_pessoa) from pessoa_imovel pi where pi.id_pessoa = p.id_pessoa and pi.status = '''+Valor_Tipo.Text+''') > 0 ';
       end
       else
       Begin
              if (Pos('LOCAÇÃO',Valor.Text) <> 0) OR (Pos('LOCACAO',Valor.Text) <> 0) OR (Pos('ALUGUEL',Valor.Text) <> 0) then
                 Where := Where + ' AND (select count(pc.id_pessoa) from pessoa_contrato pc inner join contrato c on c.id_contrato = pc.id_contrato and c.tipo_contrato = ''LOCAÇÃO'' where pC.id_pessoa = p.id_pessoa and pc.tipo = '''+Valor_Tipo.Text+''') > 0 '
              ELSE
              if (Pos('VENDA',Valor.Text) <> 0) OR (Pos('COMPRA',Valor.Text) <> 0) then
                 Where := Where + ' AND (select count(pc.id_pessoa) from pessoa_contrato pc inner join contrato c on c.id_contrato = pc.id_contrato and c.tipo_contrato = ''VENDA'' where pC.id_pessoa = p.id_pessoa and pc.tipo = '''+Valor_Tipo.Text+''') > 0 '
              ELSE
                  Where := Where + ' AND (select count(pc.id_pessoa) from pessoa_contrato pc inner join contrato c on c.id_contrato = pc.id_contrato where pC.id_pessoa = p.id_pessoa and pc.tipo = '''+Valor_Tipo.Text+''') > 0 ';
       end;

       if (Contratos_Ativos.Checked) then
       Begin
            if Valor_Tipo.Text = 'PROPRIETARIO' then
               Where := Where + ' AND (select count(pi.id_pessoa) from pessoa_imovel pi inner join contrato c on c.id_imovel = pi.id_imovel and c.tipo_contrato = ''LOCAÇÃO'' where pi.id_pessoa = p.id_pessoa and pi.status = '''+Valor_Tipo.Text+''' and c.ativo = ''SIM'') > 0 '
            else
                Where := Where + ' AND (select count(pc.id_pessoa) from pessoa_contrato pc inner join contrato c on c.id_contrato = pc.id_contrato where pC.id_pessoa = p.id_pessoa and c.ativo = ''SIM'') > 0 ';
       end;

    consultaFinal := 'select P.*, O.nome as ocupacao, PT.nome as tipo, (select first 1 t.numero from telefone t '+'where t.id_pessoa = p.id_pessoa) as xtelefone from PESSOA P left join usuario res on res.id_usuario = p.pessoa_responsavel left join ocupacao O on O.id_ocupacao = P.id_ocupacao inner join pessoa_tipo PT on PT.id_pessoa_tipo = P.id_pessoa_tipo where '+Where+' order by '+Ordenacao;

    if PainelRodape.Visible then
    Begin
         pagina.Mostrar := pagina.Mostrar;
         finalizaPesquisa(pagina.maisRegistros(consultaFinal));
    end
    else
    Begin
         finalizaPesquisa(consultaFinal);
    end;


    PRINCIPAL.setMensagem('Registros Encontrados: '+pagina.calcularTotal(consultaFinal,'from PESSOA P'));
end;

procedure TCAD_Pessoa.radioConjugeCompletoClick(Sender: TObject);
begin
  inherited;
  comboConjujeBusca.Enabled := True;
  editConjuje.Enabled := False;
  comboConjujeBusca.SetFocus;
  PRINCIPAL.setMensagem(comboConjujeBusca.Hint);
end;

procedure TCAD_Pessoa.radioConjugeSimplesClick(Sender: TObject);
begin
  inherited;
  comboConjujeBusca.Enabled := False;
  editConjuje.Enabled := True;
  editConjuje.SetFocus;
  PRINCIPAL.setMensagem(editConjuje.Hint);
end;

procedure TCAD_Pessoa.Btn_RetornoClick(Sender: TObject);
begin
// FIZ O RETORNO DAS INFORMACOES POR AQUI, POIS PELO PRINCIPAL
// ELE NAO CONSERVA A JANELA QUE ESTAVA EM ABERTO

{  IF FormCriador.Name = 'REL_FINANCEIRO' THEN
    begin

    end
  ELSE
}
Tab_ContatoShow(Sender);
inherited;

end;

procedure TCAD_Pessoa.DadosBancrios1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Dados_Bancarios.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE INFORMAÇÕES BANCÁRIAS. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT P.id_pessoa, P.nome, ICQ AS BANCO, AIM AS RESP FROM PESSOA P LEFT JOIN USUARIO U ON U.id_usuario = P.pessoa_responsavel WHERE P.id_pessoa IN ('+alinhaStringlist(SelecaoPessoa)+') ORDER BY U.nome, P.nome');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,#9+varSQL.FieldByName('NOME').AsString+' CÓD '+varSQL.FieldByName('ID_PESSOA').AsString+'  ('+varSQL.FieldByName('BANCO').AsString+' RESP. '+varSQL.FieldByName('RESP').AsString+')');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);
end;

procedure TCAD_Pessoa.DadosdeConsultaOutrasObservaes1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Observacoes.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE PESSOAS E SUAS OBSERVAÇÕES. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT ID_PESSOA, NOME, CONSULTA_DADOS FROM PESSOA WHERE ID_PESSOA IN ('+alinhaStringlist(SelecaoPessoa)+') ORDER BY NOME');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,'=> '+varSQL.FieldByName('NOME').AsString+' CÓD '+varSQL.FieldByName('ID_PESSOA').AsString);

          Writeln(Arquivo,#9+TRIM(varSQL.FieldByName('CONSULTA_DADOS').AsString));

          Writeln(Arquivo,' ');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);

end;

procedure TCAD_Pessoa.DBCheckBox1Click(Sender: TObject);
begin
  inherited;

  If DBCheckBox1.Checked Then
     DBCheckBox1.Caption := 'Pessoa Física'
  Else
     DBCheckBox1.Caption := 'Pessoa Jurídica';

  if DBCheckBox1.State = cbChecked then
    begin
      DBCheckBox3.Enabled := true;
      dbcheckbox2.Enabled := true;
      DBRadioGroup1.Enabled := true;
    end
  else
    begin
      DBCheckBox3.Enabled := false;
      dbcheckbox2.Enabled := false;
      DBRadioGroup1.Enabled := false;
    end;
end;

procedure TCAD_Pessoa.DBCheckBox2Click(Sender: TObject);
begin
  inherited;
  If DBCheckBox2.Checked Then
     DBCheckBox2.Caption := 'Sexo Masculino'
  Else
     DBCheckBox2.Caption := 'Sexo Feminino';
end;

procedure TCAD_Pessoa.SCPC1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Obs_Consultas_SCPC.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE PESSOAS E SUA CONSULTA AO SCPC. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT ID_PESSOA, NOME FROM PESSOA WHERE CONSULTA_SPC = ''SIM'' AND ATIVO <> ''XXX'' ORDER BY NOME');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,'=> CÓD '+varSQL.FieldByName('ID_PESSOA').AsString+#9+varSQL.FieldByName('NOME').AsString);
          //Writeln(Arquivo,' ');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);

end;

procedure TCAD_Pessoa.Serasa1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Obs_Consultas_SCPC.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE PESSOAS E SUA CONSULTA AO SERASA. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT ID_PESSOA, NOME FROM PESSOA WHERE CONSULTA_CERASA = ''SIM'' AND ATIVO <> ''XXX'' ORDER BY NOME');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,'=> CÓD '+varSQL.FieldByName('ID_PESSOA').AsString+#9+varSQL.FieldByName('NOME').AsString);
          //Writeln(Arquivo,' ');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);

end;

procedure TCAD_Pessoa.Simples1Click(Sender: TObject);
begin
     if (NOT DS.DataSet.Active) Then
        Exit;

     DM_RELATORIOS.SQL1.Close;
     DM_RELATORIOS.SQL1.SQL.Clear;

     if SelecaoPessoa.Count > 0 then
     Begin

         DM_RELATORIOS.SQL1.SQL.text := 'SELECT p.nome, (select first 1 l.tipo ||'' ''||l.nome||'', Nº''||e.numero||'', ''||b.nome||'' - ''||c.nome from endereco e '+
         ' left join logradouro l on l.id_logradouro = e.id_logradouro '+
         ' left join cidade c on c.id_cidade = l.id_cidade '+
         ' left join bairro b on b.id_bairro = l.id_bairro '+
         ' where e.id_endereco_tipo = 1  and e.id_pessoa = p.id_pessoa '+
         ' ) as endereco, (select first 1 t.ddd||''-''|| t.numero from telefone t where t.id_pessoa = p.id_pessoa and t.id_endereco_tipo = 1) as telefone '+
         ' from pessoa p where p.id_pessoa in ('+ alinhaStringlist(SelecaoPessoa) +') order by p.nome';
     end
     else
     Begin
         DM_RELATORIOS.SQL1.SQL.text := 'SELECT p.nome, (select first 1 l.tipo ||'' ''||l.nome||'', Nº''||e.numero||'', ''||b.nome||'' - ''||c.nome from endereco e '+
         ' left join logradouro l on l.id_logradouro = e.id_logradouro '+
         ' left join cidade c on c.id_cidade = l.id_cidade '+
         ' left join bairro b on b.id_bairro = l.id_bairro '+
         ' where e.id_endereco_tipo = 1  and e.id_pessoa = p.id_pessoa '+
         ' ) as endereco, (select first 1 t.ddd||''-''|| t.numero from telefone t where t.id_pessoa = p.id_pessoa and t.id_endereco_tipo = 1) as telefone '+
         ' from pessoa p where p.id_pessoa '+ descobreIDSelect((DS.DataSet as TZQuery) , 'ID_PESSOA');
     end;

     DM_RELATORIOS.DS1.DataSet := DM_RELATORIOS.SQL1;

     DM_RELATORIOS.Rave.SetParam('varPeriodo',InputBox('Anotação: ','Escreva uma anotação para ser colocada no relatório.',''));

     DM_RELATORIOS.Rave.Close;
     DM_RELATORIOS.Rave.ProjectFile := ExtractFilePath(ParamStr(0))+'REL\RV_15_PESSOA_SIMPLES.rav';
     principal.setRelatorio(DM_RELATORIOS.Rave);
     DM_RELATORIOS.Rave.Open;
     DM_RELATORIOS.Rave.Execute;

end;

procedure TCAD_Pessoa.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  PRINCIPAL.setMensagem('Busque uma imagem para ser atribuída a este registro.');
  DM_Cadastro.Z_Pessoa.Edit;
       Try
          DM_Cadastro.Z_PessoaFOTO.Value := unImagem.setImagem('P',IntToStr(DM_Cadastro.Z_PessoaID_PESSOA.Value));

          unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);
       Except
        unMsg.ERRO(19);
       End;

end;

procedure TCAD_Pessoa.SpeedButton3Click(Sender: TObject);
Var varSQL: TZQuery;
begin
  inherited;
  if unUtilitario.setMensagem('Deseja desmarcar todos os registros?'+#13+'Esta ação desmarca a opção "MARCAR REGISTRO" de todos as pessoas.'+#13+'(Pode demorar alguns segundos...)','confirma') = IDYES then
  Begin
       varSQL := unUtilitario.getSQL('UPDATE PESSOA SET IMPRIMIR = ''NAO'' WHERE ATIVO <> ''XXX''');
       varSQL.ExecSQL;

       setLogSQL('TODOS', 'ALTERAÇÃO', Self.Caption, 'UPDATE PESSOA SET IMPRIMIR = ''NAO'' WHERE ATIVO <> ''XXX''');
       FreeAndNil(varSQL);
       DS.DataSet.Refresh;
       unUtilitario.setMensagem('Registros desmarcados com sucesso!','informa');
  end;
  
end;

procedure TCAD_Pessoa.SpeedButton3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  PRINCIPAL.setMensagem('Use este campo para limpar os registros marcados no sistema... (Esta ação é global para todas as máquinas)');
end;

procedure TCAD_Pessoa.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  If MessageDlg('Deseja excluir a foto?', mtConfirmation, [mbYes, mbNo],0) = mryes Then
  Begin
        If (DM_Cadastro.Z_PessoaFOTO.Value <> 'X_Foto.jpg') Then
        Begin
             DM_Cadastro.Z_Pessoa.Edit;
             DM_Cadastro.Z_PessoaFOTO.Value := unImagem.deletaImagem(DM_Cadastro.Z_PessoaFOTO.Value);
             Try
                PRINCIPAL.setMensagem('Procurando Imagens...');
                unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);
             except
                   DM_Cadastro.Z_PessoaFOTO.Value :=  'X_Foto.jpg';
             End;
       End;
  End;
end;

procedure TCAD_Pessoa.Btn_NovoClick(Sender: TObject);
begin
     inherited;

  If DM_Cadastro.Z_Curinga_02.Active Then
     DM_Cadastro.Z_Curinga_02.Close;

     DM_Cadastro.ZqAux.SQL.Clear;
     DM_Cadastro.ZqAux.SQL.Add('select ID from SP_GEN_PESSOA_ID');
     DM_Cadastro.ZqAux.Open;

     DM_Cadastro.Z_PessoaID_PESSOA.Value := DM_Cadastro.ZqAux.FieldByName('ID').Value;
     DM_Cadastro.Z_PessoaSENHA.Value := DM_Cadastro.ZqAux.FieldByName('ID').Value;

     DM_Cadastro.ZqAux.Close;

     DM_Cadastro.Z_PessoaATIVO.Value := 'SIM';
     DM_Cadastro.Z_PessoaFILHOS.Value := 'NAO';
     DM_Cadastro.Z_PessoaPESSOA_FISICA.Value := 'SIM';
     DM_Cadastro.Z_PessoaCONSULTA_SPC.Value := 'NAO';
     DM_Cadastro.Z_PessoaCONSULTA_CERASA.Value := 'NAO';
     DM_Cadastro.Z_PessoaCONSULTA_TELEFONE.Value := 'NAO';
     DM_Cadastro.Z_PessoaCONSULTA_OUTROS.Value := 'NAO';
     DM_Cadastro.Z_PessoaCREDITO_VAL_ATIVO.Value := 'NAO';
     DM_Cadastro.Z_PessoaMALADIRETA.Value := 'SIM';
     DM_Cadastro.Z_PessoaSEXO.Value := 'MAS';
     DM_Cadastro.Z_PessoaNOTA.AsInteger := 0;
     DM_Cadastro.Z_PessoaESTADO_CIVIL.Value := 'SOLTEIRO';
     DM_Cadastro.Z_PessoaFOTO.Value := 'X_Foto.jpg';
     DM_Cadastro.Z_PessoaIMPRIMIR.Value := 'NAO';
     //DM_Cadastro.Z_PessoaNACIONALIDADE.Value := 'BRASILEIRA';
     dm_cadastro.Z_PessoaID_PESSOA_TIPO.AsInteger := 1;

     EstrelaCheia.Width := 0;

     NovoRegistro := 1;

     Label16.Font.Color := clWindowText;

     DBEdit5.SetFocus;
       Try
       PRINCIPAL.setMensagem('Procurando Imagens...');
       If DM_Cadastro.Z_PessoaFOTO.Value <> '' Then
       unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);
       Except
        unMsg.ERRO(19);
       End;
end;

procedure TCAD_Pessoa.Btn_GravarClick(Sender: TObject);
Var dia: Smallint;
    varSQL: TZQuery;
begin

  IF (DBEDIT3.TEXT = '{NÃO ENCONTRADO}') THEN
    begin
      MessageDlg('Verique a Ocupação da Pessoa!', mtError, [mbOK], 0);
      dbedit2.SetFocus;
      exit;
    end;

     DM_Cadastro.Z_Pessoa.Edit;

     if not verificaAspasSimples(DM_Cadastro.Z_Pessoa) then
        exit;   

     If DM_Cadastro.Z_PessoaFOTO.Value = '' Then
        DM_Cadastro.Z_PessoaFOTO.Value := 'X_Foto.jpg';

     If NovoRegistro = 1 Then
     Begin
          DM_Cadastro.Z_PessoaID_USUARIO.AsString := getUser('CODIGO_USUARIO');
          DM_Cadastro.Z_PessoaDATA.AsDateTime := Date;

          {Thread := 'TWITTER';
          ThreadExporta := ThreadBanco.Create(True);
          dia := DayOf(Date);

          if (dia <= 10) then
             if DM_Cadastro.Z_PessoaSEXO.AsString = 'MAS' Then
                ThreadExporta.msg := 'Seja Bem-Vindo '+DM_Cadastro.Z_PessoaNOME.AsString+'! A '+getConf('EMPRESA_FANTASIA')+' agradece a sua visita! #ÓtimaVisita'
             Else
                 ThreadExporta.msg := 'Seja Bem-Vinda '+DM_Cadastro.Z_PessoaNOME.AsString+'! A '+getConf('EMPRESA_FANTASIA')+' agradece a sua visita! #ÓtimaVisita';

          if (dia > 10) and (dia <= 20) then
             if DM_Cadastro.Z_PessoaSEXO.AsString = 'MAS' Then
                ThreadExporta.msg := 'Acabamos de receber o '+DM_Cadastro.Z_PessoaNOME.AsString+'! Seja bem-vindo! #'+StringReplace(getConf('EMPRESA_FANTASIA'),' ','', [rfReplaceAll])
             Else
                 ThreadExporta.msg := 'Acabamos de receber a '+DM_Cadastro.Z_PessoaNOME.AsString+'! Seja bem-vinda! #'+StringReplace(getConf('EMPRESA_FANTASIA'),' ','', [rfReplaceAll]);

          if (dia > 20) and (dia <= 30) then
             if DM_Cadastro.Z_PessoaSEXO.AsString = 'MAS' Then
                ThreadExporta.msg := 'O senhor '+DM_Cadastro.Z_PessoaNOME.AsString+' agora e nosso cliente! Seja bem-vindo! Esperamos que goste do nosso atendimento! #'+StringReplace(getConf('EMPRESA_FANTASIA'),' ','', [rfReplaceAll])
             Else
                 ThreadExporta.msg := 'A senhora '+DM_Cadastro.Z_PessoaNOME.AsString+' agora e nossa cliente! Seja bem-vinda! Esperamos que goste do nosso atendimento! #'+StringReplace(getConf('EMPRESA_FANTASIA'),' ','', [rfReplaceAll]);

          ThreadExporta.Resume;
          }
     End;

     DM_Cadastro.Z_PessoaALTERACAO_FUNC.AsString := getUser('CODIGO_USUARIO');
     DM_Cadastro.Z_PessoaALTERACAO_DATA.AsDateTime := Date;

     try
        if radioConjugeCompleto.Checked then
           if Length(Trim(comboConjujeBusca.Text)) > 0 then
           Begin
              if IDCampo(comboConjujeBusca.Text) > 0 then
              Begin
                   varSQL := unUtilitario.getSQL('update pessoa set conjuge = '+Edit_Codigo.Text+' where id_pessoa = '+ IntToStr(unUtilitario.IDCampo(comboConjujeBusca.Text)));
              end;
           end
           else
           Begin
                DM_Cadastro.Z_PessoaCONJUGE.AsString := '';
                varSQL := unUtilitario.getSQL('update pessoa set conjuge = null where conjuge = '''+Edit_Codigo.Text+'''');
           end;

     except
           PRINCIPAL.setMensagem('Erro ao vincular os conjuges!');
     end;


     if verificaDuplicidade('PESSOA', 'ID_PESSOA', DS.DataSet.FieldByName('ID_PESSOA').AsString, 'NOME LIKE '''+DS.DataSet.FieldByName('NOME').AsString+'''') then
     Begin
          inherited;
          NovoRegistro := 0;
     end;

end;

procedure TCAD_Pessoa.AdicionarRegistos1Click(Sender: TObject);
var i: integer;
begin
     with Grid_Busca.DataSource.DataSet do
     begin
          for i := 0 to Grid_Busca.SelectedRows.Count-1 do
          begin
               GotoBookmark(Pointer(Grid_Busca.SelectedRows.Items[i]));
               SelecaoPessoa.Add(DM_CADASTRO.Z_Pessoa.FieldByName('ID_PESSOA').AsString);
          end;
     end;

     PRINCIPAL.setMensagem(IntToStr(Grid_Busca.SelectedRows.Count) + ' Registro(s) Adicionado(s)!' + #13 + IntToStr(SelecaoPessoa.Count) + ' Registro(s) na lista até o momento.');
     Grid_Busca.SelectedRows.Clear;
end;

procedure TCAD_Pessoa.BitBtn1Click(Sender: TObject);
begin
  PRINCIPAL.CriarForm(TCAD_Ocupacao, self, '1');
end;

procedure TCAD_Pessoa.btnAvancarGrid2Click(Sender: TObject);
begin
      DM_Cadastro.Z_Pessoa.Close;
      DM_Cadastro.Z_Pessoa.SQL.Text := pagina.maisRegistros(DM_Cadastro.Z_Pessoa.SQL.Text);
      DM_Cadastro.Z_Pessoa.Open;
end;

procedure TCAD_Pessoa.Btn_DireitaClick(Sender: TObject);
begin
  inherited;
  Try
    PRINCIPAL.setMensagem('Procurando Imagens...');
  If DM_Cadastro.Z_PessoaFOTO.Value <> '' Then
    unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);

  Except
        unMsg.ERRO(19);
  End;

  Tab_Informacoes.Show;
  Tab_InformacoesShow(Sender);

end;

procedure TCAD_Pessoa.Btn_EsquerdaClick(Sender: TObject);
begin
  inherited;
  Try
  PRINCIPAL.setMensagem('Procurando Imagens...');
  If DM_Cadastro.Z_PessoaFOTO.Value <> '' Then
  unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);
  Except
        unMsg.ERRO(19);
  End;

  Tab_Informacoes.Show;
  Tab_InformacoesShow(Sender);

end;

procedure TCAD_Pessoa.Tab_InformacoesShow(Sender: TObject);
begin
  inherited;
  Try

  If DM_Cadastro.Z_PessoaFOTO.Value <> '' Then
    unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);
  Except
        unMsg.ERRO(19);
  End;


  if DM_CADASTRO.Z_PessoaNOTA.AsInteger > 200 then
  Begin
       EstrelaCheia.Width := 200;
       DM_Cadastro.Z_PessoaNOTA.AsInteger := 200;
  end;

  if DM_Cadastro.Z_PessoaNOTA.IsNull then
     EstrelaCheia.Width := 0
  else
      EstrelaCheia.Width := DM_Cadastro.Z_PessoaNOTA.AsInteger;

  EditSenha.PasswordChar := #149;

end;



procedure TCAD_Pessoa.VerSeleo1Click(Sender: TObject);
var i: integer;
    Escolha: String;
begin

     For i := 0 to SelecaoPessoa.Count - 1 Do
         Escolha := Escolha + #13 + SelecaoPessoa.Strings[i];

     ShowMessage('REGISTROS SELECIONADOS: '+ #13 + Escolha);

end;

procedure TCAD_Pessoa.BitBtn3Click(Sender: TObject);
var tipoConsulta: String;
begin
  inherited;
       tipoConsulta := InputBox('Selecione o site para consulta: ',
                           '0 - Associação Comercial'+#13+
                           '1 - E-Proc'+#13+
                           '2 - Receita Federal'+#13+
                           '3 - Serasa Experian'+#13+
                           '4 - CCFácil'+#13+
                           '5 - Check Check'+#13+#13+
                           'Caso queira indicar mais opções, entre em contato conosco.','0');

       try
          if StrToInt(tipoConsulta) < 0 then
             Exit

       except
             ShowMessage('Entre somente com números.');
             exit;
       end;

       if tipoConsulta = '0' then
       begin

            if getTela('SITE_ASSOCIACAOCOMERCIAL') = 'NULO' Then
            Begin
                 setMensagem('Não foi identificada a configuração do site da ASSOCIAÇÃO COMERCIAL LOCAL.'+#13+'O sistema irá configurar agora.', 'informa');
                 tipoConsulta := InputBox('CONFIGURANDO LINK da ASSOCIAÇÃO COMERCIAL DA CIDADE','Entre com o site da Associação Comercial de sua cidade.'+#13+'Obs: com o http://', 'http://www.acifranca.com.br/');

                 if setMensagem('Você confirma esta configuração? (DEVE CONTER O http://)'+#13+'Assocação Comercial = '+tipoConsulta,'confirma') = IDYES then
                    setTela('SITE_ASSOCIACAOCOMERCIAL',tipoConsulta)
                 else
                     exit;
            end
            else
            Begin
                 PRINCIPAL.SITE(getTela('SITE_ASSOCIACAOCOMERCIAL'));
                 Exit;
            end;
       end;

       if tipoConsulta = '1' then
       begin
            PRINCIPAL.SITE('http://www.eproc.com.br/');
            Exit;
       end;

       if tipoConsulta = '2' then
       begin
            PRINCIPAL.SITE('http://www.receita.fazenda.gov.br/aplicacoes/ATCTA/cpf/ConsultaPublica.asp');
            Exit;
       end;

       if tipoConsulta = '3' then
       begin
            PRINCIPAL.SITE('http://www.serasaexperian.com.br/');
            Exit;
       end;

       if tipoConsulta = '4' then
       begin
            PRINCIPAL.SITE('http://www.ccfacil.com.br/');
            Exit;
       end;

       if tipoConsulta = '5' then
       begin
            PRINCIPAL.SITE('http://www.checkcheck.com.br/');
            Exit;
       end;

       ShowMessage('Escolha uma opção válida.');
end;

procedure TCAD_Pessoa.Tab_ContatoShow(Sender: TObject);
begin
  inherited;
  If Edit_Codigo.Text <> '' Then
  Begin
       unCamposBusca.BUSCA(DM_Cadastro.Z_Endereco,'select E.*, ET.tipo as ENDTIPO, L.cep AS CEP, L.tipo as TIPORUA, L.nome as RUA, B.nome as BAIRRO, C.nome as CIDADE, U.sigla as ESTADO from endereco E left join endereco_tipo ET on ET.id_endereco_tipo = E.id_endereco_tipo left join logradouro L'+' on L.id_logradouro = E.id_logradouro left join bairro B on B.id_bairro = L.id_bairro left join Cidade C on C.id_cidade = L.id_cidade left join uf U on U.id_sigla = L.id_sigla where E.id_pessoa = '+Edit_Codigo.Text);
       unCamposBusca.BUSCA(DM_Cadastro.Z_Telefone,'select T.*, ET.tipo from telefone T left join endereco_tipo ET on ET.id_endereco_tipo = T.id_endereco_tipo where T.id_pessoa = '+Edit_Codigo.Text);
       unCamposBusca.BUSCA(DM_Cadastro.Z_Endereco_Tipo,'select ID_ENDERECO_TIPO, TIPO, TELEFONE, ENDERECO from endereco_tipo');
  End;

  ajustarTelefonesBloqueia();

end;

procedure TCAD_Pessoa.Tab_HistoricoVisitaExit(Sender: TObject);
begin
  zqinteressados.close;
end;

procedure TCAD_Pessoa.Tab_HistoricoVisitaShow(Sender: TObject);
begin
  if not dm_cadastro.Z_PessoaID_PESSOA.IsNull then
    begin
         zqinteressados.Close;
         if not dm_cadastro.Z_PessoaCPF_CNPJ.IsNull then
            zqinteressados.ParamByName('pcpf').AsString := '%'+dm_cadastro.Z_PessoaCPF_CNPJ.AsString+'%'
         else
             zqinteressados.ParamByName('pcpf').AsString := '';

         if not dm_cadastro.Z_PessoaRG_IE.IsNull then
            zqinteressados.ParamByName('prg').AsString := '%'+dm_cadastro.Z_PessoaRG_IE.AsString+'%'
         else
             zqinteressados.ParamByName('prg').AsString := '';

         zqinteressados.Open;

         GroupBox13.Caption := 'Visitas (Qtde: '+ IntToStr(zqinteressados.RecordCount)+' )';
    end;
end;

procedure TCAD_Pessoa.Btn_Endereco_NovoClick(Sender: TObject);
begin
  inherited;

       If NOT DM_Cadastro.Z_Endereco.Active Then
        DM_Cadastro.Z_Endereco.Open;

       DM_Cadastro.Z_Endereco.Append;

       Btn_Endereco_Novo.Enabled := False;

       DM_Cadastro.Z_EnderecoMALADIRETA.Value := 'SIM';
       DM_Cadastro.Z_EnderecoID_PESSOA.Value := DM_Cadastro.Z_PessoaID_PESSOA.Value;

       unCamposBusca.BUSCA(DM_Cadastro.Z_Endereco_Tipo,'select ID_ENDERECO_TIPO, TIPO, TELEFONE, ENDERECO from endereco_tipo where endereco = ''SIM''');

       If DM_Cadastro.Z_Curinga_02.Active Then
          DM_Cadastro.Z_Curinga_02.Close;

       DM_Cadastro.Z_Curinga_02.SQL.Clear;
       DM_Cadastro.Z_Curinga_02.SQL.Add('select distinct(tipo) from logradouro order by tipo');

       PRINCIPAL.CriarForm(TCAD_Logradouro, self, '1');

end;

procedure TCAD_Pessoa.Btn_Endereco_CancelarClick(Sender: TObject);
begin
  inherited;
   If DM_Cadastro.Z_Endereco.Active Then
        Begin
             DM_Cadastro.Z_Endereco.Cancel;
             DM_Cadastro.Z_Endereco.CancelUpdates;
             Btn_Endereco_Novo.Enabled := True;
             DM_Cadastro.Z_Endereco_Tipo.Close;
        End;
end;

procedure TCAD_Pessoa.Btn_Endereco_GravarClick(Sender: TObject);
begin
  inherited;
    If NovoRegistro = 1 Then
  Begin
      If MessageDlg('Será necessário gravar as alterações'+#13+'realizadas até agora no registro principal, OK?'+#13+'Verifique os campos obrigatórios antes de prosseguir.', mtConfirmation, [mbYes, mbNo],0) = mrYes Then
      Begin
           Btn_GravarClick(Sender);
      End
      Else
      Begin
           ShowMessage('O registro completo não foi salvo.');
      End;

  End;

  If NovoRegistro = 0 Then
  Begin
       If DM_Cadastro.Z_Endereco.Active Then
          Begin
               Try
                  DM_Cadastro.Z_Endereco.ApplyUpdates;
                  setLog(DM_Cadastro.Z_Endereco.Fields[0].AsString, 'ALTERAÇÃO', Self.Caption+': ENDEREÇO', DM_Cadastro.Z_Endereco);

                  unMsg.INFORMA(1);
                  Btn_Endereco_Novo.Enabled := True;
                  DM_Cadastro.Z_Endereco_Tipo.Close;
               Except
                     unMsg.ERRO(18);
               End;
          End
          Else
              unMsg.ERRO(13);

          DM_Cadastro.Z_Endereco.Edit;
  End;

  Tab_ContatoShow(Sender);

end;

procedure TCAD_Pessoa.Btn_Endereco_ExcluirClick(Sender: TObject);
begin
  inherited;
     If MessageDlg('Deseja excluir este endereço?',mtConfirmation, [mbYes,mbNo], 0) = mrYes Then
     Begin
           If DM_Cadastro.Z_Endereco.Active Then
              Begin
                   Try
                      setLog(DM_Cadastro.Z_Endereco.Fields[0].AsString, 'EXCLUSÃO', Self.Caption+': ENDEREÇO', DM_Cadastro.Z_Endereco);
                      DM_Cadastro.Z_Endereco.Delete;
                      DM_Cadastro.Z_Endereco.ApplyUpdates;
                      unMsg.INFORMA(2);
                      DM_Cadastro.Z_Endereco_Tipo.Close;
                   Except
                         unMsg.ERRO(12);
                   End;
              End
              Else
                  unMsg.ERRO(13);
     End;

     DM_Cadastro.Z_Endereco.Edit;
end;

procedure TCAD_Pessoa.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  unCamposBusca.BUSCA(DM_Cadastro.Z_Endereco_Tipo,'select *  from endereco_tipo where endereco = ''SIM''');
end;

procedure TCAD_Pessoa.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  ajustarTelefonesLibera();
end;

procedure TCAD_Pessoa.DBGrid8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var Escolha, idadeImovel: String;
  varSQL: TZQuery;
  montante: Double;
  lista: TStringList;
  I, x: Integer;
begin

     if Length(Edit_Codigo.Text) = 0 then
     Begin
          setMensagem('Selecione uma Pessoa.','erro');
          exit;
     end;

     lista := TStringList.Create;

     Escolha := '';

  If (Key = VK_MENU) Then
  Begin
     Escolha := InputBox('MENU DE OPERAÇÕES:','1 - APAGAR Registro;'+#13+'2 - IMPRIMIR Relatos Simples;'+#13+'3 - ALTERAR Comentário.','');

     if NOT verificaStringInt(escolha) Then
     Begin
          unUtilitario.setMensagem('Entre somente com números!','erro');
          Exit;                        
     End;

     If (Escolha = '1') Then
     Begin
          If unUtilitario.setMensagem('Deseja EXCLUIR o registro selecionado?', 'confirma') = IDYES Then
          Begin
               if DSPessoasInteressadas.DataSet.RecordCount > 0 then
               begin
                    varSQL := unUtilitario.getSQL('update log set ativo = ''XXX'' where id_log = '+DSPessoasInteressadas.DataSet.FieldByName('id_pessoa_imovel').AsString );
                    varSQL.ApplyUpdates;
                    DSPessoasInteressadas.DataSet.Refresh;
               end;
          End;
              Exit;
     End;

     If (Escolha = '2') Then
     Begin
          if DSPessoasInteressadas.DataSet.RecordCount > 0 then
          begin
               varSQL := unUtilitario.getSelect('select ''(''||it.nome||'') ''||l.nome||'' ''||COALESCE(i.complemento, '''')||'', ''||i.NUMERO||'', ''||b.nome||'' de ''||i.DORMITORIOS||'' quartos em ''||c.nome||'' (R$''||I.valor_aluquel||'')-''||i.ID_IMOVEL as IMOVEL, pi.componente as DEPOIMENTO, pi.data as data '+
                      ' from log pi '+
                      ' left join imovel i on i.id_imovel = pi.id_conta '+
                      ' left join logradouro L ON L.id_logradouro = I.id_logradouro '+
                      ' left JOIN cidade C ON C.id_cidade = L.id_cidade '+
                      ' left JOIN bairro B ON B.id_bairro = L.id_bairro '+
                      ' left join imovel_tipo it on it.id_imovel_tipo = i.id_imovel_tipo '+
                      ' where pi.acao = ''CHV'' and pi.ativo = ''SIM'' and (pi.obs like ''%'+DS.DataSet.FieldByName('CPF_CNPJ').AsString+'%'' or pi.obs like ''%'+DS.DataSet.FieldByName('RG_IE').AsString+'%'') order by pi.data desc ');

               setWord(varSQL,'RELATÓRIO SIMPLIFICADO DE VISITAÇÃO DE '+DS.DataSet.FieldByName('NOME').AsString);

          end;
     End;

     If (Escolha = '3') Then
     Begin
          If unUtilitario.setMensagem('Deseja ALTERAR o campo OBS desde registro?', 'confirma') = IDYES Then
          Begin
               if DSPessoasInteressadas.DataSet.RecordCount > 0 then
               begin
                    varSQL := unUtilitario.getSQL('update log set COMPONENTE = '''+Trim(InputBox('Campo Observação do anúncio.','Entre com a nova informação:',DSPessoasInteressadas.DataSet.FieldByName('NOME').AsString))+''' where id_log = '+DSPessoasInteressadas.DataSet.FieldByName('id_pessoa_imovel').AsString );
                    varSQL.ApplyUpdates;
                    DSPessoasInteressadas.DataSet.Refresh;
               end;
          End;
              Exit;
     End;

     IF VARSQL <> NIL THEN
        FREEANDNIL(VARSQL);
  End;


end;

procedure TCAD_Pessoa.DBGrid8MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var key: Word;
begin
     key := VK_MENU;

     if Button = mbRight then
        DBGrid8KeyDown(Sender, Key, Shift);

end;

procedure TCAD_Pessoa.BtnPrimeiroClick(Sender: TObject);
begin
  inherited;
  Try
    PRINCIPAL.setMensagem('Procurando Imagens...');
  If DM_Cadastro.Z_PessoaFOTO.Value <> '' Then
    unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);

  Except
        unMsg.ERRO(19);
  End;

  Tab_Informacoes.Show;
  Tab_InformacoesShow(Sender);

end;

procedure TCAD_Pessoa.BtnUltimoClick(Sender: TObject);
begin
  inherited;
  Try
    PRINCIPAL.setMensagem('Procurando Imagens...');
  If DM_Cadastro.Z_PessoaFOTO.Value <> '' Then
    unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);
  Except
        unMsg.ERRO(19);
  End;

  Tab_Informacoes.Show;
  Tab_InformacoesShow(Sender);

end;

procedure TCAD_Pessoa.btn_buscaPaginadaClick(Sender: TObject);
begin
     if btn_buscaPaginada.State = cbChecked then
        PainelRodape.Visible := True
     else
         PainelRodape.Visible := False;

     DM_Cadastro.Z_Pessoa.Close;
end;

procedure TCAD_Pessoa.Btn_CancelarClick(Sender: TObject);
begin
  inherited;
  NovoRegistro := 0;
end;

procedure TCAD_Pessoa.Btn_ExcluirClick(Sender: TObject);
begin

PRINCIPAL.setMensagem('A foto do registro não será excluída automaticamente... Ela ainda ficará nos arquivos do servidor.');

     If unUtilitario.setMensagem('Deseja excluir este registro?','confirma') = idYes Then
        If NOT DM_Cadastro.Z_PessoaID_PESSOA.IsNull Then
         Begin
              try
                 DS.Edit;
                 DS.DataSet.FieldByName('ATIVO').AsString := 'XXX';
                 DS.DataSet.FieldByName('ALTERACAO_FUNC').AsString := getUser('CODIGO_USUARIO');
                 DS.DataSet.FieldByName('ALTERACAO_DATA').AsDateTime := Date;

                 DS.DataSet.Post;
                 DM_Cadastro.Z_Pessoa.ApplyUpdates;

                 setLog(DS.DataSet.Fields[0].AsString, 'EXCLUSÃO', Self.Caption, (DS.DataSet as TZQuery));

                 //PRINCIPAL.duplicar('NEW', (DS.DATASET AS TZQUERY));
                 //PRINCIPAL.registrarLog('DEL', DS.DataSet.Fields[0].ASINTEGER);

                 Tab_Pesquisa.Show;
                 unMsg.INFORMA(2);
                 Btn_Novo.Enabled := True;
                 NovoRegistro := 0;
                 DM_Cadastro.Z_Pessoa.Refresh;
                 DM_Cadastro.Z_Pessoa.Edit;
              Except
                    unMsg.ERRO(12);
              End;
         End
         Else
             unMsg.ERRO(13);
end;

procedure TCAD_Pessoa.Btn_FecharClick(Sender: TObject);
begin
     unUtilitario.salvaGrid(Self.Name,Grid_Busca);
  inherited;
end;

procedure TCAD_Pessoa.Btn_Telefone_NovoClick(Sender: TObject);
begin
  inherited;
       If NOT DM_Cadastro.Z_Telefone.Active Then
        DM_Cadastro.Z_Telefone.Open;

       DM_Cadastro.Z_Telefone.Append;

       ajustarTelefonesLibera();

       DM_Cadastro.Z_TelefoneMALADIRETA.Value := 'SIM';
       DM_Cadastro.Z_TelefoneID_PESSOA.Value := DM_Cadastro.Z_PessoaID_PESSOA.Value;

       unCamposBusca.BUSCA(DM_Cadastro.Z_Endereco_Tipo,'select ID_ENDERECO_TIPO, TIPO, TELEFONE, ENDERECO from endereco_tipo where telefone = ''SIM''');
       PRINCIPAL.setMensagem('Escolha um "Tipo de Endereço" para ser atribuído ao novo número.');
end;

procedure TCAD_Pessoa.Btn_Telefone_CancelarClick(Sender: TObject);
begin
  inherited;
   If DM_Cadastro.Z_Telefone.Active Then
        Begin
             DM_Cadastro.Z_Telefone.Cancel;
             DM_Cadastro.Z_Telefone.CancelUpdates;
             DM_Cadastro.Z_Endereco_Tipo.Close;
        End;

       ajustarTelefonesBloqueia();
     
end;

procedure TCAD_Pessoa.Btn_Telefone_GravarClick(Sender: TObject);
begin
  inherited;


    If NovoRegistro = 1 Then
  Begin
      If application.MessageBox('Será necessário gravar as alterações'+#13+'realizadas até agora no registro principal, OK?'+#13+'Verifique os campos obrigatórios antes de prosseguir.', 'Aviso Célula Digital', MB_YESNO) = mryes then
        Btn_GravarClick(Sender)
      Else
      Begin
           ShowMessage('O registro completo não foi salvo.');
      End;

  End;

  If NovoRegistro = 0 Then
  Begin
       If DM_Cadastro.Z_Telefone.Active Then
          Begin
               Try                 

                  PRINCIPAL.setID(dm_cadastro.Z_Telefone, 'ID_TELEFONE', 'TELEFONE');
                  DM_Cadastro.Z_Telefone.ApplyUpdates;

                  setLog(DM_Cadastro.Z_Telefone.Fields[0].AsString, 'ALTERAÇÃO', Self.Caption+': TELEFONE', DM_Cadastro.Z_Telefone);
                  unMsg.INFORMA(1);
                  DM_Cadastro.Z_Endereco_Tipo.Close;
                  DM_CADASTRO.ZqAux.Close;

                  ajustarTelefonesBloqueia();

               Except
                     unMsg.ERRO(13);
               End;
          End
          Else
              unMsg.ERRO(13);
  End;

  Tab_ContatoShow(Sender);

  DM_Cadastro.Z_Telefone.open;

end;

procedure TCAD_Pessoa.Btn_Telefone_ExcluirClick(Sender: TObject);
begin
  inherited;
     If MessageDlg('Deseja excluir este endereço?',mtConfirmation, [mbYes,mbNo], 0) = mrYes Then
     Begin
           If DM_Cadastro.Z_Telefone.Active Then
              Begin
                   Try
                      setLog(DM_Cadastro.Z_Telefone.Fields[0].AsString, 'EXCLUSÃO', Self.Caption+': TELEFONE', DM_Cadastro.Z_Telefone);
                      DM_Cadastro.Z_Telefone.Delete;
                      DM_Cadastro.Z_Telefone.ApplyUpdates;
                      unMsg.INFORMA(2);
                      DM_Cadastro.Z_Endereco_Tipo.Close;
                      ajustarTelefonesBloqueia();
                   Except
                         unMsg.ERRO(12);
                   End;
              End
              Else
                  unMsg.ERRO(13);
     End;

     DM_Cadastro.Z_Telefone.Edit;
     

end;
procedure TCAD_Pessoa.Btn_ImprimirClick(Sender: TObject);
vAR pt: TPoint;
begin
     GetCursorPos(pt);
     PopupRelatorio.Popup(pt.x,pt.y);
end;

procedure TCAD_Pessoa.Tab_InfAdicionalShow(Sender: TObject);
Var varSQL: TZQuery;
begin
     try

        if DM_Cadastro.Z_PessoaID_PESSOA.IsNull Then
           Exit;

        //FINANCEIRO
        //labelEntradaQuitadas
        varSQL := unUtilitario.getSelect('SELECT COUNT(ID_CAIXA) FROM caixa_entrada WHERE ATIVO <> ''XXX'' AND DATA_PGTO IS NOT NULL AND ID_PESSOA = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        labelEntradaQuitadas.Caption := varSQL.Fields[0].AsString;
        //varSQL.Close;

        //labelEntradaNaoQuitadas
        varSQL := unUtilitario.getSelect('SELECT COUNT(ID_CAIXA) FROM caixa_entrada WHERE ATIVO <> ''XXX'' AND DATA_PGTO IS NULL AND ID_PESSOA = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        labelEntradaNaoQuitadas.Caption := varSQL.Fields[0].AsString;
        //varSQL.Close;

        //labelSaidaQuitadas
        varSQL := unUtilitario.getSelect('SELECT COUNT(ID_CAIXA) FROM caixa_saida WHERE ATIVO <> ''XXX'' AND DATA_PGTO IS NOT NULL AND ID_PESSOA = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        labelSaidaQuitadas.Caption := varSQL.Fields[0].AsString;
        //varSQL.Close;

        //labelSaidaNaoQuitadas
        varSQL := unUtilitario.getSelect('SELECT COUNT(ID_CAIXA) FROM caixa_saida WHERE ATIVO <> ''XXX'' AND DATA_PGTO IS NULL AND ID_PESSOA = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        labelSaidaNaoQuitadas.Caption := varSQL.Fields[0].AsString;
        //varSQL.Close;

        //memoEntrada
        memoEntrada.Items.Clear;
        varSQL := unUtilitario.getSelect('SELECT FIRST 10 C.VALOR, CS.nome, C.data_pgto, C.id_caixa  FROM caixa_entrada C INNER JOIN caixa_sis CS ON CS.id_caixa_sis = C.id_subtipo WHERE C.ATIVO <> ''XXX'' AND C.data_pgto IS NOT NULL AND C.ID_PESSOA = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString+' ORDER BY C.DATA_PGTO DESC ');

        while NOT varSQL.Eof do
        Begin
             memoEntrada.Items.Add(getCurrToStr(varSQL.Fields[0].AsCurrency,TRUE) + ' ' + varSQL.Fields[1].AsString + ' ' + varSQL.Fields[2].AsString + ' - ' +varSQL.Fields[3].AsString);
             varSQL.Next;
        end;
        //varSQL.Close;

        //memoSaida
        memoSaida.Items.Clear;
        varSQL := unUtilitario.getSelect('SELECT FIRST 10 C.VALOR, CS.nome, C.data_pgto, C.id_caixa  FROM caixa_saida C INNER JOIN caixa_sis CS ON CS.id_caixa_sis = C.id_subtipo WHERE C.ATIVO <> ''XXX'' AND C.data_pgto IS NOT NULL AND C.ID_PESSOA = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString+' ORDER BY C.DATA_PGTO DESC ');

        while NOT varSQL.Eof do
        Begin
             memoSaida.Items.Add(getCurrToStr(varSQL.Fields[0].AsCurrency,TRUE) + ' ' + varSQL.Fields[1].AsString + ' ' + varSQL.Fields[2].AsString + ' - ' +varSQL.Fields[3].AsString);
             varSQL.Next;
        end;
        //varSQL.Close;

        //memoImovel
        memoImovel.Items.Clear;
        varSQL := unUtilitario.getSelect('SELECT L.tipo AS TIPO, L.nome AS LOGRADOURO, I.numero AS NUMERO, B.nome AS BAIRRO, C.nome AS CIDADE, I.dormitorios AS DORMITORIOS, I.valor_aluquel, PI.status, I.id_imovel FROM imovel I INNER JOIN '+'logradouro L ON L.id_logradouro = I.id_logradouro INNER JOIN cidade C ON C.id_cidade = L.id_cidade INNER JOIN bairro B ON B.id_bairro = L.id_bairro INNER JOIN pessoa_imovel PI ON PI.id_imovel = I.id_imovel where I.ativo <> ''XXX'' AND PI.id_pessoa = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        while NOT varSQL.Eof do                                                               
        Begin
             memoImovel.Items.Add('('+varSQL.FieldByName('STATUS').AsString+') '+varSQL.FieldByName('TIPO').AsString+ ' ' + varSQL.FieldByName('LOGRADOURO').AsString + ', ' + varSQL.FieldByName('NUMERO').AsString + ', ' +varSQL.FieldByName('BAIRRO').AsString + ' de '+varSQL.FieldByName('DORMITORIOS').AsString + ' quartos em '+ varSQL.FieldByName('CIDADE').AsString + ' ('+getCurrToStr(varSQL.FieldByName('valor_aluquel').AsCurrency, TRUE)+')-'+varSQL.FieldByName('ID_IMOVEL').AsString);
             varSQL.Next;
        end;
        //varSQL.Close;

        varSQL := unUtilitario.getSelect('SELECT L.tipo AS TIPO, L.nome AS LOGRADOURO, I.numero AS NUMERO, B.nome AS BAIRRO, C.nome AS CIDADE, I.dormitorios AS DORMITORIOS, I.valor_aluquel, PI.TIPO as status, I.id_imovel FROM imovel I INNER JOIN '+'logradouro L ON L.id_logradouro = I.id_logradouro INNER JOIN cidade C ON C.id_cidade = L.id_cidade INNER JOIN bairro B ON B.id_bairro = L.id_bairro INNER JOIN pessoa_contrato PI ON PI.id_imovel = I.id_imovel where I.ativo <> ''XXX'' AND PI.id_pessoa = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        while NOT varSQL.Eof do                                                               
        Begin
             memoImovel.Items.Add('('+varSQL.FieldByName('STATUS').AsString+') '+ varSQL.FieldByName('TIPO').AsString+ ' ' + varSQL.FieldByName('LOGRADOURO').AsString + ', ' + varSQL.FieldByName('NUMERO').AsString + ', ' +varSQL.FieldByName('BAIRRO').AsString + ' de '+varSQL.FieldByName('DORMITORIOS').AsString + ' quartos em '+ varSQL.FieldByName('CIDADE').AsString + ' ('+getCurrToStr(varSQL.FieldByName('valor_aluquel').AsCurrency, TRUE)+')-'+ varSQL.FieldByName('ID_IMOVEL').AsString);
             varSQL.Next;
        end;
        //varSQL.Close;

        //memoPessoa
        memoPessoa.Items.Clear;
        varSQL := unUtilitario.getSelect('SELECT P.nome, P.obs, PCON.tipo, PCON.id_contrato, PCON.id_imovel, P.id_pessoa FROM PESSOA P  INNER JOIN pessoa_contrato PCON ON PCON.id_pessoa = P.id_pessoa WHERE '+'PCON.id_contrato IN (SELECT PC.id_contrato FROM PESSOA_CONTRATO PC INNER JOIN CONTRATO CC ON CC.ID_CONTRATO = PC.ID_CONTRATO AND ATIVO <> ''XXX'' WHERE PC.id_pessoa = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString+') AND P.ativo <> ''XXX'' AND P.ID_PESSOA <> '+DM_Cadastro.Z_PessoaID_PESSOA.AsString+' ORDER BY PCON.tipo');
        while NOT varSQL.Eof do                                                               
        Begin
             memoPessoa.Items.Add('('+varSQL.FieldByName('TIPO').AsString +') '+StringReplace(varSQL.FieldByName('NOME').AsString,'-','|',[rfReplaceAll])+ ', ' + StringReplace(varSQL.FieldByName('OBS').AsString,'-','|',[rfReplaceAll]) + ' (Contrato:' +varSQL.FieldByName('id_contrato').AsString + ') (Imóvel:'+varSQL.FieldByName('ID_imovel').AsString + ')-'+ varSQL.FieldByName('id_pessoa').AsString);
             varSQL.Next;
        end;
        //varSQL.Close;

        varSQL := unUtilitario.getSelect('SELECT P.nome, P.obs, PCON.status as tipo, 0 as id_contrato, PCON.id_imovel, P.id_pessoa FROM PESSOA P  '+'INNER JOIN pessoa_imovel PCON ON PCON.id_pessoa = P.id_pessoa WHERE PCON.id_imovel IN (SELECT PC.id_imovel FROM pessoa_imovel PC INNER JOIN imovel CC ON CC.id_imovel = PC.id_imovel AND CC.ATIVO <> ''XXX'' WHERE PC.id_pessoa = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString+') AND P.ativo <> ''XXX'' AND P.ID_PESSOA <> '+DM_Cadastro.Z_PessoaID_PESSOA.AsString+' ORDER BY PCON.status');
        while NOT varSQL.Eof do                                                               
        Begin
             memoPessoa.Items.Add('('+varSQL.FieldByName('TIPO').AsString +') '+StringReplace(varSQL.FieldByName('NOME').AsString,'-','|',[rfReplaceAll])+ ', ' + StringReplace(varSQL.FieldByName('OBS').AsString,'-','|',[rfReplaceAll]) + ' (Contrato:' +varSQL.FieldByName('id_contrato').AsString + ') (Imóvel:'+varSQL.FieldByName('ID_imovel').AsString + ')-'+ varSQL.FieldByName('id_pessoa').AsString);
             varSQL.Next;
        end;
        //varSQL.Close;

        //memoPendencias
        memoPendencias.Items.Clear;
        varSQL := unUtilitario.getSelect('select l.*, r.nome as remetente, case l.componente when ''FUNCIONARIO'' then (select nome from usuario '+'where id_usuario = l.id_conta) when ''PESSOA'' then (select nome from pessoa where id_pessoa = l.id_conta) else ''NÃO INFORMADO'' end as destinatario from log l inner'+' join usuario r on r.id_usuario = l.id_func where l.ativo = ''SIM'' and l.acao = ''MSN'' and l.id_conta = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        while NOT varSQL.Eof do                                                               
        Begin
             memoPendencias.Items.Add('('+varSQL.FieldByName('DATA').AsString +') de '+varSQL.FieldByName('REMETENTE').AsString+ ': '+ varSQL.FieldByName('CAMPOS').AsString+'-'+varSQL.FieldByName('ID_LOG').AsString);
             varSQL.Next;
        end;
        SetHorizontalScrollBar(memoPendencias);
        //varSQL.Close;

        varSQL := unUtilitario.getSelect('SELECT CS.data_entrada DATA, SUBSTRING(CS.anotacao from 1 for 30) AS ANOTACAO, CS.id_caixa_status FROM CAIXA_STATUS CS LEFT JOIN CAIXA_SAIDA CE ON CE.id_caixa = CS.id_caixa_saida WHERE CE.ativo <> ''XXX'' AND CE.id_pessoa = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        while NOT varSQL.Eof do
        Begin
             memoPendencias.Items.Add('('+varSQL.FieldByName('DATA').AsString +') '+varSQL.FieldByName('ANOTACAO').AsString+ '-'+ varSQL.FieldByName('id_caixa_status').AsString);
             varSQL.Next;
        end;
        //varSQL.Close;

        varSQL := unUtilitario.getSelect('SELECT CS.data_entrada DATA, SUBSTRING(CS.anotacao from 1 for 30) AS ANOTACAO, CS.id_caixa_status FROM CAIXA_STATUS CS WHERE CS.ID_FUNCIONARIO = '+DM_Cadastro.Z_PessoaID_PESSOA.AsString);
        while NOT varSQL.Eof do                                                               
        Begin
             memoPendencias.Items.Add('('+varSQL.FieldByName('DATA').AsString +') '+varSQL.FieldByName('ANOTACAO').AsString+ '-'+ varSQL.FieldByName('id_caixa_status').AsString);
             varSQL.Next;
        end;
        //varSQL.Close;

     finally
            FreeAndNil(varSQL);
     end;

end;

procedure TCAD_Pessoa.DBEdit16Exit(Sender: TObject);
begin
  inherited;

  DBEdit16.Text := Trim(DBEdit16.Text);

  if Length(DBEdit16.Text) = 0 then
  Begin
       Label16.Font.Color := clBlack;
       exit;
  end;

  if Length(DBEdit16.Text) < 10 then
  Begin
       Label16.Font.Color := clRed;
       //DBEdit16.SetFocus;
       exit;
  end;

Try
  if DM_Cadastro.Z_Pessoa.FieldByName('PESSOA_FISICA').Value = 'SIM' THEN
  BEGIN
       If Length(DBEdit16.Text) > 0 Then
          If unValidacao.cpf(DBEdit16.Text) Then
             Label16.Font.Color := clBlue
          else
          Begin
              Label16.Font.Color := clRed;
              //DBEdit16.SetFocus;
          end;
  END
  ELSE
  BEGIN
       If Length(DBEdit16.Text) > 0 Then
          If unValidacao.cnpj(DBEdit16.Text) Then
             Label16.Font.Color := clBlue
          else
          begin
              Label16.Font.Color := clRed;
              //DBEdit16.SetFocus;
          end;
  END;
Except
      PRINCIPAL.setMensagem('ENTRE SOMENTE COM NÚMEROS PARA VALIDAR A CONSULTA DE CPF/CNPJ!');
      Label16.Font.Color := clBlack;
End;
end;

procedure TCAD_Pessoa.DBEdit16MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
PRINCIPAL.setMensagem('Somente números neste campo para validar a consulta!');
end;

procedure TCAD_Pessoa.DBEdit1Change(Sender: TObject);
begin
  inherited;

  if DBEdit1.Focused then
     if Length(DBEdit1.Text) = 2 then
        DBEdit49.SetFocus;
  
end;

procedure TCAD_Pessoa.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  IF length(trim(dbedit2.Text)) = 0 then
    BEGIN
      dbedit3.text := '';
      exit;      
    END;

  dm_cadastro.zqaux.Close;
  dm_cadastro.zqaux.SQL.clear;
  dm_cadastro.ZqAux.SQL.Add('select nome from ocupacao where id_ocupacao = ' + dbedit2.text);
  dm_cadastro.zqaux.Open;

  if dm_cadastro.zqaux.RecordCount = 0 then
    dbedit3.text := '{NÃO ENCONTRADO}'
  else
    dbedit3.text := dm_cadastro.zqaux.fieldbyname('nome').asstring;

  dm_cadastro.ZqAux.Close;

end;

procedure TCAD_Pessoa.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  IF KEY = #13 THEN
    DBEdit2Exit(sender);

  dbedit2.SetFocus;


end;

procedure TCAD_Pessoa.DBEdit49Exit(Sender: TObject);
var numero: String;
begin

     if not DM_CADASTRO.Z_TelefoneNUMERO.IsNull then
     Begin
          numero := DM_CADASTRO.Z_TelefoneNUMERO.AsString;

          numero := Trim(numero);

          if Length(numero) = 8 then
             numero := Copy(numero, 0, 4)+'-'+Copy(numero, 5, 4);

          DM_CADASTRO.Z_TelefoneNUMERO.AsString := numero;
     end;
  
end;

procedure TCAD_Pessoa.DBEdit49MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
PRINCIPAL.setMensagem('O CAMPO TELEFONE É OBRIGATÓRIO, CASO QUEIRA SAIR DO CAMPO, INFORME AO MENOS UM NÚMERO QUALQUER (0000-0000) E DEPOIS EXCLUA O REGISTRO.');
end;

procedure TCAD_Pessoa.DBEdit8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
    PRINCIPAL.setMensagem('Uma tag é uma palavra-chave (relevante) ou termo associado com uma informação que o descreve e permite uma classificação da informação baseada em palavras-chave.');
end;

{
 Busca antiga pelo cônjuge. Agora é feito digitando apenas o nome
procedure TCAD_Pessoa.rb1Click(Sender: TObject);
begin
  dbedit15.Enabled := true;
  lbconjuge.Caption := '';
  DBEDIT15.Color := clWindow;
  CONJUGE := TRUE;
end;

procedure TCAD_Pessoa.rb2Click(Sender: TObject);
begin
  dbedit15.Text := '';
  dbedit15.Enabled := false;
  DBEDIT15.Color := cl3DLight;

  if conjuge = true then
    IF NOT DS.DATASET.FieldByName('ID_PESSOA').IsNull THEN
      PRINCIPAL.CriarForm(TCAD_CONJUGE, SELF, 'NOMATRIZ')
  else
    begin
      APPLICATION.MessageBox('Não existe nenhum registro aberto!', 'Aviso '+celulaNome, mb_ok);
      RB1.Checked := TRUE;
      dbedit15.Enabled := true;
      lbconjuge.Caption := '';
      DBEDIT15.Color := clWindow;
    end;

    conjuge := true;
end;
}

procedure TCAD_Pessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Cad_Pessoa := nil;
end;

procedure TCAD_Pessoa.BitBtn8Click(Sender: TObject);
begin
  inherited;
    If DM_Cadastro.Z_Curinga_02.Active Then
     DM_Cadastro.Z_Curinga_02.Close;

  DM_Cadastro.Z_Curinga_02.SQL.Clear;
  DM_Cadastro.Z_Curinga_02.SQL.Add('select distinct(tipo) from logradouro order by tipo');

  Application.CreateForm(TCAD_Logradouro, CAD_Logradouro);
  CAD_Logradouro.Btn_Retorno.Visible := True;

If CAD_Logradouro.ShowModal = mrOK Then
   If not DM_Cadastro.Z_Logradouro.IsEmpty Then
      Begin
           DM_Cadastro.Z_Endereco.FieldByName('CEP').Value := DM_Cadastro.Z_Logradouro.FieldByName('CEP').Value;
           DM_Cadastro.Z_Endereco.FieldByName('TIPORUA').Value := DM_Cadastro.Z_Logradouro.FieldByName('TIPO').Value;
           DM_Cadastro.Z_Endereco.FieldByName('RUA').Value := DM_Cadastro.Z_Logradouro.FieldByName('NOME').Value;
           DM_Cadastro.Z_Endereco.FieldByName('BAIRRO').Value := DM_Cadastro.Z_Logradouro.FieldByName('XBAIRRO').Value;
           DM_Cadastro.Z_Endereco.FieldByName('CIDADE').Value := DM_Cadastro.Z_Logradouro.FieldByName('XCIDADE').Value;
           DM_Cadastro.Z_Endereco.FieldByName('ESTADO').Value := DM_Cadastro.Z_Logradouro.FieldByName('XSIGLA').Value;
           DM_Cadastro.Z_Endereco.FieldByName('ID_LOGRADOURO').Value := DM_Cadastro.Z_Logradouro.FieldByName('ID_LOGRADOURO').Value;
           DM_Cadastro.Z_Logradouro.Close;

           DBEdit31.SetFocus;
      End;

end;

procedure TCAD_Pessoa.BitBtn7Click(Sender: TObject);
begin
  inherited;

       If NOT DM_Cadastro.Z_Endereco.Active Then
        DM_Cadastro.Z_Endereco.Open;

       DM_Cadastro.Z_Endereco.Append;

       Btn_Endereco_Novo.Enabled := False;

       DM_Cadastro.Z_EnderecoMALADIRETA.Value := 'SIM';
       DM_Cadastro.Z_EnderecoID_PESSOA.Value := DM_Cadastro.Z_PessoaID_PESSOA.Value;

       unCamposBusca.BUSCA(DM_Cadastro.Z_Endereco_Tipo,'select tipo, id_endereco_tipo from endereco_tipo where endereco = ''SIM''');

       PRINCIPAL.setMensagem('Clique em "Procurar Endereço" para encontrar um endereço cadastrado.');

end;

procedure TCAD_Pessoa.BitBtn6Click(Sender: TObject);
begin
  inherited;
   If DM_Cadastro.Z_Endereco.Active Then
        Begin
             DM_Cadastro.Z_Endereco.Cancel;
             DM_Cadastro.Z_Endereco.CancelUpdates;
             Btn_Endereco_Novo.Enabled := True;
             DM_Cadastro.Z_Endereco_Tipo.Close;
        End;
end;

procedure TCAD_Pessoa.BitBtn5Click(Sender: TObject);
begin
  inherited;

    If NovoRegistro = 1 Then
  Begin
      If MessageDlg('Será necessário gravar as alterações'+#13+'realizadas até agora no registro principal, OK?'+#13+'Verifique os campos obrigatórios antes de prosseguir.', mtConfirmation, [mbYes, mbNo],0) = mrYes Then
      Begin
           Btn_GravarClick(Sender);
      End
      Else
      Begin
           ShowMessage('O registro completo não foi salvo.');
      End;

  End;

  If NovoRegistro = 0 Then
  Begin
       If DM_Cadastro.Z_Endereco.Active Then
          Begin
               Try
                  DM_Cadastro.Z_Endereco.ApplyUpdates;
                  unMsg.INFORMA(1);
                  Btn_Endereco_Novo.Enabled := True;
                  DM_Cadastro.Z_Endereco_Tipo.Close;
               Except
                     unMsg.ERRO(18);
               End;
          End
          Else
              unMsg.ERRO(13);

          DM_Cadastro.Z_Endereco.Edit;
  End;

  Tab_ContatoShow(Sender);

end;

procedure TCAD_Pessoa.cClick(Sender: TObject);
begin
     DM_Cadastro.Z_Pessoa.Close;
     DM_Cadastro.Z_Pessoa.SQL.Text := pagina.menosRegistros(DM_Cadastro.Z_Pessoa.SQL.Text);
     DM_Cadastro.Z_Pessoa.Open;
end;

procedure TCAD_Pessoa.Tab_CadastroShow(Sender: TObject);
begin

  IF DS.DATASET.State IN [dsInactive] THEN
    Exit;

  principal.duplicar('OLD', (DS.DATASET AS TZQUERY));

  inherited;
  
  Try
  PRINCIPAL.setMensagem('Procurando Imagens...');
  If NOT DM_Cadastro.Z_PessoaFOTO.IsNull Then
    unImagem.getImagem(IMG_Foto,DM_Cadastro.Z_PessoaFOTO.Value);
  Except
        unMsg.ERRO(19);
  End;

end;

procedure TCAD_Pessoa.DBEdit13Change(Sender: TObject);
begin

  if DM_Cadastro.Z_Telefone.Active then
     DM_Cadastro.Z_Telefone.Edit;
  

end;

procedure TCAD_Pessoa.editConjujeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  PRINCIPAL.setMensagem(editConjuje.Hint);
end;

procedure TCAD_Pessoa.Grid_BuscaDblClick(Sender: TObject);
begin
  inherited;
  Tab_InformacoesShow(Sender);
end;

procedure TCAD_Pessoa.Grid_BuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 Var i: integer;
begin
     If Key = VK_RETURN then
        Grid_BuscaDblClick(Sender);
end;

procedure TCAD_Pessoa.ImpressodeEndereos1Click(Sender: TObject);
var varSQL, varSQLTelefone: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Enderecos.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE PESSOAS E SEUS RESPECTIVOS ENDEREÇOS. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT ID_PESSOA, NOME  FROM PESSOA WHERE ID_PESSOA IN ('+alinhaStringlist(SelecaoPessoa)+') ORDER BY NOME');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,varSQL.FieldByName('NOME').AsString+' CÓD '+varSQL.FieldByName('ID_PESSOA').AsString);

          varSQLTelefone := getSelect('SELECT ET.tipo AS ENDERECO_TIPO, E.numero, E.complemento, L.tipo, L.nome, L.cep, B.nome AS BAIRRO, C.nome AS CIDADE, U.sigla ,U.nome AS ESTADO  FROM ENDERECO E INNER JOIN logradouro L ON L.id_logradouro = E.id_logradouro INNER JOIN BAIRRO B'+' ON B.id_bairro = L.id_bairro INNER JOIN CIDADE C ON C.id_cidade = L.id_cidade INNER JOIN uf U ON U.id_sigla = L.id_sigla INNER JOIN endereco_tipo ET ON ET.id_endereco_tipo = E.id_endereco_tipo WHERE E.id_pessoa = '+varSQL.FieldByName('ID_PESSOA').AsString+' ORDER BY ET.TIPO, l.NOME');

          if varSQLTelefone.RecordCount = 0 Then
          Begin
               Writeln(Arquivo,#9+'Favor cadastrar os endereços desta pessoa.');
          end
          ELSE
              while not varSQLTelefone.Eof do
              Begin
                   Writeln(Arquivo,#9+varSQLTelefone.FieldByName('ENDERECO_TIPO').AsString+' = '+varSQLTelefone.FieldByName('TIPO').AsString+' '+varSQLTelefone.FieldByName('NOME').AsString+' '+varSQLTelefone.FieldByName('NUMERO').AsString+' '+TRIM(varSQLTelefone.FieldByName('COMPLEMENTO').AsString)+' '+varSQLTelefone.FieldByName('BAIRRO').AsString+'. '+varSQLTelefone.FieldByName('CIDADE').AsString+', '+varSQLTelefone.FieldByName('ESTADO').AsString+'-'+varSQLTelefone.FieldByName('SIGLA').AsString+'. '+varSQLTelefone.FieldByName('CEP').AsString);
                   varSQLTelefone.Next
              end;

          Writeln(Arquivo,' ');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);

end;

procedure TCAD_Pessoa.ImpressodeTelefones1Click(Sender: TObject);
var varSQL, varSQLTelefone: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Telefones.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE PESSOAS E SEUS RESPECTIVOS TELEFONES. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT ID_PESSOA, NOME  FROM PESSOA WHERE ID_PESSOA IN ('+alinhaStringlist(SelecaoPessoa)+') ORDER BY NOME');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,#9+varSQL.FieldByName('NOME').AsString+' CÓD '+varSQL.FieldByName('ID_PESSOA').AsString);

          varSQLTelefone := getSelect('SELECT T.*, ET.tipo AS ENDERECO_TIPO FROM TELEFONE T INNER JOIN ENDERECO_TIPO ET ON ET.id_endereco_tipo = T.id_endereco_tipo WHERE T.id_pessoa = '+varSQL.FieldByName('ID_PESSOA').AsString+' ORDER BY ENDERECO_TIPO');

          if varSQLTelefone.RecordCount = 0 Then
          Begin
               Writeln(Arquivo,#9+'Favor cadastrar os telefones desta pessoa.');
          end
          ELSE
              while not varSQLTelefone.Eof do
              Begin
                   Writeln(Arquivo,#9+#9+'('+varSQLTelefone.FieldByName('DDD').AsString+') '+varSQLTelefone.FieldByName('NUMERO').AsString+#9+#9+varSQLTelefone.FieldByName('ENDERECO_TIPO').AsString+' '+varSQLTelefone.FieldByName('RAMAL').AsString +' '+varSQLTelefone.FieldByName('CONTATO').AsString);
                   varSQLTelefone.Next
              end;

          Writeln(Arquivo,' ');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);
end;

procedure TCAD_Pessoa.InformaesGeraisdasPessoas1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Pessoa_DadosGerais.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE INFORMAÇÕES GERAIS PESSOAIS. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('select p.id_pessoa, p.nome, p.nacionalidade, o.nome as ocupacao, p.estado_civil, p.rg_ie, p.rg_orgao, p.cpf_cnpj, l.tipo, l.nome as logradouro, e.numero, e.complemento, b.nome as bairro, c.nome as cidade from pessoa p '+
     ' left join ocupacao o on o.id_ocupacao = p.id_ocupacao '+
     ' left join endereco e on e.id_pessoa = p.id_pessoa and e.id_endereco_tipo = 1 '+
     ' left join logradouro l on l.id_logradouro = e.id_logradouro '+
     ' left join bairro b on b.id_bairro = l.id_logradouro '+
     ' left join cidade c on c.id_cidade = l.id_cidade WHERE P.ID_PESSOA IN ('+alinhaStringlist(SelecaoPessoa)+') ORDER BY P.NOME');

     Writeln(Arquivo,'=> NOME COMPLETO - CÓDIGO - NACIONALIDADE/TAGS - OCUPAÇÃO - ESTADO CIVÍL - RG/IE - CPF/CNPJ - ENDEREÇO RESIDENCIAL');
     Writeln(Arquivo,' ');
     while not varSQL.Eof do
     Begin                                                                                                                                                                                                                                                                                                                                                                                                                               
          Writeln(Arquivo,'=> '+varSQL.FieldByName('NOME').AsString+' - '+varSQL.FieldByName('id_pessoa').AsString+' - '+varSQL.FieldByName('nacionalidade').AsString+' - '+varSQL.FieldByName('ocupacao').AsString+' - '+varSQL.FieldByName('estado_civil').AsString+' - '+varSQL.FieldByName('rg_ie').AsString+' '+varSQL.FieldByName('rg_orgao').AsString+' - '+varSQL.FieldByName('cpf_cnpj').AsString+' - '+varSQL.FieldByName('tipo').AsString+' '+varSQL.FieldByName('logradouro').AsString+', '+varSQL.FieldByName('numero').AsString+' '+varSQL.FieldByName('complemento').AsString+' - '+varSQL.FieldByName('bairro').AsString+' '+varSQL.FieldByName('cidade').AsString);

          //Writeln(Arquivo,' ');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);
end;

procedure TCAD_Pessoa.LimparSeleo1Click(Sender: TObject);
begin
     SelecaoPessoa.Clear;
     ShowMessage('Registros excluídos com sucesso!');
end;

procedure TCAD_Pessoa.memoEntradaDblClick(Sender: TObject);
Var Formulario: TForm;
    I,ID: INTEGER;
begin

     ID := IDCampo(memoEntrada.Items[memoEntrada.ItemIndex]);

  if ID > 0 Then
  Begin
       PRINCIPAL.CriarForm(TCAD_Caixas, Self,'0');

       for I := 0 to Screen.FormCount - 1 do
       begin
            if Screen.Forms[I] is TCAD_Caixas then
            begin
                 Formulario := Screen.Forms[i];
            end;
       end;

       TCAD_Caixas(Formulario).mostraContaEntrada(ID);
  End;
end;

procedure TCAD_Pessoa.memoImovelDblClick(Sender: TObject);
Var ID: INTEGER;
begin

   ID := IDCampo(memoImovel.Items[memoImovel.ItemIndex]);

   if ID > 0 Then
      unCamposBusca.buscaIndividual(1,ID,TCAD_Imovel,self);

end;

procedure TCAD_Pessoa.memoPendenciasDblClick(Sender: TObject);
Var Formulario: TForm;
    I,ID: INTEGER;
begin

     ID := IDCampo(memoPendencias.Items[memoPendencias.ItemIndex]);

  if ID > 0 Then
  Begin

       with TCAD_Mensagem.Create(Application) do
       try
          mostraMensagemRecebida(ID);
          ShowModal;

       finally
              Free;
       end;
       //Application.CreateForm(TCAD_Mensagem,CAD_Mensagem);
       //CAD_Mensagem.mostraMensagemRecebida(ID);
       //CAD_Mensagem.ShowModal;
  End;
end;

procedure TCAD_Pessoa.memoPessoaDblClick(Sender: TObject);
Var ID: Integer;
begin

     ID := IDCampo(memoPessoa.Items[memoPessoa.ItemIndex]);

     if ID > 0 Then
     Begin
          Tab_Pesquisa.Show;
          Valor.Text := IntToStr(ID);
          Pesquisar();

          Tab_Informacoes.Show;
     end;

end;

procedure TCAD_Pessoa.memoSaidaDblClick(Sender: TObject);
Var Formulario: TForm;
    I,ID: INTEGER;
begin

     ID := IDCampo(memoSaida.Items[memoSaida.ItemIndex]);

  if ID > 0 Then
  Begin
       PRINCIPAL.CriarForm(TCAD_Caixas, Self,'0');

       for I := 0 to Screen.FormCount - 1 do
       begin
            if Screen.Forms[I] is TCAD_Caixas then
            begin
                 Formulario := Screen.Forms[i];
            end;
       end;

       TCAD_Caixas(Formulario).mostraContaSaida(ID);
  End;

end;

procedure TCAD_Pessoa.OutrasConsultas1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Obs_Consultas_SCPC.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE PESSOAS E OUTRAS CONSULTAS INTERNAS DA EMPRESA. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,'Verifique no cadstro da pessoa para saber qual tipo de consulta foi realizada.');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT ID_PESSOA, NOME FROM PESSOA WHERE CONSULTA_OUTROS = ''SIM'' AND ATIVO <> ''XXX'' ORDER BY NOME');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,'=> CÓD '+varSQL.FieldByName('ID_PESSOA').AsString+#9+varSQL.FieldByName('NOME').AsString);
          //Writeln(Arquivo,' ');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);
end;

procedure TCAD_Pessoa.CodigoPessoaResponsavelExit(Sender: TObject);
begin
  inherited;
  dm_cadastro.DS_Usuario.DataSet.Open;
{
if Length(Edit_Codigo.Text) > 0  Then
Begin
  DM_CADASTRO.Z_Curinga_01.Close;
  DM_CADASTRO.Z_Curinga_01.SQL.Clear;

  If DM_CADASTRO.Z_PessoaPESSOA_RESPONSAVEL.value > FrmPrincipal.CodFaixa_Inicial Then
  Begin
       DM_CADASTRO.Z_Curinga_01.SQL.Add('select nome from USUARIO where id_usuario = '+ CodigoPessoaResponsavel.Text);
  End
  Else
  Begin
       IF Length(CodigoPessoaResponsavel.Text) > 0 THEN
       Begin
          DM_CADASTRO.Z_PessoaPESSOA_RESPONSAVEL.value := DM_CADASTRO.Z_PessoaPESSOA_RESPONSAVEL.value;
          DM_CADASTRO.Z_Curinga_01.SQL.Add('select nome from USUARIO where id_usuario = '+DM_CADASTRO.Z_PessoaPESSOA_RESPONSAVEL.AsString);
       End;
  End;

  If Length(DM_CADASTRO.Z_Curinga_01.SQL.GetText) > 0 THEN
     DM_CADASTRO.Z_Curinga_01.Open;

  iF DM_CADASTRO.Z_Curinga_01.Active THEN
  BEGIN

       if DM_CADASTRO.Z_Curinga_01.RecordCount = 1 Then
          NomePessoaResponsavel.caption := DM_CADASTRO.Z_Curinga_01.FieldByName('NOME').Value
       else
           NomePessoaResponsavel.caption := 'SEM RESPONSÁVEL';

       DM_CADASTRO.Z_Curinga_01.Close;
  END;

End;
}
end;

procedure TCAD_Pessoa.comboConjujeBuscaDropDown(Sender: TObject);
Var varSQL: TZQuery;
begin
     comboConjujeBusca.Items.Clear;

     if Length(Trim(comboConjujeBusca.Text)) = 0 then
        Exit;

     varSQL := unUtilitario.getSelect('SELECT NOME ||''-''|| ID_PESSOA FROM PESSOA WHERE ATIVO = ''SIM'' AND NOME LIKE '''+comboConjujeBusca.Text+'%'' ORDER BY NOME');

     while not varSQL.Eof do
     Begin
          comboConjujeBusca.Items.Add(varSQL.Fields[0].AsString);
          varSQL.Next;
     End;

     AjustarLargura(comboConjujeBusca);
     varSQL.Close;
     FreeAndNil(varSQL);
end;

procedure TCAD_Pessoa.comboConjujeBuscaExit(Sender: TObject);
var codigo: String;
begin

     codigo := IDCampoSTR(comboConjujeBusca.Text);

     if verificaStringInt(codigo) Then
        DM_CADASTRO.DS_Pessoa.DataSet.FieldByName('CONJUGE').AsString := codigo;
end;

procedure TCAD_Pessoa.Tab_ComplementoExit(Sender: TObject);
begin
  inherited;
 dm_cadastro.DS_Usuario.DataSet.CLOSE;
end;

procedure TCAD_Pessoa.Tab_ComplementoShow(Sender: TObject);
Var varSQL: TZQuery;
begin
     inherited;
     //CodigoPessoaResponsavelExit(Sender);

     comboConjujeBusca.Items.Clear;
     comboConjujeBusca.Text := '';
     radioConjugeSimples.Checked := False;
     radioConjugeCompleto.Checked := False;
     comboConjujeBusca.Enabled := False;
     editConjuje.Enabled := False;

     if Length(trim(DM_CADASTRO.Z_Pessoa.FieldByName('CONJUGE').AsString)) > 0 then
     Begin
         if verificaStringInt(DM_CADASTRO.Z_Pessoa.FieldByName('CONJUGE').AsString) then
         Begin
              radioConjugeCompleto.Checked := true;
              radioConjugeCompleto.Enabled := true;
              varSQL := unUtilitario.getSelect('select id_pessoa, nome from pessoa where id_pessoa = ' + DM_CADASTRO.Z_Pessoa.FieldByName('CONJUGE').AsString);

              if varSQL.RecordCount > 0 then
                 comboConjujeBusca.Text := varSQL.FieldByName('NOME').AsString+'-'+varSQL.FieldByName('ID_PESSOA').AsString
              else
                  comboConjujeBusca.Text := 'CÔNJUGE NÃO IDENTIFICADO CORRETAMENTE...';

              varSQL.Close;
         end
         ELSE
         Begin
              radioConjugeSimples.Checked := true;
              editConjuje.Enabled := true;
         end;
     end
     else
     Begin
          comboConjujeBusca.Enabled := False;
          editConjuje.Enabled := False;
          radioConjugeSimples.Checked := False;
          radioConjugeCompleto.Checked := False;
          comboConjujeBusca.Text := 'SELECIONE UMA OPÇÃO ACIMA.'
     end;

     //DBEdit9.SetFocus;
end;


procedure TCAD_Pessoa.EditSenhaDblClick(Sender: TObject);
begin
  inherited;
  If EditSenha.PasswordChar = #149 Then
     EditSenha.PasswordChar := #0
     Else
     EditSenha.PasswordChar := #149;
end;

procedure TCAD_Pessoa.elefone1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Obs_Consultas_SCPC.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE PESSOAS E SUA CONSULTA AO TELEFONE. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     //Dados da Pessoa
     varSQL :=  getSelect('SELECT ID_PESSOA, NOME FROM PESSOA WHERE CONSULTA_TELEFONE = ''SIM'' AND ATIVO <> ''XXX'' ORDER BY NOME');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,'=> CÓD '+varSQL.FieldByName('ID_PESSOA').AsString+#9+varSQL.FieldByName('NOME').AsString);
          //Writeln(Arquivo,' ');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);
end;

procedure TCAD_Pessoa.Emails1Click(Sender: TObject);
var varSQL: TZQuery;
    Arquivo: TextFile;
    nomeArquivo: String;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'_Relatorio_Email.txt';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     //Gera Relatório
     Writeln(Arquivo,'RELATÓRIO DE E-MAILS. '+DateTimeToStr(Date()+Time()));
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     varSQL :=  getSelect('SELECT P.nome, p.email FROM PESSOA P WHERE P.id_pessoa IN ('+alinhaStringlist(SelecaoPessoa)+') and p.email is not null and p.MALADIRETA = ''SIM'' ORDER BY p.nome');

     Writeln(Arquivo,'E-MAIL PESSOAL:');
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,'"'+varSQL.FieldByName('NOME').AsString+'" <'+varSQL.FieldByName('EMAIL').AsString+'>,');
          varSQL.Next;
     end;

     varSQL :=  getSelect('SELECT P.nome, p.YAHOO FROM PESSOA P WHERE P.id_pessoa IN ('+alinhaStringlist(SelecaoPessoa)+') and p.YAHOO is not null and p.MALADIRETA = ''SIM'' ORDER BY p.nome');

     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');
     Writeln(Arquivo,'E-MAIL DE TRABALHO:');
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,'"'+varSQL.FieldByName('NOME').AsString+'" <'+varSQL.FieldByName('YAHOO').AsString+'>,');
          varSQL.Next;
     end;

     varSQL :=  getSelect('SELECT P.nome, p.MSN FROM PESSOA P WHERE P.id_pessoa IN ('+alinhaStringlist(SelecaoPessoa)+') and p.MSN is not null and p.MALADIRETA = ''SIM'' ORDER BY p.nome');

     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');
     Writeln(Arquivo,'E-MAIL DE MSN/MESSENGER:');
     Writeln(Arquivo,' ');
     Writeln(Arquivo,' ');

     while not varSQL.Eof do
     Begin
          Writeln(Arquivo,'"'+varSQL.FieldByName('NOME').AsString+'" <'+varSQL.FieldByName('MSN').AsString+'>,');
          varSQL.Next;
     end;

     CloseFile(Arquivo);
     FreeAndNil(varSQL);

     WinExec(pchar('notepad "'+nomeArquivo+'"'), SW_SHOW);

end;

procedure TCAD_Pessoa.EndereoResidencial1Click(Sender: TObject);
Var
   sqlEtiqueta: TZQuery;
   Escolha, Registros, qtde: String;
   I: Integer;
begin
     //ETIQUETA 30

          if SelecaoPessoa.Count = 0 Then
          Begin
               ShowMessage('NENHUM REGISTRO SELECIONADO'+#13+'Faça a seleção dos registros com a tecla ALT no resultado da consulta.');
               Exit;
          end;

          qtde := Trim(InputBox('Quantidade de etiquetas à pular.','Quantas etiquetas em branco que o sistema deve pular?','0'));

          if not unUtilitario.verificaStringInt(qtde) then
          begin
               unUtilitario.setMensagem('Entre somente com o número de etiquetas que devem ser puladas!','erro');
               exit;
          end;

          sqlEtiqueta := TZQuery.Create(Self);
          sqlEtiqueta.Connection := PRINCIPAL.Conexao;

          sqlEtiqueta.SQL.Add('select ET.id_endereco_tipo, ET.tipo from endereco_tipo ET where ET.endereco = ''SIM'' order by ET.id_endereco_tipo');
          sqlEtiqueta.Open;

          Escolha := '0-ENDEREÇO DE LOCAÇÃO'+#13;

          while NOT sqlEtiqueta.Eof do
          Begin
               Escolha := Escolha + sqlEtiqueta.FieldByName ('id_endereco_tipo').AsString +'-'+ sqlEtiqueta.FieldByName('tipo').AsString + #13;
               sqlEtiqueta.Next;
          end;

          Escolha := Escolha + '99-TODOS'+#13;


          Escolha := Trim(InputBox('Escolha o tipo de endereço',Escolha,'99'));

          if (Length(Escolha) = 0) OR (Length(Escolha) > 2) then
          Begin
               ShowMessage('Escolha o número de uma opção!');
               Exit;
          end;

          For I := 0 to SelecaoPessoa.Count - 1 do
          Begin
              Registros := Registros + ' en.id_pessoa = ' + SelecaoPessoa.Strings[I];

              if I < SelecaoPessoa.Count -1 then
                 Registros := Registros + ' OR ';
          end;


          if(Escolha = '99') then
          begin

          DM_REL.ZQUERY1.SQL.Clear;
          DM_REL.ZQUERY1.SQL.Add('select nome, id_endereco_tipo, id_pessoa, RUA, numero, BAIRRO, CIDADE, cep from ('+
          'select first '+qtde+' '' '' as nome, 0 as id_endereco_tipo, 0 as id_pessoa, '' '' as RUA, '' '' as numero, '' '' as BAIRRO, '' '' as CIDADE, '' '' as cep from pessoa p UNION ALL '+
          ' select p.nome, en.id_endereco_tipo, p.id_pessoa, L.tipo||'' ''||L.nome as RUA, ''N° ''||en.numero||'' ''||coalesce(en.complemento,'''') as numero, ''Bairro ''||B.nome as BAIRRO, C.nome ||''-''|| U.sigla AS CIDADE, L.cep from pessoa p '+
          ' inner join endereco en on en.id_pessoa = p.id_pessoa '+
          ' inner join logradouro l on l.id_logradouro = en.id_logradouro '+
          ' inner join cidade c on c.id_cidade = l.id_cidade '+
          ' inner join bairro b on b.id_bairro = l.id_bairro '+
          ' inner join uf u on u.id_sigla = l.id_sigla where en.maladireta = ''SIM'' and ('+Registros+') ) order by nome ');

          DM_REL.ZQUERY1.Open;
          DM_REL.RV_Query.DataSet := DM_REL.ZQUERY1;

          DM_REL.RV_IMPRESSAO.CLOSE;
          DM_REL.RV_IMPRESSAO.ProjectFile := ExtractFilePath(ParamStr(0))+'REL\RV_15_ETIQUETA_POLIFIX_25X66.rav';
          principal.setLogo(dm_rel.RV_IMPRESSAO);
          DM_REL.RV_IMPRESSAO.Open;

          DM_REL.RV_IMPRESSAO.Execute;

          sqlEtiqueta.Close;
          DM_REL.ZQUERY1.Close;
          
          end
          else
          if(Escolha = '0') then
          begin

          DM_REL.ZQUERY1.SQL.Clear;
          DM_REL.ZQUERY1.SQL.Add('select nome, id_endereco_tipo, id_pessoa, RUA, numero, BAIRRO, CIDADE, cep from ('+
          'select first '+qtde+' '' '' as nome, 0 as id_endereco_tipo, 0 as id_pessoa, '' '' as RUA, '' '' as numero, '' '' as BAIRRO, '' '' as CIDADE, '' '' as cep from pessoa p UNION ALL '+
          ' select p.nome, l.id_logradouro as id_endereco_tipo, p.id_pessoa, L.tipo||'' ''||L.nome as RUA, ''N° ''||i.numero||'' ''||coalesce(i.complemento,'''') as numero, ''Bairro ''||B.nome as BAIRRO, C.nome ||''-''|| U.sigla AS CIDADE, L.cep from pessoa p '+
          ' inner join pessoa_contrato pc on pc.id_pessoa = p.id_pessoa  '+
          ' inner join contrato co on co.id_contrato = pc.id_contrato and co.ativo = ''SIM'' '+
          ' inner join imovel i on i.id_imovel = co.id_imovel '+
          ' inner join logradouro l on l.id_logradouro = i.id_logradouro '+
          ' inner join cidade c on c.id_cidade = l.id_cidade '+
          ' inner join bairro b on b.id_bairro = l.id_bairro '+
          ' inner join uf u on u.id_sigla = l.id_sigla '+
          ' where ('+StringReplace(Registros,'en.','p.',[rfReplaceAll])+') ) order by nome ');

          //DM_REL.ZQUERY1.SQL.Add('select P.nome, p.id_pessoa, L.tipo||'' ''||L.nome as RUA, i.numero||'' ''||en.complemento as numero,'+' B.nome as BAIRRO, Ci.nome ||''-''|| Uf.sigla AS CIDADE, L.cep from contrato cc inner join imovel i on i.id_imovel = cc.id_imovel '+'inner join logradouro l on l.id_logradouro = i.id_logradouro inner join cidade ci on ci.id_cidade = l.id_cidade inner join uf on uf.id_sigla = l.id_sigla inner join bairro b on b.id_bairro = l.id_bairro '+'inner join pessoa_contrato pc on pc.id_contrato = cc.id_contrato inner join pessoa p on p.id_pessoa = pc.id_pessoa inner join endereco en on en.id_logradouro = l.id_logradouro where cc.ativo = ''SIM'' and ('+StringReplace(Registros,'E.','p.',[rfReplaceAll])+')');
          DM_REL.ZQUERY1.Open;
          DM_REL.RV_Query.DataSet := DM_REL.ZQUERY1;

          DM_REL.RV_IMPRESSAO.CLOSE;
          DM_REL.RV_IMPRESSAO.ProjectFile := ExtractFilePath(ParamStr(0))+'REL\RV_15_ETIQUETA_POLIFIX_25X66.rav';
          principal.setLogo(dm_rel.RV_IMPRESSAO);
          DM_REL.RV_IMPRESSAO.Open;

          DM_REL.RV_IMPRESSAO.Execute;

          sqlEtiqueta.Close;
          DM_REL.ZQUERY1.Close;
          
          end
          else
          begin

          DM_REL.ZQUERY1.SQL.Clear;
          DM_REL.ZQUERY1.SQL.Add('select nome, id_endereco_tipo, id_pessoa, RUA, numero, BAIRRO, CIDADE, cep from ('+
          'select first '+qtde+' '' '' as nome, 0 as id_endereco_tipo, 0 as id_pessoa, '' '' as RUA, '' '' as numero, '' '' as BAIRRO, '' '' as CIDADE, '' '' as cep from pessoa p UNION ALL '+
          ' select p.nome, en.id_endereco_tipo, p.id_pessoa, L.tipo||'' ''||L.nome as RUA, ''N° ''||en.numero||'' ''||coalesce(en.complemento,'''') as numero, ''Bairro ''||B.nome as BAIRRO, C.nome ||''-''|| U.sigla AS CIDADE, L.cep from pessoa p '+
          ' inner join endereco en on en.id_pessoa = p.id_pessoa '+
          ' inner join logradouro l on l.id_logradouro = en.id_logradouro '+
          ' inner join cidade c on c.id_cidade = l.id_cidade '+
          ' inner join bairro b on b.id_bairro = l.id_bairro '+
          ' inner join uf u on u.id_sigla = l.id_sigla where en.id_endereco_tipo = '+Escolha+' and en.maladireta = ''SIM'' and ('+Registros+') ) order by nome ');

          DM_REL.ZQUERY1.Open;
          DM_REL.RV_Query.DataSet := DM_REL.ZQUERY1;

          DM_REL.RV_IMPRESSAO.CLOSE;
          DM_REL.RV_IMPRESSAO.ProjectFile := ExtractFilePath(ParamStr(0))+'REL\RV_15_ETIQUETA_POLIFIX_25X66.rav';
          principal.setLogo(dm_rel.RV_IMPRESSAO);
          DM_REL.RV_IMPRESSAO.Open;

          DM_REL.RV_IMPRESSAO.Execute;

          sqlEtiqueta.Close;
          DM_REL.ZQUERY1.Close;
          end;

end;

procedure TCAD_Pessoa.EstrelaCheiaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  EstrelaVaziaMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TCAD_Pessoa.EstrelaVaziaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     EstrelaCheia.Width := X;

     if DM_CADASTRO.Z_Pessoa.Active AND NOT DM_CADASTRO.Z_PessoaID_PESSOA.IsNull then
     Begin
          DM_CADASTRO.Z_Pessoa.Edit;
          DM_CADASTRO.Z_PessoaNOTA.AsInteger := EstrelaCheia.Width;
     end;

     PRINCIPAL.setMensagem('Salve o registro para gravar no banco a alteração de avaliação.');
end;

procedure TCAD_Pessoa.Etiqueta1Click(Sender: TObject);
begin
  inherited;
   ShowMessage('Estudando proposta de implantação.');
end;

procedure TCAD_Pessoa.Etiqueta30254x667PolifixENDEREO1Click(Sender: TObject);
Var
   sqlEtiqueta: TZQuery;
   Escolha, Registros, qtde: String;
   I: Integer;
begin
     //ETIQUETA 30 BANCÁRIO

          if SelecaoPessoa.Count = 0 Then
          Begin
               ShowMessage('NENHUM REGISTRO SELECIONADO'+#13+'Faça a seleção dos registros com a tecla ALT no resultado da consulta.');
               Exit;
          end;

          qtde := Trim(InputBox('Quantidade de etiquetas à pular.','Quantas etiquetas em branco que o sistema deve pular?','0'));

          if not unUtilitario.verificaStringInt(qtde) then
          begin
               unUtilitario.setMensagem('Entre somente com o número de etiquetas que devem ser puladas!','erro');
               exit;
          end;

          sqlEtiqueta := TZQuery.Create(Self);
          sqlEtiqueta.Connection := PRINCIPAL.Conexao;

          For I := 0 to SelecaoPessoa.Count - 1 do
          Begin
              Registros := Registros + ' p.id_pessoa = ' + SelecaoPessoa.Strings[I];

              if I < SelecaoPessoa.Count -1 then
                 Registros := Registros + ' OR ';
          end;

          DM_REL.ZQUERY1.SQL.Clear;
          DM_REL.ZQUERY1.SQL.Add('SELECT nome, rua from(select first '+qtde+' '' '' as nome, '' '' as RUA from pessoa p UNION ALL '+
          ' select AIM as NOME, ICQ as RUA from pessoa p '+
          ' where '+Registros+') order by nome ');

          DM_REL.ZQUERY1.Open;
          DM_REL.RV_Query.DataSet := DM_REL.ZQUERY1;

          DM_REL.RV_IMPRESSAO.CLOSE;
          DM_REL.RV_IMPRESSAO.ProjectFile := ExtractFilePath(ParamStr(0))+'REL\RV_2_ETIQUETA_POLIFIX_25X66_BANCARIO.rav';
          principal.setLogo(dm_rel.RV_IMPRESSAO);
          DM_REL.RV_IMPRESSAO.Open;

          DM_REL.RV_IMPRESSAO.Execute;

          sqlEtiqueta.Close;
          FreeAndNil(sqlEtiqueta);
          DM_REL.ZQUERY1.Close;
end;

procedure TCAD_Pessoa.buscaIndividual(Codigo: Integer);
begin

     if Codigo > 0 then
     Begin
          Valor.Text := 'CODIGO '+IntToStr(Codigo);
          Pesquisar();

          if DM_CADASTRO.Z_Pessoa.RecordCount > 0 then
          Begin
               Tab_Informacoes.Show;
          end
          else
          Begin
               Tab_Pesquisa.Show;
          end;
     end
     else
     Begin
          Tab_Pesquisa.Show;
     end;

end;

end.
