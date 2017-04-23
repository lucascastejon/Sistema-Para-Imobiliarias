unit FrmMatriz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, ComCtrls, Grids, DBGrids, DB,
  DBCtrls, ZDataset, Mask, ZAbstractRODataset, ZAbstractDataset;

type
  TCAD_MATRIZ = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Btn_Esquerda: TBitBtn;
    Btn_Direita: TBitBtn;
    Btn_Novo: TBitBtn;
    Btn_Excluir: TBitBtn;
    Btn_Gravar: TBitBtn;
    Btn_Cancelar: TBitBtn;
    Btn_Fechar: TBitBtn;
    PageControl1: TPageControl;
    Tab_Pesquisa: TTabSheet;
    Tab_Cadastro: TTabSheet;
    PageControl2: TPageControl;
    Tab_Informacoes: TTabSheet;
    Panel2: TPanel;
    Valor: TEdit;
    Grid_Busca: TDBGrid;
    DS: TDataSource;
    Valor_Ativo: TCheckBox;
    Bevel1: TBevel;
    ScrollBox1: TScrollBox;
    Btn_Retorno: TBitBtn;
    Btn_Imprimir: TSpeedButton;
    ZqBusca: TZQuery;
    BtnUltimo: TBitBtn;
    BtnPrimeiro: TBitBtn;
    Bevel6: TBevel;
    Image2: TImage;
    Data_Maior: TDateTimePicker;
    Data_Menor: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure Tab_InformacoesShow(Sender: TObject);
    procedure Grid_BuscaTitleClick(Column: TColumn);
    procedure Tab_CadastroShow(Sender: TObject);
    procedure Btn_RetornoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grid_BuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Grid_BuscaDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure Btn_EsquerdaClick(Sender: TObject);
    procedure Btn_DireitaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_FecharClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  FormCriador: TForm;
  FormCriadorConteudo: String;
  FormCriatura: TFormClass;
  nor_set : integer;
  Function NORMAL(ARQUIVO : ShortString ; CAMPO : ShorTString ; ABUSCA : TMASKEDIT ) : ShortString;
  procedure finalizaPesquisa(SQL: String);
  end;

var
  CAD_MATRIZ: TCAD_MATRIZ;
  Fechar : Smallint;

implementation

uses FrmPrincipal, unCamposBusca, FrmDM_Cadastro, unMsg,
  FrmEmpresa, FrmImovel, FrmBairros, FrmCaracteristicaImovel, FrmCidades,
  FrmEnderecoTipo, FrmEstados, FrmLogradouro, FrmOcupacao, FrmPessoa, FrmTipoImovel, FrmTipoPessoa, FrmUsuario,
  FrmAluguel, FrmCheques, FrmDM_ADMIN, unUtilitario, FrmCaixas, unLog;
  //UnitSQLDinamico

{$R *.dfm}

procedure TCAD_MATRIZ.finalizaPesquisa(SQL: String);
begin
     //Colocar essa função no final da busca realizada dos novos formulários.
     
     DS.DataSet.Close;
     TZQuery(DS.DataSet).SQL.Clear;
     TZQuery(DS.DataSet).SQL.Add(SQL);
     TZQuery(DS.DataSet).SQL.Text;
     DS.DataSet.Open;

     if DS.DataSet.RecordCount > 0 then
     Begin
          if Grid_Busca <> nil then
             Grid_Busca.SetFocus;
          PRINCIPAL.setMensagem('Registros Encontrados: '+IntToStr(DS.DataSet.RecordCount));
     end
     else
     Begin
          if Valor <> nil then
             Valor.SetFocus;
          PRINCIPAL.setMensagem('Verifique a sua busca para localizar melhor os registros... Em breve: HTTP://MANUAL.CELULADIGITAL.COM.BR');
     end;

end;

procedure TCAD_MATRIZ.Btn_FecharClick(Sender: TObject);
begin
     DS.DataSet.Cancel;
     DS.DataSet.Close;
     close;
end;

procedure TCAD_MATRIZ.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     PRINCIPAL.DestroiForm(FormCriatura, FormCriador, FormCriadorConteudo, Fechar);

     Action := caFree;
end;

procedure TCAD_MATRIZ.Btn_DireitaClick(Sender: TObject);
begin
     If DS.DataSet.Active Then
        DS.DataSet.Next;
end;

procedure TCAD_MATRIZ.Btn_EsquerdaClick(Sender: TObject);
begin
     If DS.DataSet.Active Then
        DS.DataSet.Prior;
end;

procedure TCAD_MATRIZ.Btn_NovoClick(Sender: TObject);
begin
    PRINCIPAL.pegaID.Close;
    PRINCIPAL.pegaID.SQL.Clear;

    Try
     If NOT DS.DataSet.Active Then
        DS.DataSet.Open;

     DS.DataSet.Append;

     Except
           ShowMessage('Erro ao tentar abrir um novo registro.');
     End;

        Tab_Cadastro.Show;
        Tab_Informacoes.Show;

        Btn_Novo.Enabled := False;
end;

procedure TCAD_MATRIZ.BtnPrimeiroClick(Sender: TObject);
begin
  if ds.dataset.active then
    ds.DataSet.First;
end;

procedure TCAD_MATRIZ.BtnUltimoClick(Sender: TObject);
begin
  if ds.DataSet.Active then
    ds.DataSet.Last;
end;

procedure TCAD_MATRIZ.Btn_CancelarClick(Sender: TObject);
begin
     If DS.DataSet.Active Then
        Begin
             DS.DataSet.Cancel;
             (DS.DataSet as TZQuery).CancelUpdates;
             Btn_Novo.Enabled := True;
        End;

     Tab_Pesquisa.Show;
end;

procedure TCAD_MATRIZ.Btn_GravarClick(Sender: TObject);
var
  modo_edicao: boolean;
begin
  if ds.state in [dsedit] then
    modo_edicao := true
  else
    modo_edicao := false;

  If DS.DataSet.Active Then
  Begin
       Try
          DS.DataSet.Post;
          (DS.DataSet as TZQuery).ApplyUpdates;

          setLog(DS.DataSet.Fields[0].AsString, 'ALTERAÇÃO', Self.Caption, (DS.DataSet as TZQuery));
          PRINCIPAL.setMensagem('REGISTRO SALVO!');
          Btn_Novo.Enabled := True;
       Except
             on e : exception do
             Begin
                unMsg.ERRO(10);
                PRINCIPAL.setMensagem('ERRO: '+E.Message);
             end;
       end;

       DS.DataSet.Edit;
  End
  Else
      unMsg.ERRO(13);
end;

procedure TCAD_MATRIZ.Btn_ExcluirClick(Sender: TObject);
//var Conta: String;
begin
  If MessageDlg('Deseja excluir este registro?',mtConfirmation, [mbYes,mbNo], 0) = mrYes Then
     Begin
           If DS.DataSet.Active Then
              Begin
                   Try
                      setLog(DS.DataSet.Fields[0].AsString, 'EXCLUSÃO', Self.Caption, (DS.DataSet as TZQuery));
                      
                      IF FormCriatura = TCAD_Ocupacao Then
                      Begin
                         DM_Cadastro.Z_Ocupacao.Delete;
                         DM_Cadastro.Z_Ocupacao.ApplyUpdates;
                      end
                      else
                      begin
                           DS.Edit;
                           DS.DataSet.FieldByName('ATIVO').AsString := 'XXX';
                           (DS.DataSet as TZQuery).ApplyUpdates;
                      end;

                      unMsg.INFORMA(2);
                      Btn_Novo.Enabled := True;
                   Except
                         unMsg.ERRO(12);
                   End;

                   DS.DataSet.Edit;
              End
              Else
                  unMsg.ERRO(13);
     End;
end;


procedure TCAD_MATRIZ.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//TECLAS DE ATALHO

  Case Key of
       VK_RETURN:
       BEGIN
                 if NOT (ActiveControl is TDBMemo) then
                    Perform(Wm_NextDlgCtl,0,0);

                   if Tab_Pesquisa.Showing then
                   begin
                        TRY
                           TRY
                              Valor.Color := clSkyBlue;
                              Valor.Repaint;

                              //PEGAR FUNÇÃO PESQUISAR DE CADA FORMULÁRIO
                              IF FormCriatura = TCAD_Pessoa Then TCAD_Pessoa(Self).Pesquisar();

                              IF FormCriatura = TCAD_Bairro Then TCAD_Bairro(Self).Pesquisar();

                              IF FormCriatura = TCAD_Cidade Then TCAD_Cidade(Self).Pesquisar();

                              IF FormCriatura = TCAD_Estados Then TCAD_Estados(Self).Pesquisar();

                              IF FormCriatura = TCAD_Endereco_Tipo Then TCAD_Endereco_Tipo(Self).Pesquisar();

                              IF FormCriatura = TCAD_Logradouro Then TCAD_Logradouro(Self).Pesquisar();

                              IF FormCriatura = TCAD_Ocupacao Then TCAD_Ocupacao(Self).Pesquisar();

                              IF FormCriatura = TCAD_Imovel Then TCAD_Imovel(Self).Pesquisar('');

                              IF FormCriatura = TCAD_Cheques Then TCAD_Cheques(Self).Pesquisar();


                           Except
                                 unUtilitario.setMensagem('Dificuldades em realizar a busca?'+#13+
                                 'Visite o manual do sistema em e ferifique a melhor forma de procurar o que deseja. '+#13+
                                 'http://manual.celuladigital.com.br','informa');
                           end;
                        finally
                               Valor.Color := $00D8E9EC;
                               Valor.Repaint;
                               Valor.SetFocus;
                        end;
                   end;
       END;


       VK_F1:
             Begin
                  If FormCriatura = TCAD_Cheques Then
                  Begin
                     TCAD_Cheques(self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Empresa Then
                  Begin
                     TCAD_Empresa(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Imovel Then
                  Begin
                     TCAD_Imovel(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Bairro Then
                  Begin
                       TCAD_Bairro(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Cidade Then
                  Begin
                     TCAD_Cidade(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Endereco_Tipo Then
                  Begin
                     TCAD_Endereco_Tipo(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Estados Then
                  Begin
                     TCAD_Estados(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Logradouro Then
                  Begin
                     TCAD_Logradouro(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Ocupacao Then
                  Begin
                     TCAD_Ocupacao(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_TipoImovel Then
                  Begin
                     TCAD_TipoImovel(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_TipoPessoa Then
                  Begin
                     TCAD_TipoPessoa(Self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(Self).Btn_NovoClick(Sender);
                  End
                  Else
                   If FormCriatura = TCAD_Usuario Then
                  Begin
                     TCAD_Usuario(Self).Btn_NovoClick(Sender);
                  End

             End;
       VK_F2:
             Begin

                  self.Btn_CancelarClick(Sender);
                  
             End;
       VK_F3:
             Begin
                  If FormCriatura = TCAD_Cheques Then
                  Begin
                     TCAD_Cheques(self).Btn_NovoClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Empresa Then
                  Begin
                     TCAD_Empresa(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Imovel Then
                  Begin
                     TCAD_Imovel(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Bairro Then
                  Begin
                     TCAD_Bairro(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Cidade Then
                  Begin
                     TCAD_Cidade(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Endereco_Tipo Then
                  Begin
                     TCAD_Endereco_Tipo(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Estados Then
                  Begin
                     TCAD_Estados(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Logradouro Then
                  Begin
                     TCAD_Logradouro(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Ocupacao Then
                  Begin
                      TCAD_Ocupacao(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_TipoImovel Then
                  Begin
                     TCAD_TipoImovel(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_TipoPessoa Then
                  Begin
                     TCAD_TipoPessoa(Self).Btn_GravarClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(Self).Btn_GravarClick(Sender);
                  End
                  Else
                   If FormCriatura = TCAD_Usuario Then
                  Begin
                     TCAD_Usuario(self).Btn_GravarClick(Sender);
                  End

             End;
       VK_F4:
             Begin
                  If FormCriatura = TCAD_Cheques Then
                  Begin
                     TCAD_Cheques(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Empresa Then
                  Begin
                     TCAD_Empresa(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Imovel Then
                  Begin
                     TCAD_Imovel(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Bairro Then
                  Begin
                     TCAD_Bairro(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Cidade Then
                  Begin
                     TCAD_Cidade(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Endereco_Tipo Then
                  Begin
                     TCAD_Endereco_Tipo(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Estados Then
                  Begin
                     TCAD_Estados(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Logradouro Then
                  Begin
                     TCAD_Logradouro(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Ocupacao Then
                  Begin
                     TCAD_Ocupacao(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_TipoImovel Then
                  Begin
                     TCAD_TipoImovel(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_TipoPessoa Then
                  Begin
                     TCAD_TipoPessoa(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(self).Btn_ExcluirClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Usuario Then
                  Begin
                     TCAD_Usuario(self).Btn_ExcluirClick(Sender);
                  End;

             End;
       VK_F9:
             Begin
                  //Campos.SetFocus;
             End;
       VK_F11:
              Begin
                   Valor.SetFocus;
              End;
       VK_F12:
              Begin
                   ShowMessage('MENU AJUDA: Em construção.');
              End;
       VK_PRIOR:
                Begin
                  If FormCriatura = TCAD_Cheques Then
                  Begin
                     TCAD_Cheques(self).Btn_EsquerdaClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Empresa Then
                  Begin
                     TCAD_Empresa(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Imovel Then
                  Begin
                     TCAD_Imovel(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Bairro Then
                  Begin
                     TCAD_Bairro(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Cidade Then
                  Begin
                     TCAD_Cidade(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Endereco_Tipo Then
                  Begin
                     TCAD_Endereco_Tipo(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Estados Then
                  Begin
                     TCAD_Estados(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Logradouro Then
                  Begin
                     TCAD_Logradouro(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Ocupacao Then
                  Begin
                     TCAD_Ocupacao(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_TipoImovel Then
                  Begin
                     TCAD_TipoImovel(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_TipoPessoa Then
                  Begin
                     TCAD_TipoPessoa(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(self).Btn_EsquerdaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Usuario Then
                  Begin
                     TCAD_Usuario(self).Btn_EsquerdaClick(Sender);
                  End;

                End;
       VK_NEXT:
               Begin
                  If FormCriatura = TCAD_Cheques Then
                  Begin
                     TCAD_Cheques(self).Btn_DireitaClick(Sender);
                  End
                  Else
                  If FormCriatura = TCAD_Empresa Then
                  Begin
                     TCAD_Empresa(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Imovel Then
                  Begin
                     TCAD_Imovel(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Bairro Then
                  Begin
                     TCAD_Bairro(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Cidade Then
                  Begin
                     TCAD_Cidade(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Endereco_Tipo Then
                  Begin
                     TCAD_Endereco_Tipo(self).Btn_DireitaClick(Sender);
                  End
                   ELSE
                  If FormCriatura = TCAD_Estados Then
                  Begin
                     TCAD_Estados(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Logradouro Then
                  Begin
                     TCAD_Logradouro(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Ocupacao Then
                  Begin
                     TCAD_Ocupacao(self).Btn_DireitaClick(Sender);
                  End
                   ELSE
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_TipoImovel Then
                  Begin
                     TCAD_TipoImovel(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_TipoPessoa Then
                  Begin
                     TCAD_TipoPessoa(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Pessoa Then
                  Begin
                     TCAD_Pessoa(self).Btn_DireitaClick(Sender);
                  End
                  ELSE
                  If FormCriatura = TCAD_Usuario Then
                  Begin
                     TCAD_Usuario(self).Btn_DireitaClick(Sender);
                  End;

               End;
       VK_ESCAPE:
                 Begin
                      If ssShift in Shift Then
                      Begin
                           SELF.Btn_RetornoClick(Sender);
                      End;
                 End;

  end;

end;

procedure TCAD_MATRIZ.Grid_BuscaDblClick(Sender: TObject);
begin
     If DS.DataSet.Active Then
     Begin
          DS.DataSet.Edit;
          Tab_Cadastro.Show;
     End;

     Tab_Informacoes.Show;
     Tab_InformacoesShow(Sender);
end;

procedure TCAD_MATRIZ.FormCreate(Sender: TObject);
begin

{

ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = FORMULARIO
ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = INCLUIR
ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = GRAVAR
ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = EXCLUIR
ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = RELATÓRIOS

ARQUIVOS >> PASTAS >> PESSOAS >> TIPO = FORMULARIO
ARQUIVOS >> PASTAS >> PESSOAS >> TIPO = INCLUIR
ARQUIVOS >> PASTAS >> PESSOAS >> TIPO = GRAVAR
ARQUIVOS >> PASTAS >> PESSOAS >> TIPO = EXCLUIR

ARQUIVOS >> PASTAS >> PESSOAS >> OCUPACAO = FORMULARIO
ARQUIVOS >> PASTAS >> PESSOAS >> OCUPACAO = INCLUIR
ARQUIVOS >> PASTAS >> PESSOAS >> OCUPACAO = GRAVAR
ARQUIVOS >> PASTAS >> PESSOAS >> OCUPACAO = EXCLUIR

ARQUIVOS >> SISTEMA >> EMPRESA = FORMULARIO
ARQUIVOS >> SISTEMA >> USUÁRIO = FORMULARIO
ARQUIVOS >> SISTEMA >> BOLETOS = FORMULARIO
ARQUIVOS >> SISTEMA >> CONFIGURAÇÕES = FORMULARIO
ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = FORMULARIO
ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = SAÚDE DO SISTEMA
ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = PASSAR USUÁRIOS PARA ADMINISTRADORES
ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = RECUPERAR ARQUIVO MORTO
ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = GERAR SEGUNDA VIA DE CONTAS
ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = ESTORNAR CONTAS
ARQUIVOS >> SISTEMA >> ADMINISTRAÇÃO GERAL = PERMISSÕES DE USUÁRIOS

ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = FORMULARIO
ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = INCLUIR
ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = GRAVAR
ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = EXCLUIR
ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = RELATÓRIOS
ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = CHAVES
ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = ANÚNCIO


}
     Ordenacao := '';
     Fechar := 0;

     if Self.Name = 'CAD_Pessoa' Then
     Begin
          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = FORMULARIO') then
             Close;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = INCLUIR') then
          Begin
               Btn_Novo.Visible := False;
               TCAD_Pessoa(self).Btn_Endereco_Novo.Visible := False;
               TCAD_Pessoa(self).Btn_Telefone_Novo.Visible := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = GRAVAR') then
          Begin
               Btn_Gravar.Visible := False;
               TCAD_Pessoa(self).Btn_Endereco_Gravar.Visible := False;
               TCAD_Pessoa(self).Btn_Telefone_Gravar.Visible := False;

               TCAD_Pessoa(self).Tab_Informacoes.Enabled := False;
               TCAD_Pessoa(self).Tab_Complemento.Enabled := False;
               TCAD_Pessoa(self).Tab_Contato.Enabled := False;
               TCAD_Pessoa(self).Tab_Obs.Enabled := False;
               TCAD_Pessoa(self).Tab_InfAdicional.Enabled := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = EXCLUIR') then
          Begin
               Btn_Excluir.Visible := False;
               TCAD_Pessoa(self).Btn_Endereco_Excluir.Visible := False;
               TCAD_Pessoa(self).Btn_Telefone_Excluir.Visible := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> CADASTRO = RELATÓRIOS') then
          Begin
               Btn_Imprimir.Visible := False;
               TCAD_Pessoa(self).btn_relatorios.Visible := False;
          end;
     end;

     if Self.Name = 'CAD_TipoPessoa' Then
     Begin
          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> TIPO = FORMULARIO') then
             Close;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> TIPO = INCLUIR') then
             Btn_Novo.Visible := False;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> TIPO = GRAVAR') then
          Begin
               Btn_Gravar.Visible := False;
               TCAD_TipoPessoa(self).Tab_Informacoes.Enabled := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> TIPO = EXCLUIR') then
             Btn_Excluir.Visible := False;
     end;

     if Self.Name = 'CAD_Ocupacao' Then
     Begin
          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> OCUPACAO = FORMULARIO') then
             Close;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> OCUPACAO = INCLUIR') then
             Btn_Novo.Visible := False;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> OCUPACAO = GRAVAR') then
          Begin
               Btn_Gravar.Visible := False;
               TCAD_Ocupacao(self).Tab_Informacoes.Enabled := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> PESSOAS >> OCUPACAO = EXCLUIR') then
             Btn_Excluir.Visible := False;
     end;

     if Self.Name = 'CAD_Imovel' Then
     Begin
          if not verificaPermissao('ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = FORMULARIO') then
             Close;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = INCLUIR') then
          Begin
               Btn_Novo.Visible := False;
               TCAD_Imovel(self).Btn_Caracteristica_Novo.Visible := False;
               TCAD_Imovel(self).Btn_Proprietario_Novo.Visible := False;
               TCAD_Imovel(self).Btn_Pessoas_Novo.Visible := False;
               TCAD_Imovel(self).Btn_Anuncio_Novo.Visible := False;
               TCAD_Imovel(self).Btn_Agenda_Novo.Visible := False;
               TCAD_Imovel(self).Btn_IPTU_Novo.Visible := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = GRAVAR') then
          Begin
               Btn_Gravar.Visible := False;
               TCAD_Imovel(self).Btn_Caracteristica_Gravar.Visible := False;
               TCAD_Imovel(self).Btn_Proprietario_Gravar.Visible := False;
               TCAD_Imovel(self).Btn_Pessoas_Gravar.Visible := False;
               TCAD_Imovel(self).Btn_Anuncio_Gravar.Visible := False;
               TCAD_Imovel(self).Btn_Agenda_Gravar.Visible := False;
               TCAD_Imovel(self).Btn_IPTU_GRAVAR.Visible := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = EXCLUIR') then
          Begin
               Btn_Excluir.Visible := False;
               TCAD_Imovel(self).Btn_Caracteristica_Excluir.Visible := False;
               TCAD_Imovel(self).Btn_Proprietario_Excluir.Visible := False;
               TCAD_Imovel(self).Btn_Pessoas_Excluir.Visible := False;
               TCAD_Imovel(self).Btn_Anuncio_Excluir.Visible := False;
               TCAD_Imovel(self).Btn_Agenda_Excluir.Visible := False;
               TCAD_Imovel(self).Btn_IPTU_EXCLUIR.Visible := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = RELATÓRIOS') then
          Begin
               Btn_Imprimir.Visible := False;
               TCAD_Imovel(self).btn_imprimir_contrato.Visible := False;
               TCAD_Imovel(self).Btn_Imprimir_Processos.Visible := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = CHAVES') then
          Begin
               TCAD_Imovel(self).btnchaves.Visible := False;
               TCAD_Imovel(self).tab_Chaves.Visible := False;
          end;

          if not verificaPermissao('ARQUIVOS >> PASTAS >> IMOVEIS >> CADASTRO = ANÚNCIO') then
          Begin
               TCAD_Imovel(self).btn_Anuncios.Visible := False;
          end;
     end;







     
end;

procedure TCAD_MATRIZ.Grid_BuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = VK_RETURN then
 Grid_BuscaDblClick(Sender);
end;

procedure TCAD_MATRIZ.FormShow(Sender: TObject);
begin
    nor_set:=0;
    IF Tab_Pesquisa.Showing Then
       Valor.SetFocus;
end;

procedure TCAD_MATRIZ.Btn_RetornoClick(Sender: TObject);
begin
Fechar := 1;
Close;
end;

procedure TCAD_MATRIZ.Tab_CadastroShow(Sender: TObject);
begin
  IF DS.DATASET.State IN [dsInactive] THEN
    ABORT;

  If DS.DataSet.Active Then
    DS.DataSet.Edit;

// QUANDO BUSCO UM REGISTRO EM UMA OUTRA TELA, COMO A DE CONTRATO BUSCA O IMOVEL OU PESSOA, SE
// EU ENTRAR EM ALGUM REGISTRO, O SISTEMA LOG ENTENDE QUE ESTOU ALTERANDO ESSES DADOS. AÍ, PERCO
// A REFERENCIA DE MEU REGISTRO PRINCIPAL (NO CASO, CONTRATO), GERANDO UM ERRO. DEVE EXISTIR UMA
// MELHOR FORMA DE FAZER ISSO...                              RAFAEL DONATO  14.01.2008       ;)
  //IF Btn_Retorno.Visible = FALSE then
  //  principal.duplicar('OLD', (DS.DATASET AS TZQUERY));
end;

procedure TCAD_MATRIZ.Grid_BuscaTitleClick(Column: TColumn);
Var Colunas: Smallint;
begin
//Ordenar pelo título da grid...

          Ordenacao := '';

          Ordenacao := Column.FieldName;

          For Colunas := 0 TO Grid_Busca.Columns.Count-1 DO
              If Grid_Busca.Columns[Colunas].Visible = true Then
                 Grid_Busca.Columns[Colunas].Title.Font.Style := [];


          Column.Title.Font.Style := [fsBold];
end;

function TCAD_MATRIZ.NORMAL(ARQUIVO, CAMPO: ShorTString;
  ABUSCA: TMaskEdit): ShortString;
begin
  IF (Trim(abusca.Text)='') OR (NOR_SET=0) then
    Begin
      Result:='';
      exit;
    End;


  With ZqBusca do
    Begin
      Active:=False;
      Close;
      SQL.Clear;
      Params.Clear;
      SQL.add('Select '+CAMPO+' From '+ARQUIVO+' Where '+CAMPO+' like '+#39+''+COPY(ABUSCA.TEXT,1,ABUSCA.SelStart)+'%'+#39);
      open;
      RESULT:=COPY(ABUSCA.TEXT,0,ABUSCA.SelStart)+COPY(Fieldbyname(CAMPO).AsString,ABUSCA.SelStart+1,255);
    End;

  IF NOR_SET=0 THEN NOR_SET:=1 ELSE NOR_SET:=0;
  ZqBusca.Free;

end;

procedure TCAD_MATRIZ.Tab_InformacoesShow(Sender: TObject);
begin
//Eventos on SHOW!
end;

procedure TCAD_MATRIZ.FormActivate(Sender: TObject);
begin
     Ordenacao := '';
end;

end.

