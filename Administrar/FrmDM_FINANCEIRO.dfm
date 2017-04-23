object DM_FINANCEIRO: TDM_FINANCEIRO
  OldCreateOrder = False
  Height = 733
  Width = 889
  object ZContaEntrada: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UpContaEntrada
    SQL.Strings = (
      
        'select CE.*, C.conta XCONTA, CG.nome XGRUPO, CS.nome XSUBGRUPO, ' +
        'p.nome, CASE WHEN CE.DATA_PGTO > CE.DATA_REF THEN CE.valortotal ' +
        'ELSE CAST(CE.valor + (CE.multa - ((CE.valor * CE.desconto)/100))' +
        ' AS NUMERIC(9,2)) END AS VALORCALC  '
      'from conta_entrada CE'
      'left join pessoa p on p.id_pessoa = ce.id_pessoa'
      'left join conta C on C.id_contas = CE.id_contas'
      'left join conta_grupo CG on CG.id_conta_grupo = CE.id_conta_tipo'
      
        'left join conta_subgrupo CS on CS.id_conta_subgrupo = CE.id_cont' +
        'a_subtipo'
      'where CE.id_contas_entada = 0')
    Params = <>
    Left = 64
    Top = 32
    object ZContaEntradaID_CONTAS_ENTADA: TIntegerField
      FieldName = 'ID_CONTAS_ENTADA'
    end
    object ZContaEntradaID_CONTA_TIPO: TIntegerField
      FieldName = 'ID_CONTA_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZContaEntradaID_CONTA_SUBTIPO: TIntegerField
      FieldName = 'ID_CONTA_SUBTIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZContaEntradaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaID_CONTAS: TIntegerField
      FieldName = 'ID_CONTAS'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaID_CONTA_FORMA: TIntegerField
      FieldName = 'ID_CONTA_FORMA'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaDATA_REF: TDateField
      FieldName = 'DATA_REF'
      ProviderFlags = [pfInUpdate]
      OnSetText = ZContaEntradaDATA_REFSetText
      EditMask = '99/99/9999;1;_'
    end
    object ZContaEntradaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZContaEntradaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object ZContaEntradaVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object ZContaEntradaPARCELADO: TStringField
      FieldName = 'PARCELADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object ZContaEntradaPARCELA: TSmallintField
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaPARCELA_TOTAL: TSmallintField
      FieldName = 'PARCELA_TOTAL'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaEntradaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object ZContaEntradaDATA: TDateTimeField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = ZContaEntradaDATASetText
      EditMask = '99/99/9999;1;_'
    end
    object ZContaEntradaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object ZContaEntradaATIVO_EXTRA: TStringField
      FieldName = 'ATIVO_EXTRA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object ZContaEntradaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object ZContaEntradaID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZContaEntradaJUROS: TFloatField
      FieldName = 'JUROS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZContaEntradaMULTA: TFloatField
      FieldName = 'MULTA'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object ZContaEntradaVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      currency = True
    end
    object ZContaEntradaID_CONTA_ENTRADA: TIntegerField
      FieldName = 'ID_CONTA_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
    end
    object ZContaEntradaXCONTA: TStringField
      FieldName = 'XCONTA'
      ProviderFlags = []
      ReadOnly = True
    end
    object ZContaEntradaXGRUPO: TStringField
      FieldName = 'XGRUPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ZContaEntradaXSUBGRUPO: TStringField
      FieldName = 'XSUBGRUPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ZContaEntradaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object UpContaEntrada: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM conta_entrada'
      'WHERE'
      '  conta_entrada.ID_CONTAS_ENTADA = :OLD_ID_CONTAS_ENTADA')
    InsertSQL.Strings = (
      'INSERT INTO conta_entrada'
      '  (conta_entrada.ID_CONTAS_ENTADA, '
      'conta_entrada.ID_CONTA_TIPO, conta_entrada.ID_CONTA_SUBTIPO, '
      '   conta_entrada.ID_PESSOA, conta_entrada.ID_IMOVEL, '
      'conta_entrada.ID_CONTAS, '
      '   conta_entrada.ID_FUNCIONARIO, conta_entrada.ID_CONTRATO, '
      'conta_entrada.ID_CONTA_FORMA, '
      '   conta_entrada.DATA_PGTO, conta_entrada.DATA_REF, '
      'conta_entrada.DOCUMENTO, '
      '   conta_entrada.OPERACAO, conta_entrada.VALOR, '
      'conta_entrada.PARCELADO, '
      '   conta_entrada.PARCELA, conta_entrada.PARCELA_TOTAL, '
      'conta_entrada.OBS, '
      '   conta_entrada.DATA, conta_entrada.ATIVO, '
      'conta_entrada.ATIVO_EXTRA, '
      '   conta_entrada.DESCONTO, conta_entrada.ID_FUNCIONARIO_BAIXA, '
      'conta_entrada.JUROS, '
      '   conta_entrada.MULTA)'
      'VALUES'
      '  (:ID_CONTAS_ENTADA, :ID_CONTA_TIPO, :ID_CONTA_SUBTIPO, '
      ':ID_PESSOA, :ID_IMOVEL, '
      '   :ID_CONTAS, :ID_FUNCIONARIO, :ID_CONTRATO, '
      ':ID_CONTA_FORMA, :DATA_PGTO, '
      '   :DATA_REF, :DOCUMENTO, :OPERACAO, :VALOR, :PARCELADO, '
      ':PARCELA, :PARCELA_TOTAL, '
      '   :OBS, :DATA, :ATIVO, :ATIVO_EXTRA, :DESCONTO, '
      ':ID_FUNCIONARIO_BAIXA, '
      '   :JUROS, :MULTA)')
    ModifySQL.Strings = (
      'UPDATE conta_entrada SET'
      '  conta_entrada.ID_CONTAS_ENTADA = :ID_CONTAS_ENTADA,'
      '  conta_entrada.ID_CONTA_TIPO = :ID_CONTA_TIPO,'
      '  conta_entrada.ID_CONTA_SUBTIPO = :ID_CONTA_SUBTIPO,'
      '  conta_entrada.ID_PESSOA = :ID_PESSOA,'
      '  conta_entrada.ID_IMOVEL = :ID_IMOVEL,'
      '  conta_entrada.ID_CONTAS = :ID_CONTAS,'
      '  conta_entrada.ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  conta_entrada.ID_CONTRATO = :ID_CONTRATO,'
      '  conta_entrada.ID_CONTA_FORMA = :ID_CONTA_FORMA,'
      '  conta_entrada.DATA_PGTO = :DATA_PGTO,'
      '  conta_entrada.DATA_REF = :DATA_REF,'
      '  conta_entrada.DOCUMENTO = :DOCUMENTO,'
      '  conta_entrada.OPERACAO = :OPERACAO,'
      '  conta_entrada.VALOR = :VALOR,'
      '  conta_entrada.PARCELADO = :PARCELADO,'
      '  conta_entrada.PARCELA = :PARCELA,'
      '  conta_entrada.PARCELA_TOTAL = :PARCELA_TOTAL,'
      '  conta_entrada.OBS = :OBS,'
      '  conta_entrada.DATA = :DATA,'
      '  conta_entrada.ATIVO = :ATIVO,'
      '  conta_entrada.ATIVO_EXTRA = :ATIVO_EXTRA,'
      '  conta_entrada.DESCONTO = :DESCONTO,'
      '  conta_entrada.ID_FUNCIONARIO_BAIXA = :ID_FUNCIONARIO_BAIXA,'
      '  conta_entrada.JUROS = :JUROS,'
      '  conta_entrada.MULTA = :MULTA'
      'WHERE'
      '  conta_entrada.ID_CONTAS_ENTADA = :OLD_ID_CONTAS_ENTADA')
    UseSequenceFieldForRefreshSQL = False
    Left = 168
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTAS_ENTADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTA_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTA_SUBTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTA_FORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELA_TOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS'
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
        Name = 'ATIVO_EXTRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO_BAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'JUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CONTAS_ENTADA'
        ParamType = ptUnknown
      end>
  end
  object ZContaEntradaRecibo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from conta_entrada CE'
      'where'
      'CE.id_imovel = :CODIGO and'
      'Extract(month from CE.data_ref) <= 9 and'
      'Extract(year from CE.data_ref) <= 2006 and'
      'CE.ativo = '#39'SIM'#39' and'
      'CE.ativo_extra = '#39'NAO'#39
      'order by CE.data')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object ZContaSaidaRecibo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from conta_saida CS'
      'where'
      'CS.id_imovel = :CODIGO and'
      'Extract(month from CS.data_ref) <= 9 and'
      'Extract(year from CS.data_ref) <= 2006 and'
      'CS.ativo = '#39'SIM'#39' and'
      'CS.ativo_extra = '#39'NAO'#39
      'order by CS.data')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object ZContaSubgrupo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from conta_subgrupo where id_conta_subgrupo = 0')
    Params = <>
    Left = 64
    Top = 248
    object ZContaSubgrupoID_CONTA_SUBGRUPO: TIntegerField
      FieldName = 'ID_CONTA_SUBGRUPO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ZContaSubgrupoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZContaSubgrupoOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZContaSubgrupoPADRAO: TStringField
      FieldName = 'PADRAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object ZContaSubgrupoATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
  end
  object ZContaGrupo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from conta_grupo where id_conta_grupo = 0')
    Params = <>
    Left = 64
    Top = 328
    object ZContaGrupoID_CONTA_GRUPO: TIntegerField
      FieldName = 'ID_CONTA_GRUPO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ZContaGrupoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZContaGrupoOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZContaGrupoPADRAO: TStringField
      FieldName = 'PADRAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object ZContaGrupoATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
  end
  object ZConta: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from conta where id_contas = 0')
    Params = <>
    Left = 64
    Top = 392
    object ZContaID_CONTAS: TIntegerField
      FieldName = 'ID_CONTAS'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ZContaDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZContaAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZContaCONTA: TStringField
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZContaSALDO_INICIAL: TFloatField
      FieldName = 'SALDO_INICIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object ZContaBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object ZContaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object ZContaDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZContaPADRAO: TStringField
      FieldName = 'PADRAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object ZContaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
  end
  object ZForma: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from conta_forma where id_conta_forma = 0')
    Params = <>
    Left = 64
    Top = 464
    object ZFormaID_CONTA_FORMA: TIntegerField
      FieldName = 'ID_CONTA_FORMA'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ZFormaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZFormaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object ZFormaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
  end
  object ZCheque: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = ZUpdateCheque
    SQL.Strings = (
      'select c.*, p.nome as nome_normal, p.nome_fantasia from cheque c'
      'left join pessoa p on p.id_pessoa = c.id_pessoa'
      'where id_cheque = 0')
    Params = <>
    Left = 64
    Top = 520
    object ZChequeID_CHEQUE: TIntegerField
      FieldName = 'ID_CHEQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ZChequeBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object ZChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZChequeCC: TStringField
      FieldName = 'CC'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZChequeNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZChequeDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object ZChequeID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZChequeID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
    end
    object ZChequeNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZChequeRG: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZChequeCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZChequeENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object ZChequeTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object ZChequeTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object ZChequeVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object ZChequeOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZChequeDATA_REF: TDateField
      FieldName = 'DATA_REF'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object ZChequeATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZChequeDATA_BAIXA: TDateField
      FieldName = 'DATA_BAIXA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object ZChequeNOME_NORMAL: TStringField
      FieldName = 'NOME_NORMAL'
      ProviderFlags = []
      Size = 100
    end
    object ZChequeNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
  end
  object ZContaSaida: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UpContaSaida
    SQL.Strings = (
      
        'select CE.*, C.conta XCONTA, CG.nome XGRUPO, CS.nome XSUBGRUPO, ' +
        'P.NOME, CASE WHEN CE.DATA_PGTO > CE.DATA_REF THEN CE.valortotal ' +
        'ELSE CAST(CE.valor + (CE.multa - ((CE.valor * CE.desconto)/100))' +
        ' AS NUMERIC(9,2)) END AS VALORCALC  '
      'from conta_saida ce'
      'LEFT JOIN PESSOA P ON P.ID_PESSOA = CE.ID_PESSOA'
      'left join conta C on C.id_contas = CE.id_contas'
      'left join conta_grupo CG on CG.id_conta_grupo = CE.id_conta_tipo'
      
        'left join conta_subgrupo CS on CS.id_conta_subgrupo = CE.id_cont' +
        'a_subtipo'
      'where CE.id_contas_entada = 0')
    Params = <>
    Left = 288
    Top = 32
    object ZContaSaidaID_CONTAS_ENTADA: TIntegerField
      FieldName = 'ID_CONTAS_ENTADA'
    end
    object ZContaSaidaID_CONTA_TIPO: TIntegerField
      FieldName = 'ID_CONTA_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaID_CONTA_SUBTIPO: TIntegerField
      FieldName = 'ID_CONTA_SUBTIPO'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaID_CONTAS: TIntegerField
      FieldName = 'ID_CONTAS'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaID_CONTA_FORMA: TIntegerField
      FieldName = 'ID_CONTA_FORMA'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaDATA_REF: TDateField
      FieldName = 'DATA_REF'
      ProviderFlags = [pfInUpdate]
      OnSetText = ZContaSaidaDATA_REFSetText
      EditMask = '99/99/9999;1;_'
    end
    object ZContaSaidaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZContaSaidaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object ZContaSaidaVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZContaSaidaPARCELADO: TStringField
      FieldName = 'PARCELADO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZContaSaidaPARCELA: TSmallintField
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaPARCELA_TOTAL: TSmallintField
      FieldName = 'PARCELA_TOTAL'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object ZContaSaidaDATA: TDateTimeField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      OnSetText = ZContaSaidaDATASetText
      EditMask = '99/99/9999;1;_'
    end
    object ZContaSaidaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ZContaSaidaATIVO_EXTRA: TStringField
      FieldName = 'ATIVO_EXTRA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZContaSaidaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZContaSaidaID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaJUROS: TFloatField
      FieldName = 'JUROS'
      ProviderFlags = [pfInUpdate]
    end
    object ZContaSaidaMULTA: TFloatField
      FieldName = 'MULTA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZContaSaidaVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZContaSaidaXCONTA: TStringField
      FieldName = 'XCONTA'
      ProviderFlags = []
    end
    object ZContaSaidaXGRUPO: TStringField
      FieldName = 'XGRUPO'
      ProviderFlags = []
      Size = 100
    end
    object ZContaSaidaXSUBGRUPO: TStringField
      FieldName = 'XSUBGRUPO'
      ProviderFlags = []
      Size = 100
    end
    object ZContaSaidaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object ZqItensContaEntrada: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'SELECT id_contas_entada, ID_CONTA_TIPO,ID_CONTA_SUBTIPO,ID_PESSO' +
        'A,ID_IMOVEL,'
      
        '             ID_CONTAS,ID_FUNCIONARIO,ID_CONTRATO,ID_CONTA_FORMA' +
        ','
      '             DATA_PGTO,DATA_REF,DOCUMENTO,OPERACAO,VALOR,'
      '             PARCELADO,PARCELA,PARCELA_TOTAL,OBS,DATA,ATIVO,'
      
        '             ATIVO_EXTRA,DESCONTO,ID_FUNCIONARIO_BAIXA,JUROS,MUL' +
        'TA,VALORTOTAL'
      'FROM CONTA_ENTRADA'
      'where ATIVO = '#39'SIM'#39' AND'
      '           ID_CONTRATO = :PCONTRATO AND'
      '           ID_IMOVEL = :PIMOVEL AND'
      '           ID_PESSOA = :PPESSOA AND'
      '           ID_CONTAS_ENTADA <> :PIDCONTAENTRADA'
      ''
      'ORDER BY DATA_REF')
    Params = <
      item
        DataType = ftInteger
        Name = 'PCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTAENTRADA'
        ParamType = ptInput
      end>
    Left = 576
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTAENTRADA'
        ParamType = ptInput
      end>
    object ZqItensContaEntradaGRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPO'
      LookupDataSet = ZContaTipo
      LookupKeyFields = 'ID_CONTA_GRUPO'
      LookupResultField = 'NOME'
      KeyFields = 'ID_CONTA_TIPO'
      ProviderFlags = []
      Size = 100
      Lookup = True
    end
    object ZqItensContaEntradaSUBGRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'SUBGRUPO'
      LookupDataSet = ZContaSubtipo
      LookupKeyFields = 'ID_CONTA_SUBGRUPO'
      LookupResultField = 'NOME'
      KeyFields = 'ID_CONTA_SUBTIPO'
      ProviderFlags = []
      Size = 30
      Lookup = True
    end
    object ZqItensContaEntradaID_CONTAS_ENTADA: TIntegerField
      FieldName = 'ID_CONTAS_ENTADA'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object ZqItensContaEntradaID_CONTA_TIPO: TIntegerField
      FieldName = 'ID_CONTA_TIPO'
      Required = True
    end
    object ZqItensContaEntradaID_CONTA_SUBTIPO: TIntegerField
      FieldName = 'ID_CONTA_SUBTIPO'
      Required = True
    end
    object ZqItensContaEntradaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object ZqItensContaEntradaID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
    end
    object ZqItensContaEntradaID_CONTAS: TIntegerField
      FieldName = 'ID_CONTAS'
    end
    object ZqItensContaEntradaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object ZqItensContaEntradaID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
    end
    object ZqItensContaEntradaID_CONTA_FORMA: TIntegerField
      FieldName = 'ID_CONTA_FORMA'
    end
    object ZqItensContaEntradaDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
    end
    object ZqItensContaEntradaDATA_REF: TDateField
      FieldName = 'DATA_REF'
      EditMask = '99/99/9999;1;_'
    end
    object ZqItensContaEntradaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 100
    end
    object ZqItensContaEntradaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 400
    end
    object ZqItensContaEntradaVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      currency = True
    end
    object ZqItensContaEntradaPARCELADO: TStringField
      FieldName = 'PARCELADO'
      Required = True
      Size = 3
    end
    object ZqItensContaEntradaPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object ZqItensContaEntradaPARCELA_TOTAL: TSmallintField
      FieldName = 'PARCELA_TOTAL'
    end
    object ZqItensContaEntradaOBS: TStringField
      FieldName = 'OBS'
      Size = 300
    end
    object ZqItensContaEntradaDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object ZqItensContaEntradaATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 3
    end
    object ZqItensContaEntradaATIVO_EXTRA: TStringField
      FieldName = 'ATIVO_EXTRA'
      Required = True
      Size = 3
    end
    object ZqItensContaEntradaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Required = True
    end
    object ZqItensContaEntradaID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
      Required = True
    end
    object ZqItensContaEntradaJUROS: TFloatField
      FieldName = 'JUROS'
      Required = True
    end
    object ZqItensContaEntradaMULTA: TFloatField
      FieldName = 'MULTA'
      Required = True
    end
    object ZqItensContaEntradaVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
  end
  object dsItensContaEntrada: TDataSource
    DataSet = ZqItensContaEntrada
    Left = 576
    Top = 280
  end
  object ZContaTipo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select *'
      'from conta_grupo')
    Params = <>
    Left = 576
    Top = 168
  end
  object ZContaSubtipo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select *'
      'from conta_subgrupo')
    Params = <>
    Left = 672
    Top = 168
  end
  object ZqItensContaSaida: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'SELECT id_contas_entada, ID_CONTA_TIPO,ID_CONTA_SUBTIPO,ID_PESSO' +
        'A,ID_IMOVEL,'
      
        '             ID_CONTAS,ID_FUNCIONARIO,ID_CONTRATO,ID_CONTA_FORMA' +
        ','
      '             DATA_PGTO,DATA_REF,DOCUMENTO,OPERACAO,VALOR,'
      '             PARCELADO,PARCELA,PARCELA_TOTAL,OBS,DATA,ATIVO,'
      
        '             ATIVO_EXTRA,DESCONTO,ID_FUNCIONARIO_BAIXA,JUROS,MUL' +
        'TA'
      'FROM CONTA_SAIDA'
      'where ATIVO = '#39'SIM'#39' AND'
      '           ID_CONTRATO = :PCONTRATO AND'
      '           ID_IMOVEL = :PIMOVEL AND'
      '           ID_PESSOA = :PPESSOA AND'
      '           ID_CONTAS_ENTADA <> :PPCONTAENTADA'
      ''
      'ORDER BY DATA_REF')
    Params = <
      item
        DataType = ftInteger
        Name = 'PCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPCONTAENTADA'
        ParamType = ptInput
      end>
    Left = 680
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPCONTAENTADA'
        ParamType = ptInput
      end>
    object ZqItensContaSaidaGRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPO'
      LookupDataSet = ZContaTipo
      LookupKeyFields = 'ID_CONTA_GRUPO'
      LookupResultField = 'NOME'
      KeyFields = 'ID_CONTA_TIPO'
      ProviderFlags = []
      Size = 50
      Lookup = True
    end
    object ZqItensContaSaidaSUBGRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'SUBGRUPO'
      LookupDataSet = ZContaSubtipo
      LookupKeyFields = 'ID_CONTA_SUBGRUPO'
      LookupResultField = 'NOME'
      KeyFields = 'ID_CONTA_SUBTIPO'
      ProviderFlags = []
      Size = 30
      Lookup = True
    end
    object ZqItensContaSaidaID_CONTAS_ENTADA: TIntegerField
      FieldName = 'ID_CONTAS_ENTADA'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object ZqItensContaSaidaID_CONTA_TIPO: TIntegerField
      FieldName = 'ID_CONTA_TIPO'
      Required = True
    end
    object ZqItensContaSaidaID_CONTA_SUBTIPO: TIntegerField
      FieldName = 'ID_CONTA_SUBTIPO'
      Required = True
    end
    object ZqItensContaSaidaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object ZqItensContaSaidaID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
    end
    object ZqItensContaSaidaID_CONTAS: TIntegerField
      FieldName = 'ID_CONTAS'
    end
    object ZqItensContaSaidaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object ZqItensContaSaidaID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
    end
    object ZqItensContaSaidaID_CONTA_FORMA: TIntegerField
      FieldName = 'ID_CONTA_FORMA'
    end
    object ZqItensContaSaidaDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
    end
    object ZqItensContaSaidaDATA_REF: TDateField
      FieldName = 'DATA_REF'
      EditMask = '99/99/9999;1;_'
    end
    object ZqItensContaSaidaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 100
    end
    object ZqItensContaSaidaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 400
    end
    object ZqItensContaSaidaVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      currency = True
    end
    object ZqItensContaSaidaPARCELADO: TStringField
      FieldName = 'PARCELADO'
      Required = True
      Size = 3
    end
    object ZqItensContaSaidaPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object ZqItensContaSaidaPARCELA_TOTAL: TSmallintField
      FieldName = 'PARCELA_TOTAL'
    end
    object ZqItensContaSaidaOBS: TStringField
      FieldName = 'OBS'
      Size = 300
    end
    object ZqItensContaSaidaDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object ZqItensContaSaidaATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 100
    end
    object ZqItensContaSaidaATIVO_EXTRA: TStringField
      FieldName = 'ATIVO_EXTRA'
      Required = True
      Size = 3
    end
    object ZqItensContaSaidaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Required = True
    end
    object ZqItensContaSaidaID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
      Required = True
    end
    object ZqItensContaSaidaJUROS: TFloatField
      FieldName = 'JUROS'
      Required = True
    end
    object ZqItensContaSaidaMULTA: TFloatField
      FieldName = 'MULTA'
      Required = True
    end
  end
  object dsItensContaSaida: TDataSource
    DataSet = ZqItensContaSaida
    Left = 680
    Top = 280
  end
  object ZqContaCheque: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from conta_cheque')
    Params = <>
    Left = 600
    Top = 16
  end
  object ZqAux: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 528
    Top = 16
  end
  object UpContaSaida: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM conta_saida'
      'WHERE'
      '  conta_saida.ID_CONTAS_ENTADA = :OLD_ID_CONTAS_ENTADA')
    InsertSQL.Strings = (
      'INSERT INTO conta_saida'
      
        '  (conta_saida.ID_CONTAS_ENTADA, conta_saida.ID_CONTA_TIPO, cont' +
        'a_saida.ID_CONTA_SUBTIPO, '
      
        '   conta_saida.ID_PESSOA, conta_saida.ID_IMOVEL, conta_saida.ID_' +
        'CONTAS, '
      
        '   conta_saida.ID_FUNCIONARIO, conta_saida.ID_CONTRATO, conta_sa' +
        'ida.ID_CONTA_FORMA, '
      
        '   conta_saida.DATA_PGTO, conta_saida.DATA_REF, conta_saida.DOCU' +
        'MENTO, '
      
        '   conta_saida.OPERACAO, conta_saida.VALOR, conta_saida.PARCELAD' +
        'O, conta_saida.PARCELA, '
      
        '   conta_saida.PARCELA_TOTAL, conta_saida.OBS, conta_saida.DATA,' +
        ' conta_saida.ATIVO, '
      
        '   conta_saida.ATIVO_EXTRA, conta_saida.DESCONTO, conta_saida.ID' +
        '_FUNCIONARIO_BAIXA, '
      '   conta_saida.JUROS, conta_saida.MULTA)'
      'VALUES'
      
        '  (:ID_CONTAS_ENTADA, :ID_CONTA_TIPO, :ID_CONTA_SUBTIPO, :ID_PES' +
        'SOA, :ID_IMOVEL, '
      
        '   :ID_CONTAS, :ID_FUNCIONARIO, :ID_CONTRATO, :ID_CONTA_FORMA, :' +
        'DATA_PGTO, '
      
        '   :DATA_REF, :DOCUMENTO, :OPERACAO, :VALOR, :PARCELADO, :PARCEL' +
        'A, :PARCELA_TOTAL, '
      
        '   :OBS, :DATA, :ATIVO, :ATIVO_EXTRA, :DESCONTO, :ID_FUNCIONARIO' +
        '_BAIXA, '
      '   :JUROS, :MULTA)')
    ModifySQL.Strings = (
      'UPDATE conta_saida SET'
      '  conta_saida.ID_CONTAS_ENTADA = :ID_CONTAS_ENTADA,'
      '  conta_saida.ID_CONTA_TIPO = :ID_CONTA_TIPO,'
      '  conta_saida.ID_CONTA_SUBTIPO = :ID_CONTA_SUBTIPO,'
      '  conta_saida.ID_PESSOA = :ID_PESSOA,'
      '  conta_saida.ID_IMOVEL = :ID_IMOVEL,'
      '  conta_saida.ID_CONTAS = :ID_CONTAS,'
      '  conta_saida.ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  conta_saida.ID_CONTRATO = :ID_CONTRATO,'
      '  conta_saida.ID_CONTA_FORMA = :ID_CONTA_FORMA,'
      '  conta_saida.DATA_PGTO = :DATA_PGTO,'
      '  conta_saida.DATA_REF = :DATA_REF,'
      '  conta_saida.DOCUMENTO = :DOCUMENTO,'
      '  conta_saida.OPERACAO = :OPERACAO,'
      '  conta_saida.VALOR = :VALOR,'
      '  conta_saida.PARCELADO = :PARCELADO,'
      '  conta_saida.PARCELA = :PARCELA,'
      '  conta_saida.PARCELA_TOTAL = :PARCELA_TOTAL,'
      '  conta_saida.OBS = :OBS,'
      '  conta_saida.DATA = :DATA,'
      '  conta_saida.ATIVO = :ATIVO,'
      '  conta_saida.ATIVO_EXTRA = :ATIVO_EXTRA,'
      '  conta_saida.DESCONTO = :DESCONTO,'
      '  conta_saida.ID_FUNCIONARIO_BAIXA = :ID_FUNCIONARIO_BAIXA,'
      '  conta_saida.JUROS = :JUROS,'
      '  conta_saida.MULTA = :MULTA'
      'WHERE'
      '  conta_saida.ID_CONTAS_ENTADA = :OLD_ID_CONTAS_ENTADA')
    UseSequenceFieldForRefreshSQL = False
    Left = 376
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTAS_ENTADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTA_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTA_SUBTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTA_FORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELA_TOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS'
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
        Name = 'ATIVO_EXTRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO_BAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'JUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CONTAS_ENTADA'
        ParamType = ptUnknown
      end>
  end
  object ZCaixa: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = ZUpdateCaixa
    SQL.Strings = (
      
        'select c.*,  p.nome as PESSOA, (l.nome ||'#39' - '#39'|| i.numero) as RU' +
        'A,'
      'cat.nome as CATEGORIA, tip.nome as GRUPO, stip.nome as SUBGRUPO,'
      'con.id_referencia as CONTRATO_REF, I.COMPLEMENTO,'
      
        '(select result from spvalorcobranca1(1, c.data_ref, c.data_pgto,' +
        ' c.valor, c.valor_juros, c.valor_multa, c.valor_desconto)) as VA' +
        'LORREAL,'
      
        '(select result from spContaPaga(1, c.id_caixa, '#39'CAIXA_ENTRADA'#39'))' +
        ' as PAGO,'
      
        '(select count(cent.id_caixa) from caixa_entrada cent where cent.' +
        'id_categoria = 1 and cent.id_subtipo = 1 and cent.id_tipo = 1 an' +
        'd cent.id_pessoa = c.id_pessoa and cent.id_imovel = c.id_imovel ' +
        'and cent.id_contrato = c.id_contrato) as PARCELATOTAL'
      'from caixa_entrada c'
      'left join caixa_sis cat on cat.id_caixa_sis = c.id_categoria'
      'left join caixa_sis tip on tip.id_caixa_sis = c.id_tipo'
      'left join caixa_sis stip on stip.id_caixa_sis = c.id_subtipo'
      'left join pessoa p on p.id_pessoa = c.id_pessoa'
      'left join imovel i on i.id_imovel = c.id_imovel'
      'left join logradouro l on l.id_logradouro = i.id_logradouro'
      'left join contrato con on con.id_contrato = c.id_contrato')
    Params = <>
    Left = 288
    Top = 160
    object ZCaixaID_CAIXA: TIntegerField
      FieldName = 'ID_CAIXA'
      Required = True
    end
    object ZCaixaID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaID_SUBTIPO: TIntegerField
      FieldName = 'ID_SUBTIPO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaID_SAIDA: TIntegerField
      FieldName = 'ID_SAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaDATA_REF: TDateField
      FieldName = 'DATA_REF'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaDATA_PGTO: TDateField
      FieldName = 'DATA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaHORA_PGTO: TTimeField
      FieldName = 'HORA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object ZCaixaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object ZCaixaVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZCaixaVALOR_JUROS: TFloatField
      FieldName = 'VALOR_JUROS'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaVALOR_MULTA: TFloatField
      FieldName = 'VALOR_MULTA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZCaixaPARCELA: TIntegerField
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaPENDENTE: TStringField
      FieldName = 'PENDENTE'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZCaixaANOTACAO: TMemoField
      FieldName = 'ANOTACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object ZCaixaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZCaixaGARANTIDO: TStringField
      FieldName = 'GARANTIDO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZCaixaPESSOA: TStringField
      FieldName = 'PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = []
      Size = 114
    end
    object ZCaixaCATEGORIA2: TStringField
      FieldName = 'CATEGORIA'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaGRUPO2: TStringField
      FieldName = 'GRUPO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaSUBGRUPO2: TStringField
      FieldName = 'SUBGRUPO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaCONTRATO_REF: TLargeintField
      FieldName = 'CONTRATO_REF'
      ProviderFlags = []
    end
    object ZCaixaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaVALORREAL: TFloatField
      FieldName = 'VALORREAL'
      ProviderFlags = []
      currency = True
    end
    object ZCaixaPAGO: TStringField
      FieldName = 'PAGO'
      ProviderFlags = []
      Size = 3
    end
    object ZCaixaPARCELATOTAL: TIntegerField
      FieldName = 'PARCELATOTAL'
      ProviderFlags = []
    end
  end
  object ZCaixaCategoria: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select id_caixa_sis, nome from caixa_sis where ativo = '#39'SIM'#39' and' +
        ' tipo = '#39'CATEGORIA'#39' order by nome')
    Params = <>
    Left = 288
    Top = 216
  end
  object ZCaixaGrupo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select id_caixa_sis, nome from caixa_sis where ativo = '#39'SIM'#39' and' +
        ' tipo = '#39'GRUPO'#39' order by nome')
    Params = <>
    Left = 288
    Top = 272
  end
  object ZCaixaSubgrupo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select id_caixa_sis, nome from caixa_sis where ativo = '#39'SIM'#39' and' +
        ' tipo = '#39'SUBGRUPO'#39' order by nome')
    Params = <>
    Left = 288
    Top = 328
  end
  object DS_CaixaCategoria: TDataSource
    DataSet = ZCaixaCategoria
    Left = 384
    Top = 216
  end
  object DS_CaixaGrupo: TDataSource
    DataSet = ZCaixaGrupo
    Left = 384
    Top = 272
  end
  object DS_CaixaSubgrupo: TDataSource
    DataSet = ZCaixaSubgrupo
    Left = 384
    Top = 328
  end
  object ZCaixaPgto: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = ZUpdateCaixaPgto
    SQL.Strings = (
      'select cp.*, cs.nome from caixa_pgto cp'
      'left join caixa_sis cs on cs.id_caixa_sis = cp.id_forma_pgto'
      'where id_caixa_entrada = 0 order by data_cad')
    Params = <>
    Left = 288
    Top = 392
    object ZCaixaPgtoID_CAIXA_PGTO: TIntegerField
      FieldName = 'ID_CAIXA_PGTO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ZCaixaPgtoID_CAIXA_ENTRADA: TIntegerField
      FieldName = 'ID_CAIXA_ENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaPgtoID_CAIXA_SAIDA: TIntegerField
      FieldName = 'ID_CAIXA_SAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaPgtoID_FORMA_PGTO: TIntegerField
      FieldName = 'ID_FORMA_PGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaPgtoID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaPgtoDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaPgtoDATA_RECEBIMENTO: TDateTimeField
      FieldName = 'DATA_RECEBIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaPgtoDATA_PGTO: TDateField
      FieldName = 'DATA_PGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99/99/0000;1;_'
    end
    object ZCaixaPgtoANOTACAO: TStringField
      FieldName = 'ANOTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object ZCaixaPgtoVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object ZCaixaPgtoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object DS_CaixaPgto: TDataSource
    DataSet = ZCaixaPgto
    Left = 480
    Top = 392
  end
  object ZCaixaFormaPgto: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select id_caixa_sis, nome from caixa_sis where ativo = '#39'SIM'#39' and' +
        ' tipo = '#39'FORMAPGTO'#39' order by nome')
    Params = <>
    Left = 288
    Top = 448
  end
  object DS_CaixaFormaPgto: TDataSource
    DataSet = ZCaixaFormaPgto
    Left = 392
    Top = 448
  end
  object ZUpdateCaixa: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM caixa_entrada'
      'WHERE'
      '  caixa_entrada.ID_CAIXA = :OLD_ID_CAIXA')
    InsertSQL.Strings = (
      'INSERT INTO caixa_entrada'
      '  (caixa_entrada.ID_CAIXA, caixa_entrada.ID_CATEGORIA, '
      'caixa_entrada.ID_SUBTIPO, '
      '   caixa_entrada.ID_TIPO, caixa_entrada.ID_PESSOA, '
      'caixa_entrada.ID_IMOVEL, '
      '   caixa_entrada.ID_CONTRATO, caixa_entrada.ID_FUNCIONARIO, '
      'caixa_entrada.ID_ENTRADA, '
      '   caixa_entrada.ID_SAIDA, caixa_entrada.DATA_REF, '
      'caixa_entrada.DATA_CAD, '
      '   caixa_entrada.DATA_ALT, caixa_entrada.DATA_PGTO, '
      'caixa_entrada.HORA_PGTO, '
      '   caixa_entrada.DOCUMENTO, caixa_entrada.OPERACAO, '
      'caixa_entrada.VALOR, '
      '   caixa_entrada.VALOR_JUROS, caixa_entrada.VALOR_MULTA, '
      'caixa_entrada.VALOR_DESCONTO, '
      '   caixa_entrada.PARCELA, caixa_entrada.PENDENTE, '
      'caixa_entrada.ANOTACAO, '
      '   caixa_entrada.ATIVO,  caixa_entrada.GARANTIDO)'
      'VALUES'
      '  (:ID_CAIXA, :ID_CATEGORIA, :ID_SUBTIPO, :ID_TIPO, :ID_PESSOA, '
      ':ID_IMOVEL, '
      '   :ID_CONTRATO, :ID_FUNCIONARIO, :ID_ENTRADA, :ID_SAIDA, '
      ':DATA_REF, :DATA_CAD, '
      '   :DATA_ALT, :DATA_PGTO, :HORA_PGTO, :DOCUMENTO, '
      ':OPERACAO, :VALOR, :VALOR_JUROS, '
      '   :VALOR_MULTA, :VALOR_DESCONTO, :PARCELA, :PENDENTE, '
      ':ANOTACAO, :ATIVO, :GARANTIDO)')
    ModifySQL.Strings = (
      'UPDATE caixa_entrada SET'
      '  caixa_entrada.ID_CAIXA = :ID_CAIXA,'
      '  caixa_entrada.ID_CATEGORIA = :ID_CATEGORIA,'
      '  caixa_entrada.ID_SUBTIPO = :ID_SUBTIPO,'
      '  caixa_entrada.ID_TIPO = :ID_TIPO,'
      '  caixa_entrada.ID_PESSOA = :ID_PESSOA,'
      '  caixa_entrada.ID_IMOVEL = :ID_IMOVEL,'
      '  caixa_entrada.ID_CONTRATO = :ID_CONTRATO,'
      '  caixa_entrada.ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  caixa_entrada.ID_ENTRADA = :ID_ENTRADA,'
      '  caixa_entrada.ID_SAIDA = :ID_SAIDA,'
      '  caixa_entrada.DATA_REF = :DATA_REF,'
      '  caixa_entrada.DATA_CAD = :DATA_CAD,'
      '  caixa_entrada.DATA_ALT = :DATA_ALT,'
      '  caixa_entrada.DATA_PGTO = :DATA_PGTO,'
      '  caixa_entrada.HORA_PGTO = :HORA_PGTO,'
      '  caixa_entrada.DOCUMENTO = :DOCUMENTO,'
      '  caixa_entrada.OPERACAO = :OPERACAO,'
      '  caixa_entrada.VALOR = :VALOR,'
      '  caixa_entrada.VALOR_JUROS = :VALOR_JUROS,'
      '  caixa_entrada.VALOR_MULTA = :VALOR_MULTA,'
      '  caixa_entrada.VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  caixa_entrada.PARCELA = :PARCELA,'
      '  caixa_entrada.PENDENTE = :PENDENTE,'
      '  caixa_entrada.ANOTACAO = :ANOTACAO,'
      '  caixa_entrada.ATIVO = :ATIVO,'
      'caixa_entrada.GARANTIDO = :GARANTIDO'
      'WHERE'
      '  caixa_entrada.ID_CAIXA = :OLD_ID_CAIXA')
    UseSequenceFieldForRefreshSQL = False
    Left = 384
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CATEGORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SUBTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SAIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_CAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_ALT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_JUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_MULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GARANTIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CAIXA'
        ParamType = ptUnknown
      end>
  end
  object ZUpdateCaixaPgto: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM caixa_pgto'
      'WHERE'
      '  caixa_pgto.ID_CAIXA_PGTO = :OLD_ID_CAIXA_PGTO')
    InsertSQL.Strings = (
      'INSERT INTO caixa_pgto'
      '  (caixa_pgto.ID_CAIXA_ENTRADA, caixa_pgto.ID_CAIXA_SAIDA, '
      'caixa_pgto.ID_FORMA_PGTO, '
      '   caixa_pgto.ID_FUNCIONARIO, caixa_pgto.DATA_CAD, '
      'caixa_pgto.DATA_RECEBIMENTO, '
      '   caixa_pgto.DATA_PGTO, caixa_pgto.ANOTACAO, caixa_pgto.VALOR)'
      'VALUES'
      '  (:ID_CAIXA_ENTRADA, :ID_CAIXA_SAIDA, :ID_FORMA_PGTO, '
      ':ID_FUNCIONARIO, '
      '   :DATA_CAD, :DATA_RECEBIMENTO, :DATA_PGTO, :ANOTACAO, '
      ':VALOR)')
    ModifySQL.Strings = (
      'UPDATE caixa_pgto SET'
      '  caixa_pgto.ID_CAIXA_ENTRADA = :ID_CAIXA_ENTRADA,'
      '  caixa_pgto.ID_CAIXA_SAIDA = :ID_CAIXA_SAIDA,'
      '  caixa_pgto.ID_FORMA_PGTO = :ID_FORMA_PGTO,'
      '  caixa_pgto.ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  caixa_pgto.DATA_CAD = :DATA_CAD,'
      '  caixa_pgto.DATA_RECEBIMENTO = :DATA_RECEBIMENTO,'
      '  caixa_pgto.DATA_PGTO = :DATA_PGTO,'
      '  caixa_pgto.ANOTACAO = :ANOTACAO,'
      '  caixa_pgto.VALOR = :VALOR'
      'WHERE'
      '  caixa_pgto.ID_CAIXA_PGTO = :OLD_ID_CAIXA_PGTO')
    UseSequenceFieldForRefreshSQL = False
    Left = 384
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CAIXA_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CAIXA_SAIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FORMA_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_CAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_RECEBIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CAIXA_PGTO'
        ParamType = ptUnknown
      end>
  end
  object ZCaixaTipoStatus: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select id_caixa_sis, nome from caixa_sis where ativo = '#39'SIM'#39' and' +
        ' tipo = '#39'STATUS'#39' order by nome')
    Params = <>
    Left = 288
    Top = 504
  end
  object DS_CaixaTipoStatus: TDataSource
    DataSet = ZCaixaTipoStatus
    Left = 392
    Top = 504
  end
  object ZCaixaStatus: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = ZUpdatecaixaStatus
    SQL.Strings = (
      'select cst.*, cs.nome from caixa_status cst'
      'inner join caixa_sis cs on cst.id_status = cs.id_caixa_sis')
    Params = <>
    Left = 512
    Top = 504
    object ZCaixaStatusID_CAIXA_STATUS: TIntegerField
      FieldName = 'ID_CAIXA_STATUS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ZCaixaStatusID_STATUS: TIntegerField
      FieldName = 'ID_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaStatusID_CAIXA_SAIDA: TIntegerField
      FieldName = 'ID_CAIXA_SAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaStatusID_CAIXA_ENTRADA: TIntegerField
      FieldName = 'ID_CAIXA_ENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaStatusID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaStatusDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaStatusDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99/99/0000;1;_'
    end
    object ZCaixaStatusDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object ZCaixaStatusDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaStatusANOTACAO: TMemoField
      FieldName = 'ANOTACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object ZCaixaStatusNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object DS_CaixaStatus: TDataSource
    DataSet = ZCaixaStatus
    Left = 728
    Top = 504
  end
  object ZUpdatecaixaStatus: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM caixa_status'
      'WHERE'
      '  caixa_status.ID_CAIXA_STATUS = :OLD_ID_CAIXA_STATUS')
    InsertSQL.Strings = (
      'INSERT INTO caixa_status'
      
        '  (caixa_status.ID_CAIXA_STATUS, caixa_status.ID_STATUS, caixa_s' +
        'tatus.ID_CAIXA_SAIDA, '
      
        '   caixa_status.ID_CAIXA_ENTRADA, caixa_status.ID_FUNCIONARIO, c' +
        'aixa_status.DATA_CAD, '
      
        '   caixa_status.DATA_ENTRADA, caixa_status.DATA_SAIDA, caixa_sta' +
        'tus.DATA_ALT, '
      '   caixa_status.ANOTACAO)'
      'VALUES'
      
        '  (:ID_CAIXA_STATUS, :ID_STATUS, :ID_CAIXA_SAIDA, :ID_CAIXA_ENTR' +
        'ADA, :ID_FUNCIONARIO, '
      '   :DATA_CAD, :DATA_ENTRADA, :DATA_SAIDA, :DATA_ALT, :ANOTACAO)')
    ModifySQL.Strings = (
      'UPDATE caixa_status SET'
      '  caixa_status.ID_CAIXA_STATUS = :ID_CAIXA_STATUS,'
      '  caixa_status.ID_STATUS = :ID_STATUS,'
      '  caixa_status.ID_CAIXA_SAIDA = :ID_CAIXA_SAIDA,'
      '  caixa_status.ID_CAIXA_ENTRADA = :ID_CAIXA_ENTRADA,'
      '  caixa_status.ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  caixa_status.DATA_CAD = :DATA_CAD,'
      '  caixa_status.DATA_ENTRADA = :DATA_ENTRADA,'
      '  caixa_status.DATA_SAIDA = :DATA_SAIDA,'
      '  caixa_status.DATA_ALT = :DATA_ALT,'
      '  caixa_status.ANOTACAO = :ANOTACAO'
      'WHERE'
      '  caixa_status.ID_CAIXA_STATUS = :OLD_ID_CAIXA_STATUS')
    UseSequenceFieldForRefreshSQL = False
    Left = 616
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CAIXA_STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CAIXA_SAIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CAIXA_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_CAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_SAIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_ALT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CAIXA_STATUS'
        ParamType = ptUnknown
      end>
  end
  object ZLog: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'Select * from log')
    Params = <>
    Left = 512
    Top = 456
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
  object DS_Log: TDataSource
    DataSet = ZLog
    Left = 616
    Top = 456
  end
  object ZCaixaBackup: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = ZUpdateCaixa
    SQL.Strings = (
      
        'select c.*,  p.nome as PESSOA, (l.nome ||'#39' - '#39'|| i.numero) as RU' +
        'A,'
      'cat.nome as CATEGORIA, tip.nome as GRUPO, stip.nome as SUBGRUPO,'
      'con.id_referencia as CONTRATO_REF, I.COMPLEMENTO,'
      
        '(select result from spvalorcobranca1(1, c.data_ref, c.data_pgto,' +
        ' c.valor, c.valor_juros, c.valor_multa, c.valor_desconto)) as VA' +
        'LORREAL,'
      
        '(select result from spContaPaga(1, c.id_caixa, '#39'CAIXA_ENTRADA'#39'))' +
        ' as PAGO,'
      
        '(select count(cent.id_caixa) from caixa_entrada cent where cent.' +
        'id_categoria = 1 and cent.id_subtipo = 1 and cent.id_tipo = 1 an' +
        'd cent.id_pessoa = c.id_pessoa and cent.id_imovel = c.id_imovel ' +
        'and cent.id_contrato = c.id_contrato) as PARCELATOTAL'
      'from caixa_entrada c'
      'left join caixa_sis cat on cat.id_caixa_sis = c.id_categoria'
      'left join caixa_sis tip on tip.id_caixa_sis = c.id_tipo'
      'left join caixa_sis stip on stip.id_caixa_sis = c.id_subtipo'
      'left join pessoa p on p.id_pessoa = c.id_pessoa'
      'left join imovel i on i.id_imovel = c.id_imovel'
      'left join logradouro l on l.id_logradouro = i.id_logradouro'
      'left join contrato con on con.id_contrato = c.id_contrato'
      '')
    Params = <>
    Left = 288
    Top = 104
    object ZCaixaBackupID_CAIXA: TIntegerField
      FieldName = 'ID_CAIXA'
      Required = True
    end
    object ZCaixaBackupID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupID_SUBTIPO: TIntegerField
      FieldName = 'ID_SUBTIPO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupID_SAIDA: TIntegerField
      FieldName = 'ID_SAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupDATA_REF: TDateField
      FieldName = 'DATA_REF'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object ZCaixaBackupDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupDATA_PGTO: TDateField
      FieldName = 'DATA_PGTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object ZCaixaBackupHORA_PGTO: TTimeField
      FieldName = 'HORA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object ZCaixaBackupOPERACAO: TStringField
      FieldName = 'OPERACAO'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object ZCaixaBackupVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZCaixaBackupVALOR_JUROS: TFloatField
      FieldName = 'VALOR_JUROS'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupVALOR_MULTA: TFloatField
      FieldName = 'VALOR_MULTA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZCaixaBackupPARCELA: TIntegerField
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaBackupPENDENTE: TStringField
      FieldName = 'PENDENTE'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZCaixaBackupANOTACAO: TMemoField
      FieldName = 'ANOTACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object ZCaixaBackupATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZCaixaBackupGARANTIDO: TStringField
      FieldName = 'GARANTIDO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZCaixaBackupPESSOA: TStringField
      FieldName = 'PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaBackupRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = []
      Size = 114
    end
    object ZCaixaBackupCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaBackupGRUPO: TStringField
      FieldName = 'GRUPO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaBackupSUBGRUPO: TStringField
      FieldName = 'SUBGRUPO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaBackupCONTRATO_REF: TLargeintField
      FieldName = 'CONTRATO_REF'
      ProviderFlags = []
    end
    object ZCaixaBackupCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaBackupVALORREAL: TFloatField
      FieldName = 'VALORREAL'
      ProviderFlags = []
      currency = True
    end
    object ZCaixaBackupPAGO: TStringField
      FieldName = 'PAGO'
      ProviderFlags = []
      Size = 3
    end
    object ZCaixaBackupPARCELATOTAL: TIntegerField
      FieldName = 'PARCELATOTAL'
      ProviderFlags = []
    end
  end
  object DS_CaixaBackup: TDataSource
    DataSet = ZCaixaBackup
    Left = 384
    Top = 104
  end
  object DS_CaixaSimples: TDataSource
    DataSet = ZCaixaSimples
    Left = 512
    Top = 568
  end
  object ZCaixaSimples: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = ZUpdateCaixaSimples
    SQL.Strings = (
      
        'select CAST(CE.VALOR AS NUMERIC(15,2)) AS VALOR, CAST(CE.VALOR_J' +
        'UROS AS NUMERIC(15,3)) AS VALOR_JUROS, CAST(CE.VALOR_MULTA AS NU' +
        'MERIC(15,2)) AS VALOR_MULTA, CAST(CE.VALOR_DESCONTO AS NUMERIC(1' +
        '5,2)) AS VALOR_DESCONTO , cat.nome as categoria, tip.nome as tip' +
        'o, stip.nome as subtipo, p.nome as pessoa, l.nome as logradouro,' +
        ' i.numero, i.complemento, ce.*,'
      
        '(select result from spvalorcobranca1(1, ce.data_ref, ce.data_pgt' +
        'o, ce.valor, ce.valor_juros, ce.valor_multa, ce.valor_desconto))' +
        ' as VALORREAL'
      'from caixa_entrada ce'
      'left join imovel i on i.id_imovel = ce.id_imovel'
      'inner join logradouro l on l.id_logradouro = i.id_logradouro'
      'left join pessoa p on p.id_pessoa = ce.id_pessoa'
      'left join caixa_sis cat on cat.id_caixa_sis = ce.id_categoria'
      'left join caixa_sis tip on tip.id_caixa_sis = ce.id_tipo'
      'left join caixa_sis stip on stip.id_caixa_sis = ce.id_subtipo')
    Params = <>
    Left = 288
    Top = 568
    object ZCaixaSimplesCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaSimplesTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaSimplesSUBTIPO: TStringField
      FieldName = 'SUBTIPO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaSimplesPESSOA: TStringField
      FieldName = 'PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaSimplesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaSimplesNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = []
    end
    object ZCaixaSimplesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object ZCaixaSimplesID_CAIXA: TIntegerField
      FieldName = 'ID_CAIXA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ZCaixaSimplesID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaSimplesID_SUBTIPO: TIntegerField
      FieldName = 'ID_SUBTIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaSimplesID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaSimplesID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaSimplesID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesID_SAIDA: TIntegerField
      FieldName = 'ID_SAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesDATA_REF: TDateField
      FieldName = 'DATA_REF'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaSimplesDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaSimplesDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaSimplesDATA_PGTO: TDateField
      FieldName = 'DATA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesHORA_PGTO: TTimeField
      FieldName = 'HORA_PGTO'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object ZCaixaSimplesOPERACAO: TStringField
      FieldName = 'OPERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object ZCaixaSimplesPARCELA: TIntegerField
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ZCaixaSimplesPENDENTE: TStringField
      FieldName = 'PENDENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object ZCaixaSimplesANOTACAO: TMemoField
      FieldName = 'ANOTACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object ZCaixaSimplesATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object ZCaixaSimplesVALORREAL: TFloatField
      FieldName = 'VALORREAL'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
    object ZCaixaSimplesGARANTIDO: TStringField
      FieldName = 'GARANTIDO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object ZCaixaSimplesVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object ZCaixaSimplesVALOR_JUROS: TFloatField
      FieldName = 'VALOR_JUROS'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesVALOR_MULTA: TFloatField
      FieldName = 'VALOR_MULTA'
      ProviderFlags = [pfInUpdate]
    end
    object ZCaixaSimplesVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
  end
  object ZUpdateCaixaSimples: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM caixa_entrada'
      'WHERE'
      '  caixa_entrada.ID_CAIXA = :OLD_ID_CAIXA')
    InsertSQL.Strings = (
      'INSERT INTO caixa_entrada'
      '  (caixa_entrada.ID_CAIXA, caixa_entrada.ID_CATEGORIA, '
      'caixa_entrada.ID_SUBTIPO, '
      '   caixa_entrada.ID_TIPO, caixa_entrada.ID_PESSOA, '
      'caixa_entrada.ID_IMOVEL, '
      '   caixa_entrada.ID_CONTRATO, caixa_entrada.ID_FUNCIONARIO, '
      'caixa_entrada.ID_ENTRADA, '
      '   caixa_entrada.ID_SAIDA, caixa_entrada.DATA_REF, '
      'caixa_entrada.DATA_CAD, '
      '   caixa_entrada.DATA_ALT, caixa_entrada.DATA_PGTO, '
      'caixa_entrada.HORA_PGTO, '
      '   caixa_entrada.DOCUMENTO, caixa_entrada.OPERACAO, '
      'caixa_entrada.VALOR, '
      '   caixa_entrada.VALOR_JUROS, caixa_entrada.VALOR_MULTA, '
      'caixa_entrada.VALOR_DESCONTO, '
      '   caixa_entrada.PARCELA, caixa_entrada.PENDENTE, '
      'caixa_entrada.ANOTACAO, '
      '   caixa_entrada.ATIVO, caixa_entrada.GARANTIDO)'
      'VALUES'
      '  (:ID_CAIXA, :ID_CATEGORIA, :ID_SUBTIPO, :ID_TIPO, :ID_PESSOA, '
      ':ID_IMOVEL, '
      '   :ID_CONTRATO, :ID_FUNCIONARIO, :ID_ENTRADA, :ID_SAIDA, '
      ':DATA_REF, :DATA_CAD, '
      '   :DATA_ALT, :DATA_PGTO, :HORA_PGTO, :DOCUMENTO, '
      ':OPERACAO, :VALOR, :VALOR_JUROS, '
      '   :VALOR_MULTA, :VALOR_DESCONTO, :PARCELA, :PENDENTE, '
      ':ANOTACAO, :ATIVO, GARANTIDO)')
    ModifySQL.Strings = (
      'UPDATE caixa_entrada SET'
      '  caixa_entrada.ID_CAIXA = :ID_CAIXA,'
      '  caixa_entrada.ID_CATEGORIA = :ID_CATEGORIA,'
      '  caixa_entrada.ID_SUBTIPO = :ID_SUBTIPO,'
      '  caixa_entrada.ID_TIPO = :ID_TIPO,'
      '  caixa_entrada.ID_PESSOA = :ID_PESSOA,'
      '  caixa_entrada.ID_IMOVEL = :ID_IMOVEL,'
      '  caixa_entrada.ID_CONTRATO = :ID_CONTRATO,'
      '  caixa_entrada.ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  caixa_entrada.ID_ENTRADA = :ID_ENTRADA,'
      '  caixa_entrada.ID_SAIDA = :ID_SAIDA,'
      '  caixa_entrada.DATA_REF = :DATA_REF,'
      '  caixa_entrada.DATA_CAD = :DATA_CAD,'
      '  caixa_entrada.DATA_ALT = :DATA_ALT,'
      '  caixa_entrada.DATA_PGTO = :DATA_PGTO,'
      '  caixa_entrada.HORA_PGTO = :HORA_PGTO,'
      '  caixa_entrada.DOCUMENTO = :DOCUMENTO,'
      '  caixa_entrada.OPERACAO = :OPERACAO,'
      '  caixa_entrada.VALOR = :VALOR,'
      '  caixa_entrada.VALOR_JUROS = :VALOR_JUROS,'
      '  caixa_entrada.VALOR_MULTA = :VALOR_MULTA,'
      '  caixa_entrada.VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  caixa_entrada.PARCELA = :PARCELA,'
      '  caixa_entrada.PENDENTE = :PENDENTE,'
      '  caixa_entrada.ANOTACAO = :ANOTACAO,'
      '  caixa_entrada.ATIVO = :ATIVO,'
      'caixa_entrada.GARANTIDO = :GARANTIDO'
      'WHERE'
      '  caixa_entrada.ID_CAIXA = :OLD_ID_CAIXA')
    UseSequenceFieldForRefreshSQL = False
    Left = 400
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CATEGORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SUBTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SAIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_CAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_ALT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_JUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_MULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GARANTIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CAIXA'
        ParamType = ptUnknown
      end>
  end
  object ZChequeConta: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = ZChequeContaUpdate
    SQL.Strings = (
      'select cc.*, c.* from conta_cheque cc'
      'left join cheque c  on cc.id_cheque = c.id_cheque')
    Params = <>
    Left = 64
    Top = 584
    object ZChequeContaID_CONTA_CHEQUE: TIntegerField
      FieldName = 'ID_CONTA_CHEQUE'
      Required = True
    end
    object ZChequeContaID_CHEQUE: TIntegerField
      FieldName = 'ID_CHEQUE'
      Required = True
    end
    object ZChequeContaID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
      Required = True
    end
    object ZChequeContaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      Size = 3
    end
    object ZChequeContaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Required = True
    end
    object ZChequeContaOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object ZChequeContaID_CHEQUE_1: TIntegerField
      FieldName = 'ID_CHEQUE_1'
      ProviderFlags = []
    end
    object ZChequeContaBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 50
    end
    object ZChequeContaAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = []
    end
    object ZChequeContaCC: TStringField
      FieldName = 'CC'
      ProviderFlags = []
    end
    object ZChequeContaNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      ProviderFlags = []
    end
    object ZChequeContaDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      ProviderFlags = []
    end
    object ZChequeContaID_FUNCIONARIO_1: TIntegerField
      FieldName = 'ID_FUNCIONARIO_1'
      ProviderFlags = []
    end
    object ZChequeContaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
    end
    object ZChequeContaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object ZChequeContaRG: TStringField
      FieldName = 'RG'
      ProviderFlags = []
      Size = 100
    end
    object ZChequeContaCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = []
      Size = 100
    end
    object ZChequeContaENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = []
      Size = 200
    end
    object ZChequeContaTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      ProviderFlags = []
      Size = 10
    end
    object ZChequeContaTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      ProviderFlags = []
      Size = 10
    end
    object ZChequeContaVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = []
    end
    object ZChequeContaOBS_1: TStringField
      FieldName = 'OBS_1'
      ProviderFlags = []
      Size = 100
    end
    object ZChequeContaDATA_REF: TDateField
      FieldName = 'DATA_REF'
      ProviderFlags = []
    end
    object ZChequeContaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = []
      Size = 3
    end
    object ZChequeContaDATA_BAIXA: TDateField
      FieldName = 'DATA_BAIXA'
      ProviderFlags = []
    end
  end
  object DSChequeConta: TDataSource
    DataSet = ZChequeConta
    Left = 168
    Top = 640
  end
  object ZChequeContaUpdate: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM conta_cheque'
      'WHERE'
      '  conta_cheque.ID_CONTA_CHEQUE = :OLD_ID_CONTA_CHEQUE')
    InsertSQL.Strings = (
      'INSERT INTO conta_cheque'
      '  (conta_cheque.ID_CONTA_CHEQUE, conta_cheque.ID_CHEQUE, '
      'conta_cheque.ID_CONTA, '
      '   conta_cheque.OPERACAO, conta_cheque.ID_FUNCIONARIO, '
      'conta_cheque.OBS)'
      'VALUES'
      '  (:ID_CONTA_CHEQUE, :ID_CHEQUE, :ID_CONTA, :OPERACAO, '
      ':ID_FUNCIONARIO, '
      '   :OBS)')
    ModifySQL.Strings = (
      'UPDATE conta_cheque SET'
      '  conta_cheque.ID_CONTA_CHEQUE = :ID_CONTA_CHEQUE,'
      '  conta_cheque.ID_CHEQUE = :ID_CHEQUE,'
      '  conta_cheque.ID_CONTA = :ID_CONTA,'
      '  conta_cheque.OPERACAO = :OPERACAO,'
      '  conta_cheque.ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  conta_cheque.OBS = :OBS'
      'WHERE'
      '  conta_cheque.ID_CONTA_CHEQUE = :OLD_ID_CONTA_CHEQUE')
    UseSequenceFieldForRefreshSQL = False
    Left = 168
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTA_CHEQUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CHEQUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CONTA_CHEQUE'
        ParamType = ptUnknown
      end>
  end
  object ZUpdateCheque: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cheque'
      'WHERE'
      '  cheque.ID_CHEQUE = :OLD_ID_CHEQUE')
    InsertSQL.Strings = (
      'INSERT INTO cheque'
      
        '  (cheque.ID_CHEQUE, cheque.BANCO, cheque.AGENCIA, cheque.CC, ch' +
        'eque.NUM_CHEQUE, '
      
        '   cheque.DATA_ENTRADA, cheque.ID_FUNCIONARIO, cheque.ID_PESSOA,' +
        ' cheque.NOME, '
      
        '   cheque.RG, cheque.CPF, cheque.ENDERECO, cheque.TELEFONE1, che' +
        'que.TELEFONE2, '
      
        '   cheque.VALOR, cheque.OBS, cheque.DATA_REF, cheque.ATIVO, cheq' +
        'ue.DATA_BAIXA)'
      'VALUES'
      
        '  (:ID_CHEQUE, :BANCO, :AGENCIA, :CC, :NUM_CHEQUE, :DATA_ENTRADA' +
        ', :ID_FUNCIONARIO, '
      
        '   :ID_PESSOA, :NOME, :RG, :CPF, :ENDERECO, :TELEFONE1, :TELEFON' +
        'E2, :VALOR, '
      '   :OBS, :DATA_REF, :ATIVO, :DATA_BAIXA)')
    ModifySQL.Strings = (
      'UPDATE cheque SET'
      '  cheque.ID_CHEQUE = :ID_CHEQUE,'
      '  cheque.BANCO = :BANCO,'
      '  cheque.AGENCIA = :AGENCIA,'
      '  cheque.CC = :CC,'
      '  cheque.NUM_CHEQUE = :NUM_CHEQUE,'
      '  cheque.DATA_ENTRADA = :DATA_ENTRADA,'
      '  cheque.ID_FUNCIONARIO = :ID_FUNCIONARIO,'
      '  cheque.ID_PESSOA = :ID_PESSOA,'
      '  cheque.NOME = :NOME,'
      '  cheque.RG = :RG,'
      '  cheque.CPF = :CPF,'
      '  cheque.ENDERECO = :ENDERECO,'
      '  cheque.TELEFONE1 = :TELEFONE1,'
      '  cheque.TELEFONE2 = :TELEFONE2,'
      '  cheque.VALOR = :VALOR,'
      '  cheque.OBS = :OBS,'
      '  cheque.DATA_REF = :DATA_REF,'
      '  cheque.ATIVO = :ATIVO,'
      '  cheque.DATA_BAIXA = :DATA_BAIXA'
      'WHERE'
      '  cheque.ID_CHEQUE = :OLD_ID_CHEQUE')
    UseSequenceFieldForRefreshSQL = False
    Left = 168
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CHEQUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUM_CHEQUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FUNCIONARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CPF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TELEFONE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TELEFONE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_BAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_CHEQUE'
        ParamType = ptUnknown
      end>
  end
  object ZLogs_Banco: TZQuery
    Connection = PRINCIPAL.Conexao_log
    SQL.Strings = (
      
        'select FIRST 40 l.* from logs l where lower(L.Campos) like lower' +
        '('#39'%caixa_entrada%'#39') AND L.Campos like '#39'%46294%'#39' ORDER BY L.DATA ' +
        'DESC')
    Params = <>
    Left = 672
    Top = 376
  end
  object DS_Logs_Banco: TDataSource
    DataSet = ZLogs_Banco
    Left = 760
    Top = 376
  end
end
