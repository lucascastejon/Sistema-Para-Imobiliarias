object DM_REL: TDM_REL
  OldCreateOrder = False
  Height = 548
  Width = 773
  object RV_IMPRESSAO: TRvProject
    Engine = RV_SYS
    Left = 40
    Top = 16
  end
  object RV_SYS: TRvSystem
    TitleSetup = 'Op'#231#245'es de Output'
    TitleStatus = 'C'#233'lula Digital Status'
    TitlePreview = 'C'#233'lula Digital Preview'
    SystemFiler.StatusFormat = 'Gerando p'#225'gina %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Imprimindo p'#225'gina %p'
    SystemPrinter.Title = 'C'#233'lula Report'
    SystemPrinter.Units = unCM
    SystemPrinter.UnitsFactor = 2.540000000000000000
    Left = 136
    Top = 16
  end
  object RV_ANUNCIO: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DM_ADMIN.Z_ANUNCIO
    Left = 40
    Top = 80
  end
  object RV_RENDER_PDF: TRvRenderPDF
    DisplayName = 'Adobe (PDF)'
    FileExtension = '*.pdf'
    UseCompression = True
    EmbedFonts = False
    ImageQuality = 90
    MetafileDPI = 300
    FontEncoding = feWinAnsiEncoding
    DocInfo.Author = 'C'#233'lula Digital Imobili'#225'ria'
    DocInfo.Creator = 'C'#233'lula Digital Imobili'#225'ria'
    DocInfo.Producer = 'C'#233'lula Digital Software'
    BufferDocument = True
    DisableHyperlinks = False
    Left = 680
    Top = 16
  end
  object RV_RENDER_RTF: TRvRenderRTF
    DisplayName = 'Word (RTF)'
    FileExtension = '*.rtf'
    Left = 680
    Top = 72
  end
  object RV_IMOVEL: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DM_CADASTRO.Z_Imovel
    Left = 136
    Top = 80
  end
  object RV_Contrato: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 216
    Top = 80
  end
  object ZQUERY1: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select DISTINCT(P.id_pessoa), p.nome,'
      
        'SUM( (select result from spvalorcobranca1(1, C.data_ref, C.data_' +
        'pgto, C.valor, C.valor_juros, C.valor_multa, C.valor_desconto)) ' +
        '),'
      
        'count(1), list(extract(MONTH from C.data_ref), '#39', '#39') as parcelas' +
        ','
      
        '       substring(List((select first 1 skip 0 con.HONORARIO_ADMIN' +
        ' from contrato con where con.id_contrato = C.id_contrato), '#39#39') f' +
        'rom 1 for 3) as deposito'
      ''
      
        ' from caixa_saida C  inner join pessoa P on P.id_pessoa = C.id_p' +
        'essoa'
      
        'WHERE  (C.data_ref >= '#39'01.01.2016'#39' AND C.data_ref <= '#39'03.04.2017' +
        #39') AND C.data_pgto IS NULL AND'
      'C.PENDENTE = '#39'NAO'#39' AND  C.ATIVO = '#39'SIM'#39
      'group by P.id_pessoa, p.nome order by p.nome')
    Params = <>
    Properties.Strings = (
      
        'select DISTINCT(P.id_pessoa), p.nome, SUM(C.valor), count(1) fro' +
        'm caixa_saida C'
      'inner join pessoa P on P.id_pessoa = C.id_pessoa'
      
        'where C.data_pgto is NULL and C.data_ref < current_date and C.at' +
        'ivo = '#39'SIM'#39
      'group by P.id_pessoa, p.nome'
      'order by P.nome')
    Left = 328
    Top = 208
  end
  object RV_Query: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ZQUERY1
    Left = 248
    Top = 208
  end
  object ZQUERY2: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select'
      
        '(select first 1 ic.foto1 from imovel_caracteristica ic where ic.' +
        'id_imovel = im.id_imovel and ic.id_caracteristica = 60) as foto1' +
        ','
      
        '(select first 1 ic.foto2 from imovel_caracteristica ic where ic.' +
        'id_imovel = im.id_imovel and ic.id_caracteristica = 60) as foto2' +
        ','
      
        '(select first 1 ic.foto3 from imovel_caracteristica ic where ic.' +
        'id_imovel = im.id_imovel and ic.id_caracteristica = 60) as foto3' +
        ','
      ''
      
        'im.id_imovel, LG.TIPO, lg.nome as ENDERECO, im.numero, ba.nome A' +
        'S BAIRRO, cid.nome AS CIDADE, u.sigla, im.complemento, im.valor_' +
        'venda, im.valor_aluquel, im.area_l, im.area_c,'
      
        'im.area_construida from imovel im left join logradouro lg on lg.' +
        'id_logradouro = im.id_logradouro left join bairro ba on ba.id_ba' +
        'irro = lg.id_bairro'
      
        'left join cidade cid on cid.id_cidade = lg.id_cidade left join u' +
        'f u on u.id_sigla = lg.id_sigla where id_imovel in (1120) order ' +
        'by ba.nome, lg.nome'
      '')
    Params = <>
    Left = 328
    Top = 272
  end
  object RV_Query2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ZQUERY2
    Left = 248
    Top = 264
  end
  object ZQUERY3: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 328
    Top = 328
  end
  object ZQUERY4: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select ic.id_imovel, c.nome, ic.quantidade, ic.obs FROM imovel_c' +
        'aracteristica IC inner join caracteristicas c on c.id_caracteris' +
        'ticas = ic.ID_CARACTERISTICA WHERE IC.id_imovel IN (3) order by ' +
        'IC.id_imovel')
    Params = <>
    Left = 328
    Top = 376
  end
  object RV_Query3: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ZQUERY3
    Left = 248
    Top = 320
  end
  object RV_Query4: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ZQUERY4
    Left = 248
    Top = 376
  end
  object RV_Query5: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ZQUERY5
    Left = 248
    Top = 432
  end
  object ZQUERY5: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select'
      ' pi.id_pessoa,'
      ' pe.nome,'
      '123 as id_contrato,'
      ' COALESCE(pe.email,pe.yahoo, pe.msn) as email,'
      ' pt.nome as TIPO,'
      
        ' (select first 1 skip 0 te.numero from TELEFONE te inner join pe' +
        'ssoa on te.id_pessoa = pe.id_pessoa where te.id_endereco_tipo = ' +
        '1) as TELEFONE,'
      
        ' (select first 1 skip 0 te.numero from TELEFONE te inner join pe' +
        'ssoa on te.id_pessoa = pe.id_pessoa where te.id_endereco_tipo = ' +
        '3) as CELULAR,'
      
        ' (select first 1 skip 0 lg.nome || '#39', '#39' || ed.numero || '#39' - '#39' ||' +
        ' ba.nome || '#39' - '#39' || cid.nome || '#39' ( '#39' || u.sigla || '#39' ) '#39
      ' from endereco ed'
      ' left join pessoa pe on pe.id_pessoa = ed.id_pessoa'
      ' left join logradouro lg on lg.id_logradouro = ed.id_logradouro'
      ' left join bairro ba on ba.id_bairro = lg.id_bairro'
      ' left join cidade cid on cid.id_cidade = lg.id_cidade'
      ' left join uf u on u.id_sigla = lg.id_sigla'
      ' where PE.id_pessoa = pi.id_pessoa) as ENDERECO,'
      ' pi.id_imovel'
      ' from pessoa_imovel pi'
      ' left join imovel im on im.id_imovel = pi.id_imovel'
      ' left  join pessoa pe on pe.id_pessoa = pi.id_pessoa'
      
        ' left join pessoa_tipo pt on pt.id_pessoa_tipo = pi.id_pessoa_ti' +
        'po'
      ' where pi.id_imovel in (1120) order by pi.id_imovel'
      '')
    Params = <>
    Left = 328
    Top = 432
  end
  object TabelaVirtual_Contas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 416
    object TabelaVirtual_ContasID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
    end
    object TabelaVirtual_ContasALUGUEL: TCurrencyField
      FieldName = 'ALUGUEL'
    end
    object TabelaVirtual_ContasTAXA: TCurrencyField
      FieldName = 'TAXA'
    end
    object TabelaVirtual_ContasIPTU: TCurrencyField
      FieldName = 'IPTU'
    end
    object TabelaVirtual_ContasCONDOMINIO: TCurrencyField
      FieldName = 'CONDOMINIO'
    end
    object TabelaVirtual_ContasENERGIA: TCurrencyField
      FieldName = 'ENERGIA'
    end
    object TabelaVirtual_ContasAGUA: TCurrencyField
      FieldName = 'AGUA'
    end
    object TabelaVirtual_ContasGAS: TCurrencyField
      FieldName = 'GAS'
    end
    object TabelaVirtual_ContasOUTROS: TCurrencyField
      FieldName = 'OUTROS'
    end
    object TabelaVirtual_ContasLIQUIDO: TCurrencyField
      FieldName = 'LIQUIDO'
    end
    object TabelaVirtual_ContasMES: TStringField
      FieldName = 'MES'
      Size = 100
    end
    object TabelaVirtual_ContasMEDIA: TStringField
      FieldName = 'MEDIA'
      Size = 200
    end
  end
  object RV_RENDER_HTML: TRvRenderHTML
    DisplayName = 'Pagina da Web (HTML)'
    FileExtension = '*.html;*.htm'
    ServerMode = False
    Left = 680
    Top = 128
  end
  object RV_RENDER_TXT: TRvRenderText
    DisplayName = 'Texto Puro (TXT)'
    FileExtension = '*.txt'
    CPI = 10.000000000000000000
    LPI = 6.000000000000000000
    Left = 680
    Top = 200
  end
end
