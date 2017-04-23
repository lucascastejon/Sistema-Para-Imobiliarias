unit FrmCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmMatriz, DB, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  jpeg, DBCtrls, Mask, ZAbstractRODataset, ZAbstractDataset, ZDataset, unConfiguracao;

type
  TCAD_Cheques = class(TCAD_MATRIZ)
    DsVinculo: TDataSource;
    ZVinculoContas: TZQuery;
    GroupBox2: TGroupBox;
    Label88: TLabel;
    chequeBanco: TDBComboBox;
    chequeAgencia: TDBComboBox;
    Label89: TLabel;
    chequeConta: TDBEdit;
    Label90: TLabel;
    chequeNumero: TDBEdit;
    Label91: TLabel;
    chequeValor: TDBEdit;
    Label101: TLabel;
    chequeEmissao: TDBEdit;
    Label103: TLabel;
    chequeAnotacoes: TDBEdit;
    Label102: TLabel;
    GroupBox3: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    ZVinculoContasID_CONTA_CHEQUE: TIntegerField;
    ZVinculoContasID_CHEQUE: TIntegerField;
    ZVinculoContasID_CONTA: TIntegerField;
    ZVinculoContasOPERACAO: TStringField;
    ZVinculoContasID_FUNCIONARIO: TIntegerField;
    ZVinculoContasOBS: TStringField;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Valor_Tipo: TComboBox;
    Label3: TLabel;
    LabelDatas: TLabel;
    DBEdit3: TDBEdit;
    procedure Grid_BuscaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure LabelDatasClick(Sender: TObject);
    procedure chequeNomeDblClick(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Grid_BuscaDblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Tab_InformacoesShow(Sender: TObject);
    procedure Btn_Endereco_EnderecoClick(Sender: TObject);
    procedure DBEdit2DblClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure CamposSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Valor_AtivoClick(Sender: TObject);
    procedure DBdata_baixaDblClick(Sender: TObject);
    procedure DBdata_refDblClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
  private
    procedure quitar();
    { Private declarations }
  public
    { Public declarations }
    procedure ApagarContaCheque(codigo: integer);
    procedure Pesquisar();

  end;

var
  CAD_Cheques: TCAD_Cheques;
  baixado: Boolean;

implementation

uses FrmDM_FINANCEIRO, FrmPrincipal, unCamposBusca, unMsg, unValidacao, FrmPessoa,
  FrmDM_Cadastro, unINI, unUtilitario, FrmCaixas;

{$R *.dfm}

procedure TCAD_Cheques.Pesquisar();
Var quantidadeFiltros, i: integer;
    tamanhoString: Smallint;
    BUSCA_VALOR, troca: string;
    Where: string;
begin

     //Trata completamente a string, removendo caracteres especiais e trocando palavras
    BUSCA_VALOR := tratarBusca(Valor.Text);

    if BUSCA_VALOR = 'false' then
       exit;

    //Ver qual é a quantidade de filtros usadas para refinar a busca
    quantidadeFiltros := contarPalavras(BUSCA_VALOR, 'AND') + contarPalavras(BUSCA_VALOR, 'OR');

    TamanhoString := Length(BUSCA_VALOR); //Verifica se foi alterado ou não

    //Trocar as palavras e elaborar a SQL
    for i := 0 to quantidadeFiltros do
    Begin
         If (Pos('C.ID_CHEQUE',BUSCA_VALOR) = 0) AND ((Pos('CODIGO ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' C.ID_CHEQUE = ';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'CODIGO', troca,[rfReplaceAll]);
         end
         else
         If (Pos('C.ID_FUNCIONARIO',BUSCA_VALOR) = 0) AND ((Pos('FUNCIONARIO ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' C.ID_FUNCIONARIO = ';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'USUARIO', troca,[rfReplaceAll]);
         end
         else
         If (Pos('TUDO',BUSCA_VALOR) <> 0) OR (Pos('TODOS',BUSCA_VALOR) <> 0) OR (Pos('TODO',BUSCA_VALOR) <> 0) then
         Begin
              BUSCA_VALOR := ' CURRENT_DATE = CURRENT_DATE '; //Só para passar sem parâmetros mesmo...
         end
         else
         If (Pos('Soundex(P.NOME) LIKE',BUSCA_VALOR) = 0) AND ((Pos('NOME ',BUSCA_VALOR) <> 0) OR (Pos('NOMES ',BUSCA_VALOR) <> 0)) then
         Begin
              troca := ' (Mv_Soundex(P.NOME) LIKE ''%''||Mv_Soundex(''';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'NOME ', troca,[rfReplaceAll]);
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'NOMES ', troca,[rfReplaceAll]);
              BUSCA_VALOR := descobrirPalavra(troca, BUSCA_VALOR);
         end
         else
         If (Pos('(C.NUM_CHEQUE like',BUSCA_VALOR) = 0) AND (Pos('CHEQUE ',BUSCA_VALOR) <> 0) then
         Begin
              troca := ' (C.NUM_CHEQUE like ''%''||TRIM(''';
              BUSCA_VALOR := StringReplace(BUSCA_VALOR, 'CHEQUE ', troca,[rfReplaceAll]);
              BUSCA_VALOR := descobrirPalavra(troca, BUSCA_VALOR);
         end;
    end;

    if (Length(BUSCA_VALOR) = TamanhoString) then
    Begin
              BUSCA_VALOR := ' ( '+
              ' C.NOME LIKE ''%'+BUSCA_VALOR+'%'' or'+
              ' C.BANCO LIKE ''%'+BUSCA_VALOR+'%'' or'+
              ' C.AGENCIA LIKE ''%'+BUSCA_VALOR+'%'' or'+
              ' C.CC LIKE ''%'+BUSCA_VALOR+'%'' or'+
              ' C.OBS LIKE ''%'+BUSCA_VALOR+'%'' or'+
              ' C.ID_CHEQUE LIKE '''+BUSCA_VALOR+''' or'+
              ' C.NUM_CHEQUE LIKE ''%'+BUSCA_VALOR+'%'' ) ';
    end;

    //BUSCA DOS COMPONENTES VISUAIS
    if Valor_Ativo.State <> cbGrayed Then
    If Valor_Ativo.Checked Then
       BUSCA_VALOR := BUSCA_VALOR +  ' AND (C.ativo = ''SIM'') '
    else
        BUSCA_VALOR := BUSCA_VALOR + ' AND (C.ativo = ''NAO'') ';

    if Length(Trim(Valor_Tipo.Text)) > 0 then
    Begin
         if Valor_Tipo.Text = 'COMPENSADOS' then
            BUSCA_VALOR := BUSCA_VALOR + ' AND (C.DATA_BAIXA is not null) '
         else
         if Valor_Tipo.Text = 'NÃO COMPENSADOS' then
            BUSCA_VALOR := BUSCA_VALOR + ' AND (C.DATA_BAIXA is null) '
         else
         if Valor_Tipo.Text = 'SEM REFERÊNCIA' then
            BUSCA_VALOR := BUSCA_VALOR + ' AND (C.DATA_BAIXA is null) ';

    end;

    if LabelDatas.Caption <> 'Não usar datas' then
    Begin
         if LabelDatas.Caption = 'Procurar por data de cadastro' then
            BUSCA_VALOR := BUSCA_VALOR + ' AND (C.DATA_ENTRADA between '''+formataDataSQL(DateToStr(Data_Menor.date))+''' and '''+formataDataSQL(DateToStr(Data_Maior.date))+''') '
         else
         if LabelDatas.Caption = 'Procurar por data de referência' then
            BUSCA_VALOR := BUSCA_VALOR + ' AND (C.DATA_REF between '''+formataDataSQL(DateToStr(Data_Menor.date))+''' and '''+formataDataSQL(DateToStr(Data_Maior.date))+''') '
         else
         if LabelDatas.Caption = 'Procurar por data de compensação' then
            BUSCA_VALOR := BUSCA_VALOR + ' AND (C.DATA_BAIXA between '''+formataDataSQL(DateToStr(Data_Menor.date))+''' and '''+formataDataSQL(DateToStr(Data_Maior.date))+''') ';
    end;

    finalizaPesquisa('select c.*, ''NADA'' as nome_normal, ''NADA'' as nome_fantasia from cheque c where C.ATIVO <> ''XXX'' AND '+BUSCA_VALOR);
end;


procedure TCAD_Cheques.FormCreate(Sender: TObject);
begin
  inherited;

  Data_Maior.Date := Date;
  Data_Menor.Date := Date;

  DS.DataSet := DM_FINANCEIRO.ZCheque;

end;

procedure TCAD_Cheques.CamposSelect(Sender: TObject);
Var Cod: Integer;
begin
  inherited;
{
  Campos.Items.Add(unCamposBusca.CAMPOS(1)); //Código
  Campos.Items.Add(unCamposBusca.CAMPOS(2)); //Nome
  Campos.Items.Add(unCamposBusca.CAMPOS(3)); //Data
  Campos.Items.Add(unCamposBusca.CAMPOS(24)); //Valor
  Campos.Items.Add(unCamposBusca.CAMPOS(48)); //Número do Cheque
  Campos.Items.Add(unCamposBusca.CAMPOS(49)); //Número da Conta
}
// Cod := unCamposBusca.IDCampo(Campos.Text);

 Valor.Visible := False;
 Valor_Ativo.Visible := False;
 Valor.MaxLength := 0;
 Data_Maior.Visible := False;
 Data_Menor.Visible := False;
end;

procedure TCAD_Cheques.chequeNomeDblClick(Sender: TObject);
begin
  inherited;
      if NOT DM_FINANCEIRO.ZChequeID_PESSOA.IsNull then
       unCamposBusca.buscaIndividual(3,DM_FINANCEIRO.ZChequeID_PESSOA.AsInteger,TCAD_Pessoa,self);

end;



procedure TCAD_Cheques.Grid_BuscaDblClick(Sender: TObject);
begin
  inherited;
  Tab_InformacoesShow(Sender);
end;

procedure TCAD_Cheques.Grid_BuscaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  IF (COLUMN.Title.CAPTION = 'Código') THEN
    if (DS.DataSet.FieldByName('ATIVO').AsString = 'NAO') THEN
      begin
        Grid_Busca.Canvas.Brush.Color:= clMaroon;
        Grid_Busca.Canvas.Font.Color:= clWindowText;
        Grid_Busca.Canvas.Font.Style := Grid_Busca.Canvas.Font.Style + [fsBold];
        Grid_Busca.Canvas.FillRect(Rect);
        Grid_Busca.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
    ELSE if (DS.DataSet.FieldByName('ATIVO').AsString = 'SIM') THEN
      begin
        Grid_Busca.Canvas.Brush.Color:= clGray;
        Grid_Busca.Canvas.Font.Color:= clWindow;
        Grid_Busca.Canvas.Font.Style := Grid_Busca.Canvas.Font.Style + [fsBold];
        Grid_Busca.Canvas.FillRect(Rect);
        Grid_Busca.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
end;

procedure TCAD_Cheques.LabelDatasClick(Sender: TObject);
begin
  inherited;

  if UpperCase(LabelDatas.Caption) = UpperCase('Não usar datas') Then
  Begin
       LabelDatas.Caption := 'Procurar por data de cadastro';
       exit;
  end;

  if UpperCase(LabelDatas.Caption) = UpperCase('Procurar por data de cadastro') Then
  Begin
       LabelDatas.Caption := 'Procurar por data de referência';
       exit;
  end;

  if UpperCase(LabelDatas.Caption) = UpperCase('Procurar por data de referência') Then
  Begin
       LabelDatas.Caption := 'Procurar por data de compensação';
       exit;
  end;

  if UpperCase(LabelDatas.Caption) = UpperCase('Procurar por data de compensação') Then
  Begin
       LabelDatas.Caption := 'Não usar datas';
       exit;
  end;

end;

procedure TCAD_Cheques.quitar;
begin
  dm_financeiro.ZCheque.fieldbyname('DATA_BAIXA').AsString := dateTOSTR(NOW);
  dm_financeiro.ZCheque.FieldByName('id_funcionario').AsString := getUser('CODIGO_USUARIO');
  dm_financeiro.ZCheque.FieldByName('ativo').AsString := 'NAO';
end;

procedure TCAD_Cheques.Btn_Endereco_EnderecoClick(Sender: TObject);
begin
  inherited;
   PRINCIPAL.CriarForm(TCAD_Pessoa, self, '1');
end;

procedure TCAD_Cheques.Btn_ExcluirClick(Sender: TObject);
begin
       dm_financeiro.ZCheque.FieldByName('ID_FUNCIONARIO').AsString := getUser('CODIGO_USUARIO');
       inherited;

end;

procedure TCAD_Cheques.Btn_GravarClick(Sender: TObject);
begin

     if NOT ds.DataSet.Active then
        Exit;

     dm_financeiro.ZCheque.FieldByName('ID_FUNCIONARIO').AsString := getUser('CODIGO_USUARIO');

  inherited;

end;

procedure TCAD_Cheques.Btn_NovoClick(Sender: TObject);
begin
     inherited;
     principal.setID(dm_financeiro.ZCheque, 'ID_CHEQUE', 'CHEQUE');
     dm_financeiro.ZCheque.FieldByName('DATA_ENTRADA').AsString := DATETOSTR(NOW);
     dm_financeiro.ZCheque.FieldByName('data_ref').AsString := datetostr(now);
     dm_financeiro.ZCheque.FieldByName('ATIVO').AsString := 'SIM';
     DM_FINANCEIRO.ZChequeDATA_REF.FocusControl;
end;

procedure TCAD_Cheques.Tab_InformacoesShow(Sender: TObject);
var varSQL: TZQuery;
begin
     varSQL := unUtilitario.getSelect('select distinct(banco) from cheque where ativo = ''SIM'' order by banco');

     chequeBanco.Items.Clear;

     while not varSQL.Eof do
     Begin
          chequeBanco.Items.Add(varSQL.Fields[0].AsString);
          varSQL.Next;
     end;

     varSQL := unUtilitario.getSelect('select distinct(agencia) from cheque where ativo = ''SIM'' order by agencia');

     chequeAgencia.Items.Clear;

     while not varSQL.Eof do
     Begin
          chequeAgencia.Items.Add(varSQL.Fields[0].AsString);
          varSQL.Next;
     end;

     if NOT DM_FINANCEIRO.ZChequeID_PESSOA.IsNull then
     Begin
          varSQL := unUtilitario.getSelect('select p.nome, case when p.cpf_cnpj is null then ''SEM CPF/CNPJ'' else p.cpf_cnpj end as CPF, case when p.rg_ie is null then ''SEM RG/IE'' else p.rg_ie end as RG  from pessoa p where p.id_pessoa = '+ DM_FINANCEIRO.ZChequeID_PESSOA.AsString);
     end;

     ZVinculoContas.Close;
     ZVinculoContas.SQL.Clear;

     if DM_FINANCEIRO.ZChequeID_CHEQUE.IsNull then
        ZVinculoContas.SQL.Add('select cc.* from conta_cheque cc where cc.id_cheque = 0')
     Else
         ZVinculoContas.SQL.Add('select cc.* from conta_cheque cc where cc.id_cheque = '+DM_FINANCEIRO.ZChequeID_CHEQUE.AsString);

     ZVinculoContas.Open;

     FreeAndNil(varSQL);
end;

procedure TCAD_Cheques.Valor_AtivoClick(Sender: TObject);
begin
  inherited;
  if valor_ativo.State = cbChecked then
    valor_ativo.Caption := 'Quitados'
  else if valor_ativo.state = cbUnchecked then
    valor_ativo.Caption := 'Não Quitados'
  else IF valor_ativo.state = cbGrayed then
    valor_ativo.Caption := 'Todos';
  
end;

procedure TCAD_Cheques.ApagarContaCheque(codigo: Integer);
begin
    with dm_financeiro do
      begin
        ZQAux.Close;
        ZQAux.sql.Clear;
        zqaux.SQL.Add('delete from conta_cheque where id_conta_cheque = ' + inttostr(codigo) + '');
        try
          zqaux.ExecSQL;
          zqaux.ApplyUpdates;
        except
          application.MessageBox('Não foi possível excluir o registro!','Aviso '+celulaNome,mb_ok);
        end;

        ZqContaCheque.Close;
      end;
end;

procedure TCAD_Cheques.BitBtn1Click(Sender: TObject);
begin
  inherited;
  PRINCIPAL.CriarForm(TCAD_Pessoa, self, '1');
end;

procedure TCAD_Cheques.DBEdit2DblClick(Sender: TObject);
begin
  inherited;

    if not DS.DataSet.FieldByName('ID_PESSOA').IsNull then
       unCamposBusca.buscaIndividual(5,DS.DataSet.FieldByName('ID_PESSOA').Value,TCAD_Pessoa,self);

end;

procedure TCAD_Cheques.DBdata_baixaDblClick(Sender: TObject);
begin
  dm_financeiro.ZCheque.fieldbyname('DATA_BAIXA').AsString := dateTOSTR(NOW);
end;

procedure TCAD_Cheques.DBdata_refDblClick(Sender: TObject);
begin
  dm_financeiro.ZCheque.fieldbyname('DATA_REF').AsString := dateTOSTR(NOW);
end;

procedure TCAD_Cheques.DBEdit4Exit(Sender: TObject);
begin
{  inherited;

  If MessageDlg('Deseja efetuar a busca por esse código ('+ DM_FINANCEIRO.ZChequeID_CONTAS_ENTADA.AsString +')?', mtConfirmation, [mbYes,mbNo],0) = mrYes Then
  Begin
       Escolha := InputBox('Qual tipo de caixa você deseja abrir?','1 - Caixa Entrada. (Contas à Receber)'+#13+'2 - Caixa Saída. (Contas à Pagar)','');

       SQL := TZQuery.Create(SELF);
       SQL.Connection := PRINCIPAL.Conexao;

       If Escolha = '1' Then
       Begin
            SQL.SQL.Add('select CE.id_contas_entada, CE.documento, CE.data_ref, CE.obs, CE.valor, CE.OPERACAO from conta_entrada CE where ID_CONTAS_ENTADA = ' + DM_FINANCEIRO.ZChequeID_CONTAS_ENTADA.AsString);
            SQL.Open;

            Edit_Documento.Text := SQL.FieldByName('DOCUMENTO').AsString;
            Edit_Operacao.Text := SQL.FieldByName('OPERACAO').AsString;
            Edit_Obs.Text := SQL.FieldByName('OBS').AsString;
            Edit_Data.Text := SQL.FieldByName('DATA_REF').AsString;
            Edit_Valor.Text := floattostrf(SQL.FieldByName('VALOR').AsFloat,ffCurrency,18,2);

            DM_FINANCEIRO.ZChequeOBS.Value := 'VINCULADO AO CONTAS À RECEBER.';

       End;

       If Escolha = '2' Then
       Begin
            SQL.SQL.Add('select CE.id_contas_entada, CE.documento, CE.data_ref, CE.obs, CE.valor, CE.OPERACAO from conta_saida CE where ID_CONTAS_ENTADA = ' + DM_FINANCEIRO.ZChequeID_CONTAS_ENTADA.AsString);
            SQL.Open;

            Edit_Documento.Text := SQL.FieldByName('DOCUMENTO').AsString;
            Edit_Operacao.Text := SQL.FieldByName('OPERACAO').AsString;
            Edit_Obs.Text := SQL.FieldByName('OBS').AsString;
            Edit_Data.Text := SQL.FieldByName('DATA_REF').AsString;
            Edit_Valor.Text := floattostrf(SQL.FieldByName('VALOR').AsFloat,ffCurrency,18,2);

            DM_FINANCEIRO.ZChequeOBS.Value := 'VINCULADO AO CONTAS À PAGAR.';
       End;

       SQL.Close;
       SQL.Free;

  End;


end;

procedure TCAD_Cheques.Tab_CadastroShow(Sender: TObject);
begin
  inherited;
  Tab_InformacoesShow(Sender);
end;

procedure TCAD_Cheques.Valor_AtivoClick(Sender: TObject);
begin
  inherited;
 if Valor_Ativo.Checked Then
    Valor_Ativo.Caption := 'Pago.'
 else
     Valor_Ativo.Caption := 'Não Pago.';
}
end;

procedure TCAD_Cheques.DBGrid1DblClick(Sender: TObject);
begin
     if not DS.DataSet.Active Then
        Exit;

     if not ZVinculoContasID_CONTA.IsNull then
        if UpperCase(ZVinculoContasOPERACAO.AsString) = 'ENT' then
           unCamposBusca.buscaIndividual(1,ZVinculoContasID_CONTA.AsInteger,TCAD_Caixas,self)
        else
            unCamposBusca.buscaIndividual(2,ZVinculoContasID_CONTA.AsInteger,TCAD_Caixas,self);

end;


end.
