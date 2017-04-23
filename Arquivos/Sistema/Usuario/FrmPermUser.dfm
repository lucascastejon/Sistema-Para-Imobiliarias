object FRMPERMUSERS: TFRMPERMUSERS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Permiss'#227'o de Usu'#225'rios'
  ClientHeight = 467
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 303
    Top = 238
    Width = 194
    Height = 70
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 10
    object SpeedButton2: TSpeedButton
      Left = 82
      Top = 41
      Width = 31
      Height = 19
      Cursor = crHandPoint
      Caption = 'Sai&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 9
      Width = 178
      Height = 26
      Cursor = crHandPoint
      Caption = 'Salvar Altera'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
  end
  object Panel1: TPanel
    Left = 509
    Top = 5
    Width = 5
    Height = 457
    Align = alRight
    BevelWidth = 2
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 462
    Width = 514
    Height = 5
    Align = alBottom
    BevelWidth = 2
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 5
    Width = 5
    Height = 457
    Align = alLeft
    BevelWidth = 2
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 5
    Align = alTop
    BevelWidth = 2
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 303
    Top = 34
    Width = 194
    Height = 65
    Caption = '  Selecione o Usu'#225'rio  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 9
      Top = 24
      Width = 177
      Height = 24
      KeyField = 'ID_USUARIO'
      ListField = 'NOME'
      ListFieldIndex = 1
      ListSource = DSUSER
      TabOrder = 0
      OnClick = DBLookupComboBox1Click
    end
  end
  object List: TListView
    Left = 8
    Top = 34
    Width = 281
    Height = 415
    Checkboxes = True
    Columns = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    ReadOnly = True
    ParentFont = False
    TabOrder = 5
    ViewStyle = vsList
  end
  object todos: TCheckBox
    Left = 11
    Top = 16
    Width = 22
    Height = 17
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = todosClick
  end
  object ListIncluir: TListView
    Left = 184
    Top = 34
    Width = 35
    Height = 415
    Checkboxes = True
    Color = clGradientActiveCaption
    Columns = <>
    GridLines = True
    ReadOnly = True
    TabOrder = 7
    ViewStyle = vsList
  end
  object ListAlterar: TListView
    Left = 218
    Top = 34
    Width = 35
    Height = 415
    Checkboxes = True
    Color = clMoneyGreen
    Columns = <>
    GridLines = True
    ReadOnly = True
    TabOrder = 8
    ViewStyle = vsList
  end
  object ListExcluir: TListView
    Left = 253
    Top = 34
    Width = 35
    Height = 415
    Checkboxes = True
    Color = clMedGray
    Columns = <>
    GridLines = True
    ReadOnly = True
    TabOrder = 9
    ViewStyle = vsList
  end
  object CheckBox1: TCheckBox
    Left = 186
    Top = 16
    Width = 26
    Height = 17
    TabOrder = 11
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 221
    Top = 16
    Width = 19
    Height = 17
    TabOrder = 12
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 255
    Top = 16
    Width = 25
    Height = 17
    TabOrder = 13
    OnClick = CheckBox3Click
  end
  object GroupBox2: TGroupBox
    Left = 303
    Top = 319
    Width = 194
    Height = 130
    Caption = ' Legendas '
    TabOrder = 14
    object Label1: TLabel
      Left = 7
      Top = 70
      Width = 178
      Height = 13
      Caption = 'Permiss'#227'o para Altera'#231#227'o / Grava'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 33
      Width = 116
      Height = 13
      Caption = 'Permiss'#227'o para Inclus'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 107
      Width = 118
      Height = 13
      Caption = 'Permiss'#227'o para Exclus'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ListView1: TListView
      Left = 7
      Top = 56
      Width = 178
      Height = 13
      Color = clMoneyGreen
      Columns = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object ListView2: TListView
      Left = 7
      Top = 20
      Width = 178
      Height = 13
      Color = clSkyBlue
      Columns = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object ListView3: TListView
      Left = 7
      Top = 94
      Width = 178
      Height = 13
      Color = clGray
      Columns = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel6: TPanel
    Left = 303
    Top = 105
    Width = 194
    Height = 124
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 15
    object Image1: TImage
      Left = 19
      Top = 13
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C0000130B0000130B0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E6E6E6D7D7D7D2D2D2CFCFCFCECECE
        CECECECECECED0D0D0D3D3D3D6D6D6D9D9D9E0E0E0E9E9E9F3F3F3F7F7F7FBFB
        FBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF6F6F6AFAFAF7676766161615A5B5B575759575859
        5757595858595A5A5B5E5E5F6464656B6B6B7F7F7F939393ACACACBBBBBBCCCC
        CCDCDCDCEDEDEDF6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFBFBFB8383843231333D3D3E4A494A5150505857565C5A5A
        605F5E636261656363646261615F5F5C5B5B5150504A494A434344464648504F
        516262637F7F7F9D9D9DC3C3C3DCDCDCF5F5F5FEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF0F0F04242444444444949484E4D4D52514F5756555A5A59
        615F5E6463626A68666E6C6B7371707775737E7B7A7673727472717371706361
        615353524242423E3E405B5B5C898989BFBFBFE7E7E7FEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEBEBEB3737384444444746464D4C4C504F50565554595957
        5F5C5D63605F6666636A6867706E6D6E6C6B4D4C4D2E2F30353536605E5E7674
        71726F6E6F6D6B6664634E4D4C39383A535355929292E3E3E3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEAEAEA3535374443434647454C4B4B504E4F555453595857
        5E5C5C60605F6664636C6A695A59593B3A3D504F503434363A393B3D3D3E5D5B
        5A706D6C6867656664636261605D5B5A4140414F4F50C0C0C0FDFDFDFFFFFFFF
        FFFFFFFFFFFFFFFFECECED3A3A3B4242424644444B4A4A4D4E4C535152575654
        5A59585F5E5D5E5D5C4443443F3F406966664847494847483E3D40595756403F
        40504F4F6765646462615E5D5C5B5A59575655373738ACACACFCFCFCFFFFFFFF
        FFFFFFFFFFFFFFFFF1F1F14444464242414343434949494D4B4C515150535352
        5A59585958573635374747486968665F5E5D3736385957574F4E4F3D3C3E6764
        6337373A58565662605F5C5C5B5A5958555453373637ADADADFCFCFCFFFFFFFF
        FFFFFFFFFFFFFFFFFBFBFB6565673E3E3F41414147474549494A4F4D4E535251
        4B4A4A3332345553546462605E5C5C3A3A3C4140415B5959555252292A2C5A59
        5963605F3334365452525B5958575655525151363537B6B6B6FCFCFCFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA6A6A83535364242414445454948484D4C4C50504F
        3233354F4D4C5D5B5B605E5E4544459494964646475956564B4A4A6A6A6C4241
        426361604E4D4D37373A5958585554534E4D4D3A3A3CC7C7C7FDFDFDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDFDFD57575A3B3B3C4342424544444A48494E4D4C
        3A3A3B3C3C3D5857564C4D4D6A5D5BF7F1EF696A6C413F40454547D7D9D95452
        545352525D5C5B404041424141525151434243575758E5E5E5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B83E3E404141404242434748474A4A4A
        4949493131333C3C3D343638D7C4BDFACBBB484A4E3A3A3D44474BE5D4CC8168
        6148484A5150503A3A3B39393A504F4F3C3B3D929293F8F8F8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B638383A3F3F3F3F3F3F303032
        3232333B3A3B353637938F8DFFFFFEFFEDE2C08C78866B61BF8F7EFAD8CAB8B7
        B74141422B2B2E3535364E4E4D3E3E3F6E6E6FE4E4E4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9C3A3A3B363638383839
        4A484848484855514DEBD9C8BBBBBB9192946759557051499A8F89B1AEAABAB2
        AD4544454B4B4A3434363838394A4A4BD7D7D6FCFCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C647474A2F2F31
        464545323132817976405A7710365F191E242120221E1F221A191C1615182323
        273130324C4C4C353536616163D5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C8535355
        323131242F3B224A741E5185264B7425252A25314025394E253142252D392221
        252A2A2D3A3A3B656565E0E0E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1A0A0817F7E
        313E4E184572275D95275D9527517F2425292643612654812653832655872532
        4222252A606264D1D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F47F7D7C727477
        234C7726609A28629D27629D285F99253D562422232424282425282424282523
        2420385259636FC1C1C1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F57B7A78405365
        235E992A67A62A67A52A67A42A67A62A69A9275E95285A8E2857882853802858
        882966A42B4A68939697F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF747273253345
        296CB02A6AAB296BAB2A6BAF2A69AB2A69AA2A6DB22A6CB12A6CAE2A6EB32A70
        B82B71B9265281767A7FEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919090514D4C
        255F9A2B70B82B70B7284B7224242724262A253343295B912B70B629537F2638
        4E273B52223F5C5B646EDEDEDEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A4A3645F5B
        25598F2A69A72A629E25324224201F242323231E1B263B522B73BB25303D2420
        20242122252426515558D8D8D8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888D9332465E
        2855832746682A5D932A649F274566263C552743612853802857852746672530
        3C242D37252F3B4C535CD8D8D8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8497AA2665A3
        2B65A22B5E932C6EB22D7CCB2D7AC92D78C52D79C82D7AC92D77C52D79C62C72
        BA2C71B72765A34D6174DFDFDFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9AA8B8275584
        2B639C2C639C2A649E2D78C32E7ECE2E7ECE2E7ECE2E7ECE2E7ECE2E7ECF2E7E
        CE2E7ED12565A668727DECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1BCC8285582
        2C66A12B649F2B659E2E77C12F81D42F82D42F81D32F81D42E7FD12E7CCB2F80
        D23085D9285C91888D91F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D4D63D5E80
        2D6AA72D68A32E67A42D76BF2D7AC72C71B62E7DCF2D78C22C69A62B66A22C69
        A72D79C53B5977C0C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F4F45F778E
        2B66A12D6AA82F6BA82E6CAA316DAA2D6BAA2D71B72F6CA9306CA82C69A62D6A
        A824598D74808BEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAD0D5
        284F782D6BA92E6CAD3270AF3371B02F6DAC3674B03573B12F6EAD2E6DAE285E
        92405A72E2E2E2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        7D90A42654823071B33171B13574B43877B63A79B83574B43172B42A649E3652
        6FB3B7BAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F8F89AA7B434597F295F96306DAB3472B13471AD2C669F2F577F5A6D81DDDE
        DFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFEC5C9CE8799AB516D8A426283506B87718498B9BDC2EDEEEEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Transparent = True
    end
    object Label4: TLabel
      Left = 83
      Top = 13
      Width = 81
      Height = 13
      Cursor = crHandPoint
      Caption = 'Administrador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label4Click
    end
    object administrador: TCheckBox
      Left = 65
      Top = 13
      Width = 17
      Height = 17
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 8
      Top = 56
      Width = 177
      Height = 60
      BorderStyle = bsNone
      Color = cl3DLight
      Enabled = False
      Lines.Strings = (
        'Administradores possuem '
        'permiss'#245'es especiais, como alterar '
        'datas, valores e itens de '
        'seguran'#231'a do sistema.')
      TabOrder = 1
    end
  end
  object ZQUser: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select *'
      'from usuario'
      'ORDER BY NOME')
    Params = <>
    Left = 152
    Top = 552
  end
  object DSUSER: TDataSource
    DataSet = ZQUser
    Left = 112
    Top = 552
  end
  object DSPERM: TDataSource
    DataSet = ZPERM
    Left = 162
    Top = 606
  end
  object ZPERM: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'SELECT *'
      'FROM AUTORIZACAO')
    Params = <>
    Left = 114
    Top = 606
  end
  object ZList: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select nome'
      'from tabela')
    Params = <>
    Left = 208
    Top = 608
  end
  object zcheck: TZQuery
    Connection = PRINCIPAL.Conexao
    Params = <>
    Left = 104
    Top = 680
  end
end
