inherited CAD_TipoImovel: TCAD_TipoImovel
  Caption = 'Cadastro de Tipos de Im'#243'veis'
  ClientWidth = 559
  ExplicitWidth = 565
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 559
    ExplicitWidth = 559
    inherited Image1: TImage
      Width = 557
      ExplicitWidth = 557
    end
    inherited Btn_Imprimir: TSpeedButton
      Visible = False
    end
    inherited Btn_Fechar: TBitBtn
      Left = 528
      ExplicitLeft = 528
    end
  end
  inherited PageControl1: TPageControl
    Width = 559
    ExplicitWidth = 559
    inherited Tab_Pesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 551
      ExplicitHeight = 261
      inherited Panel2: TPanel
        Width = 551
        Height = 41
        ExplicitWidth = 551
        ExplicitHeight = 41
        inherited Image2: TImage
          Width = 515
          Height = 39
          ExplicitWidth = 576
          ExplicitHeight = 39
        end
        inherited Valor: TEdit
          Width = 542
          Text = 'N'#195'O '#201' USADO NENHUM FILTRO DE BUSCA NESTE FORMUL'#193'RIO.'
          ExplicitWidth = 542
        end
        inherited Valor_Ativo: TCheckBox
          Left = 498
          Visible = False
          ExplicitLeft = 498
        end
        inherited Data_Maior: TDateTimePicker
          Left = 392
          Visible = False
          ExplicitLeft = 392
        end
        inherited Data_Menor: TDateTimePicker
          Left = 290
          Visible = False
          ExplicitLeft = 290
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 41
        Width = 551
        Height = 220
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_IMOVEL_TIPO'
            Title.Caption = 'C'#243'digo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Title.Caption = 'Obs'
            Width = 170
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'COMERCIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Comercial'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PADRAO'
            Title.Caption = 'Padr'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Title.Caption = 'Ativo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_IMOVEL_TIPO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PADRAO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Visible = False
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 551
      ExplicitHeight = 261
      inherited PageControl2: TPageControl
        Width = 551
        ExplicitWidth = 551
        ExplicitHeight = 261
        inherited Tab_Informacoes: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 25
          ExplicitWidth = 543
          ExplicitHeight = 232
          inherited ScrollBox1: TScrollBox
            Width = 543
            ExplicitWidth = 543
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 35
              Height = 12
              Cursor = crNo
              Caption = 'C'#243'digo'
              FocusControl = Edit_Codigo
              ParentShowHint = False
              ShowHint = True
            end
            object Label2: TLabel
              Left = 56
              Top = 8
              Width = 29
              Height = 12
              Caption = 'Nome'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 264
              Top = 8
              Width = 21
              Height = 12
              Caption = 'Obs'
              FocusControl = DBEdit3
            end
            object Edit_Codigo: TDBEdit
              Left = 8
              Top = 24
              Width = 41
              Height = 20
              Cursor = crNo
              Color = cl3DLight
              DataField = 'ID_IMOVEL_TIPO'
              DataSource = DS
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 55
              Top = 24
              Width = 201
              Height = 20
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = DS
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 262
              Top = 24
              Width = 278
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'OBS'
              DataSource = DS
              TabOrder = 2
            end
            object DBCheckBox2: TDBCheckBox
              Left = 489
              Top = 3
              Width = 51
              Height = 17
              Anchors = [akTop, akRight]
              Caption = 'Ativo'
              DataField = 'ATIVO'
              DataSource = DM_CADASTRO.DS_Imovel_Tipo
              TabOrder = 3
              ValueChecked = 'SIM'
              ValueUnchecked = 'NAO'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 409
              Top = 3
              Width = 74
              Height = 17
              Cursor = crHandPoint
              Hint = 'Registro padr'#227'o de sistema. N'#227'o pode ser exclu'#237'do'
              Anchors = [akTop, akRight]
              Caption = 'Comercial'
              DataField = 'COMERCIAL'
              DataSource = DM_CADASTRO.DS_Imovel_Tipo
              TabOrder = 4
              ValueChecked = 'SIM'
              ValueUnchecked = 'NAO'
              OnClick = DBCheckBox3Click
            end
            object GroupBox2: TGroupBox
              Left = 3
              Top = 50
              Width = 537
              Height = 179
              Caption = 
                ' Subtipos (lembre-se de mover os im'#243'veis entre tipos e subtipos ' +
                'quando excluir um registro.)'
              TabOrder = 5
              object DBGrid1: TDBGrid
                Left = 35
                Top = 15
                Width = 499
                Height = 154
                Cursor = crHandPoint
                Align = alCustom
                DataSource = DM_CADASTRO.DS_Imovel_Subtipo
                Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnKeyDown = DBGrid1KeyDown
                OnMouseMove = DBGrid1MouseMove
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_IMOVEL_SUBTIPO'
                    ReadOnly = True
                    Title.Caption = 'C'#243'digo'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -9
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_IMOVEL_TIPO'
                    ReadOnly = True
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -9
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Title.Caption = 'Nome'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -9
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBS'
                    Title.Caption = 'Observa'#231#227'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -9
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PADRAO'
                    PickList.Strings = (
                      'SIM'
                      'NAO')
                    ReadOnly = True
                    Title.Caption = 'Padr'#227'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -9
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end>
              end
              object btnadd_subtipo: TBitBtn
                Left = 6
                Top = 36
                Width = 23
                Height = 23
                Cursor = crHandPoint
                Hint = 'Adicionar Subtipo'
                TabOrder = 1
                OnClick = btnadd_subtipoClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  0800000000000001000000000000000000000001000000010000025304000256
                  0400025704000358040003590400035905000359050003580500035705000356
                  05000354050004500500044A060005440700073A08000A2D0B000C240D000E1D
                  0E00111611001313130014141400151515001616160017171700181818001919
                  19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
                  2100222222002323230024242400252525002626260027272700282828002929
                  29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002C323500283941002341
                  50001E485D0018516D0014577800105D82000D6088000A638E00086591000766
                  930007669500066796000667960006699800066A9A00056B9C00056C9D00046D
                  9F00046FA2000370A4000371A5000272A7000273A7000273A8000273A8000274
                  A9000275AA000276AC000278AE00037AB000037DB4000480B6000682B8000783
                  B9000885BB000A86BB000C87BB000F89BC001A8FC0002796C400339DC70040A5
                  CC0050AED10062BAD90075C7E00088D3E7009ADDED00A4E3F000ADE8F300B4ED
                  F600BAF3F900BDF8FC00B5F9FD00ABF9FD00A0F8FD0099F8FD0090F8FD0086F7
                  FC007DF4FC0077F2FC0074F2FC0071F1FC006FF0FC006CF0FC0069EEFC0063EB
                  FC005CE8FD0056E6FD004FE3FD0049E1FC0047E0FC0045DBFA0042D7F7003DD3
                  F50036D0F50031CEF4002CCCF40025CBF50020CAF8001ECAF70020C8F50025C6
                  F1002CC0E80033B9DF0037B2D6003FAECE0048A9C60056A4BA00619EB0006F97
                  A3007C9197008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
                  9100929292009393930094949400959595009696960097979700989898009999
                  99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
                  A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
                  A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
                  B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
                  B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
                  C100C2C2C200C3C3C300C4C4C400C8B9C800CCAECC00D0A4D000D499D400DE77
                  DE00E855E800EF3DEF00F526F500F914F900FC0AFC00FD04FD00FE01FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FD01FD00FA04FA00E714EB00C82FD000AC47
                  B800935DA2007C718F0066867D00529C6D0043AB620037B758002CC2500028C5
                  4C0025C6490024C5470023C4450021C041001FBE3E001DBB3B001CB837001AB5
                  330018B2310017AF2D0015AC2A0013A8260012A6240011A52200DBDBDBDBDBDB
                  DBDBDB06060606DBDBDBDBDB3A3A3A3A3A3ADB06FFFF06DBDBDBDB49827F7E74
                  6C843A06FFFF06DBDBDB496C767F7E7806060606FEFF06060606496C767F7E78
                  06F2F5F8FAFCFFFFFF06496C767F7E7806F0F1F4F6F8FBFDFF06496666646363
                  06060606F1F406060606496084525255564C5C06F0F106DBDBDB4984767F7E74
                  6C844206EFF006DBDBDB496C767F7E746C845206060606DBDBDB496C767F7E74
                  6C845239DBDBDBDBDBDB496C767F7E746C84523ADBDBDBDBDBDB496B7073716A
                  6979523ADBDBDBDBDBDB4963636366676768733ADBDBDBDBDBDBDB4D63636467
                  68693EDBDBDBDBDBDBDBDBDB494949494949DBDBDBDBDBDBDBDB}
                Margin = 1
              end
              object btnCancel_subtipo: TBitBtn
                Left = 6
                Top = 65
                Width = 23
                Height = 23
                Cursor = crHandPoint
                Hint = 'Cancelar'
                TabOrder = 2
                OnClick = btnCancel_subtipoClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000120B0000120B00000001000000000000000000000101
                  0100020202000303030004040400050505000606060007070700080808000909
                  09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
                  1100121212001313130014141400151515001616160017171700181818001919
                  19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
                  2100222222002323230024242400252525002626260027272700282828002929
                  29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
                  3100323232003333330034343400353535003636360037373700383838003939
                  39003A3A3A003B3B3B003A42450039494E0038505700335C6A002E677A002971
                  8B00257A98002181A3001F86AB001D8AB1001A8DB600178EBA00158FBD00128F
                  BF001090C1000E8FC1000C8EC2000B8DC100098AC0000988BD000883B700077D
                  B2000679AE000476AB000474A8000472A6000470A300046D9E00046DA100056E
                  A100056DA500086BB0000A67BD000D61CB001059D9001053E100104FE3000E48
                  E5000C41E7000A3AEA000A35ED000932EE000930F000092FF100082FF100082E
                  EE00082CE9000729DD000622C600051DB300041BA30003189A00021493000112
                  8E0001108B00010E8800000D8700000B85000008840000068400000A84000110
                  850002158600031A870005218800092989000F378A001C4A8C0027548B00355B
                  8A00406289004A6A8A0054738A00607D8A00687F8A006F818A0077848A008087
                  8A008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
                  9100929292009393930094949400959595009696960097979700989898009999
                  99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
                  A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
                  A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
                  B100B2B5B600B6BEBF00B8C9CB00B9D2D500BADADD00BBE1E500BDE8EC00C1ED
                  F200C4F2F600C5F4F800C6F6FA00C7F8FB00C8F9FC00C2F9FC00BDF9FD00B9FA
                  FD00B3FAFD00A9FBFE009FFBFE0099FCFE0095FCFE008FFCFE0085FBFE0080FA
                  FD007EF8FD007CF6FD0079EEFA0076EAF90072E8F9006FECFC006BECFC0066ED
                  FD0062EDFD005EECFE0058E9FE0054E5FE0050E3FE004DE1FE004AE0FE0046DF
                  FE0042DEFE003FDEFE003DDCFD0037DAFD0032D8FD002DD4FC0028CFF90021CC
                  F90023CAF60023C8F40023C7F20025C5F10027C4EE002CBEE90033B8E80041AA
                  E9005696EB006E7FEC008669EE00A151F000BB3AF400D523F700F20AFC00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00F8F8F8F8F8F8
                  F8F8F8F8F8F8F8F8F8F8F8F8F8575757575757F8F8F8F8F8F8F8F8F854E7E1E1
                  D5CEE857F8F8F8F8F8F8F854C9DBE1E30000000000000000F8F8F854C9DBE1E3
                  0000000000000000F8F8F854C9DBE1E30000000000000000F8F8F854C4C4C1BE
                  0000000000000000F8F8F854B84A4C4F494852CD57F8F8F8F8F8F854E8DBE1E1
                  D5CEE85857F8F8F8F8F8F854C9DBE1E1D5CEE84E57F8F8F8F8F8F854C9DBE1E1
                  D5CEE84E57F8F8F8F8F8F854C9DBE1E1D5CEE84E57F8F8F8F8F8F854C9D1D4D3
                  C9C8D94E57F8F8F8F8F8F854BEBEBEC4C5C5C6D457F8F8F8F8F8F8F852BEBEC1
                  C5C7C957F8F8F8F8F8F8F8F8F8545454545454F8F8F8F8F8F8F8}
                Margin = 1
              end
              object btnGravar_subtipo: TBitBtn
                Left = 6
                Top = 93
                Width = 23
                Height = 23
                Cursor = crHandPoint
                Hint = 'Gravar'
                TabOrder = 3
                OnClick = btnGravar_subtipoClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  0800000000000001000000000000000000000001000000010000000000000101
                  010002020200030303000B050300140804001C0A0400240C05002B0E05003711
                  0500411305004E1504005817040060190300671A03006D1B0200721C0200761C
                  0100791D01007B1D01007D1D00007D1D01007E1D01007E1D01007E1D01007E1D
                  01007E1D01007E1D01007E1D01007E1D01007E1E01007E1E01007E1E01007F1E
                  01007F1E01007F1E00007F1E00007F1E00007F1E00007F1E00007F1E00007E1E
                  01007D1E01007B1F0200761F0600732007006E210A006A220D00642410005E26
                  150056281A00512B1F004A2D2400472F280043312C00403330003C3634003939
                  39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
                  4100424242004343430044444400454545004646460047474700484848004949
                  49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
                  5100525252005353530054545400555555005656560057575700585858005959
                  59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
                  6100626262006363630064646400656565006666660067676700686868006969
                  69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
                  7100727272007373730074747400757575007676760077777700787878007979
                  79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
                  8100828282008383830084848400858585008686860087878700888888008989
                  89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
                  9100929292009393930094949400959595009696960097979700989898009999
                  99009A9A9A009B9B9B009C9C9C009D9D9D00949B9E008297A0007393A200558E
                  A7003888AB002684AE001983B2001183B4000C83B6000982B6000782B6000681
                  B700057FB500047DB200047BB1000379AE000377AC000376AA000274A9000273
                  A8000273A7000272A6000370A300046DA000046B9D000469A0000564A500055D
                  AF000551BF000641CF000736D9000731DF00072DE600092BEF00092AF7000B2D
                  F7000E34F800123CF9001744F9001A4AFA001F5FF7002271F500278CF2002B9F
                  F1002CAFEE0028C1F20026C7F50024CAF70027CDF9002FD1FA0039D6FB0043DD
                  FD004EE2FE0057E8FD0062EDFD006AF0FD0070EEFD0075E8FC0078E9FC007DEA
                  FC0083EBFD008BEDFD0090F0FD0097F0FD00A4F1FD00B4F5FD00C3F8FD00CEF6
                  FD00D9F6FE00E4F8FE00EDF9FE00F4F9FE00F3F7FE00F4EFFE00F4E1FE00F5CB
                  FD00F7B4FE00FA9AFE00FA82FE00FB64FE00FC40FE00FD25FE00FD17FE00FE0A
                  FE00FE05FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00F9F9F9F9F9F9
                  2424242424242424F9F9F9F9B6B6B6B624E5E5E5C8DEE524F9F9F9B0CCCDCED2
                  24E5E5C8C0C6E524F9F9B0D6D1CDCED224E1C5C0C5C0E124F9F9B0D6D1CDCED2
                  24C6C0DEE7C1C621F9F9B0D6D1CDCED224E2E1E5E5D9C035F9F9B0DEDEDFE2E3
                  24E5E5E5E5E5C6C0F9F9B0DECAA8A8A52424242424242CBCC0F9B0CAD1CDCED2
                  D7CAB7B6F9F9F9F9C0C0B0D6D1CDCED2D7CAA9B6F9F9F9F9F9C0B0D6D1CDCED2
                  D7CAA9B6F9F9F9F9F9F9B0D6D1CDCED2D7CAA9B6F9F9F9F9F9F9B0D8D5D3D4DA
                  DBD1A9B6F9F9F9F9F9F9B0E5E4E0DEDDDDDCD3B6F9F9F9F9F9F9F9ADE4E2DFDD
                  DCDAB6F9F9F9F9F9F9F9F9F9B0B0B0B0B0B0F9F9F9F9F9F9F9F9}
                Margin = 1
              end
              object btnExcluir_subtipo: TBitBtn
                Left = 6
                Top = 122
                Width = 23
                Height = 23
                Cursor = crHandPoint
                Hint = 'Excluir Subtipo'
                TabOrder = 4
                OnClick = btnExcluir_subtipoClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  0800000000000001000000000000000000000001000000010000000000000101
                  0100020202000303030004040400050505000606060007070700080808000909
                  09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
                  1100121212001313130014141400151515001616160017171700181818001919
                  19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
                  2100222222002323230024242400252525002626260027272700282828002929
                  29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
                  3100323232003333330034343400353535003636360037373700383838003939
                  39003A3A3A003B3B3B003A42450039494E0038505700335C6A002E677A002971
                  8B00257A98002181A3001F86AB001D8AB1001A8DB600178EBA00158FBD00128F
                  BF001090C1000E8FC1000C8EC2000B8DC100098AC0000988BD000883B700077D
                  B2000679AE000476AB000474A8000472A6000470A300046D9E00046DA100056E
                  A100056DA500086BB0000A67BD000D61CB001059D9001053E100104FE3000E48
                  E5000C41E7000A3AEA000A35ED000932EE000930F000092FF100082FF100082E
                  EE00082CE9000729DD000622C600051DB300041BA30003189A00021493000112
                  8E0001108B00010E8800000D8700000B85000008840000068400000A84000110
                  850002158600031A870005218800092989000F378A001C4A8C0027548B00355B
                  8A00406289004A6A8A0054738A00607D8A00687F8A006F818A0077848A008087
                  8A008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
                  9100929292009393930094949400959595009696960097979700989898009999
                  99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
                  A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
                  A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
                  B100B2B5B600B6BEBF00B8C9CB00B9D2D500BADADD00BBE1E500BDE8EC00C1ED
                  F200C4F2F600C5F4F800C6F6FA00C7F8FB00C8F9FC00C2F9FC00BDF9FD00B9FA
                  FD00B3FAFD00A9FBFE009FFBFE0099FCFE0095FCFE008FFCFE0085FBFE0080FA
                  FD007EF8FD007CF6FD0079EEFA0076EAF90072E8F9006FECFC006BECFC0066ED
                  FD0062EDFD005EECFE0058E9FE0054E5FE0050E3FE004DE1FE004AE0FE0046DF
                  FE0042DEFE003FDEFE003DDCFD0037DAFD0032D8FD002DD4FC0028CFF90021CC
                  F90023CAF60023C8F40023C7F20025C5F10027C4EE002CBEE90033B8E80041AA
                  E9005696EB006E7FEC008669EE00A151F000BB3AF400D523F700F20AFC00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00F8F8F8F8F8F8
                  F8F8F8F8F8F8F8F8F8F8F8F8F8575757575757F8F8F8F8F8F8F8F8F854E7E1E1
                  D5CEE857F8F8F8F8F8F8F854C9DBE1E37777777777777777F8F8F854C9DBE1E3
                  775F626868686A77F8F8F854C9DBE1E3775F616468686977F8F8F854C4C4C1BE
                  7777777777777777F8F8F854B84A4C4F494852CD57F8F8F8F8F8F854E8DBE1E1
                  D5CEE85857F8F8F8F8F8F854C9DBE1E1D5CEE84E57F8F8F8F8F8F854C9DBE1E1
                  D5CEE84E57F8F8F8F8F8F854C9DBE1E1D5CEE84E57F8F8F8F8F8F854C9D1D4D3
                  C9C8D94E57F8F8F8F8F8F854BEBEBEC4C5C5C6D457F8F8F8F8F8F8F852BEBEC1
                  C5C7C957F8F8F8F8F8F8F8F8F8545454545454F8F8F8F8F8F8F8}
                Margin = 1
              end
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Movimentar Im'#243'veis'
          ImageIndex = 15
          OnShow = TabSheet1Show
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label9: TLabel
            Left = 6
            Top = 173
            Width = 534
            Height = 12
            Alignment = taCenter
            AutoSize = False
            Caption = 'S'#227'o listados todos os tipos e subgrupos j'#225' criados no sistema.'
          end
          object GroupBox3: TGroupBox
            Left = 6
            Top = 71
            Width = 531
            Height = 65
            Caption = 'DESTINO'
            TabOrder = 0
            object Label6: TLabel
              Left = 26
              Top = 15
              Width = 26
              Height = 12
              Caption = 'Tipo:'
            end
            object Label7: TLabel
              Left = 230
              Top = 15
              Width = 48
              Height = 12
              Caption = 'Subtipos:'
            end
            object labelDestinoTotal: TLabel
              Left = 434
              Top = 31
              Width = 54
              Height = 12
              Caption = '0 Im'#243'veis.'
            end
            object comboTiposDestino: TComboBox
              Left = 26
              Top = 29
              Width = 198
              Height = 20
              Cursor = crHandPoint
              AutoDropDown = True
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 0
              OnCloseUp = comboTiposDestinoCloseUp
            end
            object comboSubtiposDestino: TComboBox
              Left = 230
              Top = 29
              Width = 198
              Height = 20
              Cursor = crHandPoint
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 1
              OnCloseUp = comboSubtiposDestinoCloseUp
            end
          end
          object Button1: TButton
            Left = 3
            Top = 142
            Width = 531
            Height = 25
            Caption = 'EFETUAR TRANSFER'#202'NCIA DE IM'#211'VEIS'
            TabOrder = 1
            OnClick = Button1Click
          end
          object GroupBox1: TGroupBox
            Left = 6
            Top = 2
            Width = 531
            Height = 65
            Caption = 'ORIGEM'
            TabOrder = 2
            object Label4: TLabel
              Left = 26
              Top = 15
              Width = 26
              Height = 12
              Caption = 'Tipo:'
            end
            object Label5: TLabel
              Left = 230
              Top = 15
              Width = 48
              Height = 12
              Caption = 'Subtipos:'
            end
            object labelOrigemTotal: TLabel
              Left = 434
              Top = 31
              Width = 54
              Height = 12
              Caption = '0 Im'#243'veis.'
            end
            object comboTipos: TComboBox
              Left = 26
              Top = 29
              Width = 198
              Height = 20
              Cursor = crHandPoint
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 0
              OnCloseUp = comboTiposCloseUp
            end
            object comboSubtipos: TComboBox
              Left = 230
              Top = 29
              Width = 198
              Height = 20
              Cursor = crHandPoint
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 1
              OnCloseUp = comboSubtiposCloseUp
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM_CADASTRO.Z_Imovel_Tipo
    Left = 312
    Top = 16
  end
end
