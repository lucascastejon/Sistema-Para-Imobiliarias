object DM_CADASTRO: TDM_CADASTRO
  OldCreateOrder = False
  Height = 820
  Width = 978
  object Z_Usuario: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from usuario order by nome')
    Params = <>
    Left = 24
    Top = 32
    object Z_UsuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_UsuarioNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_UsuarioSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 8
    end
    object Z_UsuarioFUNDO: TStringField
      FieldName = 'FUNDO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_UsuarioATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_UsuarioADMINISTRADOR: TStringField
      FieldName = 'ADMINISTRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_UsuarioEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
  end
  object Z_Tabela: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from tabela where id_tabela = 0')
    Params = <>
    Left = 24
    Top = 88
    object Z_TabelaID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_TabelaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_TabelaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
  end
  object Z_Permissao: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Permissao
    SQL.Strings = (
      
        'select A.ID_USUARIO, A.ID_TABELA, A.XSELECT, A.XDELETE, A.XINSER' +
        'T, A.XUPDATE, U.NOME, T.NOME from'
      'AUTORIZACAO A'
      'LEFT JOIN USUARIO U ON U.id_usuario = A.id_usuario'
      'LEFT JOIN TABELA T ON T.id_tabela = A.id_tabela'
      'where'
      'a.id_usuario = 0')
    Params = <>
    Left = 24
    Top = 144
    object Z_PermissaoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_PermissaoID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_PermissaoXSELECT: TStringField
      FieldName = 'XSELECT'
      Required = True
      Size = 3
    end
    object Z_PermissaoXDELETE: TStringField
      FieldName = 'XDELETE'
      Required = True
      Size = 3
    end
    object Z_PermissaoXINSERT: TStringField
      FieldName = 'XINSERT'
      Required = True
      Size = 3
    end
    object Z_PermissaoXUPDATE: TStringField
      FieldName = 'XUPDATE'
      Required = True
      Size = 3
    end
    object Z_PermissaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object Z_PermissaoNOME_1: TStringField
      FieldName = 'NOME_1'
      ProviderFlags = []
      Size = 100
    end
  end
  object DS_Usuario: TDataSource
    DataSet = Z_Usuario
    Left = 192
    Top = 32
  end
  object DS_Tabela: TDataSource
    DataSet = Z_Tabela
    Left = 192
    Top = 88
  end
  object DS_Permissao: TDataSource
    DataSet = Z_Permissao
    Left = 192
    Top = 144
  end
  object Z_Curinga_02: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select categ.nome as categoria, tip.nome as tipo, stip.nome as s' +
        'ubtipo ,ce.*,'
      
        '(SELECT RESULT FROM spvalorcobranca1(1, ce.data_ref, ce.data_pgt' +
        'o, ce.valor, ce.valor_juros, ce.valor_multa, ce.valor_desconto))' +
        ' as VALORREAL'
      ' from caixa_entrada ce'
      
        '      LEFT join caixa_sis categ on categ.id_caixa_sis = ce.id_ca' +
        'tegoria'
      '      LEFT join caixa_sis tip on tip.id_caixa_sis = ce.id_tipo'
      
        '      LEFT join caixa_sis stip on stip.id_caixa_sis = ce.id_subt' +
        'ipo')
    Params = <>
    Left = 600
    Top = 72
  end
  object Z_Curinga_01: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select distinct(ce.id_pessoa) as codigo, c.id_contrato, p.nome a' +
        's pessoa, l.nome as logradouro, i.numero, i.complemento,'
      
        '      (select first 1 tel.ddd from telefone tel where tel.id_pes' +
        'soa = p.id_pessoa and tel.id_endereco_tipo = 1) as telDDDRes,'
      
        '      (select first 1 tel.numero from telefone tel where tel.id_' +
        'pessoa = p.id_pessoa and tel.id_endereco_tipo = 1) as telNUMRes,'
      
        '      (select first 1 tel.contato from telefone tel where tel.id' +
        '_pessoa = p.id_pessoa and tel.id_endereco_tipo = 1) as telCONTAT' +
        'ORes,'
      
        '      (select first 1 tel.ddd from telefone tel where tel.id_pes' +
        'soa = p.id_pessoa and tel.id_endereco_tipo = 2) as telDDDCom,'
      
        '      (select first 1 tel.numero from telefone tel where tel.id_' +
        'pessoa = p.id_pessoa and tel.id_endereco_tipo = 2) as telNUMCom,'
      
        '      (select first 1 tel.contato from telefone tel where tel.id' +
        '_pessoa = p.id_pessoa and tel.id_endereco_tipo = 2) as telCONTAT' +
        'OCom,'
      
        '      (select first 1 tel.ddd from telefone tel where tel.id_pes' +
        'soa = p.id_pessoa and tel.id_endereco_tipo = 3) as telDDDCel,'
      
        '      (select first 1 tel.numero from telefone tel where tel.id_' +
        'pessoa = p.id_pessoa and tel.id_endereco_tipo = 3) as telNUMCel,'
      
        '      (select first 1 tel.contato from telefone tel where tel.id' +
        '_pessoa = p.id_pessoa and tel.id_endereco_tipo = 3) as telCONTAT' +
        'OCel,'
      '      p.email,'
      '      p.msn,'
      '      p.yahoo'
      ' from caixa_entrada ce'
      
        '      LEFT join contrato c on c.id_contrato = ce.id_contrato and' +
        ' c.ativo = '#39'SIM'#39
      
        '      LEFT join pessoa_contrato pc on pc.id_contrato = ce.id_con' +
        'trato'
      '      LEFT join pessoa p on p.id_pessoa = ce.id_pessoa'
      '      LEFT join imovel i on i.id_imovel = ce.id_imovel'
      
        '      LEFT join logradouro l on l.id_logradouro = i.id_logradour' +
        'o'
      
        'where ce.data_pgto is null and ce.ativo = '#39'SIM'#39' and ce.data_ref ' +
        '< dateadd(30 day to current_date)')
    Params = <>
    Left = 600
    Top = 8
  end
  object DS_Curinga_01: TDataSource
    DataSet = Z_Curinga_01
    Left = 760
    Top = 8
  end
  object DS_Curinga_02: TDataSource
    DataSet = Z_Curinga_02
    Left = 760
    Top = 72
  end
  object UP_Permissao: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM AUTORIZACAO'
      'WHERE'
      '  AUTORIZACAO.ID_USUARIO = :OLD_ID_USUARIO AND'
      '  AUTORIZACAO.ID_TABELA = :OLD_ID_TABELA')
    InsertSQL.Strings = (
      'INSERT INTO AUTORIZACAO'
      '  (AUTORIZACAO.ID_USUARIO, AUTORIZACAO.ID_TABELA, '
      'AUTORIZACAO.XSELECT, '
      '   AUTORIZACAO.XDELETE, AUTORIZACAO.XINSERT, '
      'AUTORIZACAO.XUPDATE)'
      'VALUES'
      '  (:ID_USUARIO, :ID_TABELA, :XSELECT, :XDELETE, :XINSERT, '
      ':XUPDATE)')
    ModifySQL.Strings = (
      'UPDATE AUTORIZACAO SET'
      '  AUTORIZACAO.XSELECT = :XSELECT,'
      '  AUTORIZACAO.XDELETE = :XDELETE,'
      '  AUTORIZACAO.XINSERT = :XINSERT,'
      '  AUTORIZACAO.XUPDATE = :XUPDATE'
      'WHERE'
      '  AUTORIZACAO.ID_USUARIO = :OLD_ID_USUARIO AND'
      '  AUTORIZACAO.ID_TABELA = :OLD_ID_TABELA')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'XSELECT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'XDELETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'XINSERT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'XUPDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_TABELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TABELA'
        ParamType = ptUnknown
      end>
  end
  object Z_Empresa: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from empresa where id_empresa = 0')
    Params = <>
    Left = 24
    Top = 200
    object Z_EmpresaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_EmpresaFAIXA_INICIAL: TIntegerField
      FieldName = 'FAIXA_INICIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_EmpresaFAIXA_FINAL: TIntegerField
      FieldName = 'FAIXA_FINAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_EmpresaIPLOCAL: TStringField
      FieldName = 'IPLOCAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_EmpresaIPWWW: TStringField
      FieldName = 'IPWWW'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_EmpresaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_EmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaIE: TStringField
      FieldName = 'IE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaIM: TStringField
      FieldName = 'IM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_EmpresaNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_EmpresaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_EmpresaTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      ProviderFlags = [pfInUpdate]
      EditMask = '!\(99\)9999\-9999;1;_'
      Size = 14
    end
    object Z_EmpresaTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      ProviderFlags = [pfInUpdate]
      EditMask = '!\(99\)9999\-9999;1;_'
      Size = 14
    end
    object Z_EmpresaCELULAR: TStringField
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      EditMask = '!\(99\)9999\-9999;1;_'
      Size = 14
    end
    object Z_EmpresaFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      EditMask = '!\(99\)9999\-9999;1;_'
      Size = 14
    end
    object Z_EmpresaRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_EmpresaCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99999\-999;1;_'
      Size = 9
    end
    object Z_EmpresaMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object Z_EmpresaLOGO: TStringField
      FieldName = 'LOGO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaFUNDO: TStringField
      FieldName = 'FUNDO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_EmpresaDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object Z_EmpresaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
  end
  object DS_Empresa: TDataSource
    DataSet = Z_Empresa
    Left = 192
    Top = 200
  end
  object Z_Estado: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from uf where id_sigla = 0')
    Params = <>
    Left = 24
    Top = 264
    object Z_EstadoID_SIGLA: TIntegerField
      FieldName = 'ID_SIGLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_EstadoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_EstadoSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 2
    end
  end
  object Z_Cidade: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from cidade where id_cidade = 0')
    Params = <>
    Left = 24
    Top = 328
    object Z_CidadeID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_CidadeNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_CidadeCEP_INICIAL: TStringField
      FieldName = 'CEP_INICIAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99999\-999;1;_'
      Size = 9
    end
    object Z_CidadeCEP_FINAL: TStringField
      FieldName = 'CEP_FINAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99999\-999;1;_'
      Size = 9
    end
  end
  object Z_Bairro: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from bairro where id_bairro = 0')
    Params = <>
    Left = 24
    Top = 384
    object Z_BairroID_BAIRRO: TIntegerField
      FieldName = 'ID_BAIRRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_BairroNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object Z_Logradouro: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Logradouro
    SQL.Strings = (
      
        'select L.*, B.nome AS XBAIRRO, C.nome AS XCIDADE, U.nome AS XEST' +
        'ADO, U.sigla AS XSIGLA'
      'from logradouro L'
      'left join bairro B on B.id_bairro = L.id_bairro'
      'left join cidade C on C.id_cidade = L.id_cidade'
      'left join uf U on U.id_sigla = L.id_sigla'
      'WHERE L.ID_LOGRADOURO = :CODIGO'
      'order by U.nome, C.nome, B.nome, C.nome')
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object Z_LogradouroID_LOGRADOURO: TIntegerField
      FieldName = 'ID_LOGRADOURO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_LogradouroID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_LogradouroID_SIGLA: TIntegerField
      FieldName = 'ID_SIGLA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_LogradouroID_BAIRRO: TIntegerField
      FieldName = 'ID_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_LogradouroCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object Z_LogradouroTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_LogradouroNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_LogradouroXBAIRRO: TStringField
      FieldName = 'XBAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object Z_LogradouroXCIDADE: TStringField
      FieldName = 'XCIDADE'
      ProviderFlags = []
      Size = 100
    end
    object Z_LogradouroXESTADO: TStringField
      FieldName = 'XESTADO'
      ProviderFlags = []
      Size = 100
    end
    object Z_LogradouroXSIGLA: TStringField
      FieldName = 'XSIGLA'
      ProviderFlags = []
      Size = 2
    end
  end
  object DS_Estado: TDataSource
    DataSet = Z_Estado
    Left = 192
    Top = 264
  end
  object DS_Cidade: TDataSource
    DataSet = Z_Cidade
    Left = 200
    Top = 328
  end
  object DS_Bairro: TDataSource
    DataSet = Z_Bairro
    Left = 200
    Top = 392
  end
  object DS_Logradouro: TDataSource
    DataSet = Z_Logradouro
    Left = 200
    Top = 440
  end
  object UP_Logradouro: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM logradouro'
      'WHERE'
      '  logradouro.ID_LOGRADOURO = :OLD_ID_LOGRADOURO')
    InsertSQL.Strings = (
      'INSERT INTO logradouro'
      '  (logradouro.ID_LOGRADOURO,'
      'logradouro.ID_CIDADE, '
      'logradouro.ID_SIGLA,'
      ' logradouro.ID_BAIRRO, '
      'logradouro.CEP, '
      '   logradouro.TIPO,'
      ' logradouro.NOME)'
      'VALUES'
      '  (:ID_LOGRADOURO,'
      ' :ID_CIDADE,'
      ' :ID_SIGLA,'
      ' :ID_BAIRRO,'
      ' :CEP,'
      ' :TIPO,'
      ' :NOME)')
    ModifySQL.Strings = (
      'UPDATE logradouro SET'
      '  logradouro.ID_CIDADE = :ID_CIDADE,'
      '  logradouro.ID_SIGLA = :ID_SIGLA,'
      '  logradouro.ID_BAIRRO = :ID_BAIRRO,'
      '  logradouro.CEP = :CEP,'
      '  logradouro.TIPO = :TIPO,'
      '  logradouro.NOME = :NOME'
      'WHERE'
      '  logradouro.ID_LOGRADOURO = :OLD_ID_LOGRADOURO')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SIGLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_BAIRRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_LOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_LOGRADOURO'
        ParamType = ptUnknown
      end>
  end
  object Z_Endereco_Tipo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'SELECT ID_ENDERECO_TIPO, TIPO, TELEFONE, ENDERECO FROM ENDERECO_' +
        'TIPO'
      'WHERE ID_ENDERECO_TIPO = 0')
    Params = <>
    Left = 24
    Top = 496
    object Z_Endereco_TipoID_ENDERECO_TIPO: TIntegerField
      FieldName = 'ID_ENDERECO_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_Endereco_TipoTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_Endereco_TipoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_Endereco_TipoENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
  end
  object DS_Endereco_Tipo: TDataSource
    DataSet = Z_Endereco_Tipo
    Left = 200
    Top = 488
  end
  object Z_Pessoa_Tipo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select * from pessoa_tipo WHERE ATIVO = '#39'SIM'#39)
    Params = <>
    Left = 24
    Top = 552
    object Z_Pessoa_TipoID_PESSOA_TIPO: TIntegerField
      FieldName = 'ID_PESSOA_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_Pessoa_TipoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object Z_Pessoa_TipoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object Z_Pessoa_TipoPADRAO: TStringField
      FieldName = 'PADRAO'
      Required = True
      Size = 3
    end
    object Z_Pessoa_TipoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 3
    end
  end
  object DS_Pessoa_Tipo: TDataSource
    DataSet = Z_Pessoa_Tipo
    Left = 200
    Top = 552
  end
  object Z_Ocupacao: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select id_ocupacao, cbo, nome, obs from ocupacao'
      'where id_ocupacao = 0')
    Params = <>
    Left = 304
    Top = 496
    object Z_OcupacaoID_OCUPACAO: TIntegerField
      FieldName = 'ID_OCUPACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_OcupacaoCBO: TStringField
      FieldName = 'CBO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_OcupacaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_OcupacaoOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
  end
  object DS_Ocupacao: TDataSource
    DataSet = Z_Ocupacao
    Left = 464
    Top = 496
  end
  object Z_Pessoa: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Pessoa
    BeforePost = Z_PessoaBeforePost
    SQL.Strings = (
      
        'select P.*, O.nome as ocupacao, PT.nome as tipo, (select first 1' +
        ' t.numero from telefone t where t.id_pessoa = p.id_pessoa) as xt' +
        'elefone from pessoa P'
      'left join ocupacao O on O.id_ocupacao = P.id_ocupacao'
      'left join pessoa_tipo PT on PT.id_pessoa_tipo = P.id_pessoa_tipo'
      'where'
      'P.id_pessoa = 0')
    Params = <>
    Left = 304
    Top = 552
    object Z_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object Z_PessoaID_PESSOA_TIPO: TIntegerField
      FieldName = 'ID_PESSOA_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaID_OCUPACAO: TIntegerField
      FieldName = 'ID_OCUPACAO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaPESSOA_FISICA: TStringField
      FieldName = 'PESSOA_FISICA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaRG_IE: TStringField
      FieldName = 'RG_IE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaRG_EMISSAO: TDateField
      FieldName = 'RG_EMISSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_PessoaRG_ORGAO: TStringField
      FieldName = 'RG_ORGAO'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object Z_PessoaIM: TStringField
      FieldName = 'IM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaSEXO: TStringField
      FieldName = 'SEXO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaPAI: TStringField
      FieldName = 'PAI'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaMAE: TStringField
      FieldName = 'MAE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaCONJUGE: TStringField
      FieldName = 'CONJUGE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaNACIONALIDADE: TStringField
      FieldName = 'NACIONALIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaEMPRESA_CARGO: TStringField
      FieldName = 'EMPRESA_CARGO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaEMPRESA_RENDA: TFloatField
      FieldName = 'EMPRESA_RENDA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_PessoaEMPRESA_TEMPO: TDateField
      FieldName = 'EMPRESA_TEMPO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaCONSULTA_SPC: TStringField
      FieldName = 'CONSULTA_SPC'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaCONSULTA_CERASA: TStringField
      FieldName = 'CONSULTA_CERASA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaCONSULTA_TELEFONE: TStringField
      FieldName = 'CONSULTA_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaCONSULTA_OUTROS: TStringField
      FieldName = 'CONSULTA_OUTROS'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaCONSULTA_DADOS: TMemoField
      FieldName = 'CONSULTA_DADOS'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object Z_PessoaCREDITO: TFloatField
      FieldName = 'CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaCREDITO_VAL: TDateField
      FieldName = 'CREDITO_VAL'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaCREDITO_VAL_ATIVO: TStringField
      FieldName = 'CREDITO_VAL_ATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaNOTA: TSmallintField
      FieldName = 'NOTA'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_PessoaCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaFILHOS: TStringField
      FieldName = 'FILHOS'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaFOTO: TStringField
      FieldName = 'FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_PessoaEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_PessoaMSN: TStringField
      FieldName = 'MSN'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_PessoaICQ: TStringField
      FieldName = 'ICQ'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_PessoaYAHOO: TStringField
      FieldName = 'YAHOO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_PessoaAIM: TStringField
      FieldName = 'AIM'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_PessoaMALADIRETA: TStringField
      FieldName = 'MALADIRETA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaDATA: TDateTimeField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_PessoaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaALTERACAO_FUNC: TSmallintField
      FieldName = 'ALTERACAO_FUNC'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaALTERACAO_DATA: TDateField
      FieldName = 'ALTERACAO_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaIMPRIMIR: TStringField
      FieldName = 'IMPRIMIR'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_PessoaPESSOA_RESPONSAVEL: TIntegerField
      FieldName = 'PESSOA_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
    end
    object Z_PessoaSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object Z_PessoaOCUPACAO: TStringField
      FieldName = 'OCUPACAO'
      ProviderFlags = []
      Size = 100
    end
    object Z_PessoaTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = []
      Size = 100
    end
    object Z_PessoaXTELEFONE: TStringField
      FieldName = 'XTELEFONE'
      ProviderFlags = []
      Size = 9
    end
  end
  object Z_Endereco: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Endereco
    SQL.Strings = (
      
        'select E.*, ET.tipo as ENDTIPO, L.cep AS CEP, L.tipo as TIPORUA,' +
        ' L.nome as RUA, B.nome as BAIRRO, C.nome as CIDADE, U.sigla as E' +
        'STADO from endereco E'
      
        'left join endereco_tipo ET on ET.id_endereco_tipo = E.id_enderec' +
        'o_tipo'
      'left join logradouro L on L.id_logradouro = E.id_logradouro'
      'left join bairro B on B.id_bairro = L.id_bairro'
      'left join Cidade C on C.id_cidade = L.id_cidade'
      'left join uf U on U.id_sigla = L.id_sigla')
    Params = <>
    Left = 304
    Top = 440
    object Z_EnderecoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_EnderecoID_LOGRADOURO: TIntegerField
      FieldName = 'ID_LOGRADOURO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_EnderecoID_ENDERECO_TIPO: TIntegerField
      FieldName = 'ID_ENDERECO_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_EnderecoNUMERO: TSmallintField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_EnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object Z_EnderecoMALADIRETA: TStringField
      FieldName = 'MALADIRETA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_EnderecoOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_EnderecoENDTIPO: TStringField
      FieldName = 'ENDTIPO'
      ProviderFlags = []
      Size = 100
    end
    object Z_EnderecoCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = []
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object Z_EnderecoTIPORUA: TStringField
      FieldName = 'TIPORUA'
      ProviderFlags = []
    end
    object Z_EnderecoRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = []
      Size = 100
    end
    object Z_EnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object Z_EnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 100
    end
    object Z_EnderecoESTADO: TStringField
      FieldName = 'ESTADO'
      ProviderFlags = []
      Size = 100
    end
  end
  object Z_Telefone: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Telefone
    SQL.Strings = (
      
        'select T.*, ET.tipo from telefone T left join endereco_tipo ET o' +
        'n ET.id_endereco_tipo = T.id_endereco_tipo where T.id_pessoa = 0')
    Params = <>
    Left = 304
    Top = 384
    object Z_TelefoneID_TELEFONE: TIntegerField
      FieldName = 'ID_TELEFONE'
    end
    object Z_TelefoneID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_TelefoneID_ENDERECO_TIPO: TIntegerField
      FieldName = 'ID_ENDERECO_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_TelefoneDDD: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object Z_TelefoneRAMAL: TStringField
      FieldName = 'RAMAL'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object Z_TelefoneNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 9
    end
    object Z_TelefoneCONTATO: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_TelefoneMALADIRETA: TStringField
      FieldName = 'MALADIRETA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_TelefoneTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object DS_Pessoa: TDataSource
    DataSet = Z_Pessoa
    Left = 464
    Top = 552
  end
  object DS_Endereco: TDataSource
    DataSet = Z_Endereco
    Left = 464
    Top = 440
  end
  object DS_Telefone: TDataSource
    DataSet = Z_Telefone
    Left = 464
    Top = 384
  end
  object UP_Pessoa: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pessoa'
      'WHERE'
      '  pessoa.ID_PESSOA = :OLD_ID_PESSOA')
    InsertSQL.Strings = (
      'INSERT INTO pessoa'
      '  (pessoa.ID_PESSOA, pessoa.ID_PESSOA_TIPO, pessoa.ID_USUARIO, '
      'pessoa.ID_OCUPACAO, '
      '   pessoa.PESSOA_FISICA, pessoa.NOME, pessoa.NOME_FANTASIA, '
      'pessoa.CPF_CNPJ, '
      '   pessoa.RG_IE, pessoa.RG_EMISSAO, pessoa.RG_ORGAO, pessoa.IM, '
      'pessoa.SEXO, '
      '   pessoa.PAI, pessoa.MAE, pessoa.CONJUGE, '
      'pessoa.NACIONALIDADE, pessoa.ESTADO_CIVIL, '
      '   pessoa.EMPRESA, pessoa.EMPRESA_CARGO, '
      'pessoa.EMPRESA_RENDA, pessoa.EMPRESA_TEMPO, '
      '   pessoa.CONSULTA_SPC, pessoa.CONSULTA_CERASA, '
      'pessoa.CONSULTA_TELEFONE, '
      '   pessoa.CONSULTA_OUTROS, pessoa.CREDITO, '
      'pessoa.CREDITO_VAL, pessoa.CREDITO_VAL_ATIVO, '
      '   pessoa.NOTA, pessoa.NASCIMENTO, pessoa.COMISSAO, '
      'pessoa.DESCONTO, pessoa.FILHOS, '
      '   pessoa.FOTO, pessoa.EMAIL, pessoa.MSN, pessoa.ICQ, '
      'pessoa.YAHOO, pessoa.AIM, '
      '   pessoa.MALADIRETA, pessoa.DATA, pessoa.OBS, pessoa.ATIVO, '
      'pessoa.ALTERACAO_FUNC, '
      '   pessoa.ALTERACAO_DATA, pessoa.CONSULTA_DADOS,  '
      'pessoa.IMPRIMIR, pessoa.PESSOA_RESPONSAVEL, pessoa.SENHA)'
      'VALUES'
      '  (:ID_PESSOA, :ID_PESSOA_TIPO, :ID_USUARIO, :ID_OCUPACAO, '
      ':PESSOA_FISICA, '
      '   :NOME, :NOME_FANTASIA, :CPF_CNPJ, :RG_IE, :RG_EMISSAO, '
      ':RG_ORGAO, :IM, '
      '   :SEXO, :PAI, :MAE, :CONJUGE, :NACIONALIDADE, :ESTADO_CIVIL, '
      ':EMPRESA, '
      '   :EMPRESA_CARGO, :EMPRESA_RENDA, :EMPRESA_TEMPO, '
      ':CONSULTA_SPC, :CONSULTA_CERASA, '
      '   :CONSULTA_TELEFONE, :CONSULTA_OUTROS, :CREDITO, '
      ':CREDITO_VAL, :CREDITO_VAL_ATIVO, '
      '   :NOTA, :NASCIMENTO, :COMISSAO, :DESCONTO, :FILHOS, :FOTO, '
      ':EMAIL, :MSN, '
      '   :ICQ, :YAHOO, :AIM, :MALADIRETA, :DATA, :OBS, :ATIVO, '
      ':ALTERACAO_FUNC, '
      '   :ALTERACAO_DATA, :CONSULTA_DADOS,  :IMPRIMIR, '
      ':PESSOA_RESPONSAVEL, :SENHA)')
    ModifySQL.Strings = (
      'UPDATE pessoa SET'
      '  pessoa.ID_PESSOA = :ID_PESSOA,'
      '  pessoa.ID_PESSOA_TIPO = :ID_PESSOA_TIPO,'
      '  pessoa.ID_USUARIO = :ID_USUARIO,'
      '  pessoa.ID_OCUPACAO = :ID_OCUPACAO,'
      '  pessoa.PESSOA_FISICA = :PESSOA_FISICA,'
      '  pessoa.NOME = :NOME,'
      '  pessoa.NOME_FANTASIA = :NOME_FANTASIA,'
      '  pessoa.CPF_CNPJ = :CPF_CNPJ,'
      '  pessoa.RG_IE = :RG_IE,'
      '  pessoa.RG_EMISSAO = :RG_EMISSAO,'
      '  pessoa.RG_ORGAO = :RG_ORGAO,'
      '  pessoa.IM = :IM,'
      '  pessoa.SEXO = :SEXO,'
      '  pessoa.PAI = :PAI,'
      '  pessoa.MAE = :MAE,'
      '  pessoa.CONJUGE = :CONJUGE,'
      '  pessoa.NACIONALIDADE = :NACIONALIDADE,'
      '  pessoa.ESTADO_CIVIL = :ESTADO_CIVIL,'
      '  pessoa.EMPRESA = :EMPRESA,'
      '  pessoa.EMPRESA_CARGO = :EMPRESA_CARGO,'
      '  pessoa.EMPRESA_RENDA = :EMPRESA_RENDA,'
      '  pessoa.EMPRESA_TEMPO = :EMPRESA_TEMPO,'
      '  pessoa.CONSULTA_SPC = :CONSULTA_SPC,'
      '  pessoa.CONSULTA_CERASA = :CONSULTA_CERASA,'
      '  pessoa.CONSULTA_TELEFONE = :CONSULTA_TELEFONE,'
      '  pessoa.CONSULTA_OUTROS = :CONSULTA_OUTROS,'
      '  pessoa.CREDITO = :CREDITO,'
      '  pessoa.CREDITO_VAL = :CREDITO_VAL,'
      '  pessoa.CREDITO_VAL_ATIVO = :CREDITO_VAL_ATIVO,'
      '  pessoa.NOTA = :NOTA,'
      '  pessoa.NASCIMENTO = :NASCIMENTO,'
      '  pessoa.COMISSAO = :COMISSAO,'
      '  pessoa.DESCONTO = :DESCONTO,'
      '  pessoa.FILHOS = :FILHOS,'
      '  pessoa.FOTO = :FOTO,'
      '  pessoa.EMAIL = :EMAIL,'
      '  pessoa.MSN = :MSN,'
      '  pessoa.ICQ = :ICQ,'
      '  pessoa.YAHOO = :YAHOO,'
      '  pessoa.AIM = :AIM,'
      '  pessoa.MALADIRETA = :MALADIRETA,'
      '  pessoa.DATA = :DATA,'
      '  pessoa.OBS = :OBS,'
      '  pessoa.ATIVO = :ATIVO,'
      '  pessoa.ALTERACAO_FUNC = :ALTERACAO_FUNC,'
      '  pessoa.ALTERACAO_DATA = :ALTERACAO_DATA,'
      ' pessoa.CONSULTA_DADOS = :CONSULTA_DADOS,'
      ' pessoa.IMPRIMIR = :IMPRIMIR,'
      ' pessoa.PESSOA_RESPONSAVEL = :PESSOA_RESPONSAVEL,'
      ' pessoa.SENHA = :SENHA'
      'WHERE'
      '  pessoa.ID_PESSOA = :OLD_ID_PESSOA')
    UseSequenceFieldForRefreshSQL = False
    Left = 384
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_OCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESSOA_FISICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOME_FANTASIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CPF_CNPJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RG_IE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RG_EMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RG_ORGAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MAE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONJUGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NACIONALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO_CIVIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_RENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA_TEMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONSULTA_SPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONSULTA_CERASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONSULTA_TELEFONE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONSULTA_OUTROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CREDITO_VAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CREDITO_VAL_ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NASCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FILHOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMAIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MSN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ICQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'YAHOO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MALADIRETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
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
        Name = 'CONSULTA_DADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMPRIMIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESSOA_RESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SENHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object UP_Telefone: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM telefone'
      'WHERE'
      '  telefone.ID_TELEFONE = :OLD_ID_TELEFONE')
    InsertSQL.Strings = (
      'INSERT INTO telefone'
      '  (telefone.ID_TELEFONE, telefone.ID_PESSOA, '
      'telefone.ID_ENDERECO_TIPO, telefone.DDD, '
      'telefone.RAMAL, '
      '   telefone.NUMERO, telefone.CONTATO, telefone.MALADIRETA)'
      'VALUES'
      '  (:ID_TELEFONE, :ID_PESSOA, :ID_ENDERECO_TIPO, :DDD, :RAMAL, '
      ':NUMERO, '
      ':CONTATO, :MALADIRETA)')
    ModifySQL.Strings = (
      'UPDATE telefone SET'
      '  telefone.ID_PESSOA = :ID_PESSOA,'
      '  telefone.ID_ENDERECO_TIPO = :ID_ENDERECO_TIPO,'
      '  telefone.DDD = :DDD,'
      '  telefone.RAMAL = :RAMAL,'
      '  telefone.NUMERO = :NUMERO,'
      '  telefone.CONTATO = :CONTATO,'
      '  telefone.MALADIRETA = :MALADIRETA'
      'WHERE'
      '  telefone.ID_TELEFONE = :OLD_ID_TELEFONE')
    UseSequenceFieldForRefreshSQL = False
    Left = 384
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ENDERECO_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RAMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONTATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MALADIRETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_TELEFONE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TELEFONE'
        ParamType = ptUnknown
      end>
  end
  object UP_Endereco: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM endereco'
      'WHERE'
      '  endereco.ID_PESSOA = :OLD_ID_PESSOA AND'
      '  endereco.ID_LOGRADOURO = :OLD_ID_LOGRADOURO AND'
      '  endereco.ID_ENDERECO_TIPO = :OLD_ID_ENDERECO_TIPO')
    InsertSQL.Strings = (
      'INSERT INTO endereco'
      '  (endereco.ID_PESSOA, endereco.ID_LOGRADOURO, '
      'endereco.ID_ENDERECO_TIPO, '
      '   endereco.NUMERO, endereco.COMPLEMENTO, '
      'endereco.MALADIRETA, endereco.OBS)'
      'VALUES'
      '  (:ID_PESSOA, :ID_LOGRADOURO, :ID_ENDERECO_TIPO, :NUMERO, '
      ':COMPLEMENTO, '
      '   :MALADIRETA, :OBS)')
    ModifySQL.Strings = (
      'UPDATE endereco SET'
      '  endereco.ID_PESSOA = :ID_PESSOA,'
      '  endereco.ID_LOGRADOURO = :ID_LOGRADOURO,'
      '  endereco.ID_ENDERECO_TIPO = :ID_ENDERECO_TIPO,'
      '  endereco.NUMERO = :NUMERO,'
      '  endereco.COMPLEMENTO = :COMPLEMENTO,'
      '  endereco.MALADIRETA = :MALADIRETA,'
      '  endereco.OBS = :OBS'
      'WHERE'
      '  endereco.ID_PESSOA = :OLD_ID_PESSOA AND'
      '  endereco.ID_LOGRADOURO = :OLD_ID_LOGRADOURO AND'
      '  endereco.ID_ENDERECO_TIPO = :OLD_ID_ENDERECO_TIPO')
    UseSequenceFieldForRefreshSQL = False
    Left = 384
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_LOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ENDERECO_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COMPLEMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MALADIRETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_LOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_ENDERECO_TIPO'
        ParamType = ptUnknown
      end>
  end
  object Z_Interesse: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Interesse
    SQL.Strings = (
      
        'select I.*, L.cep AS CEP, L.tipo as TIPORUA, L.nome as RUA, B.no' +
        'me as BAIRRO, C.nome as CIDADE, U.sigla as ESTADO'
      'from pessoa_interesse I'
      'left join logradouro L on L.id_logradouro = I.id_logradouro'
      'left join bairro B on B.id_bairro = L.id_bairro'
      'left join Cidade C on C.id_cidade = L.id_cidade'
      'left join uf U on U.id_sigla = L.id_sigla')
    Params = <>
    Left = 304
    Top = 336
    object Z_InteresseID_PESSOA_INTERESSE: TIntegerField
      FieldName = 'ID_PESSOA_INTERESSE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_InteresseID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_InteresseID_LOGRADOURO: TIntegerField
      FieldName = 'ID_LOGRADOURO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_InteresseOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_InteresseATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_InteresseCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = []
      EditMask = '!99999\-999;1;_'
      Size = 9
    end
    object Z_InteresseTIPORUA: TStringField
      FieldName = 'TIPORUA'
      ProviderFlags = []
    end
    object Z_InteresseRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = []
      Size = 100
    end
    object Z_InteresseBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object Z_InteresseCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 100
    end
    object Z_InteresseESTADO: TStringField
      FieldName = 'ESTADO'
      ProviderFlags = []
      Size = 200
    end
  end
  object UP_Interesse: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pessoa_interesse'
      'WHERE'
      '  pessoa_interesse.ID_PESSOA_INTERESSE = '
      ':OLD_ID_PESSOA_INTERESSE')
    InsertSQL.Strings = (
      'INSERT INTO pessoa_interesse'
      '  (pessoa_interesse.ID_PESSOA, pessoa_interesse.ID_LOGRADOURO, '
      'pessoa_interesse.OBS, '
      '   pessoa_interesse.ATIVO)'
      'VALUES'
      '  (:ID_PESSOA, :ID_LOGRADOURO, :OBS, :ATIVO)')
    ModifySQL.Strings = (
      'UPDATE pessoa_interesse SET'
      '  pessoa_interesse.ID_PESSOA = :ID_PESSOA,'
      '  pessoa_interesse.ID_LOGRADOURO = :ID_LOGRADOURO,'
      '  pessoa_interesse.OBS = :OBS,'
      '  pessoa_interesse.ATIVO = :ATIVO'
      'WHERE'
      '  pessoa_interesse.ID_PESSOA_INTERESSE = '
      ':OLD_ID_PESSOA_INTERESSE')
    UseSequenceFieldForRefreshSQL = False
    Left = 384
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_LOGRADOURO'
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
        Name = 'OLD_ID_PESSOA_INTERESSE'
        ParamType = ptUnknown
      end>
  end
  object DS_Interesse: TDataSource
    DataSet = Z_Interesse
    Left = 464
    Top = 336
  end
  object Z_Imovel_Tipo: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select * from imovel_tipo where id_imovel_tipo = :CODIGO ORDER B' +
        'Y NOME')
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object Z_Imovel_TipoID_IMOVEL_TIPO: TIntegerField
      FieldName = 'ID_IMOVEL_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_Imovel_TipoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object Z_Imovel_TipoOBS: TStringField
      FieldName = 'OBS'
      Size = 300
    end
    object Z_Imovel_TipoPADRAO: TStringField
      FieldName = 'PADRAO'
      Required = True
      Size = 3
    end
    object Z_Imovel_TipoATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 3
    end
    object Z_Imovel_TipoCOMERCIAL: TStringField
      FieldName = 'COMERCIAL'
      Required = True
      Size = 3
    end
  end
  object DS_Imovel_Tipo: TDataSource
    DataSet = Z_Imovel_Tipo
    Left = 464
    Top = 288
  end
  object Z_Imovel_Caracteristica: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select id_caracteristicas, nome, obs, padrao, ativo from caracte' +
        'risticas where id_caracteristicas = 0')
    Params = <>
    Left = 304
    Top = 240
    object Z_Imovel_CaracteristicaID_CARACTERISTICAS: TIntegerField
      FieldName = 'ID_CARACTERISTICAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_Imovel_CaracteristicaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_Imovel_CaracteristicaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_Imovel_CaracteristicaPADRAO: TStringField
      FieldName = 'PADRAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_Imovel_CaracteristicaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
  end
  object DS_Imovel_Caracteristica: TDataSource
    DataSet = Z_Imovel_Caracteristica
    Left = 464
    Top = 240
  end
  object Z_Imovel_Subtipo: TZQuery
    Connection = PRINCIPAL.Conexao
    OnNewRecord = Z_Imovel_SubtipoNewRecord
    SQL.Strings = (
      
        'select id_imovel_subtipo, id_imovel_tipo, nome, obs, padrao from' +
        ' imovel_subtipo where padrao <> '#39'XXX'#39' and id_imovel_tipo = :TIPO' +
        ' order by nome')
    Params = <
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInputOutput
      end>
    Left = 304
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInputOutput
      end>
    object Z_Imovel_SubtipoID_IMOVEL_SUBTIPO: TIntegerField
      FieldName = 'ID_IMOVEL_SUBTIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_Imovel_SubtipoID_IMOVEL_TIPO: TIntegerField
      FieldName = 'ID_IMOVEL_TIPO'
      Required = True
    end
    object Z_Imovel_SubtipoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object Z_Imovel_SubtipoOBS: TStringField
      FieldName = 'OBS'
      Size = 300
    end
    object Z_Imovel_SubtipoPADRAO: TStringField
      FieldName = 'PADRAO'
      Required = True
      Size = 3
    end
  end
  object DS_Imovel_Subtipo: TDataSource
    DataSet = Z_Imovel_Subtipo
    Left = 464
    Top = 136
  end
  object Z_Imovel: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Imovel
    BeforePost = Z_ImovelBeforePost
    SQL.Strings = (
      'select'
      'I.*,'
      'IMS.nome as XSUBTIPO,'
      'IT.nome as XTIPO,'
      'L.tipo as XTIPORUA,'
      'L.nome as XNOMERUA,'
      'L.CEP as XCEP,'
      'B.nome as XBAIRRO,'
      'CI.nome as XCIDADE,'
      'U.sigla as XESTADO, '
      ' '#39'teste'#39' as PROPRIETARIO'
      'from imovel I'
      
        'left join imovel_subtipo IMS on IMS.id_imovel_subtipo = I.id_imo' +
        'vel_subtipo'
      'left join imovel_tipo IT on IT.id_imovel_tipo = I.id_imovel_tipo'
      'left join logradouro L on L.id_logradouro = I.id_logradouro'
      'left join imovel_caracteristica IC on IC.id_imovel = I.id_imovel'
      
        'left join caracteristicas C on C.id_caracteristicas = IC.id_cara' +
        'cteristica'
      'left join bairro B on B.id_bairro = L.id_bairro'
      'left join cidade CI on CI.id_cidade = L.id_cidade'
      'left join uf U on U.id_sigla = L.id_sigla'
      'where I.id_imovel = 0'
      'order by'
      'U.sigla, CI.nome, B.nome, L.tipo, L.nome, I.numero')
    Params = <>
    Left = 304
    Top = 192
    object Z_ImovelID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_ImovelID_LOGRADOURO: TIntegerField
      FieldName = 'ID_LOGRADOURO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ImovelID_IMOVEL_SUBTIPO: TIntegerField
      FieldName = 'ID_IMOVEL_SUBTIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ImovelID_IMOVEL_TIPO: TIntegerField
      FieldName = 'ID_IMOVEL_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ImovelID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ImovelNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ImovelCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ImovelSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object Z_ImovelDEPOSITO: TStringField
      FieldName = 'DEPOSITO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ImovelSEGURO_FIANCA: TStringField
      FieldName = 'SEGURO_FIANCA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object TStringField
      FieldName = 'FIADOR'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ImovelVISITACORRETOR: TStringField
      FieldName = 'VISITACORRETOR'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ImovelOCUPADO: TStringField
      FieldName = 'OCUPADO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ImovelPLACA: TStringField
      FieldName = 'PLACA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ImovelVENDA: TStringField
      FieldName = 'VENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_ImovelALUGUEL: TStringField
      FieldName = 'ALUGUEL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_ImovelOUTROS: TStringField
      FieldName = 'OUTROS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_ImovelOUTROS_NOME: TStringField
      FieldName = 'OUTROS_NOME'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
      Size = 100
    end
    object Z_ImovelVALOR_REAL: TFloatField
      FieldName = 'VALOR_REAL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ImovelVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ImovelVALOR_ALUQUEL: TFloatField
      FieldName = 'VALOR_ALUQUEL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ImovelVALOR_CONDOMINIO: TFloatField
      FieldName = 'VALOR_CONDOMINIO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ImovelVALOR_OUTROS: TFloatField
      FieldName = 'VALOR_OUTROS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_ImovelVALOR_OUTROS_NOME: TStringField
      FieldName = 'VALOR_OUTROS_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ImovelAREA_DEPRECIACAO: TStringField
      FieldName = 'AREA_DEPRECIACAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ImovelNUM_LUZ: TStringField
      FieldName = 'NUM_LUZ'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ImovelNUM_MATRICULA: TStringField
      FieldName = 'NUM_MATRICULA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_ImovelNUM_AGUA: TStringField
      FieldName = 'NUM_AGUA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ImovelENTRADA_CHAVES: TSmallintField
      FieldName = 'ENTRADA_CHAVES'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ImovelHORARIO_VISITA: TStringField
      FieldName = 'HORARIO_VISITA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_ImovelCHAVE_QUADRO: TStringField
      FieldName = 'CHAVE_QUADRO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object Z_ImovelOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_ImovelDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object Z_ImovelATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_ImovelALTERACAO_FUNC: TIntegerField
      FieldName = 'ALTERACAO_FUNC'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ImovelALTERACAO_DATA: TDateField
      FieldName = 'ALTERACAO_DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object Z_ImovelANOTACOES: TMemoField
      FieldName = 'ANOTACOES'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object Z_ImovelANUNCIAR: TStringField
      FieldName = 'ANUNCIAR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_ImovelLOCAL_PGTO: TStringField
      FieldName = 'LOCAL_PGTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ImovelEXCLUSIVO: TStringField
      FieldName = 'EXCLUSIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_ImovelFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_ImovelXSUBTIPO: TStringField
      FieldName = 'XSUBTIPO'
      ProviderFlags = []
      Size = 100
    end
    object Z_ImovelXTIPO: TStringField
      FieldName = 'XTIPO'
      ProviderFlags = []
      Size = 100
    end
    object Z_ImovelXTIPORUA: TStringField
      FieldName = 'XTIPORUA'
      ProviderFlags = []
    end
    object Z_ImovelXNOMERUA: TStringField
      FieldName = 'XNOMERUA'
      ProviderFlags = []
      Size = 100
    end
    object Z_ImovelXCEP: TStringField
      FieldName = 'XCEP'
      ProviderFlags = []
      EditMask = '!99999\-999;1;_'
      Size = 9
    end
    object Z_ImovelXBAIRRO: TStringField
      FieldName = 'XBAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object Z_ImovelXCIDADE: TStringField
      FieldName = 'XCIDADE'
      ProviderFlags = []
      Size = 100
    end
    object Z_ImovelXESTADO: TStringField
      FieldName = 'XESTADO'
      ProviderFlags = []
      Size = 2
    end
    object Z_ImovelNOTA: TSmallintField
      FieldName = 'NOTA'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ImovelPLACA_DATA: TDateField
      FieldName = 'PLACA_DATA'
      ProviderFlags = [pfInUpdate]
      OnSetText = Z_ImovelPLACA_DATASetText
      EditMask = '!99/99/9999;1;_'
    end
    object Z_ImovelIMPRIMIR: TStringField
      FieldName = 'IMPRIMIR'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ImovelDORMITORIOS: TSmallintField
      FieldName = 'DORMITORIOS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ImovelINTERNET: TStringField
      FieldName = 'INTERNET'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_ImovelCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 3
    end
    object Z_ImovelAREA_L: TFloatField
      FieldName = 'AREA_L'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ImovelAREA_C: TFloatField
      FieldName = 'AREA_C'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ImovelAREA_FATOR: TFloatField
      FieldName = 'AREA_FATOR'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ImovelAREA_CONSTRUIDA: TFloatField
      FieldName = 'AREA_CONSTRUIDA'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ImovelAREA_CONSTRUIDA_FATOR: TFloatField
      FieldName = 'AREA_CONSTRUIDA_FATOR'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ImovelAREA_OUTROS: TFloatField
      FieldName = 'AREA_OUTROS'
    end
    object Z_ImovelAREA_OUTROS_FATOR: TFloatField
      FieldName = 'AREA_OUTROS_FATOR'
      EditFormat = '###.###0,00'
    end
    object Z_ImovelPROPRIETARIO: TStringField
      DisplayWidth = 200
      FieldName = 'PROPRIETARIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
  end
  object DS_Imovel: TDataSource
    DataSet = Z_Imovel
    Left = 464
    Top = 192
  end
  object Z_Curinga_03: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Curinga_03
    SQL.Strings = (
      
        'select cst.*, cs.nome, c.documento, cast(cst.anotacao as varchar' +
        '(255)) as texto, u.nome as operador from caixa_status cst inner ' +
        'join usuario u on u.id_usuario = cst.id_funcionario inner join c' +
        'aixa_sis cs on cst.id_status = cs.id_caixa_sis inner join caixa_' +
        'entrada c on c.id_caixa = cst.id_caixa_entrada and c.ativo = '#39'SI' +
        'M'#39' and c.pendente = '#39'NAO'#39)
    Params = <>
    Left = 600
    Top = 128
  end
  object UP_Curinga_03: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM caixa_status'
      'WHERE'
      '  caixa_status.ID_CAIXA_STATUS = :OLD_ID_CAIXA_STATUS')
    InsertSQL.Strings = (
      'INSERT INTO caixa_status'
      '  (caixa_status.ID_CAIXA_STATUS, caixa_status.ID_STATUS, '
      'caixa_status.ID_CAIXA_SAIDA, '
      '   caixa_status.ID_CAIXA_ENTRADA, caixa_status.ID_FUNCIONARIO, '
      'caixa_status.DATA_CAD, '
      '   caixa_status.DATA_ENTRADA, caixa_status.DATA_SAIDA, '
      'caixa_status.DATA_ALT, '
      '   caixa_status.ANOTACAO)'
      'VALUES'
      '  (:ID_CAIXA_STATUS, :ID_STATUS, :ID_CAIXA_SAIDA, '
      ':ID_CAIXA_ENTRADA, :ID_FUNCIONARIO, '
      '   :DATA_CAD, :DATA_ENTRADA, :DATA_SAIDA, :DATA_ALT, '
      ':ANOTACAO)')
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
    Left = 680
    Top = 128
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
  object DS_Curinga_03: TDataSource
    DataSet = Z_Curinga_03
    Left = 760
    Top = 128
  end
  object UP_Imovel: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM imovel'
      'WHERE'
      '  imovel.ID_IMOVEL = :OLD_ID_IMOVEL')
    InsertSQL.Strings = (
      'INSERT INTO imovel'
      '  (imovel.ID_IMOVEL, imovel.ID_LOGRADOURO, '
      'imovel.ID_IMOVEL_SUBTIPO, imovel.ID_IMOVEL_TIPO, '
      '   imovel.ID_PESSOA, imovel.NUMERO, imovel.COMPLEMENTO, '
      'imovel.STATUS, '
      '   imovel.DEPOSITO, imovel.SEGURO_FIANCA, imovel.FIADOR, '
      'imovel.VISITACORRETOR, '
      '   imovel.OCUPADO, imovel.PLACA, imovel.VENDA, imovel.ALUGUEL, '
      'imovel.OUTROS, '
      '   imovel.OUTROS_NOME, imovel.VALOR_REAL, '
      'imovel.VALOR_VENDA, imovel.VALOR_ALUQUEL, '
      '   imovel.VALOR_CONDOMINIO, imovel.VALOR_OUTROS, '
      'imovel.VALOR_OUTROS_NOME, '
      '   imovel.AREA_L, imovel.AREA_C, imovel.AREA_FATOR, '
      'imovel.AREA_OUTROS, '
      '   imovel.AREA_OUTROS_FATOR, imovel.AREA_CONSTRUIDA, '
      'imovel.AREA_CONSTRUIDA_FATOR, '
      '   imovel.AREA_DEPRECIACAO, imovel.NUM_LUZ, '
      'imovel.NUM_MATRICULA, imovel.NUM_AGUA, '
      '   imovel.ENTRADA_CHAVES, imovel.HORARIO_VISITA, '
      'imovel.CHAVE_QUADRO, imovel.OBS, '
      '   imovel.DATA, imovel.ATIVO, imovel.ALTERACAO_FUNC, '
      'imovel.ALTERACAO_DATA, '
      '   imovel.ANOTACOES, imovel.ANUNCIAR, imovel.EXCLUSIVO, '
      'imovel.LOCAL_PGTO, '
      '   imovel.FINALIDADE,imovel.NOTA, imovel.IMPRIMIR, '
      'imovel.PLACA_DATA, imovel.DORMITORIOS, imovel.INTERNET, '
      'imovel.CHAVE)'
      'VALUES'
      '  (:ID_IMOVEL, :ID_LOGRADOURO, :ID_IMOVEL_SUBTIPO, '
      ':ID_IMOVEL_TIPO, :ID_PESSOA, '
      '   :NUMERO, :COMPLEMENTO, :STATUS, :DEPOSITO, '
      ':SEGURO_FIANCA, :FIADOR, '
      '   :VISITACORRETOR, :OCUPADO, :PLACA, :VENDA, :ALUGUEL, '
      ':OUTROS, :OUTROS_NOME, '
      '   :VALOR_REAL, :VALOR_VENDA, :VALOR_ALUQUEL, '
      ':VALOR_CONDOMINIO, :VALOR_OUTROS, '
      '   :VALOR_OUTROS_NOME, :AREA_L, :AREA_C, :AREA_FATOR, '
      ':AREA_OUTROS, :AREA_OUTROS_FATOR, '
      '   :AREA_CONSTRUIDA, :AREA_CONSTRUIDA_FATOR, '
      ':AREA_DEPRECIACAO, :NUM_LUZ, '
      '   :NUM_MATRICULA, :NUM_AGUA, :ENTRADA_CHAVES, '
      ':HORARIO_VISITA, :CHAVE_QUADRO, '
      '   :OBS, :DATA, :ATIVO, :ALTERACAO_FUNC, :ALTERACAO_DATA, '
      ':ANOTACOES, :ANUNCIAR, '
      '   :EXCLUSIVO, :LOCAL_PGTO, :FINALIDADE, :NOTA, '
      ':IMPRIMIR, :PLACA_DATA, :DORMITORIOS, :INTERNET, :CHAVE)')
    ModifySQL.Strings = (
      'UPDATE imovel SET'
      '  imovel.ID_IMOVEL = :ID_IMOVEL,'
      '  imovel.ID_LOGRADOURO = :ID_LOGRADOURO,'
      '  imovel.ID_IMOVEL_SUBTIPO = :ID_IMOVEL_SUBTIPO,'
      '  imovel.ID_IMOVEL_TIPO = :ID_IMOVEL_TIPO,'
      '  imovel.ID_PESSOA = :ID_PESSOA,'
      '  imovel.NUMERO = :NUMERO,'
      '  imovel.COMPLEMENTO = :COMPLEMENTO,'
      '  imovel.STATUS = :STATUS,'
      '  imovel.DEPOSITO = :DEPOSITO,'
      '  imovel.SEGURO_FIANCA = :SEGURO_FIANCA,'
      '  imovel.FIADOR = :FIADOR,'
      '  imovel.VISITACORRETOR = :VISITACORRETOR,'
      '  imovel.OCUPADO = :OCUPADO,'
      '  imovel.PLACA = :PLACA,'
      '  imovel.VENDA = :VENDA,'
      '  imovel.ALUGUEL = :ALUGUEL,'
      '  imovel.OUTROS = :OUTROS,'
      '  imovel.OUTROS_NOME = :OUTROS_NOME,'
      '  imovel.VALOR_REAL = :VALOR_REAL,'
      '  imovel.VALOR_VENDA = :VALOR_VENDA,'
      '  imovel.VALOR_ALUQUEL = :VALOR_ALUQUEL,'
      '  imovel.VALOR_CONDOMINIO = :VALOR_CONDOMINIO,'
      '  imovel.VALOR_OUTROS = :VALOR_OUTROS,'
      '  imovel.VALOR_OUTROS_NOME = :VALOR_OUTROS_NOME,'
      '  imovel.AREA_L = :AREA_L,'
      '  imovel.AREA_C = :AREA_C,'
      '  imovel.AREA_FATOR = :AREA_FATOR,'
      '  imovel.AREA_OUTROS = :AREA_OUTROS,'
      '  imovel.AREA_OUTROS_FATOR = :AREA_OUTROS_FATOR,'
      '  imovel.AREA_CONSTRUIDA = :AREA_CONSTRUIDA,'
      '  imovel.AREA_CONSTRUIDA_FATOR = :AREA_CONSTRUIDA_FATOR,'
      '  imovel.AREA_DEPRECIACAO = :AREA_DEPRECIACAO,'
      '  imovel.NUM_LUZ = :NUM_LUZ,'
      '  imovel.NUM_MATRICULA = :NUM_MATRICULA,'
      '  imovel.NUM_AGUA = :NUM_AGUA,'
      '  imovel.ENTRADA_CHAVES = :ENTRADA_CHAVES,'
      '  imovel.HORARIO_VISITA = :HORARIO_VISITA,'
      '  imovel.CHAVE_QUADRO = :CHAVE_QUADRO,'
      '  imovel.OBS = :OBS,'
      '  imovel.DATA = :DATA,'
      '  imovel.ATIVO = :ATIVO,'
      '  imovel.ALTERACAO_FUNC = :ALTERACAO_FUNC,'
      '  imovel.ALTERACAO_DATA = :ALTERACAO_DATA,'
      '  imovel.ANOTACOES = :ANOTACOES,'
      '  imovel.ANUNCIAR = :ANUNCIAR,'
      '  imovel.EXCLUSIVO = :EXCLUSIVO,'
      '  imovel.LOCAL_PGTO = :LOCAL_PGTO,'
      '  imovel.FINALIDADE = :FINALIDADE,'
      '  imovel.NOTA = :NOTA,'
      '  imovel.IMPRIMIR = :IMPRIMIR,'
      '  imovel.PLACA_DATA = :PLACA_DATA,'
      '  imovel.DORMITORIOS= :DORMITORIOS,'
      '  imovel.INTERNET = :INTERNET,'
      '  imovel.CHAVE = :CHAVE'
      'WHERE'
      '  imovel.ID_IMOVEL = :OLD_ID_IMOVEL')
    UseSequenceFieldForRefreshSQL = False
    Left = 384
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_LOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL_SUBTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COMPLEMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEPOSITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEGURO_FIANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VISITACORRETOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OCUPADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALUGUEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OUTROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OUTROS_NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_REAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_VENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_ALUQUEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_CONDOMINIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_OUTROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_OUTROS_NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AREA_L'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AREA_C'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AREA_FATOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AREA_OUTROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AREA_OUTROS_FATOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AREA_CONSTRUIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AREA_CONSTRUIDA_FATOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AREA_DEPRECIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUM_LUZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUM_MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUM_AGUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ENTRADA_CHAVES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORARIO_VISITA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CHAVE_QUADRO'
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
        Name = 'ANOTACOES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANUNCIAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EXCLUSIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOCAL_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMPRIMIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACA_DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DORMITORIOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERNET'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CHAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_IMOVEL'
        ParamType = ptUnknown
      end>
  end
  object Z_Curinga_04: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Curinga_04
    SQL.Strings = (
      
        'SELECT pi.*, p.NOME as XPESSOA, P.cpf_cnpj as XCPF, P.foto as XF' +
        'OTO FROM PESSOA_IMOVEL PI'
      'LEFT JOIN PESSOA P ON P.id_pessoa = PI.id_pessoa'
      'WHERE PI.id_pessoa_tipo = 2 AND PI.id_imovel = :IMOVEL'
      'ORDER BY P.nome')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    Left = 600
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object Z_Curinga_04ID_PESSOA_IMOVEL: TIntegerField
      FieldName = 'ID_PESSOA_IMOVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_Curinga_04ID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_Curinga_04ID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_Curinga_04ID_PESSOA_TIPO: TIntegerField
      FieldName = 'ID_PESSOA_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_Curinga_04ID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_Curinga_04STATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_Curinga_04PORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object Z_Curinga_04INTERESSE: TStringField
      FieldName = 'INTERESSE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_Curinga_04VALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_Curinga_04GARANTIA: TStringField
      FieldName = 'GARANTIA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_Curinga_04FINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_Curinga_04DATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_Curinga_04DATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_Curinga_04HORA_INICIAL: TTimeField
      FieldName = 'HORA_INICIAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99:99;1;_'
    end
    object Z_Curinga_04HORA_FINAL: TTimeField
      FieldName = 'HORA_FINAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99:99;1;_'
    end
    object Z_Curinga_04FORMA_CONTATO: TStringField
      FieldName = 'FORMA_CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_Curinga_04OBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_Curinga_04DATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object Z_Curinga_04ATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_Curinga_04CC: TStringField
      FieldName = 'CC'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object Z_Curinga_04BANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_Curinga_04RESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_Curinga_04XPESSOA: TStringField
      FieldName = 'XPESSOA'
      ProviderFlags = []
      Size = 100
    end
    object Z_Curinga_04XCPF: TStringField
      FieldName = 'XCPF'
      ProviderFlags = []
      Size = 100
    end
    object Z_Curinga_04XFOTO: TStringField
      FieldName = 'XFOTO'
      ProviderFlags = []
      Size = 100
    end
    object Z_Curinga_04LOCAL_PGTO: TStringField
      FieldName = 'LOCAL_PGTO'
      Size = 100
    end
    object Z_Curinga_04ID_PESSOA2: TIntegerField
      FieldName = 'ID_PESSOA2'
      ProviderFlags = [pfInUpdate]
    end
    object Z_Curinga_04PESSOA2_NOME: TStringField
      FieldName = 'PESSOA2_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object UP_Curinga_04: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM PESSOA_IMOVEL'
      'WHERE'
      '  PESSOA_IMOVEL.ID_PESSOA_IMOVEL = :OLD_ID_PESSOA_IMOVEL')
    InsertSQL.Strings = (
      'INSERT INTO PESSOA_IMOVEL'
      
        '  (PESSOA_IMOVEL.ID_IMOVEL, PESSOA_IMOVEL.ID_PESSOA, PESSOA_IMOV' +
        'EL.ID_PESSOA_TIPO, '
      
        '   PESSOA_IMOVEL.ID_USUARIO, PESSOA_IMOVEL.STATUS, PESSOA_IMOVEL' +
        '.PORCENTAGEM, '
      
        '   PESSOA_IMOVEL.INTERESSE, PESSOA_IMOVEL.VALOR, PESSOA_IMOVEL.G' +
        'ARANTIA, '
      
        '   PESSOA_IMOVEL.FINALIDADE, PESSOA_IMOVEL.DATA_INICIAL, PESSOA_' +
        'IMOVEL.DATA_FINAL, '
      
        '   PESSOA_IMOVEL.HORA_INICIAL, PESSOA_IMOVEL.HORA_FINAL, PESSOA_' +
        'IMOVEL.FORMA_CONTATO, '
      
        '   PESSOA_IMOVEL.OBS, PESSOA_IMOVEL.DATA, PESSOA_IMOVEL.ATIVO, P' +
        'ESSOA_IMOVEL.CC, '
      
        '   PESSOA_IMOVEL.BANCO, PESSOA_IMOVEL.RESPONSAVEL, PESSOA_IMOVEL' +
        '.LOCAL_PGTO, '
      '   PESSOA_IMOVEL.ID_PESSOA2, PESSOA_IMOVEL.PESSOA2_NOME)'
      'VALUES'
      
        '  (:ID_IMOVEL, :ID_PESSOA, :ID_PESSOA_TIPO, :ID_USUARIO, :STATUS' +
        ', :PORCENTAGEM, '
      
        '   :INTERESSE, :VALOR, :GARANTIA, :FINALIDADE, :DATA_INICIAL, :D' +
        'ATA_FINAL, '
      
        '   :HORA_INICIAL, :HORA_FINAL, :FORMA_CONTATO, :OBS, :DATA, :ATI' +
        'VO, :CC, '
      
        '   :BANCO, :RESPONSAVEL, :LOCAL_PGTO, :ID_PESSOA2, :PESSOA2_NOME' +
        ')')
    ModifySQL.Strings = (
      'UPDATE PESSOA_IMOVEL SET'
      '  PESSOA_IMOVEL.ID_IMOVEL = :ID_IMOVEL,'
      '  PESSOA_IMOVEL.ID_PESSOA = :ID_PESSOA,'
      '  PESSOA_IMOVEL.ID_PESSOA_TIPO = :ID_PESSOA_TIPO,'
      '  PESSOA_IMOVEL.ID_USUARIO = :ID_USUARIO,'
      '  PESSOA_IMOVEL.STATUS = :STATUS,'
      '  PESSOA_IMOVEL.PORCENTAGEM = :PORCENTAGEM,'
      '  PESSOA_IMOVEL.INTERESSE = :INTERESSE,'
      '  PESSOA_IMOVEL.VALOR = :VALOR,'
      '  PESSOA_IMOVEL.GARANTIA = :GARANTIA,'
      '  PESSOA_IMOVEL.FINALIDADE = :FINALIDADE,'
      '  PESSOA_IMOVEL.DATA_INICIAL = :DATA_INICIAL,'
      '  PESSOA_IMOVEL.DATA_FINAL = :DATA_FINAL,'
      '  PESSOA_IMOVEL.HORA_INICIAL = :HORA_INICIAL,'
      '  PESSOA_IMOVEL.HORA_FINAL = :HORA_FINAL,'
      '  PESSOA_IMOVEL.FORMA_CONTATO = :FORMA_CONTATO,'
      '  PESSOA_IMOVEL.OBS = :OBS,'
      '  PESSOA_IMOVEL.DATA = :DATA,'
      '  PESSOA_IMOVEL.ATIVO = :ATIVO,'
      '  PESSOA_IMOVEL.CC = :CC,'
      '  PESSOA_IMOVEL.BANCO = :BANCO,'
      '  PESSOA_IMOVEL.RESPONSAVEL = :RESPONSAVEL,'
      '  PESSOA_IMOVEL.LOCAL_PGTO = :LOCAL_PGTO,'
      '  PESSOA_IMOVEL.ID_PESSOA2 = :ID_PESSOA2,'
      '  PESSOA_IMOVEL.PESSOA2_NOME = :PESSOA2_NOME'
      'WHERE'
      '  PESSOA_IMOVEL.ID_PESSOA_IMOVEL = :OLD_ID_PESSOA_IMOVEL')
    UseSequenceFieldForRefreshSQL = False
    Left = 680
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PORCENTAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERESSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GARANTIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_FINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_FINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FORMA_CONTATO'
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
        Name = 'CC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOCAL_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESSOA2_NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_PESSOA_IMOVEL'
        ParamType = ptUnknown
      end>
  end
  object DS_Curinga_04: TDataSource
    DataSet = Z_Curinga_04
    Left = 760
    Top = 192
  end
  object Z_Curinga_05: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Curinga_05
    SQL.Strings = (
      
        'SELECT pi.*, p.NOME as XPESSOA, P.cpf_cnpj as XCPF, P.foto as XF' +
        'OTO FROM PESSOA_IMOVEL PI'
      'LEFT JOIN PESSOA P ON P.id_pessoa = PI.id_pessoa'
      'WHERE PI.id_pessoa_tipo = 2 AND PI.id_imovel = :IMOVEL'
      'ORDER BY P.nome')
    Params = <
      item
        DataType = ftUnknown
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    Left = 600
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object Z_Curinga_05ID_PESSOA_IMOVEL: TIntegerField
      FieldName = 'ID_PESSOA_IMOVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_Curinga_05ID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_Curinga_05ID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_Curinga_05ID_PESSOA_TIPO: TIntegerField
      FieldName = 'ID_PESSOA_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_Curinga_05ID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_Curinga_05STATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_Curinga_05PORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object Z_Curinga_05INTERESSE: TStringField
      FieldName = 'INTERESSE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_Curinga_05VALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_Curinga_05GARANTIA: TStringField
      FieldName = 'GARANTIA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_Curinga_05FINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_Curinga_05DATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_Curinga_05DATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_Curinga_05HORA_INICIAL: TTimeField
      FieldName = 'HORA_INICIAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99:99;1;_'
    end
    object Z_Curinga_05HORA_FINAL: TTimeField
      FieldName = 'HORA_FINAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99:99;1;_'
    end
    object Z_Curinga_05FORMA_CONTATO: TStringField
      FieldName = 'FORMA_CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_Curinga_05OBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_Curinga_05DATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object Z_Curinga_05ATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_Curinga_05CC: TStringField
      FieldName = 'CC'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object Z_Curinga_05BANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_Curinga_05RESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_Curinga_05XPESSOA: TStringField
      FieldName = 'XPESSOA'
      ProviderFlags = []
      Size = 100
    end
    object Z_Curinga_05XCPF: TStringField
      FieldName = 'XCPF'
      ProviderFlags = []
      Size = 100
    end
    object Z_Curinga_05XFOTO: TStringField
      FieldName = 'XFOTO'
      ProviderFlags = []
      Size = 100
    end
    object Z_Curinga_05LOCAL_PGTO: TStringField
      FieldName = 'LOCAL_PGTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object UP_Curinga_05: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM PESSOA_IMOVEL'
      'WHERE'
      '  PESSOA_IMOVEL.ID_PESSOA_IMOVEL = :OLD_ID_PESSOA_IMOVEL')
    InsertSQL.Strings = (
      'INSERT INTO PESSOA_IMOVEL'
      '  (PESSOA_IMOVEL.ID_PESSOA_IMOVEL, '
      'PESSOA_IMOVEL.ID_IMOVEL, PESSOA_IMOVEL.ID_PESSOA, '
      '   PESSOA_IMOVEL.ID_PESSOA_TIPO, '
      'PESSOA_IMOVEL.ID_USUARIO, PESSOA_IMOVEL.STATUS, '
      '   PESSOA_IMOVEL.PORCENTAGEM, PESSOA_IMOVEL.INTERESSE, '
      'PESSOA_IMOVEL.VALOR, '
      '   PESSOA_IMOVEL.GARANTIA, PESSOA_IMOVEL.FINALIDADE, '
      'PESSOA_IMOVEL.DATA_INICIAL, '
      '   PESSOA_IMOVEL.DATA_FINAL, PESSOA_IMOVEL.HORA_INICIAL, '
      'PESSOA_IMOVEL.HORA_FINAL, '
      '   PESSOA_IMOVEL.FORMA_CONTATO, PESSOA_IMOVEL.OBS, '
      'PESSOA_IMOVEL.DATA, '
      '   PESSOA_IMOVEL.ATIVO, PESSOA_IMOVEL.CC, '
      'PESSOA_IMOVEL.BANCO, PESSOA_IMOVEL.RESPONSAVEL, '
      'PESSOA_IMOVEL.LOCAL_PGTO)'
      'VALUES'
      '  (:ID_PESSOA_IMOVEL, :ID_IMOVEL, :ID_PESSOA, '
      ':ID_PESSOA_TIPO, :ID_USUARIO, '
      '   :STATUS, :PORCENTAGEM, :INTERESSE, :VALOR, :GARANTIA, '
      ':FINALIDADE, :DATA_INICIAL, '
      '   :DATA_FINAL, :HORA_INICIAL, :HORA_FINAL, :FORMA_CONTATO, '
      ':OBS, :DATA, '
      '   :ATIVO, :CC, :BANCO, :RESPONSAVEL, :LOCAL_PGTO)')
    ModifySQL.Strings = (
      'UPDATE PESSOA_IMOVEL SET'
      '  PESSOA_IMOVEL.ID_PESSOA_IMOVEL = :ID_PESSOA_IMOVEL,'
      '  PESSOA_IMOVEL.ID_IMOVEL = :ID_IMOVEL,'
      '  PESSOA_IMOVEL.ID_PESSOA = :ID_PESSOA,'
      '  PESSOA_IMOVEL.ID_PESSOA_TIPO = :ID_PESSOA_TIPO,'
      '  PESSOA_IMOVEL.ID_USUARIO = :ID_USUARIO,'
      '  PESSOA_IMOVEL.STATUS = :STATUS,'
      '  PESSOA_IMOVEL.PORCENTAGEM = :PORCENTAGEM,'
      '  PESSOA_IMOVEL.INTERESSE = :INTERESSE,'
      '  PESSOA_IMOVEL.VALOR = :VALOR,'
      '  PESSOA_IMOVEL.GARANTIA = :GARANTIA,'
      '  PESSOA_IMOVEL.FINALIDADE = :FINALIDADE,'
      '  PESSOA_IMOVEL.DATA_INICIAL = :DATA_INICIAL,'
      '  PESSOA_IMOVEL.DATA_FINAL = :DATA_FINAL,'
      '  PESSOA_IMOVEL.HORA_INICIAL = :HORA_INICIAL,'
      '  PESSOA_IMOVEL.HORA_FINAL = :HORA_FINAL,'
      '  PESSOA_IMOVEL.FORMA_CONTATO = :FORMA_CONTATO,'
      '  PESSOA_IMOVEL.OBS = :OBS,'
      '  PESSOA_IMOVEL.DATA = :DATA,'
      '  PESSOA_IMOVEL.ATIVO = :ATIVO,'
      '  PESSOA_IMOVEL.CC = :CC,'
      '  PESSOA_IMOVEL.BANCO = :BANCO,'
      '  PESSOA_IMOVEL.RESPONSAVEL = :RESPONSAVEL,'
      '  PESSOA_IMOVEL.LOCAL_PGTO = :LOCAL_PGTO'
      'WHERE'
      '  PESSOA_IMOVEL.ID_PESSOA_IMOVEL = :OLD_ID_PESSOA_IMOVEL')
    UseSequenceFieldForRefreshSQL = False
    Left = 680
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PORCENTAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERESSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GARANTIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_FINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_FINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FORMA_CONTATO'
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
        Name = 'CC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOCAL_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_PESSOA_IMOVEL'
        ParamType = ptUnknown
      end>
  end
  object DS_Curinga_05: TDataSource
    DataSet = Z_Curinga_05
    Left = 760
    Top = 256
  end
  object Z_Anuncio: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select * from anuncio where id_imovel = :CODIGO AND MEIO <> '#39'INT' +
        'ERNET'#39' order by data_inicio')
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object Z_AnuncioID_ANUNCIO: TIntegerField
      FieldName = 'ID_ANUNCIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_AnuncioID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_AnuncioMEIO: TStringField
      FieldName = 'MEIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object Z_AnuncioDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object Z_AnuncioDATA_FIM: TDateField
      FieldName = 'DATA_FIM'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object Z_AnuncioVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object Z_AnuncioDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      BlobType = ftMemo
    end
    object Z_AnuncioOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_AnuncioATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
  end
  object DS_Anuncio: TDataSource
    DataSet = Z_Anuncio
    Left = 464
    Top = 88
  end
  object Z_Curinga_06: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 600
    Top = 320
  end
  object DS_Curinga_06: TDataSource
    DataSet = Z_Curinga_06
    Left = 760
    Top = 320
  end
  object Z_IPTU: TZQuery
    Connection = PRINCIPAL.Conexao
    OnNewRecord = Z_IPTUNewRecord
    SQL.Strings = (
      'select * from imovel_iptu'
      'where'
      'id_imovel = :CODIGO'
      'order by ano desc')
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 600
    Top = 552
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object Z_IPTUID_IMOVEL_IPTU: TIntegerField
      FieldName = 'ID_IMOVEL_IPTU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_IPTUID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_IPTUCONTRIBUINTE: TStringField
      FieldName = 'CONTRIBUINTE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_IPTURESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_IPTUVALORVENAL_TERRENO: TFloatField
      FieldName = 'VALORVENAL_TERRENO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_IPTUALIQUOTA_CONSTRUCAO: TFloatField
      FieldName = 'ALIQUOTA_CONSTRUCAO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_IPTUVALORVENAL_CONSTR_ITBI: TFloatField
      FieldName = 'VALORVENAL_CONSTR_ITBI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_IPTUVALOR_TOTAL_IPTU: TFloatField
      FieldName = 'VALOR_TOTAL_IPTU'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_IPTUPARCELA_VALOR: TFloatField
      FieldName = 'PARCELA_VALOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_IPTUNUM_CONTROLE: TStringField
      FieldName = 'NUM_CONTROLE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_IPTUINFORMACOES: TStringField
      FieldName = 'INFORMACOES'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_IPTUANO: TStringField
      FieldName = 'ANO'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object Z_IPTUPARCELA_UNICA: TStringField
      FieldName = 'PARCELA_UNICA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_IPTUVALORVENAL_CONSTR_IPTU: TFloatField
      FieldName = 'VALORVENAL_CONSTR_IPTU'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object Z_IPTUPARCELA_QTDE: TIntegerField
      FieldName = 'PARCELA_QTDE'
    end
  end
  object DS_IPTU: TDataSource
    DataSet = Z_IPTU
    Left = 768
    Top = 552
  end
  object Z_IPTU_Parcela: TZQuery
    Connection = PRINCIPAL.Conexao
    OnNewRecord = Z_IPTU_ParcelaNewRecord
    SQL.Strings = (
      
        'select ce.id_caixa, ce.data_ref, ce.data_pgto, ce.valor from cai' +
        'xa_entrada ce where ce.id_subtipo = 4 and ce.id_imovel = 0')
    Params = <>
    Left = 600
    Top = 496
  end
  object DS_IPTU_Parcela: TDataSource
    DataSet = Z_IPTU_Parcela
    Left = 768
    Top = 496
  end
  object Z_Reserva: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Reserva
    SQL.Strings = (
      
        'select PI.*, L.tipo XTIPO, L.nome XLOGRADOURO, I.numero XNUMERO ' +
        'from pessoa_imovel PI'
      'left join imovel I on I.id_imovel = PI.id_imovel'
      'left join logradouro L on L.id_logradouro = I.id_logradouro'
      'where PI.id_pessoa = :CODIGO')
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    Left = 600
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object Z_ReservaID_PESSOA_IMOVEL: TIntegerField
      FieldName = 'ID_PESSOA_IMOVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_ReservaID_IMOVEL: TIntegerField
      FieldName = 'ID_IMOVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ReservaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ReservaID_PESSOA_TIPO: TIntegerField
      FieldName = 'ID_PESSOA_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ReservaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ReservaSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_ReservaPORCENTAGEM: TFloatField
      FieldName = 'PORCENTAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ReservaINTERESSE: TStringField
      FieldName = 'INTERESSE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ReservaVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ReservaGARANTIA: TStringField
      FieldName = 'GARANTIA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ReservaFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ReservaDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ReservaDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ReservaHORA_INICIAL: TTimeField
      FieldName = 'HORA_INICIAL'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ReservaHORA_FINAL: TTimeField
      FieldName = 'HORA_FINAL'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ReservaFORMA_CONTATO: TStringField
      FieldName = 'FORMA_CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_ReservaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object Z_ReservaDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_ReservaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_ReservaCC: TStringField
      FieldName = 'CC'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object Z_ReservaBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object Z_ReservaRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ReservaLOCAL_PGTO: TStringField
      FieldName = 'LOCAL_PGTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ReservaID_PESSOA2: TIntegerField
      FieldName = 'ID_PESSOA2'
      ProviderFlags = [pfInUpdate]
    end
    object Z_ReservaPESSOA2_NOME: TStringField
      FieldName = 'PESSOA2_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Z_ReservaXTIPO: TStringField
      FieldName = 'XTIPO'
      ProviderFlags = []
      Required = True
    end
    object Z_ReservaXLOGRADOURO: TStringField
      FieldName = 'XLOGRADOURO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object Z_ReservaXNUMERO: TIntegerField
      FieldName = 'XNUMERO'
      ProviderFlags = []
      Required = True
    end
  end
  object UP_Reserva: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pessoa_imovel'
      'WHERE'
      '  pessoa_imovel.ID_PESSOA_IMOVEL = :OLD_ID_PESSOA_IMOVEL')
    InsertSQL.Strings = (
      'INSERT INTO pessoa_imovel'
      '  (pessoa_imovel.ID_PESSOA_IMOVEL, pessoa_imovel.ID_IMOVEL, '
      'pessoa_imovel.ID_PESSOA, '
      '   pessoa_imovel.ID_PESSOA_TIPO, pessoa_imovel.ID_USUARIO, '
      'pessoa_imovel.STATUS, '
      '   pessoa_imovel.PORCENTAGEM, pessoa_imovel.INTERESSE, '
      'pessoa_imovel.VALOR, '
      '   pessoa_imovel.GARANTIA, pessoa_imovel.FINALIDADE, '
      'pessoa_imovel.DATA_INICIAL, '
      '   pessoa_imovel.DATA_FINAL, pessoa_imovel.HORA_INICIAL, '
      'pessoa_imovel.HORA_FINAL, '
      '   pessoa_imovel.FORMA_CONTATO, pessoa_imovel.OBS, '
      'pessoa_imovel.DATA, '
      '   pessoa_imovel.ATIVO, pessoa_imovel.CC, pessoa_imovel.BANCO, '
      'pessoa_imovel.RESPONSAVEL, '
      '   pessoa_imovel.LOCAL_PGTO, pessoa_imovel.ID_PESSOA2, '
      'pessoa_imovel.PESSOA2_NOME)'
      'VALUES'
      '  (:ID_PESSOA_IMOVEL, :ID_IMOVEL, :ID_PESSOA, '
      ':ID_PESSOA_TIPO, :ID_USUARIO, '
      '   :STATUS, :PORCENTAGEM, :INTERESSE, :VALOR, :GARANTIA, '
      ':FINALIDADE, :DATA_INICIAL, '
      '   :DATA_FINAL, :HORA_INICIAL, :HORA_FINAL, :FORMA_CONTATO, '
      ':OBS, :DATA, '
      '   :ATIVO, :CC, :BANCO, :RESPONSAVEL, :LOCAL_PGTO, '
      ':ID_PESSOA2, :PESSOA2_NOME)')
    ModifySQL.Strings = (
      'UPDATE pessoa_imovel SET'
      '  pessoa_imovel.ID_PESSOA_IMOVEL = :ID_PESSOA_IMOVEL,'
      '  pessoa_imovel.ID_IMOVEL = :ID_IMOVEL,'
      '  pessoa_imovel.ID_PESSOA = :ID_PESSOA,'
      '  pessoa_imovel.ID_PESSOA_TIPO = :ID_PESSOA_TIPO,'
      '  pessoa_imovel.ID_USUARIO = :ID_USUARIO,'
      '  pessoa_imovel.STATUS = :STATUS,'
      '  pessoa_imovel.PORCENTAGEM = :PORCENTAGEM,'
      '  pessoa_imovel.INTERESSE = :INTERESSE,'
      '  pessoa_imovel.VALOR = :VALOR,'
      '  pessoa_imovel.GARANTIA = :GARANTIA,'
      '  pessoa_imovel.FINALIDADE = :FINALIDADE,'
      '  pessoa_imovel.DATA_INICIAL = :DATA_INICIAL,'
      '  pessoa_imovel.DATA_FINAL = :DATA_FINAL,'
      '  pessoa_imovel.HORA_INICIAL = :HORA_INICIAL,'
      '  pessoa_imovel.HORA_FINAL = :HORA_FINAL,'
      '  pessoa_imovel.FORMA_CONTATO = :FORMA_CONTATO,'
      '  pessoa_imovel.OBS = :OBS,'
      '  pessoa_imovel.DATA = :DATA,'
      '  pessoa_imovel.ATIVO = :ATIVO,'
      '  pessoa_imovel.CC = :CC,'
      '  pessoa_imovel.BANCO = :BANCO,'
      '  pessoa_imovel.RESPONSAVEL = :RESPONSAVEL,'
      '  pessoa_imovel.LOCAL_PGTO = :LOCAL_PGTO,'
      '  pessoa_imovel.ID_PESSOA2 = :ID_PESSOA2,'
      '  pessoa_imovel.PESSOA2_NOME = :PESSOA2_NOME'
      'WHERE'
      '  pessoa_imovel.ID_PESSOA_IMOVEL = :OLD_ID_PESSOA_IMOVEL')
    UseSequenceFieldForRefreshSQL = False
    Left = 688
    Top = 401
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PORCENTAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERESSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GARANTIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_FINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_FINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FORMA_CONTATO'
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
        Name = 'CC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOCAL_PGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESSOA2_NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_PESSOA_IMOVEL'
        ParamType = ptUnknown
      end>
  end
  object DS_Reserva: TDataSource
    DataSet = Z_Reserva
    Left = 768
    Top = 404
  end
  object ZqAux: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 384
    Top = 24
  end
  object ZqAux2: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 432
    Top = 24
  end
  object Z_Status: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'SELECT * FROM STATUS')
    Params = <>
    Left = 32
    Top = 608
    object Z_StatusID_STATUS: TIntegerField
      FieldName = 'ID_STATUS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Z_StatusNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object Z_StatusOBS: TBlobField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
    end
    object Z_StatusPADRAO: TStringField
      FieldName = 'PADRAO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object Z_StatusATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
  end
  object Z_Agenda: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Agenda
    SQL.Strings = (
      'select a.*, '
      
        'CAST(substring(A.mensagem FROM 1 FOR 50)||'#39'...'#39' as Varchar(60)) ' +
        'AS MSG,'
      
        ' u.nome, u.email from agenda a inner join usuario u on u.id_usua' +
        'rio = a.id_destinatario where a.ativo <> '#39'XXX'#39' AND a.id_remetent' +
        'e = 0 order by a.data_ref desc')
    Params = <>
    Left = 304
    Top = 608
    object Z_AgendaID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
      Required = True
    end
    object Z_AgendaID_REMETENTE: TIntegerField
      FieldName = 'ID_REMETENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_AgendaID_DESTINATARIO: TIntegerField
      FieldName = 'ID_DESTINATARIO'
      ProviderFlags = [pfInUpdate]
    end
    object Z_AgendaIMPORTANCIA: TIntegerField
      FieldName = 'IMPORTANCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_AgendaDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_AgendaDATA_REF: TDateTimeField
      FieldName = 'DATA_REF'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object Z_AgendaMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object Z_AgendaATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object Z_AgendaMSG: TStringField
      FieldName = 'MSG'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object Z_AgendaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object Z_AgendaEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = []
      Size = 200
    end
  end
  object UP_Agenda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM agenda'
      'WHERE'
      '  agenda.ID_AGENDA = :OLD_ID_AGENDA')
    InsertSQL.Strings = (
      'INSERT INTO agenda'
      '  (agenda.ID_AGENDA, agenda.ID_REMETENTE, '
      'agenda.ID_DESTINATARIO, agenda.IMPORTANCIA, '
      '   agenda.DATA_CAD, agenda.DATA_REF, agenda.MENSAGEM, '
      'agenda.ATIVO)'
      'VALUES'
      '  (:ID_AGENDA, :ID_REMETENTE, :ID_DESTINATARIO, '
      ':IMPORTANCIA, :DATA_CAD, '
      '   :DATA_REF, :MENSAGEM, :ATIVO)')
    ModifySQL.Strings = (
      'UPDATE agenda SET'
      '  agenda.ID_REMETENTE = :ID_REMETENTE,'
      '  agenda.ID_DESTINATARIO = :ID_DESTINATARIO,'
      '  agenda.IMPORTANCIA = :IMPORTANCIA,'
      '  agenda.DATA_CAD = :DATA_CAD,'
      '  agenda.DATA_REF = :DATA_REF,'
      '  agenda.MENSAGEM = :MENSAGEM,'
      '  agenda.ATIVO = :ATIVO'
      'WHERE'
      '  agenda.ID_AGENDA = :OLD_ID_AGENDA')
    UseSequenceFieldForRefreshSQL = False
    Left = 384
    Top = 608
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_REMETENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_DESTINATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMPORTANCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_CAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MENSAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_AGENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENDA'
        ParamType = ptUnknown
      end>
  end
  object Z_Curinga_01X: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select distinct(ce.id_pessoa) as codigo, c.id_contrato, p.nome a' +
        's pessoa, l.nome as logradouro, i.numero, i.complemento,'
      
        '      (select first 1 tel.ddd from telefone tel where tel.id_pes' +
        'soa = p.id_pessoa and tel.id_endereco_tipo = 1) as telDDDRes,'
      
        '      (select first 1 tel.numero from telefone tel where tel.id_' +
        'pessoa = p.id_pessoa and tel.id_endereco_tipo = 1) as telNUMRes,'
      
        '      (select first 1 tel.contato from telefone tel where tel.id' +
        '_pessoa = p.id_pessoa and tel.id_endereco_tipo = 1) as telCONTAT' +
        'ORes,'
      
        '      (select first 1 tel.ddd from telefone tel where tel.id_pes' +
        'soa = p.id_pessoa and tel.id_endereco_tipo = 2) as telDDDCom,'
      
        '      (select first 1 tel.numero from telefone tel where tel.id_' +
        'pessoa = p.id_pessoa and tel.id_endereco_tipo = 2) as telNUMCom,'
      
        '      (select first 1 tel.contato from telefone tel where tel.id' +
        '_pessoa = p.id_pessoa and tel.id_endereco_tipo = 2) as telCONTAT' +
        'OCom,'
      
        '      (select first 1 tel.ddd from telefone tel where tel.id_pes' +
        'soa = p.id_pessoa and tel.id_endereco_tipo = 3) as telDDDCel,'
      
        '      (select first 1 tel.numero from telefone tel where tel.id_' +
        'pessoa = p.id_pessoa and tel.id_endereco_tipo = 3) as telNUMCel,'
      
        '      (select first 1 tel.contato from telefone tel where tel.id' +
        '_pessoa = p.id_pessoa and tel.id_endereco_tipo = 3) as telCONTAT' +
        'OCel,'
      '      p.email,'
      '      p.msn,'
      '      p.yahoo'
      ' from caixa_entrada ce'
      
        '      LEFT join contrato c on c.id_contrato = ce.id_contrato and' +
        ' c.ativo = '#39'SIM'#39
      
        '      LEFT join pessoa_contrato pc on pc.id_contrato = ce.id_con' +
        'trato'
      '      LEFT join pessoa p on p.id_pessoa = ce.id_pessoa'
      '      LEFT join imovel i on i.id_imovel = ce.id_imovel'
      
        '      LEFT join logradouro l on l.id_logradouro = i.id_logradour' +
        'o'
      
        'where ce.data_pgto is null and ce.ativo = '#39'SIM'#39' and ce.data_ref ' +
        '< dateadd(30 day to current_date)')
    Params = <>
    Left = 856
    Top = 8
  end
  object DS_Curinga_01X: TDataSource
    DataSet = Z_Curinga_01X
    Left = 936
    Top = 8
  end
  object Z_Curinga_02X: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      
        'select categ.nome as categoria, tip.nome as tipo, stip.nome as s' +
        'ubtipo ,ce.*,'
      
        '(SELECT RESULT FROM spvalorcobranca1(1, ce.data_ref, ce.data_pgt' +
        'o, ce.valor, ce.valor_juros, ce.valor_multa, ce.valor_desconto))' +
        ' as VALORREAL'
      ' from caixa_entrada ce'
      
        '      LEFT join caixa_sis categ on categ.id_caixa_sis = ce.id_ca' +
        'tegoria'
      '      LEFT join caixa_sis tip on tip.id_caixa_sis = ce.id_tipo'
      
        '      LEFT join caixa_sis stip on stip.id_caixa_sis = ce.id_subt' +
        'ipo')
    Params = <>
    Left = 856
    Top = 72
  end
  object DS_Curinga_02X: TDataSource
    DataSet = Z_Curinga_02X
    Left = 936
    Top = 72
  end
  object Z_Curinga_03X: TZQuery
    Connection = PRINCIPAL.Conexao
    UpdateObject = UP_Curinga_03X
    SQL.Strings = (
      
        'select cst.*, cs.nome, c.documento, cast(cst.anotacao as varchar' +
        '(255)) as texto, u.nome as operador from caixa_status cst inner ' +
        'join usuario u on u.id_usuario = cst.id_funcionario inner join c' +
        'aixa_sis cs on cst.id_status = cs.id_caixa_sis inner join caixa_' +
        'entrada c on c.id_caixa = cst.id_caixa_entrada and c.ativo = '#39'SI' +
        'M'#39' and c.pendente = '#39'NAO'#39)
    Params = <>
    Left = 856
    Top = 128
  end
  object UP_Curinga_03X: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM caixa_status'
      'WHERE'
      '  caixa_status.ID_CAIXA_STATUS = :OLD_ID_CAIXA_STATUS')
    InsertSQL.Strings = (
      'INSERT INTO caixa_status'
      '  (caixa_status.ID_CAIXA_STATUS, caixa_status.ID_STATUS, '
      'caixa_status.ID_CAIXA_SAIDA, '
      '   caixa_status.ID_CAIXA_ENTRADA, caixa_status.ID_FUNCIONARIO, '
      'caixa_status.DATA_CAD, '
      '   caixa_status.DATA_ENTRADA, caixa_status.DATA_SAIDA, '
      'caixa_status.DATA_ALT, '
      '   caixa_status.ANOTACAO)'
      'VALUES'
      '  (:ID_CAIXA_STATUS, :ID_STATUS, :ID_CAIXA_SAIDA, '
      ':ID_CAIXA_ENTRADA, :ID_FUNCIONARIO, '
      '   :DATA_CAD, :DATA_ENTRADA, :DATA_SAIDA, :DATA_ALT, '
      ':ANOTACAO)')
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
    Left = 928
    Top = 128
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
  object DS_Curinga_03X: TDataSource
    DataSet = Z_Curinga_03X
    Left = 928
    Top = 176
  end
end
