unit FrmPainel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBCtrls, Mask, Buttons, jpeg, CategoryButtons, Shellapi, unConfiguracao;

type
  TPainel = class(TForm)
    Panel1: TPanel;
    LabelUsuario1: TLabel;
    ControladorAbas: TPageControl;
    ZQuery1: TZQuery;
    DSAgenda: TDataSource;
    ZQuery1ID_AGENDA: TIntegerField;
    ZQuery1ID_REMETENTE: TIntegerField;
    ZQuery1ID_DESTINATARIO: TIntegerField;
    ZQuery1IMPORTANCIA: TIntegerField;
    ZQuery1DATA_CAD: TDateTimeField;
    ZQuery1DATA_REF: TDateTimeField;
    ZQuery1MENSAGEM: TMemoField;
    ZQuery1ATIVO: TStringField;
    ZQuery1MSG: TStringField;
    ZQuery1NOME: TStringField;
    ZQuery1EMAIL: TStringField;
    Fundo_Menu: TImage;
    LabelUsuario2: TLabel;
    tabAdministracao: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ListaSaude: TListBox;
    BoxArquivoMorto: TGroupBox;
    Label3: TLabel;
    EditMortoCodigo: TEdit;
    ComboMortoCodigo: TComboBox;
    Label4: TLabel;
    Button1: TButton;
    BoxEstornarContas: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EditExtornoCodigo: TEdit;
    ComboExtornoCaixa: TComboBox;
    Button2: TButton;
    ListaArrumar: TMemo;
    BoxUsuarioAdmin: TGroupBox;
    Label9: TLabel;
    ComboBoxUsuarios: TComboBox;
    Button4: TButton;
    RadioSIM: TRadioButton;
    RadioNAO: TRadioButton;
    BoxSegundaVia: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditSegundaCodigo: TEdit;
    ComboSegundaCaixa: TComboBox;
    Button3: TButton;
    tabPermissao: TTabSheet;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    comboPermissaoUsuarios: TComboBox;
    comboPermissaoBloqueios: TComboBox;
    listaUsuarioBloqueio: TCategoryButtons;
    BitBtn1: TBitBtn;
    btnProcuraReciboSegundaVia: TButton;
    Label8: TLabel;
    Label10: TLabel;
    procedure btnProcuraReciboSegundaViaClick(Sender: TObject);
    procedure tabPermissaoShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListaSaudeClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBoxUsuariosChange(Sender: TObject);
    procedure tabAdministracaoShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Btn_Twitter_ExcluirClick(Sender: TObject);
    procedure tabTwitterHide(Sender: TObject);
    procedure tabAgendaHide(Sender: TObject);
    procedure Btn_Agenda_ExcluirClick(Sender: TObject);
    procedure tabAgendaShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    solucao: Array of String;
    procedure removerBloqueio(Sender: TObject);
    function procurarArquivo(diretorio, pesquisa: string; listaRetorno: TStringList): TStringList;
  end;

var
  Painel: TPainel;

implementation

uses FrmPrincipal, unINI, unUtilitario, unLog, unMsg, FrmDM_Cadastro,
  unCaixasSimples, FrmCaixasSimples, FrmDM_RELATORIOS;

{$R *.dfm}

procedure TPainel.Button1Click(Sender: TObject);
Var varSQL: TZQuery;
begin
     if unUtilitario.setMensagem('Deseja Recuperar o registro '+EditMortoCodigo.Text+' do arquivo morto?','confirma') = idYes then
     Begin
          if Length(Trim(EditMortoCodigo.Text)) = 0 then
          Begin
               unUtilitario.setMensagem('Entre com um código...','erro');
               exit;
          end;

          if NOT verificaStringInt(Trim(EditMortoCodigo.Text)) then
          Begin
               unUtilitario.setMensagem('Somente números são permitidos...','erro');
               exit;
          end;

          if Length(Trim(ComboMortoCodigo.Text)) = 0 then
          Begin
               unUtilitario.setMensagem('Entre com uma área...','erro');
               exit;
          end;

          if UpperCase(ComboMortoCodigo.Text) = 'IMÓVEIS' Then
             varSQL := unUtilitario.getSelect('select count(*) from imovel where id_imovel in ('+EditMortoCodigo.Text+')')
          else
          if UpperCase(ComboMortoCodigo.Text) = 'PESSOAS' Then
             varSQL := unUtilitario.getSelect('select count(*) from pessoa where id_pessoa in ('+EditMortoCodigo.Text+')')
          else
          if UpperCase(ComboMortoCodigo.Text) = 'CONTRATOS' Then
             varSQL := unUtilitario.getSelect('select count(*) from contrato where id_contrato in ('+EditMortoCodigo.Text+')')
          else
          if UpperCase(ComboMortoCodigo.Text) = 'CAIXA ENTRADA' Then
             varSQL := unUtilitario.getSelect('select count(*) from caixa_entrada where id_caixa in ('+EditMortoCodigo.Text+')')
          else
          if UpperCase(ComboMortoCodigo.Text) = 'CAIXA SAÍDA' Then
             varSQL := unUtilitario.getSelect('select count(*) from caixa_saida where id_caixa in ('+EditMortoCodigo.Text+')')
          else
              varSQL := unUtilitario.getSelect('select count(*) from usuario where id_usuario = 0');
             
          if varSQL.Fields[0].AsInteger = 0 then
          Begin
               unUtilitario.setMensagem('Não foi encontrato nenhum registro com o código '+EditMortoCodigo.Text+' na região de '+ComboMortoCodigo.Text,'erro');
               exit;
          end;

          if ComboMortoCodigo.Text = 'IMÓVEIS' Then
             varSQL := unUtilitario.getSQL('update imovel set ativo = ''SIM'' where id_imovel in ('+EditMortoCodigo.Text+')')
          else
          if ComboMortoCodigo.Text = 'PESSOAS' Then
             varSQL := unUtilitario.getSQL('update pessoa set ativo = ''SIM'' where id_pessoa in ('+EditMortoCodigo.Text+')')
          else
          if ComboMortoCodigo.Text = 'CONTRATOS' Then
             varSQL := unUtilitario.getSQL('update contrato set ativo = ''SIM'' where id_contrato in ('+EditMortoCodigo.Text+')')
          else
          if ComboMortoCodigo.Text = 'CAIXA ENTRADA' Then
             varSQL := unUtilitario.getSQL('update caixa_entrada set ativo = ''SIM'' where id_caixa in ('+EditMortoCodigo.Text+')')
          else
          if ComboMortoCodigo.Text = 'CAIXA SAÍDA' Then
             varSQL := unUtilitario.getSQL('update caixa_saida set ativo = ''SIM'' where id_caixa in ('+EditMortoCodigo.Text+')');

          unUtilitario.setMensagem('Ação de recuperação efetuada!'+#13+'Vá em seu respectivo formulário para verificar a recuperação.','informa');
          
          if varSQL <> nil then
             FreeAndNil(VarSQL);
     end;
     
end;

procedure TPainel.Button2Click(Sender: TObject);
Var varSQL: TZQuery;
begin
     if unUtilitario.setMensagem('Deseja estornar o registro '+EditExtornoCodigo.Text+' pago?','confirma') = idYes then
     Begin
          if Length(Trim(EditExtornoCodigo.Text)) = 0 then
          Begin
               unUtilitario.setMensagem('Entre com um ou mais códigos...','erro');
               exit;
          end;

          if Length(Trim(ComboExtornoCaixa.Text)) = 0 then
          Begin
               unUtilitario.setMensagem('Escolha um caixa...','erro');
               exit;
          end;

          if UpperCase(ComboExtornoCaixa.Text) = 'CAIXA ENTRADA' Then
             varSQL := unUtilitario.getSelect('select count(*) from caixa_entrada where id_caixa in ('+EditExtornoCodigo.Text+') and data_pgto is not null ')
          else
          if UpperCase(ComboExtornoCaixa.Text) = 'CAIXA SAÍDA' Then
             varSQL := unUtilitario.getSelect('select count(*) from caixa_saida where id_caixa in ('+EditExtornoCodigo.Text+') and data_pgto is not null ')
          else
              varSQL := unUtilitario.getSelect('select count(*) from usuario where id_usuario = 0');

          if varSQL.Fields[0].AsInteger = 0 then
          Begin
               unUtilitario.setMensagem('Não foi encontrato nenhum registro com o código '+EditExtornoCodigo.Text+' no '+ComboExtornoCaixa.Text+'. OU a conta não está quitada ainda.','erro');
               exit;
          end;

          if ComboExtornoCaixa.Text = 'CAIXA ENTRADA' Then
          Begin
               varSQL := unUtilitario.getSQL('update caixa_entrada set data_pgto = null, DATA_ALT = current_timestamp, anotacao = '' [ESTORNADA DT:'+DateToStr(Date+time)+' U:'+getUser('CODIGO_USUARIO')+' ]'' where id_caixa in ('+EditExtornoCodigo.Text+') and data_pgto is not null ');
               varSQL := unUtilitario.getSQL('delete from CAIXA_PGTO where id_caixa_entrada in ('+EditExtornoCodigo.Text+')');
          end
          else
          if ComboExtornoCaixa.Text = 'CAIXA SAÍDA' Then
          Begin
               varSQL := unUtilitario.getSQL('update caixa_saida set data_pgto = null, DATA_ALT = current_timestamp, anotacao = '' [ESTORNADA DT:'+DateToStr(Date+time)+' U:'+getUser('CODIGO_USUARIO')+' ]'' where id_caixa in ('+EditExtornoCodigo.Text+') and data_pgto is not null ');
               varSQL := unUtilitario.getSQL('delete from CAIXA_PGTO where id_caixa_saida in ('+EditExtornoCodigo.Text+')');
          end;

          //VOLTAR VALOR DO CAIXA SAÍDA PARA O VALOR PADRÃO DE CONTRATO QUANDO VOLTA O VALOR DO CAIXA ENTRADA.
          //if ComboExtornoCaixa.Text = 'CAIXA ENTRADA' Then
          //Begin
          //     varSQL := unUtilitario.getSQL('update caixa_saida cs set operacao = operacao || '' VOLTANDO CS POR ESTORNO DE CE N: '+EditExtornoCodigo.Text+''', valor = (select (valor * (100 - tarifa))/100 from contrato c where c.id_contrato = cs.id_contrato) where cs.id_caixa = (select first 1 max(cs.id_caixa) from caixa_saida cs where cs.ativo = ''SIM'' and cs.id_entrada in ('+EditExtornoCodigo.Text+'))');
          //     varSQL.ApplyUpdates;
          //end;

          unUtilitario.setMensagem('Ação de estorno efetuada!'+#13+'Vá no registro da conta para verificar o estorno.','informa');
          
          if varSQL <> nil then
             FreeAndNil(VarSQL);
     end;

end;

procedure TPainel.Button3Click(Sender: TObject);
begin
     if (Length(trim(EditSegundaCodigo.Text)) > 0) and (Length(trim(ComboSegundaCaixa.Text)) > 0) then
     Begin
          Application.CreateForm(TCAD_CaixasSimples, CAD_CaixasSimples);

          if ComboSegundaCaixa.Text = 'CAIXA ENTRADA' then
             CAD_CaixasSimples.whereEntrada := ' where c.id_caixa = '+EditSegundaCodigo.Text
          else
              CAD_CaixasSimples.whereSaida := ' where c.id_caixa = '+EditSegundaCodigo.Text;
              
          setInfoRecibo(StrToInt(EditSegundaCodigo.Text),StringReplace(ComboSegundaCaixa.Text,'CAIXA ','',[rfReplaceAll]),'CAD_CaixasSimples Painel',True);
          DM_RELATORIOS.Rave.Execute;
     end;
end;

procedure TPainel.Button4Click(Sender: TObject);
var varSQL: TZQuery;
begin

     if (Length(trim(ComboBoxUsuarios.Text))>0) and verificaStringInt(IntToStr(IDCampo(ComboBoxUsuarios.Text))) then
     if unUtilitario.setMensagem('Deseja salvar as configurações de ADMINISTRADOR de '+ComboBoxUsuarios.Text+'?','confirma') = IDYES then
     Begin
          if RadioSIM.Checked then
             varSQL := unUtilitario.getSQL('update usuario set administrador = ''SIM'' where id_usuario = '+IntToStr(IDCampo(ComboBoxUsuarios.Text)))
          else
              varSQL := unUtilitario.getSQL('update usuario set administrador = ''NAO'' where id_usuario = '+IntToStr(IDCampo(ComboBoxUsuarios.Text)));

     end;

     FreeAndNil(varSQL);
end;

function TPainel.procurarArquivo(diretorio, pesquisa: string; listaRetorno: TStringList): TStringList;
var 
    f: TSearchRec;
    r: integer;
begin
     if diretorio[length(diretorio)]<>'\' then
        diretorio := diretorio+'\';

     if not DirectoryExists(diretorio) then
     Begin
          unUtilitario.setMensagem('Não foi encontrado o diretório chamado PDF. Crie um em \\'+StringReplace(getConf('MAQUINA_SERVIDORA'),'_','',[rfReplaceAll,rfIgnoreCase])+'\IMOBILIARIA\REL\PDF','INFORMA');
          exit;
     end;

     r := FindFirst(diretorio+'*'+pesquisa+'*.PDF',faAnyFile,f);

     while (r=0) do
     begin
          r := FindNext(f);

          if (f.Name = '.') or (f.Name='..') then
             Continue;

          if f.Attr = fadirectory then
             procurarArquivo(diretorio+f.Name,pesquisa,listaRetorno) 
          else
          begin
               listaRetorno.Add(diretorio+f.Name);
          end;
     end;

     result := listaRetorno;
     // EDSON - alterar para retornar um tstringlist, depois abrir os pdf dessa lista
end;

procedure TPainel.ComboBoxUsuariosChange(Sender: TObject);
VAR varSQL: TZQuery;
begin

     if (Length(trim(ComboBoxUsuarios.Text))>0) and verificaStringInt(IntToStr(IDCampo(ComboBoxUsuarios.Text))) then
     Begin
          varSQL := unUtilitario.getSelect('select administrador from usuario where id_usuario = '+IntToStr(IDCampo(ComboBoxUsuarios.Text)));

          if varSQL.RecordCount = 1 then
          Begin
               if varSQL.FieldByName('administrador').AsString = 'SIM' then
                  RadioSIM.Checked := true
               else
                   RadioNAO.Checked := true;
          end;
          FreeAndNil(varSQL);          
     end
     else
     Begin
          RadioSIM.Checked := false;
          RadioNAO.Checked := false;
     end;
end;

procedure TPainel.Btn_Twitter_ExcluirClick(Sender: TObject);
begin
  if DM_CADASTRO.Z_AgendaID_AGENDA.IsNull then
     exit;

  If MessageDlg('Deseja excluir este registro do Twitter?',mtConfirmation, [mbYes,mbNo], 0) = mrYes Then
  Begin
       Try
          DM_CADASTRO.Z_Agenda.Edit;
          DM_CADASTRO.Z_Agenda.FieldByName('ATIVO').AsString := 'XXX';

          DM_CADASTRO.Z_Agenda.ApplyUpdates;
          DM_CADASTRO.Z_Agenda.Refresh;
          DM_CADASTRO.Z_Agenda.Edit;

          setLog(DM_CADASTRO.Z_Agenda.Fields[0].AsString, 'EXCLUSÃO', Self.Caption, DM_CADASTRO.Z_Agenda);
       Except
             DM_CADASTRO.Z_Agenda.Cancel;
             DM_CADASTRO.Z_Agenda.CancelUpdates;
             ShowMessage('Problemas ao Excluir o registro!');
       End;
  End;
end;

procedure TPainel.BitBtn1Click(Sender: TObject);
Var categoria: TButtonCategory;
    item: TButtonItem;
    varSQL: TZQuery;
    id: String;
begin

     if Length(Trim(comboPermissaoUsuarios.Text)) <= 0 then
     Begin
          unUtilitario.setMensagem('Favor escolher um usuário...','erro');
          comboPermissaoUsuarios.SetFocus;
          exit;
     end;

     if Length(Trim(comboPermissaoBloqueios.Text)) <= 0 then
     Begin
          unUtilitario.setMensagem('Favor escolher um bloqueio...','erro');
          comboPermissaoBloqueios.SetFocus;
          exit;
     end;

     id := IDCampoSTR(comboPermissaoUsuarios.Text);

     varSQL := unUtilitario.getSelect('select ID_TABELA from tabela where trim(nome) = '''+id+''' and obs = '''+comboPermissaoBloqueios.Text+''' ');

     if varSQL.RecordCount <= 0 then
     Begin
         try
            varSQL := unUtilitario.getSQL('insert into tabela (id_tabela, nome, obs) values (null, '''+id+''','''+Trim(comboPermissaoBloqueios.Text)+''')');
            PRINCIPAL.setMensagem('Bloqueio ao usuário '+comboPermissaoUsuarios.Text+' foi adicionado com sucesso!');
            comboPermissaoUsuarios.Text := '';
         except On e: Exception do
               unUtilitario.setMensagem('Ocorreu um erro ao tentar salvar o bloquio na base de dados:'+#13+e.Message,'erro');

         end;
         
         tabPermissaoShow(Sender);
     end;

     FreeAndNil(varSQL);
end;

procedure TPainel.removerBloqueio(Sender: TObject);
var
  item: TButtonItem;
  varSQL: TZQuery;
  id: integer;
begin
     try
        item := (Sender as TCategoryButtons).SelectedItem;

        If unUtilitario.setMensagem(item.Caption+#13+'Deseja remover o bloqueio do(a) usuário(a) '+item.Category.Caption+'?','confirma') = IDYES then
        Begin
             id := unUtilitario.IDCampo(item.Caption);
             varSQL := unUtilitario.getSQL('delete from tabela where id_tabela = '+IntToStr(id));
             (Sender as TCategoryButtons).SelectedItem.Destroy;
             FreeAndNil(varSQL);
             PRINCIPAL.setMensagem('Bloqueio retirado com sucesso!');
        end;
     Except
           on e: Exception do
              unUtilitario.setMensagem('Erro ao tentar remover o bloqueio!'+#13+'Tente fechar e abrir novamente a janela...'+#13+e.Message,'erro');
     end;
end;

procedure TPainel.btnProcuraReciboSegundaViaClick(Sender: TObject);
var lista: TStringList;
    I: Integer;
begin
     lista := TStringList.Create;

     if ComboSegundaCaixa.Text = 'CAIXA ENTRADA' then
     Begin
        lista := procurarArquivo('\\'+StringReplace(getConf('MAQUINA_SERVIDORA'),'_','',[rfReplaceAll,rfIgnoreCase])+'\imobiliaria\REL\pdf\', 'E'+Trim(EditSegundaCodigo.Text),lista);
        if lista.Count > 0 then
        begin
           for I := 0 to lista.Count - 1 do
           Begin
                ShellExecute(0, 'open', PAnsiChar(lista.Strings[I]), nil, nil, SW_SHOWNORMAL);
           end;
        end
        else
            unUtilitario.setMensagem('(Entrada) Não foi encontrado nenhum recibo salvo com este código.','INFORMA');
     end;

     if ComboSegundaCaixa.Text = 'CAIXA SAÍDA' then
     Begin
        lista := procurarArquivo('\\'+StringReplace(getConf('MAQUINA_SERVIDORA'),'_','',[rfReplaceAll,rfIgnoreCase])+'\imobiliaria\REL\pdf\', 'S'+Trim(EditSegundaCodigo.Text),lista);
        if lista.Count > 0 then
        begin
           for I := 0 to lista.Count - 1 do
           Begin
                ShellExecute(0, 'open', PAnsiChar(lista.Strings[I]), nil, nil, SW_SHOWNORMAL);
           end;
        end
        else
            unUtilitario.setMensagem('(Saída) Não foi encontrado nenhum recibo salvo com este código.','INFORMA');
     end;
end;

procedure TPainel.Btn_Agenda_ExcluirClick(Sender: TObject);
begin

  if DM_CADASTRO.Z_AgendaID_AGENDA.IsNull then
     exit;

  If MessageDlg('Deseja excluir este registro da Agenda?',mtConfirmation, [mbYes,mbNo], 0) = mrYes Then
  Begin
       Try
          DM_CADASTRO.Z_Agenda.Edit;
          DM_CADASTRO.Z_Agenda.FieldByName('ATIVO').AsString := 'XXX';

          DM_CADASTRO.Z_Agenda.ApplyUpdates;
          DM_CADASTRO.Z_Agenda.Refresh;
          DM_CADASTRO.Z_Agenda.Edit;

          setLog(DM_CADASTRO.Z_Agenda.Fields[0].AsString, 'EXCLUSÃO', Self.Caption, DM_CADASTRO.Z_Agenda);
       Except
             DM_CADASTRO.Z_Agenda.Cancel;
             DM_CADASTRO.Z_Agenda.CancelUpdates;
             ShowMessage('Problemas ao Excluir o registro de IPTU!');
       End;
  End;
end;

procedure TPainel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TPainel.FormCreate(Sender: TObject);
begin
     LabelUsuario1.Caption := 'Olá '+getUser('USUARIO')+', o seu código é '+getUser('CODIGO_USUARIO')+' e o seu e-mail é '+LowerCase(getUser('EMAIL'))+'.';
     LabelUsuario2.Caption := 'Registramos que sua máquina é a "'+LowerCase(getUser('MAQUINA'))+'". Bom trabalho!';

     ControladorAbas.TabIndex := 0;

     if not verificaPermissao('ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = PERMISSÕES DE USUÁRIOS') then
        tabPermissao.TabVisible := False;

     if not verificaPermissao('ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = PASSAR USUÁRIOS PARA ADMINISTRADORES') then
        BoxUsuarioAdmin.Visible := False;

     if not verificaPermissao('ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = RECUPERAR ARQUIVO MORTO') then
        BoxArquivoMorto.Visible := False;

     if not verificaPermissao('ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = GERAR SEGUNDA VIA DE CONTAS') then
        BoxSegundaVia.Visible := False;

     if not verificaPermissao('ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = ESTORNAR CONTAS') then
        BoxEstornarContas.Visible := False;

end;

procedure TPainel.ListaSaudeClick(Sender: TObject);
begin
     ListaArrumar.Clear;
     ListaArrumar.Text := solucao[IDCampo(ListaSaude.Items.Strings[ListaSaude.ItemIndex])];
     //ShowMessage(IntToStr(IDCampo(ListaSaude.Items.Strings[ListaSaude.ItemIndex])));
end;

procedure TPainel.tabAdministracaoShow(Sender: TObject);
Var VarSQL, varSQL2: TZQuery;
    contador: Smallint;
begin
     
     //Limpando componentes
     ListaSaude.Items.Clear;

     //Usuários administradores
     ComboBoxUsuarios.Items.Clear;
     comboPermissaoUsuarios.Items.Clear;

     solucao := nil;
     SetLength(solucao,100);
     contador := 0;

     VarSQL := unUtilitario.getSelect('select nome, id_usuario from usuario where ativo = ''SIM'' AND nome <> ''ADMINISTRADOR'' order by nome');
     ComboBoxUsuarios.Items.Add('');
     comboPermissaoUsuarios.Items.Add('');
     while not VarSQL.Eof do
     Begin
          ComboBoxUsuarios.Items.Add(VarSQL.FieldByName('NOME').AsString+'-'+VarSQL.FieldByName('ID_USUARIO').AsString);
          comboPermissaoUsuarios.Items.Add(VarSQL.FieldByName('NOME').AsString+'-'+VarSQL.FieldByName('ID_USUARIO').AsString);
          VarSQL.Next;
     end;

     if verificaPermissao('ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = SAÚDE DO SISTEMA') then
     if unUtilitario.setMensagem('Deseja realizar uma consulta sobre a saúde do sistema? (Este processo é muito demorado!)','confirma') = IDYES then
     Begin

     //SAÚDE DO SISTEMA -----------------

     //Pessoa sem nome
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_pessoa from pessoa where CHAR_LENGTH(trim(nome)) = 0 and ativo = ''SIM''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Pessoa sem nome = '+VarSQL.FieldByName('ID_PESSOA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Vá até o cadastro desta pessoa e informe um nome.';

     //Pessoa sem ativo
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select nome, id_pessoa from pessoa where CHAR_LENGTH(trim(ativo)) = 0 ');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Pessoa sem ativo SIM/NAO = '+VarSQL.FieldByName('NOME').AsString+'('+VarSQL.FieldByName('ID_PESSOA').AsString+')-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Vá até o cadastro desta pessoa e informe um status, se é ativo SIM ou NÃO.';

     //Pessoa sem funcionário
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select nome, id_pessoa from pessoa where ativo = ''SIM'' and alteracao_func is null');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Pessoa sem alteração de nenhum funcionário = '+VarSQL.FieldByName('NOME').AsString+'('+VarSQL.FieldByName('ID_PESSOA').AsString+')-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta pessoa está sem o LOG de alteração, ou seja, não foi monitorada por nenhum funcionário. Verifique os dados do registro em busca de alguma alteração suspeita.';

     //Caixa sem ativo
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_entrada where CHAR_LENGTH(trim(ativo)) = 0');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa entrada sem ativo SIM/NAO = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de entrada está sem o status ativo SIM ou NÃO, volte em seu cadastro e informe esta opção.';

     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_saida where CHAR_LENGTH(trim(ativo)) = 0');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa saida sem ativo SIM/NAO = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de saída está sem o status ativo SIM ou NÃO, volte em seu cadastro e informe esta opção.';

     //Caixa sem categoria
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_entrada where ativo = ''SIM'' and id_categoria not in (select id_caixa_sis from caixa_sis where tipo = ''CATEGORIA'' and ativo = ''SIM'')');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa entrada sem categoria definida/alterada = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de entrada está sem a categoria. Volte em seu registro e informe esta opção.';

     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_saida where ativo = ''SIM'' and id_categoria not in (select id_caixa_sis from caixa_sis where tipo = ''CATEGORIA'' and ativo = ''SIM'')');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa saída sem categoria definida/alterada = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de saída está sem a categoria. Volte em seu registro e informe esta opção.';

     //Caixa sem grupo
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_entrada where ativo = ''SIM'' and id_tipo not in (select id_caixa_sis from caixa_sis where tipo = ''GRUPO'' and ativo = ''SIM'')');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa entrada sem grupo definido/alterado = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de entrada está sem a grupo. Volte em seu registro e informe esta opção.';

     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_saida where ativo = ''SIM'' and id_tipo not in (select id_caixa_sis from caixa_sis where tipo = ''GRUPO'' and ativo = ''SIM'')');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa saida sem grupo definido/alterado = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de saída está sem a grupo. Volte em seu registro e informe esta opção.';

     //Caixa sem subgrupo
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_entrada where ativo = ''SIM'' and id_subtipo not in (select id_caixa_sis from caixa_sis where tipo = ''SUBGRUPO'' and ativo = ''SIM'')');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa entrada sem subgrupo definido/alterado = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de entrada está sem a subgrupo. Volte em seu registro e informe esta opção.';

     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_saida where ativo = ''SIM'' and id_subtipo not in (select id_caixa_sis from caixa_sis where tipo = ''SUBGRUPO'' and ativo = ''SIM'')');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa saida sem subgrupo definido/alterado = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de saída está sem a grupo. Volte em seu registro e informe esta opção.';

     //Caixa sem data de referencia definida
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_entrada where ativo = ''SIM'' and data_ref < ''01.01.2001''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa entrada com data de vencimento suspeita = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de entrada está com o seu vencimento anteriormente à 01/01/2001, ou seja, é suspeita de estar enganada.';

     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_saida where ativo = ''SIM'' and data_ref < ''01.01.2001''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa saída com data de vencimento suspeita = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de saída está com o seu vencimento anteriormente à 01/01/2001, ou seja, é suspeita de estar enganada.';

     //Conta sem pessoa
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_entrada where ativo = ''SIM'' and id_pessoa is null');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa entrada sem código de pessoa = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de entrada está sem o código de alguma pessoa, ou seja, sem uma pessoa, não se pode cobrar ninguém.';

     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_saida where ativo = ''SIM'' and id_pessoa is null');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa saida sem código de pessoa = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Esta conta de saída está sem o código de alguma pessoa, ou seja, sem uma pessoa, não se pode receber de ninguém.';

     //Conta com pessoa excluída
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_entrada where ativo = ''SIM'' and id_pessoa not in (select id_pessoa from pessoa)');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa entrada com pessoa excluída = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'A pessoa desta conta já não existe mais no sistema, ou seja, não é possível descobrir de quem receber esta conta.';

     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_caixa from caixa_saida where ativo = ''SIM'' and id_pessoa not in (select id_pessoa from pessoa)');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Caixa saida com pessoa excluída = '+VarSQL.FieldByName('ID_CAIXA').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'A pessoa desta conta já não existe mais no sistema, ou seja, não é possível descobrir quem deve pagar à imobiliária.';

     //CONTRATOS ---------------

     //Contratos com valor = 0
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where valor = 0 and ativo = ''SIM''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato com valor 0 = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Volte neste contrato e informe um valor a ele.';

     //Contratos com data suspeita
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where VENCIMENTO <= ''01.01.2000'' and ativo = ''SIM''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato com data de venvimento suspeita = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Contrato com data de vencimento antes de 01/01/2000, ou seja, data suspeita de ser um contrato fantasma. Volte e verifique a data ou exclua este contrato.';

     //Contratos sem valor de taxa
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where (tarifa = 0 or tarifa is null) and tipo_contrato = ''LOCAÇÃO'' and ativo = ''SIM''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato de locação sem valor te taxa = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Volte neste contrato e informe uma taxa a ser cobrada do inquilino. Se caso não tiver taxa mesmo, desconsiderar este recado.';

     //Contratos sem valor de multa
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where (multa = 0 or multa is null) and tipo_contrato = ''LOCAÇÃO'' and ativo = ''SIM''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato de locação sem valor te multa = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Volte neste contrato e informe um valor de multa a ser cobrado do inquilino. Se caso não tiver taxa mesmo, desconsiderar este recado.';

     //Contratos sem valor de juros
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where (multa_mora = 0 or multa_mora is null) and tipo_contrato = ''LOCAÇÃO'' and ativo = ''SIM''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato de locação sem valor te juros = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Volte neste contrato e informe um valor de juros ao dia a ser cobrado do inquilino. Se caso não tiver taxa mesmo, desconsiderar este recado.';

     //Contratos sem valor de repasse
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where (honorario_repasse = 0 or honorario_repasse is null or honorario_repasse > 31) and tipo_contrato = ''LOCAÇÃO'' and ativo = ''SIM''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato de locação com valor de repasse suspeito = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'O dia do repasse está suspeito, pois é 0 ou maior que 31...Volte no contrato e verifique este campo, assim como confirmar no financeiro a data usada.';

     //Contratos sem valor de ativo
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where CHAR_LENGTH(trim(ativo)) = 0');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato sem ativo SIM/NAO  = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'O dia do repasse ao proprietário está suspeito, pois é 0 ou maior que 31...Volte no contrato e verifique este campo, assim como confirmar no financeiro a data usada.';

     //Contratos sem finalidade
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where ativo <> ''XXX'' and CHAR_LENGTH(trim(finalidade)) = 0');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato sem finalidade  = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Volte no formulário de contratos, e verifique esta opção.';

     //Contratos terminando
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where ativo = ''SIM'' and current_date between (vencimento + (vigencia*22)) and (vencimento + ((vigencia-1)*30))');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato próximo do término  = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Este contrato está próximo da sua data final. Preste atenção à sua renovação.';

     //Contratos renovação
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select distinct(id_contrato) from caixa_entrada ce where ( parcela = 12 or parcela = 24 or parcela = 36 or'+' parcela = 48 or parcela = 60 or parcela = 72 or parcela = 84 or parcela = 96 '+'or parcela = 108 or parcela = 120 or parcela = 132 or parcela = 144 ) and ativo = ''SIM'' and data_ref between current_date - 30 and current_date + 30 and not data_ref = (select max(data_ref) from caixa_entrada where id_contrato = ce.id_contrato)');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato próximo de renovação = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Conforme a sua parcela, este contrato está próximo de ser renovado.';

                        
     //Contratos contrato vencido
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select id_contrato from contrato where vencimento + (vigencia*30) <= current_date and ativo = ''SIM''');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato vencido = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Este contrato já está vencido ou próximo de vencer com base na data atual ('+DateToStr(date())+').';

     //Contratos contrato com criada e que não está em sincronia
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select distinct(id_contrato) from contrato c where not (vencimento + (vigencia*30)) between (select max(data_ref - 30) from caixa_entrada where c.id_contrato = id_contrato and ativo = ''SIM'' and id_subtipo = 3) and (select max(data_ref + 30) from'+' caixa_entrada where c.id_contrato = id_contrato and ativo = ''SIM'' and id_subtipo = 3) and ativo = ''SIM'' and tipo_contrato = ''LOCAÇÃO'''); 
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato com conta de entrada diferente do seu vencimento real = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Verifique a data final deste contrato, pois não está batendo com o vencimento da última parcela do caixa entrada desde contrato.';

     //Contratos com valor médio diferente das suas contas
     contador := contador + 1;
     VarSQL := unUtilitario.getSelect('select c.id_contrato from contrato c where c.ativo = ''SIM'' and not c.valor between (select avg(ce.valor) from caixa_entrada ce where ce.id_subtipo = 3 and ce.ativo = ''SIM'' and ce.data_pgto is null and ce.id_contrato = c.id_contrato) - 100 and'+' (select avg(ce.valor) from caixa_entrada ce where ce.id_subtipo = 3 and ce.ativo = ''SIM'' and ce.data_pgto is null and ce.id_contrato = c.id_contrato) + 100');
     while not VarSQL.Eof do
     Begin
          ListaSaude.Items.Add('Contrato com valor diferente da média cobrada no caixa entrada = '+VarSQL.FieldByName('ID_CONTRATO').AsString+'-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     solucao[contador] := 'Verifique no contrato pelo valor de recebimento, pois ele está diferente da média das contas mensais encontradas.';


     //Data errada do servidor  - ALTERAR ESSE MÉTODO!
     TRY
     contador := contador + 1;
     conectaMySQL(mysqlImoveisBanco, mysqlImoveisServidor, mysqlImoveisUsuario, mysqlImoveisSenha);
     VarSQL2 := TZQuery.Create(self);
     VarSQL2.Connection := PRINCIPAL.MySQL;
     VarSQL2.SQL.Add('SELECT CURDATE() AS DATA');
     VarSQL2.Open;
     VarSQL := unUtilitario.getSelect('select current_date AS DATA from RDB$DATABASE');
     
     if VarSQL2.FieldByName('DATA').AsDateTime <> VarSQL.FieldByName('DATA').AsDateTime then
     Begin
          ListaSaude.Items.Add('Servidor com data errada! ('+VarSQL.Fields[0].AsString+')-'+IntToStr(contador));
          VarSQL.Next;
     end;
     VarSQL.Close;
     VarSQL2.Close;
     PRINCIPAL.MySQL.Disconnect;
     solucao[contador] := 'URGENTE! Altere a data do relógio da máquina Windows servidora do sistema! A máquina configurada é esta: '+getUser('SERVIDOR')+' / '+getUser('SERVIDOR');

     except
           contador := contador + 1;
           ListaSaude.Items.Add('Computador sem conexão com internet!-'+IntToStr(contador));
           solucao[contador] := 'Configure a conexão com a internet deste computador. (Se caso estiver conectado, e ainda mostrando este recado, entre em contato com a Célula Digital.)';
     end;
     end;
     PRINCIPAL.setMensagem('Esta é a área onde você pode verificar o andamento do sistema, assim como usar alguns recursos importantes para arrumar o seu sistema.');
     FreeAndNil(varSQL);
     FreeAndNil(varSQL2);
end;

procedure TPainel.tabAgendaHide(Sender: TObject);
begin
     DM_CADASTRO.Z_Agenda.Close;
end;

procedure TPainel.tabAgendaShow(Sender: TObject);
begin
     DM_CADASTRO.Z_Agenda.SQL.Clear;
     DM_CADASTRO.Z_Agenda.SQL.Add('select a.*, CAST(substring(A.mensagem FROM 1 FOR 100) as Varchar(100)) AS MSG, u.nome, u.email from agenda a left join usuario u on u.id_usuario = a.id_destinatario WHERE a.importancia in (100, 200, 300)'+' AND a.ativo <> ''XXX'' AND a.id_remetente = '+getUser('CODIGO_USUARIO')+' order by a.data_ref desc');
     DM_CADASTRO.Z_Agenda.Open;

     DM_CADASTRO.Z_Agenda.Edit;
     DSAgenda.DataSet := DM_CADASTRO.Z_Agenda;

     PRINCIPAL.setMensagem('Esta é sua agenda de compromissos. Ela é somente visível à você.');
end;

procedure TPainel.tabPermissaoShow(Sender: TObject);
var varSQL: TZQuery;
    i: Smallint;
    categoria: TButtonCategory;
    item: TButtonItem;
begin

     listaUsuarioBloqueio.Categories.Clear;

     for I := comboPermissaoUsuarios.Items.Count - 1 downto  1 do
     Begin
          categoria := TButtonCategory.Create(listaUsuarioBloqueio.Categories);
          categoria.Caption := comboPermissaoUsuarios.Items.Strings[i];

          varSQL := unUtilitario.getSelect('select OBS||''-''||ID_TABELA as BLOQUEIO from tabela where trim(nome) = '''+IDCampoSTR(comboPermissaoUsuarios.Items.Strings[i])+''' order by obs desc');

          while not varSQL.Eof do
          Begin
               item := TButtonItem.Create(categoria.Items);
               item.Caption := varSQL.FieldByName('BLOQUEIO').asString;
               item.OnClick := removerBloqueio;

               categoria.Items.AddItem(item, 0);
               varsql.Next;
          end;

          listaUsuarioBloqueio.Categories.AddItem(categoria,0);
     end;
     
     FreeAndNil(varSQL);
end;

procedure TPainel.tabTwitterHide(Sender: TObject);
begin
     DM_CADASTRO.Z_Agenda.Close;
end;

end.
