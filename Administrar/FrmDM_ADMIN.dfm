object DM_ADMIN: TDM_ADMIN
  OldCreateOrder = False
  Height = 643
  Width = 856
  object Z_ALUGUEL: TZQuery
    Connection = PRINCIPAL.Conexao
    OnCalcFields = Z_ALUGUELCalcFields
    UpdateObject = UPZ_Aluguel
    SQL.Strings = (
      
        'SELECT C.*,im.numero, PC.TIPO ||'#39'-'#39'|| P.NOME AS INQUILINO, (sele' +
        'ct first 1 skip 0 pe.nome from pessoa pe left join pessoa_imovel' +
        ' pi on pi.id_pessoa = pe.id_pessoa where pi.status LIKE '#39'%PROPRI' +
        'ET_RIO%'#39' and pi.id_imovel = C.id_imovel) as PROPRIETARIO, im.com' +
        'plemento, log.nome as logradouro FROM CONTRATO C inner join imov' +
        'el im on im.id_imovel = c.id_imovel inner join logradouro log on' +
        ' log.id_logradouro = im.id_logradouro LEFT JOIN PESSOA_CONTRATO ' +
        'PC ON PC.ID_CONTRATO = C.ID_CONTRATO LEFT JOIN PESSOA P ON P.ID_' +
        'PESSOA = PC.ID_PESSOA WHERE  C.id_contrato = 0')
    Params = <>
    Left = 56
    Top = 24
    object Z_ALUGUELID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object Z_ALUGUELID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ALUGUELTIPO_CONTRATO: TStringField
      FieldName = 'TIPO_CONTRATO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object Z_ALUGUELVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
    end
    object Z_ALUGUELVALOR_REAJUSTE: TFloatField
      FieldName = 'VALOR_REAJUSTE'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ALUGUELVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_ALUGUELTARIFA: TFloatField
      FieldName = 'TARIFA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###0.00'
      EditFormat = '###0.00'
    end
    object Z_ALUGUELVIGENCIA: TSmallintField
      FieldName = 'VIGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELREPASSE: TStringField
      FieldName = 'REPASSE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ALUGUELCORRESPONDENCIA: TStringField
      FieldName = 'CORRESPONDENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ALUGUELMORADORES: TSmallintField
      FieldName = 'MORADORES'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ALUGUELMULTA: TFloatField
      FieldName = 'MULTA'
      ProviderFlags = [pfInUpdate]
      Precision = 3
    end
    object Z_ALUGUELMULTA_MORA: TFloatField
      FieldName = 'MULTA_MORA'
      Precision = 3
    end
    object Z_ALUGUELMULTA_APOS: TSmallintField
      FieldName = 'MULTA_APOS'
      ProviderFlags = [pfInUpdate]
    end
    object f: TFloatField
      FieldName = 'JUROS'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELJUROS_APOS: TSmallintField
      FieldName = 'JUROS_APOS'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELHONORARIO: TFloatField
      FieldName = 'HONORARIO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELHONORARIO_APOS: TSmallintField
      FieldName = 'HONORARIO_APOS'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELREAJUSTE: TStringField
      FieldName = 'REAJUSTE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_ALUGUELREAJUSTE_APOS: TSmallintField
      FieldName = 'REAJUSTE_APOS'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELDESCONTO_ATE: TSmallintField
      FieldName = 'DESCONTO_ATE'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELISENTO_CPMF: TStringField
      FieldName = 'ISENTO_CPMF'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ALUGUELHONORARIO_1ALUGUEL: TStringField
      FieldName = 'HONORARIO_1ALUGUEL'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ALUGUELHONORARIO_ADMIN: TStringField
      FieldName = 'HONORARIO_ADMIN'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ALUGUELHONORARIO_REPASSE: TStringField
      FieldName = 'HONORARIO_REPASSE'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ALUGUELPARCELADO_EM: TSmallintField
      FieldName = 'PARCELADO_EM'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELCOMISSAO_LOCACAO: TFloatField
      FieldName = 'COMISSAO_LOCACAO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELCOMISSAO_CAPTACAO: TFloatField
      FieldName = 'COMISSAO_CAPTACAO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELCOMISSAO_DESPESAS: TFloatField
      FieldName = 'COMISSAO_DESPESAS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ALUGUELCOMISSAO_INDICACAO: TFloatField
      FieldName = 'COMISSAO_INDICACAO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ALUGUELRENTA_ALUGUEL: TFloatField
      FieldName = 'RENTA_ALUGUEL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ALUGUELRENTA_EFETIVADO: TFloatField
      FieldName = 'RENTA_EFETIVADO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ALUGUELRENTA_HONOR_ALUGUEL: TFloatField
      FieldName = 'RENTA_HONOR_ALUGUEL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ALUGUELRENTA_HONOR_ADMIN: TFloatField
      FieldName = 'RENTA_HONOR_ADMIN'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ALUGUELRES_INADIM_OCP: TStringField
      FieldName = 'RES_INADIM_OCP'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ALUGUELRES_INADIM_DES: TStringField
      FieldName = 'RES_INADIM_DES'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ALUGUELRES_ANTECIP_OCP: TStringField
      FieldName = 'RES_ANTECIP_OCP'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ALUGUELRES_ANTECIP_DES: TStringField
      FieldName = 'RES_ANTECIP_DES'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ALUGUELRES_MOTIVO: TStringField
      FieldName = 'RES_MOTIVO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ALUGUELFOTO: TStringField
      FieldName = 'FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ALUGUELDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object Z_ALUGUELATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 3
    end
    object Z_ALUGUELMULTA_MORA_APOS: TSmallintField
      FieldName = 'MULTA_MORA_APOS'
    end
    object Z_ALUGUELID_REFERENCIA: TLargeintField
      FieldName = 'ID_REFERENCIA'
    end
    object Z_ALUGUELALTERACAO_FUNC: TIntegerField
      FieldName = 'ALTERACAO_FUNC'
      Required = True
    end
    object Z_ALUGUELALTERACAO_DATA: TDateTimeField
      FieldName = 'ALTERACAO_DATA'
      Required = True
    end
    object Z_ALUGUELOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object Z_ALUGUELINQUILINO: TStringField
      FieldName = 'INQUILINO'
      ProviderFlags = []
      Size = 100
      Transliterate = False
    end
    object Z_ALUGUELPROPRIETARIO: TStringField
      FieldName = 'PROPRIETARIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
      Transliterate = False
    end
    object Z_ALUGUELINFO_1: TStringField
      FieldName = 'INFO_1'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object Z_ALUGUELINFO_2: TStringField
      FieldName = 'INFO_2'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object Z_ALUGUELINFO_3: TStringField
      FieldName = 'INFO_3'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object Z_ALUGUELINFO_4: TStringField
      FieldName = 'INFO_4'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object Z_ALUGUELCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 200
    end
    object Z_ALUGUELLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      ProviderFlags = []
      Size = 200
    end
    object Z_ALUGUELDATAFINAL: TStringField
      FieldKind = fkCalculated
      FieldName = 'DATAFINAL'
      ProviderFlags = []
      Calculated = True
    end
    object Z_ALUGUELNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = []
    end
  end
  object Z_PESSOA_CONTRATO: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_PESSOA_CONTRATO
    SQL.Strings = (
      
        'SELECT PC.*, P.id_pessoa AS XCODIGO, P.nome AS XNOME, P.cpf_cnpj' +
        ' AS XCPF, P.foto AS XFOTO FROM pessoa_contrato PC'
      'LEFT JOIN CONTRATO C ON C.id_contrato = PC.id_contrato'
      'LEFT JOIN PESSOA P ON P.id_pessoa = PC.id_pessoa'
      'WHERE PC.id_contrato = :CONTRATO'
      'ORDER BY P.NOME')
    Params = <
      item
        DataType = ftString
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    object Z_PESSOA_CONTRATOID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object Z_PESSOA_CONTRATOID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object Z_PESSOA_CONTRATOID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object Z_PESSOA_CONTRATOTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
      Size = 15
    end
    object Z_PESSOA_CONTRATOPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PESSOA_CONTRATOXCODIGO: TIntegerField
      FieldName = 'XCODIGO'
      ProviderFlags = []
    end
    object Z_PESSOA_CONTRATOXNOME: TStringField
      FieldName = 'XNOME'
      ProviderFlags = []
      Size = 100
    end
    object Z_PESSOA_CONTRATOXCPF: TStringField
      FieldName = 'XCPF'
      ProviderFlags = []
      Size = 100
    end
    object Z_PESSOA_CONTRATOXFOTO: TStringField
      FieldName = 'XFOTO'
      ProviderFlags = []
      Size = 100
    end
  end
  object DS_PESSOA_CONTRATO: TDataSource
    DataSet = Z_PESSOA_CONTRATO
    Left = 352
    Top = 96
  end
  object UP_PESSOA_CONTRATO: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pessoa_contrato'
      'WHERE'
      '  pessoa_contrato.ID_PESSOA = :OLD_ID_PESSOA AND'
      '  pessoa_contrato.ID_CONTRATO = :OLD_ID_CONTRATO AND'
      '  pessoa_contrato.ID_IMOVEL = :OLD_ID_IMOVEL AND'
      '  pessoa_contrato.TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'INSERT INTO pessoa_contrato'
      '  (pessoa_contrato.ID_PESSOA, pessoa_contrato.ID_CONTRATO, '
      'pessoa_contrato.ID_IMOVEL, '
      '   pessoa_contrato.TIPO, pessoa_contrato.PORCENTAGEM)'
      'VALUES'
      '  (:ID_PESSOA, :ID_CONTRATO, :ID_IMOVEL, :TIPO, :PORCENTAGEM)')
    ModifySQL.Strings = (
      'UPDATE pessoa_contrato SET'
      '  pessoa_contrato.ID_PESSOA = :ID_PESSOA,'
      '  pessoa_contrato.ID_CONTRATO = :ID_CONTRATO,'
      '  pessoa_contrato.ID_IMOVEL = :ID_IMOVEL,'
      '  pessoa_contrato.TIPO = :TIPO,'
      '  pessoa_contrato.PORCENTAGEM = :PORCENTAGEM'
      'WHERE'
      '  pessoa_contrato.ID_PESSOA = :OLD_ID_PESSOA AND'
      '  pessoa_contrato.ID_CONTRATO = :OLD_ID_CONTRATO AND'
      '  pessoa_contrato.ID_IMOVEL = :OLD_ID_IMOVEL AND'
      '  pessoa_contrato.TIPO = :OLD_TIPO')
    UseSequenceFieldForRefreshSQL = False
    Left = 192
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PORCENTAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_TIPO'
        ParamType = ptUnknown
      end>
  end
  object Z_GARANTIA_CONTRATO: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from contrato_garantia'
      'where'
      'id_contrato = :CODIGO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object Z_GARANTIA_CONTRATOID_CONTRATO_GARANTIA: TIntegerField
      FieldName = 'ID_CONTRATO_GARANTIA'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object Z_GARANTIA_CONTRATOID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_GARANTIA_CONTRATOID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_GARANTIA_CONTRATODEP_VALOR: TFloatField
      FieldName = 'DEP_VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_GARANTIA_CONTRATODEP_PARCELADO: TStringField
      FieldName = 'DEP_PARCELADO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_GARANTIA_CONTRATOSEG_SEGURADORA: TStringField
      FieldName = 'SEG_SEGURADORA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_GARANTIA_CONTRATOSEG_NUM: TStringField
      FieldName = 'SEG_NUM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_GARANTIA_CONTRATOSEG_PRAZO: TSmallintField
      FieldName = 'SEG_PRAZO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_GARANTIA_CONTRATOSEG_MESES: TSmallintField
      FieldName = 'SEG_MESES'
      ProviderFlags = [pfInUpdate]
    end
    object Z_GARANTIA_CONTRATOSEG_PREMIO: TFloatField
      FieldName = 'SEG_PREMIO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_GARANTIA_CONTRATOSEG_CAPITAL: TFloatField
      FieldName = 'SEG_CAPITAL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_GARANTIA_CONTRATOCAL_TIPO: TStringField
      FieldName = 'CAL_TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_GARANTIA_CONTRATOCAL_VALOR: TFloatField
      FieldName = 'CAL_VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_GARANTIA_CONTRATOCAL_DESCRICAO: TMemoField
      FieldName = 'CAL_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object Z_GARANTIA_CONTRATOANEXO: TBlobField
      FieldName = 'ANEXO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_GARANTIA_CONTRATOANEXO_OBS: TStringField
      FieldName = 'ANEXO_OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_GARANTIA_CONTRATOOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_GARANTIA_CONTRATODEP_DESTINO: TStringField
      FieldName = 'DEP_DESTINO'
      Size = 100
    end
  end
  object DS_GARANTIA_CONTRATO: TDataSource
    DataSet = Z_GARANTIA_CONTRATO
    Left = 192
    Top = 152
  end
  object DS_CONTA: TDataSource
    DataSet = Z_CONTA
    Left = 192
    Top = 208
  end
  object Z_CONTA: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 56
    Top = 208
  end
  object Z_CURINGA_01: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 688
    Top = 16
  end
  object DS_CURINGA_01: TDataSource
    DataSet = Z_CURINGA_01
    Left = 784
    Top = 16
  end
  object Z_ANUNCIO: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_ANUNCIO
    SQL.Strings = (
      
        'select A.*,I.imprimir , I.id_imovel XCODIGO, I.numero XNUMERO, I' +
        '.valor_venda XVALORVENDA, I.valor_aluquel XVALORALUGUEL, I.statu' +
        's XSTATUS, I.finalidade XFINALIDADE, IT.nome XTIPO, ISU.nome XSU' +
        'BTIPO from anuncio A'
      'left join imovel I on I.id_imovel = A.id_imovel'
      'left join logradouro L on L.id_logradouro = I.id_logradouro'
      'left join bairro B on L.id_bairro = B.id_bairro'
      'left join imovel_tipo IT on IT.id_imovel_tipo = I.id_imovel_tipo'
      
        'left join imovel_subtipo ISU on ISU.id_imovel_subtipo = I.id_imo' +
        'vel_subtipo')
    Params = <>
    Left = 56
    Top = 312
    object Z_ANUNCIOID_ANUNCIO: TIntegerField
      FieldName = 'ID_ANUNCIO'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object Z_ANUNCIOID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object Z_ANUNCIOMEIO: TStringField
      FieldName = 'MEIO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 15
    end
    object Z_ANUNCIODATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object Z_ANUNCIODATA_FIM: TDateField
      FieldName = 'DATA_FIM'
      ProviderFlags = [pfInWhere]
    end
    object Z_ANUNCIOVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object Z_ANUNCIODESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInWhere]
      Required = True
      BlobType = ftMemo
    end
    object Z_ANUNCIOOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object Z_ANUNCIOATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 3
    end
    object Z_ANUNCIOXCODIGO: TIntegerField
      FieldName = 'XCODIGO'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object Z_ANUNCIOXNUMERO: TIntegerField
      FieldName = 'XNUMERO'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object Z_ANUNCIOXVALORVENDA: TFloatField
      FieldName = 'XVALORVENDA'
      ProviderFlags = [pfInWhere]
    end
    object Z_ANUNCIOXVALORALUGUEL: TFloatField
      FieldName = 'XVALORALUGUEL'
      ProviderFlags = [pfInWhere]
    end
    object Z_ANUNCIOXSTATUS: TStringField
      FieldName = 'XSTATUS'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 15
    end
    object Z_ANUNCIOXFINALIDADE: TStringField
      FieldName = 'XFINALIDADE'
      ProviderFlags = [pfInWhere]
      Size = 15
    end
    object Z_ANUNCIOXTIPO: TStringField
      FieldName = 'XTIPO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 100
    end
    object Z_ANUNCIOXSUBTIPO: TStringField
      FieldName = 'XSUBTIPO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 100
    end
    object Z_ANUNCIOIMPRIMIR: TStringField
      FieldName = 'IMPRIMIR'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
  end
  object UP_ANUNCIO: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM anuncio'
      'WHERE'
      '  anuncio.ID_ANUNCIO = :OLD_ID_ANUNCIO')
    InsertSQL.Strings = (
      'INSERT INTO anuncio'
      '  (anuncio.ID_IMOVEL, anuncio.MEIO, anuncio.DATA_INICIO, '
      'anuncio.DATA_FIM, '
      '   anuncio.VALOR, anuncio.DESCRICAO, anuncio.OBS, anuncio.ATIVO)'
      'VALUES'
      '  (:ID_IMOVEL, :MEIO, :DATA_INICIO, :DATA_FIM, :VALOR, '
      ':DESCRICAO, :OBS, '
      '   :ATIVO)')
    ModifySQL.Strings = (
      'UPDATE anuncio SET'
      '  anuncio.ID_IMOVEL = :ID_IMOVEL,'
      '  anuncio.MEIO = :MEIO,'
      '  anuncio.DATA_INICIO = :DATA_INICIO,'
      '  anuncio.DATA_FIM = :DATA_FIM,'
      '  anuncio.VALOR = :VALOR,'
      '  anuncio.DESCRICAO = :DESCRICAO,'
      '  anuncio.OBS = :OBS,'
      '  anuncio.ATIVO = :ATIVO'
      'WHERE'
      '  anuncio.ID_ANUNCIO = :OLD_ID_ANUNCIO')
    UseSequenceFieldForRefreshSQL = False
    Left = 152
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_FIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_ANUNCIO'
        ParamType = ptUnknown
      end>
  end
  object UPZ_Aluguel: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM contrato'
      'WHERE'
      '  contrato.ID_CONTRATO = :OLD_ID_CONTRATO')
    InsertSQL.Strings = (
      'INSERT INTO contrato'
      '  (contrato.ID_CONTRATO, contrato.ID_IMOVEL, '
      'contrato.TIPO_CONTRATO, contrato.VALOR, '
      '   contrato.VALOR_REAJUSTE, contrato.VENCIMENTO, '
      'contrato.TARIFA, contrato.VIGENCIA, '
      '   contrato.REPASSE, contrato.CORRESPONDENCIA, '
      'contrato.MORADORES, contrato.FINALIDADE, '
      '   contrato.MULTA, contrato.MULTA_APOS, contrato.MULTA_MORA, '
      'contrato.MULTA_MORA_APOS, '
      '   contrato.JUROS, contrato.JUROS_APOS, contrato.HONORARIO, '
      'contrato.HONORARIO_APOS, '
      '   contrato.REAJUSTE, contrato.REAJUSTE_APOS, '
      'contrato.DESCONTO, contrato.DESCONTO_ATE, '
      '   contrato.ISENTO_CPMF, contrato.HONORARIO_1ALUGUEL, '
      'contrato.HONORARIO_ADMIN, '
      '   contrato.HONORARIO_REPASSE, contrato.PARCELADO_EM, '
      'contrato.COMISSAO_LOCACAO, '
      '   contrato.COMISSAO_CAPTACAO, contrato.COMISSAO_DESPESAS, '
      'contrato.COMISSAO_INDICACAO, '
      '   contrato.RENTA_ALUGUEL, contrato.RENTA_EFETIVADO, '
      'contrato.RENTA_HONOR_ALUGUEL, '
      '   contrato.RENTA_HONOR_ADMIN, contrato.RES_INADIM_OCP, '
      'contrato.RES_INADIM_DES, '
      '   contrato.RES_ANTECIP_OCP, contrato.RES_ANTECIP_DES, '
      'contrato.RES_MOTIVO, '
      '   contrato.FOTO, contrato.DATA, contrato.ATIVO, '
      'contrato.ID_REFERENCIA, '
      '   contrato.ALTERACAO_FUNC, contrato.ALTERACAO_DATA, '
      'contrato.OBS, contrato.INFO_1, '
      '   contrato.INFO_2, contrato.INFO_3, contrato.INFO_4)'
      'VALUES'
      '  (:ID_CONTRATO, :ID_IMOVEL, :TIPO_CONTRATO, :VALOR, '
      ':VALOR_REAJUSTE, :VENCIMENTO, '
      '   :TARIFA, :VIGENCIA, :REPASSE, :CORRESPONDENCIA, '
      ':MORADORES, :FINALIDADE, '
      '   :MULTA, :MULTA_APOS, :MULTA_MORA, :MULTA_MORA_APOS, '
      ':JUROS, :JUROS_APOS, '
      '   :HONORARIO, :HONORARIO_APOS, :REAJUSTE, '
      ':REAJUSTE_APOS, :DESCONTO, :DESCONTO_ATE, '
      '   :ISENTO_CPMF, :HONORARIO_1ALUGUEL, :HONORARIO_ADMIN, '
      ':HONORARIO_REPASSE, '
      '   :PARCELADO_EM, :COMISSAO_LOCACAO, :COMISSAO_CAPTACAO, '
      ':COMISSAO_DESPESAS, '
      '   :COMISSAO_INDICACAO, :RENTA_ALUGUEL, :RENTA_EFETIVADO, '
      ':RENTA_HONOR_ALUGUEL, '
      '   :RENTA_HONOR_ADMIN, :RES_INADIM_OCP, :RES_INADIM_DES, '
      ':RES_ANTECIP_OCP, '
      '   :RES_ANTECIP_DES, :RES_MOTIVO, :FOTO, :DATA, :ATIVO, '
      ':ID_REFERENCIA, '
      '   :ALTERACAO_FUNC, :ALTERACAO_DATA, :OBS, :INFO_1, :INFO_2, '
      ':INFO_3, :INFO_4)')
    ModifySQL.Strings = (
      'UPDATE contrato SET'
      '  contrato.ID_CONTRATO = :ID_CONTRATO,'
      '  contrato.ID_IMOVEL = :ID_IMOVEL,'
      '  contrato.TIPO_CONTRATO = :TIPO_CONTRATO,'
      '  contrato.VALOR = :VALOR,'
      '  contrato.VALOR_REAJUSTE = :VALOR_REAJUSTE,'
      '  contrato.VENCIMENTO = :VENCIMENTO,'
      '  contrato.TARIFA = :TARIFA,'
      '  contrato.VIGENCIA = :VIGENCIA,'
      '  contrato.REPASSE = :REPASSE,'
      '  contrato.CORRESPONDENCIA = :CORRESPONDENCIA,'
      '  contrato.MORADORES = :MORADORES,'
      '  contrato.FINALIDADE = :FINALIDADE,'
      '  contrato.MULTA = :MULTA,'
      '  contrato.MULTA_APOS = :MULTA_APOS,'
      '  contrato.MULTA_MORA = :MULTA_MORA,'
      '  contrato.MULTA_MORA_APOS = :MULTA_MORA_APOS,'
      '  contrato.JUROS = :JUROS,'
      '  contrato.JUROS_APOS = :JUROS_APOS,'
      '  contrato.HONORARIO = :HONORARIO,'
      '  contrato.HONORARIO_APOS = :HONORARIO_APOS,'
      '  contrato.REAJUSTE = :REAJUSTE,'
      '  contrato.REAJUSTE_APOS = :REAJUSTE_APOS,'
      '  contrato.DESCONTO = :DESCONTO,'
      '  contrato.DESCONTO_ATE = :DESCONTO_ATE,'
      '  contrato.ISENTO_CPMF = :ISENTO_CPMF,'
      '  contrato.HONORARIO_1ALUGUEL = :HONORARIO_1ALUGUEL,'
      '  contrato.HONORARIO_ADMIN = :HONORARIO_ADMIN,'
      '  contrato.HONORARIO_REPASSE = :HONORARIO_REPASSE,'
      '  contrato.PARCELADO_EM = :PARCELADO_EM,'
      '  contrato.COMISSAO_LOCACAO = :COMISSAO_LOCACAO,'
      '  contrato.COMISSAO_CAPTACAO = :COMISSAO_CAPTACAO,'
      '  contrato.COMISSAO_DESPESAS = :COMISSAO_DESPESAS,'
      '  contrato.COMISSAO_INDICACAO = :COMISSAO_INDICACAO,'
      '  contrato.RENTA_ALUGUEL = :RENTA_ALUGUEL,'
      '  contrato.RENTA_EFETIVADO = :RENTA_EFETIVADO,'
      '  contrato.RENTA_HONOR_ALUGUEL = :RENTA_HONOR_ALUGUEL,'
      '  contrato.RENTA_HONOR_ADMIN = :RENTA_HONOR_ADMIN,'
      '  contrato.RES_INADIM_OCP = :RES_INADIM_OCP,'
      '  contrato.RES_INADIM_DES = :RES_INADIM_DES,'
      '  contrato.RES_ANTECIP_OCP = :RES_ANTECIP_OCP,'
      '  contrato.RES_ANTECIP_DES = :RES_ANTECIP_DES,'
      '  contrato.RES_MOTIVO = :RES_MOTIVO,'
      '  contrato.FOTO = :FOTO,'
      '  contrato.DATA = :DATA,'
      '  contrato.ATIVO = :ATIVO,'
      '  contrato.ID_REFERENCIA = :ID_REFERENCIA,'
      '  contrato.ALTERACAO_FUNC = :ALTERACAO_FUNC,'
      '  contrato.ALTERACAO_DATA = :ALTERACAO_DATA,'
      '  contrato.OBS = :OBS,'
      '  contrato.INFO_1 = :INFO_1,'
      '  contrato.INFO_2 = :INFO_2,'
      '  contrato.INFO_3 = :INFO_3,'
      '  contrato.INFO_4 = :INFO_4'
      'WHERE'
      '  contrato.ID_CONTRATO = :OLD_ID_CONTRATO')
    UseSequenceFieldForRefreshSQL = False
    Left = 144
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_REAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TARIFA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REPASSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CORRESPONDENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MORADORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MULTA_APOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MULTA_MORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MULTA_MORA_APOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'JUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'JUROS_APOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HONORARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HONORARIO_APOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REAJUSTE_APOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCONTO_ATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ISENTO_CPMF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HONORARIO_1ALUGUEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HONORARIO_ADMIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HONORARIO_REPASSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELADO_EM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COMISSAO_LOCACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COMISSAO_CAPTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COMISSAO_DESPESAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COMISSAO_INDICACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RENTA_ALUGUEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RENTA_EFETIVADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RENTA_HONOR_ALUGUEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RENTA_HONOR_ADMIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RES_INADIM_OCP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RES_INADIM_DES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RES_ANTECIP_OCP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RES_ANTECIP_DES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RES_MOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALTERACAO_FUNC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALTERACAO_DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INFO_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INFO_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INFO_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INFO_4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CONTRATO'
        ParamType = ptUnknown
      end>
  end
  object ZLog: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from log')
    Params = <>
    Left = 56
    Top = 408
    object ZLogID_LOG: TIntegerField
      FieldName = 'ID_LOG'
      Required = True
    end
    object ZLogACAO: TStringField
      FieldName = 'ACAO'
      Required = True
      Size = 3
    end
    object ZLogCOMPONENTE: TStringField
      FieldName = 'COMPONENTE'
      Required = True
      Size = 100
    end
    object ZLogCAMPOS: TMemoField
      FieldName = 'CAMPOS'
      BlobType = ftMemo
    end
    object ZLogDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object ZLogID_FUNC: TIntegerField
      FieldName = 'ID_FUNC'
      Required = True
    end
    object ZLogID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
      Required = True
    end
    object ZLogOBS: TStringField
      FieldName = 'OBS'
      Size = 300
    end
    object ZLogATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 3
    end
  end
  object DSAnuncio: TDataSource
    Left = 256
    Top = 312
  end
  object Z_Caixa_Sis: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from caixa_sis')
    Params = <>
    Left = 56
    Top = 488
    object Z_Caixa_SisID_CAIXA_SIS: TIntegerField
      FieldName = 'ID_CAIXA_SIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_Caixa_SisTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 10
    end
    object Z_Caixa_SisNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object Z_Caixa_SisCOL1: TStringField
      FieldName = 'COL1'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object Z_Caixa_SisCOL2: TStringField
      FieldName = 'COL2'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object Z_Caixa_SisCOL3: TStringField
      FieldName = 'COL3'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object Z_Caixa_SisCOL4: TStringField
      FieldName = 'COL4'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object Z_Caixa_SisANOTACAO: TMemoField
      FieldName = 'ANOTACAO'
      ProviderFlags = [pfInWhere]
      BlobType = ftMemo
    end
    object Z_Caixa_SisPADRAO: TStringField
      FieldName = 'PADRAO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 3
    end
    object Z_Caixa_SisATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInWhere]
      Required = True
      Size = 3
    end
  end
  object Z_Sistema: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from sistema')
    Params = <>
    Left = 168
    Top = 488
    object Z_SistemaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 50
    end
    object Z_SistemaVALOR: TStringField
      FieldName = 'VALOR'
      Size = 400
    end
  end
end
