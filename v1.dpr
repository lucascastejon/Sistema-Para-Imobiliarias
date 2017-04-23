Library v1;

uses
  WxoUnit in 'WxoUnit.pas',
  Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {PRINCIPAL},
  FrmMatriz in 'FrmMatriz.pas' {CAD_MATRIZ},
  FrmDM_Cadastro in 'FrmDM_Cadastro.pas' {DM_CADASTRO: TDataModule},
  unCamposBusca in 'unCamposBusca.pas',
  FrmUsuario in 'FrmUsuario.pas' {CAD_Usuario},
  unMsg in 'unMsg.pas',
  FrmEmpresa in 'FrmEmpresa.pas' {CAD_Empresa},
  FrmLOGIN in 'FrmLOGIN.pas' {Login},
  FrmSPLASH in 'FrmSPLASH.pas' {Splash},
  FrmPessoa in 'FrmPessoa.pas' {CAD_Pessoa},
  FrmEstados in 'FrmEstados.pas' {CAD_Estados},
  unImagem in 'unImagem.pas',
  FrmCidades in 'FrmCidades.pas' {CAD_Cidade},
  FrmBairros in 'FrmBairros.pas' {CAD_Bairro},
  FrmLogradouro in 'FrmLogradouro.pas' {CAD_Logradouro},
  FrmEnderecoTipo in 'FrmEnderecoTipo.pas' {CAD_Endereco_Tipo},
  FrmTipoPessoa in 'FrmTipoPessoa.pas' {CAD_TipoPessoa},
  FrmOcupacao in 'FrmOcupacao.pas' {CAD_Ocupacao},
  FrmImovel in 'FrmImovel.pas' {CAD_Imovel},
  FrmTipoImovel in 'FrmTipoImovel.pas' {CAD_TipoImovel},
  FrmCaracteristicaImovel in 'FrmCaracteristicaImovel.pas' {CAD_CaracteristicaImovel},
  FrmImagem in 'FrmImagem.pas' {Imagem},
  unValidacao in 'unValidacao.pas',
  FrmAluguel in 'FrmAluguel.pas' {CAD_Aluguel},
  FrmDM_ADMIN in 'FrmDM_ADMIN.pas' {DM_ADMIN: TDataModule},
  FrmEmitirAnuncio in 'FrmEmitirAnuncio.pas' {CAD_EmitirAnuncio},
  FrmDM_REL in 'FrmDM_REL.pas' {DM_REL: TDataModule},
  FrmDM_FINANCEIRO in 'FrmDM_FINANCEIRO.pas' {DM_FINANCEIRO: TDataModule},
  FrmCheques in 'FrmCheques.pas' {CAD_Cheques},
  FrmFluxoCaixa in 'FrmFluxoCaixa.pas' {CAD_FluxoCaixa},
  FrmContaDemanda in 'FrmContaDemanda.pas' {ContaDemanda},
  FrmSobre in 'FrmSobre.pas' {Fsobre},
  FrmChaves in 'FrmChaves.pas' {CAD_CHAVES},
  FrmNoMatriz in 'FrmNoMatriz.pas' {CAD_NOMATRIZ},
  FrmConjuge in 'FrmConjuge.pas' {CAD_CONJUGE},
  FrmCaixas in 'FrmCaixas.pas' {CAD_Caixas},
  FormBrowser in 'FormBrowser.pas' {FrmBrowser},
  unLog in 'unLog.pas',
  FrmCaixasSimples in 'FrmCaixasSimples.pas' {CAD_CaixasSimples},
  unCaixasSimples in 'unCaixasSimples.pas',
  FrmDM_RELATORIOS in 'FrmDM_RELATORIOS.pas' {DM_RELATORIOS: TDataModule},
  unFinanceiro in 'unFinanceiro.pas',
  FrmCaixasItens in 'FrmCaixasItens.pas' {CAD_Caixas_Item},
  unINI in 'unINI.pas',
  FrmLOGINinterno in 'FrmLOGINinterno.pas' {LoginInterno},
  unErros in 'unErros.pas',
  unWord in 'unWord.pas',
  FrmCentralSQL in 'FrmCentralSQL.pas' {FrmSQL},
  FrmCaixasConfig in 'FrmCaixasConfig.pas' {CAD_CaixasConfig},
  FrmSistema in 'FrmSistema.pas' {CAD_Sistema},
  frmThread in 'frmThread.pas',
  FrmLog in 'FrmLog.pas' {FrmAuditoria},
  FrmPainel in 'FrmPainel.pas' {Painel},
  FrmConfBoleto in 'FrmConfBoleto.pas' {FormConfBoleto},
  thrContratos in 'thrContratos.pas',
  thrAtualizacao in 'thrAtualizacao.pas',
  untfrmproutupdate in 'AtualizarSistema\untfrmproutupdate.pas' {frmproutupdate},
  untthreadupdate in 'AtualizarSistema\untthreadupdate.pas',
  FrmMensagem in 'FrmMensagem.pas' {CAD_Mensagem},
  unUtilitario in 'unUtilitario.pas',
  unSeguranca in 'unSeguranca.pas';

{$E .wxo}

function LoadWebXoneForm(
          ApplicationHandle : THandle;  
          IEHandle : THandle;           
          CtrlHandle : THandle;         
          Url : PChar;                  
          Flag : PChar                  
          ):THandle;cdecl;
begin
     try
          principal := tprincipal.Create(nil);
          login := tlogin.Create(nil);
          dm_admin := tdm_admin.Create(nil);
          dm_rel := tdm_rel.Create(nil);
          dm_financeiro := tdm_financeiro.Create(nil);
          dm_cadastro := tdm_cadastro.Create(nil);
          dm_relatorios := tdm_relatorios.Create(nil);
          //
          giCtrl    := CtrlHandle;
          giApp     := ApplicationHandle;
          giIE      := IEHandle;
          WWShowForm(principal);
     finally
     end;
     Result    := principal.Handle;

end;

exports
     LoadWebXoneForm;

end.
