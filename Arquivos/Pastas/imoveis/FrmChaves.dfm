object CAD_CHAVES: TCAD_CHAVES
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Controle de Chaves'
  ClientHeight = 212
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 7
    Top = 8
    Width = 561
    Height = 81
    DataSource = DsImoveis
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Alignment = taCenter
        Title.Caption = 'Endere'#231'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 274
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#176
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Title.Alignment = taCenter
        Title.Caption = 'Bairro'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 300
        Visible = True
      end>
  end
  object PageControl1: TPageControl
    Left = 7
    Top = 95
    Width = 562
    Height = 113
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Chaves'
      object Label1: TLabel
        Left = 3
        Top = 9
        Width = 114
        Height = 13
        Caption = 'Im'#243'vel Selecionado:'
      end
      object Label2: TLabel
        Left = 3
        Top = 29
        Width = 47
        Height = 13
        Caption = 'Chaves: '
      end
      object lbChaves: TLabel
        Left = 56
        Top = 28
        Width = 49
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object DBText1: TDBText
        Left = 123
        Top = 9
        Width = 65
        Height = 17
        DataField = 'codigo'
        DataSource = DsImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnChave: TSpeedButton
        Left = 461
        Top = 57
        Width = 89
        Height = 25
        Cursor = crHandPoint
        Caption = 'Emprestar'
        OnClick = btnChaveClick
      end
      object Label3: TLabel
        Left = 96
        Top = 48
        Width = 3
        Height = 13
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Informa'#231#245'es'
      ImageIndex = 1
      object Label5: TLabel
        Left = 3
        Top = 37
        Width = 140
        Height = 13
        Caption = 'Data / Hora Empr'#233'stimo:'
      end
      object Label4: TLabel
        Left = 3
        Top = 9
        Width = 87
        Height = 13
        Caption = 'Emprestadas a:'
      end
      object lbPessoa: TLabel
        Left = 99
        Top = 9
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 3
        Top = 64
        Width = 120
        Height = 13
        Caption = 'Documentos Retidos:'
      end
      object Label7: TLabel
        Left = 430
        Top = 37
        Width = 68
        Height = 13
        Caption = 'Funcion'#225'rio:'
      end
      object lbData_hora: TLabel
        Left = 151
        Top = 37
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDocumentos: TLabel
        Left = 136
        Top = 64
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFuncionario: TLabel
        Left = 505
        Top = 37
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Registros do Im'#243'vel'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 554
        Height = 85
        Align = alClient
        DataSource = DsReg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_PESSOA'
            Title.Alignment = taCenter
            Title.Caption = 'Pessoa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_INICIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Data Empr'#233'stimo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORA_INICIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Hora Inicial'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_FINAL'
            Title.Alignment = taCenter
            Title.Caption = 'Data Devolu'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORA_FINAL'
            Title.Alignment = taCenter
            Title.Caption = 'Hora Final'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GARANTIA'
            Title.Alignment = taCenter
            Title.Caption = 'Documentos Retidos'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Title.Alignment = taCenter
            Title.Caption = 'Coment'#225'rios'
            Visible = True
          end>
      end
    end
  end
  object DsImoveis: TDataSource
    DataSet = ZqImoveis
    OnDataChange = DsImoveisDataChange
    Left = 352
    Top = 8
  end
  object ZqImoveis: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 408
    Top = 8
  end
  object ZqPI: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 408
    Top = 64
  end
  object ZqAux: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 352
    Top = 64
  end
  object ZReg: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'SELECT pi.id_pessoa,pi.data_inicial, pi.hora_inicial, '
      '             pi.data_final, pi.hora_final, pi.garantia, pi.obs'
      'from pessoa_imovel pi '
      'where pi.id_imovel = :pimovel'
      '   and pi.id_pessoa_tipo = 15')
    Params = <
      item
        DataType = ftInteger
        Name = 'pimovel'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pimovel'
        ParamType = ptUnknown
      end>
    object ZRegID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object ZRegDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object ZRegHORA_INICIAL: TTimeField
      FieldName = 'HORA_INICIAL'
    end
    object ZRegDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object ZRegHORA_FINAL: TTimeField
      FieldName = 'HORA_FINAL'
    end
    object ZRegGARANTIA: TStringField
      FieldName = 'GARANTIA'
      Size = 100
    end
    object ZRegOBS: TStringField
      FieldName = 'OBS'
      Size = 300
    end
  end
  object DsReg: TDataSource
    DataSet = ZReg
    Left = 416
    Top = 152
  end
end
