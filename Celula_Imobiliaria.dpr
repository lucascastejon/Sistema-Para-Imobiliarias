program Celula_Imobiliaria;

{%File 'ModelSupport\FrmDM_Cadastro\FrmDM_Cadastro.txvpck'}
{%File 'ModelSupport\FrmPrincipal\FrmPrincipal.txvpck'}
{%File 'ModelSupport\FrmCidades\FrmCidades.txvpck'}
{%File 'ModelSupport\FrmBairros\FrmBairros.txvpck'}
{%File 'ModelSupport\unCamposBusca\unCamposBusca.txvpck'}
{%File 'ModelSupport\FrmLOGIN\FrmLOGIN.txvpck'}
{%File 'ModelSupport\FrmEstados\FrmEstados.txvpck'}
{%File 'ModelSupport\FrmEmpresa\FrmEmpresa.txvpck'}
{%File 'ModelSupport\FrmLogradouro\FrmLogradouro.txvpck'}
{%File 'ModelSupport\FrmMatriz\FrmMatriz.txvpck'}
{%File 'ModelSupport\FrmEnderecoTipo\FrmEnderecoTipo.txvpck'}
{%File 'ModelSupport\unImagem\unImagem.txvpck'}
{%File 'ModelSupport\FrmOcupacao\FrmOcupacao.txvpck'}
{%File 'ModelSupport\FrmSPLASH\FrmSPLASH.txvpck'}
{%File 'ModelSupport\FrmTipoPessoa\FrmTipoPessoa.txvpck'}
{%File 'ModelSupport\FrmUsuario\FrmUsuario.txvpck'}
{%File 'ModelSupport\unMsg\unMsg.txvpck'}
{%File 'ModelSupport\FrmPessoa\FrmPessoa.txvpck'}
{%File 'ModelSupport\default.txvpck'}
{%File 'ModelSupport\FrmImovel\FrmImovel.txvpck'}
{%File 'ModelSupport\FrmImagem\FrmImagem.txvpck'}
{%File 'ModelSupport\FrmCaracteristicaImovel\FrmCaracteristicaImovel.txvpck'}
{%File 'ModelSupport\FrmTipoImovel\FrmTipoImovel.txvpck'}
{%File 'ModelSupport\FrmDM_REL\FrmDM_REL.txvpck'}
{%File 'ModelSupport\FrmAluguel\FrmAluguel.txvpck'}
{%File 'ModelSupport\FrmCheques\FrmCheques.txvpck'}
{%File 'ModelSupport\FrmDM_FINANCEIRO\FrmDM_FINANCEIRO.txvpck'}
{%File 'ModelSupport\FrmEmitirAnuncio\FrmEmitirAnuncio.txvpck'}
{%File 'ModelSupport\FrmDM_ADMIN\FrmDM_ADMIN.txvpck'}
{%File 'ModelSupport\unValidacao\unValidacao.txvpck'}

uses
  Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {PRINCIPAL},
  FrmMatriz in 'FrmMatriz.pas' {CAD_MATRIZ},
  FrmDM_Cadastro in 'Arquivos\FrmDM_Cadastro.pas' {DM_CADASTRO: TDataModule},
  unCamposBusca in 'unCamposBusca.pas',
  FrmUsuario in 'Arquivos\Sistema\Usuario\FrmUsuario.pas' {CAD_Usuario},
  unMsg in 'unMsg.pas',
  FrmEmpresa in 'Arquivos\Sistema\Empresa\FrmEmpresa.pas' {CAD_Empresa},
  FrmLOGIN in 'FrmLOGIN.pas' {Login},
  FrmSPLASH in 'FrmSPLASH.pas' {Splash},
  FrmPessoa in 'Arquivos\Pastas\pessoas\FrmPessoa.pas' {CAD_Pessoa},
  FrmEstados in 'Arquivos\Pastas\logradouro\FrmEstados.pas' {CAD_Estados},
  unImagem in 'Arquivos\Pastas\unImagem.pas',
  FrmCidades in 'Arquivos\Pastas\logradouro\FrmCidades.pas' {CAD_Cidade},
  FrmBairros in 'Arquivos\Pastas\logradouro\FrmBairros.pas' {CAD_Bairro},
  FrmLogradouro in 'Arquivos\Pastas\logradouro\FrmLogradouro.pas' {CAD_Logradouro},
  FrmEnderecoTipo in 'Arquivos\Pastas\logradouro\FrmEnderecoTipo.pas' {CAD_Endereco_Tipo},
  FrmTipoPessoa in 'Arquivos\Pastas\pessoas\FrmTipoPessoa.pas' {CAD_TipoPessoa},
  FrmOcupacao in 'Arquivos\Pastas\pessoas\FrmOcupacao.pas' {CAD_Ocupacao},
  FrmImovel in 'Arquivos\Pastas\imoveis\FrmImovel.pas' {CAD_Imovel},
  FrmTipoImovel in 'Arquivos\Pastas\imoveis\FrmTipoImovel.pas' {CAD_TipoImovel},
  FrmCaracteristicaImovel in 'Arquivos\Pastas\imoveis\FrmCaracteristicaImovel.pas' {CAD_CaracteristicaImovel},
  FrmImagem in 'Arquivos\Pastas\imoveis\FrmImagem.pas' {Imagem},
  unValidacao in 'unValidacao.pas',
  FrmAluguel in 'Administrar\Contratos\FrmAluguel.pas' {CAD_Aluguel},
  FrmDM_ADMIN in 'Administrar\FrmDM_ADMIN.pas' {DM_ADMIN: TDataModule},
  FrmEmitirAnuncio in 'Arquivos\Pastas\imoveis\FrmEmitirAnuncio.pas' {CAD_EmitirAnuncio},
  FrmDM_REL in 'FrmDM_REL.pas' {DM_REL: TDataModule},
  FrmDM_FINANCEIRO in 'Administrar\FrmDM_FINANCEIRO.pas' {DM_FINANCEIRO: TDataModule},
  FrmCheques in 'Administrar\Cheques\FrmCheques.pas' {CAD_Cheques},
  FrmFluxoCaixa in 'Administrar\FluxoDeCaixa\FrmFluxoCaixa.pas' {CAD_FluxoCaixa},
  FrmContaDemanda in 'Administrar\CaixaComposto\FrmContaDemanda.pas' {ContaDemanda},
  FrmSobre in 'FrmSobre.pas' {Fsobre},
  FrmChaves in 'Arquivos\Pastas\imoveis\FrmChaves.pas' {CAD_CHAVES},
  FrmNoMatriz in 'FrmNoMatriz.pas' {CAD_NOMATRIZ},
  FrmConjuge in 'Arquivos\Pastas\pessoas\FrmConjuge.pas' {CAD_CONJUGE},
  FrmCaixas in 'Administrar\CaixaComposto\FrmCaixas.pas' {CAD_Caixas},
  FormBrowser in 'FormBrowser.pas' {FrmBrowser},
  unLog in 'Ferramentas\Auditoria\unLog.pas',
  FrmCaixasSimples in 'Administrar\CaixaSimples\FrmCaixasSimples.pas' {CAD_CaixasSimples},
  unCaixasSimples in 'Administrar\CaixaSimples\unCaixasSimples.pas',
  FrmDM_RELATORIOS in 'FrmDM_RELATORIOS.pas' {DM_RELATORIOS: TDataModule},
  unFinanceiro in 'Administrar\unFinanceiro.pas',
  FrmCaixasItens in 'Administrar\Configuracoes\FrmCaixasItens.pas' {CAD_Caixas_Item},
  FrmLOGINinterno in 'FrmLOGINinterno.pas' {LoginInterno},
  unErros in 'unErros.pas',
  unWord in 'unWord.pas',
  FrmCentralSQL in 'Ferramentas\CentralSql\FrmCentralSQL.pas' {FrmSQL},
  FrmCaixasConfig in 'Administrar\Configuracoes\FrmCaixasConfig.pas' {CAD_CaixasConfig},
  FrmSistema in 'FrmSistema.pas' {CAD_Sistema},
  frmThread in 'frmThread.pas',
  FrmLog in 'Ferramentas\Auditoria\FrmLog.pas' {FrmAuditoria},
  FrmPainel in 'Arquivos\Sistema\AdministracaoGeral\FrmPainel.pas' {Painel},
  FrmConfBoleto in 'Arquivos\Sistema\Boletos\FrmConfBoleto.pas' {FormConfBoleto},
  thrContratos in 'Administrar\Contratos\thrContratos.pas',
  thrAtualizacao in 'thrAtualizacao.pas',
  untfrmproutupdate in 'AtualizarSistema\untfrmproutupdate.pas' {frmproutupdate},
  untthreadupdate in 'AtualizarSistema\untthreadupdate.pas',
  FrmMensagem in 'FrmMensagem.pas' {CAD_Mensagem},
  unUtilitario in 'unUtilitario.pas',
  unSeguranca in 'unSeguranca.pas',
  unCobreBem in 'Arquivos\Sistema\Boletos\unCobreBem.pas',
  unPaginacao in 'unPaginacao.pas',
  unINI in 'unINI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'I M O B I L I Á R I A';
  Application.CreateForm(TPRINCIPAL, PRINCIPAL);
  Application.CreateForm(TLogin, Login);
  Login.ShowModal;

  IF PRINCIPAL.Conexao.Connected Then
  Begin
       Application.CreateForm(TDM_ADMIN, DM_ADMIN);
       Application.CreateForm(TDM_REL, DM_REL);
       Application.CreateForm(TDM_FINANCEIRO, DM_FINANCEIRO);
       Application.CreateForm(TDM_CADASTRO, DM_CADASTRO);
       Application.CreateForm(TDM_RELATORIOS, DM_RELATORIOS);
       Application.Run;
  End
  ELSE
  Begin
       Application.Terminate;
  end;

end.
