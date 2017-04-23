object DM_RELATORIOS: TDM_RELATORIOS
  OldCreateOrder = False
  Height = 509
  Width = 406
  object SQL1: TZQuery
    Connection = PRINCIPAL.Conexao
    Active = True
    SQL.Strings = (
      
        'select * from anuncio where ativo = '#39'SIM'#39' and id_imovel = 100001' +
        '04 order by id_anuncio')
    Params = <>
    Left = 32
    Top = 16
  end
  object DS1: TDataSource
    DataSet = SQL1
    Left = 112
    Top = 16
  end
  object SQL2: TZQuery
    Connection = PRINCIPAL.Conexao
    Active = True
    SQL.Strings = (
      
        'select * from log where componente = '#39'PROPOSTA'#39' and acao = '#39'LOG'#39 +
        ' and ativo = '#39'SIM'#39' order by id_log')
    Params = <>
    Left = 32
    Top = 72
  end
  object DS2: TDataSource
    DataSet = SQL2
    Left = 112
    Top = 72
  end
  object SQL3: TZQuery
    Connection = PRINCIPAL.Conexao
    Active = True
    SQL.Strings = (
      
        'select * from log where componente = '#39'ANUNCIO'#39' and acao = '#39'LOG'#39' ' +
        'and ativo = '#39'SIM'#39)
    Params = <>
    Left = 32
    Top = 136
  end
  object DS3: TDataSource
    AutoEdit = False
    DataSet = SQL3
    Enabled = False
    Left = 112
    Top = 136
  end
  object Rave: TRvProject
    Engine = Rave_System
    Left = 320
    Top = 16
  end
  object DSC_1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = SQL1
    Left = 200
    Top = 16
  end
  object DSC_2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = SQL2
    Left = 200
    Top = 72
  end
  object DSC_3: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = SQL3
    Left = 200
    Top = 136
  end
  object Rave_System: TRvSystem
    TitleSetup = 'Op'#231#245'es de Sa'#237'da'
    TitleStatus = 'Status do Relat'#243'rio'
    TitlePreview = 'C'#233'lula Relat'#243'rio'
    SystemFiler.StatusFormat = 'Gerando P'#225'gina %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Imprimindo P'#225'gina %p'
    SystemPrinter.Title = 'C'#233'lula Digital - Relat'#243'rio'
    SystemPrinter.Units = unCM
    SystemPrinter.UnitsFactor = 2.540000000000000000
    Left = 320
    Top = 72
  end
  object DSC_4: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = SQL4
    Left = 200
    Top = 200
  end
  object SQL4: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 32
    Top = 200
  end
  object DS4: TDataSource
    AutoEdit = False
    DataSet = SQL4
    Enabled = False
    Left = 112
    Top = 200
  end
  object ZQuery_Bairro_Imovel: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select imov.id_imovel, imov.id_logradouro, imovetip.nome, logra.' +
        'tipo as Tipo, logra.nome as NomeRua, logra.cep, imov.numero as N' +
        'umero, imov.complemento, ba.id_bairro, ba.nome as NomeBairro, ci' +
        'd.nome as NomeCidade, u.nome as Estado, imov.ocupado, imovesubti' +
        'p.nome as SubTipo'
      'from imovel imov'
      
        'inner join imovel_tipo imovetip on imovetip.id_imovel_tipo = imo' +
        'v.id_imovel_tipo'
      
        'inner join imovel_subtipo imovesubtip on imovesubtip.id_imovel_s' +
        'ubtipo = imov.id_imovel_subtipo'
      
        'inner join logradouro logra on logra.id_logradouro = imov.id_log' +
        'radouro'
      'inner join bairro ba on ba.id_bairro = logra.id_bairro'
      'inner join cidade cid on cid.id_cidade = logra.id_cidade'
      'inner join uf u on u.id_sigla = logra.id_sigla'
      'where imov.ocupado = '#39'Nao'#39
      'order by ba.nome, logra.nome, imov.numero')
    Params = <>
    Left = 48
    Top = 336
  end
  object DS_Bairro_Imovel: TDataSource
    DataSet = ZQuery_Bairro_Imovel
    Left = 48
    Top = 392
  end
  object RV_Bairro_Imovel: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ZQuery_Bairro_Imovel
    Left = 48
    Top = 448
  end
  object ZQuery_Anuncio_Imovel: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select (select first 1 ic.foto1 from imovel_caracteristica ic wh' +
        'ere ic.id_imovel = imov.id_imovel and ic.id_caracteristica = 60)' +
        ' as foto1, '
      
        'imov.id_imovel, imov.id_logradouro, imov.dormitorios, imovetip.n' +
        'ome, logra.tipo as Tipo, logra.nome as NomeRua, logra.cep, imov.' +
        'numero as Numero, imov.complemento, ba.id_bairro, ba.nome as Nom' +
        'eBairro, cid.nome as NomeCidade, u.nome as Estado, imov.ocupado,' +
        ' imovesubtip.nome as SubTipo, anunc.descricao'
      'from imovel imov'
      
        'inner join imovel_tipo imovetip on imovetip.id_imovel_tipo = imo' +
        'v.id_imovel_tipo'
      
        'inner join imovel_subtipo imovesubtip on imovesubtip.id_imovel_s' +
        'ubtipo = imov.id_imovel_subtipo'
      
        'inner join imovel_caracteristica imovecaract on imovecaract.id_i' +
        'movel = imov.id_imovel'
      'inner join anuncio anunc on anunc.id_imovel = imov.id_imovel'
      
        'inner join logradouro logra on logra.id_logradouro = imov.id_log' +
        'radouro'
      'inner join bairro ba on ba.id_bairro = logra.id_bairro'
      'inner join cidade cid on cid.id_cidade = logra.id_cidade'
      'inner join uf u on u.id_sigla = logra.id_sigla'
      'where imov.ocupado = '#39'Nao'#39
      'and anunc.meio = '#39'INTERNET'#39
      'order by imov.dormitorios')
    Params = <>
    Left = 184
    Top = 336
  end
  object DS_Anuncio_Imove: TDataSource
    DataSet = ZQuery_Anuncio_Imovel
    Left = 184
    Top = 392
  end
  object Rv_Anuncio_Imove: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ZQuery_Anuncio_Imovel
    Left = 184
    Top = 448
  end
end
