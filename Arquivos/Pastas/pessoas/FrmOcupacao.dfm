inherited CAD_Ocupacao: TCAD_Ocupacao
  Caption = 'Cadastro de Ocupa'#231#245'es'
  ClientHeight = 505
  ClientWidth = 499
  ExplicitWidth = 505
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 499
    ExplicitWidth = 499
    inherited Image1: TImage
      Width = 497
      ExplicitWidth = 497
    end
    inherited Btn_Imprimir: TSpeedButton
      Visible = False
    end
    inherited Btn_Excluir: TBitBtn
      Top = 2
      ExplicitTop = 2
    end
    inherited Btn_Fechar: TBitBtn
      Left = 468
      ExplicitLeft = 468
    end
  end
  inherited PageControl1: TPageControl
    Width = 499
    Height = 475
    ExplicitWidth = 499
    ExplicitHeight = 475
    inherited Tab_Pesquisa: TTabSheet
      ExplicitWidth = 491
      ExplicitHeight = 446
      inherited Panel2: TPanel
        Width = 491
        Height = 49
        ExplicitWidth = 491
        ExplicitHeight = 49
        inherited Image2: TImage
          Width = 392
          Height = 47
          ExplicitWidth = 392
          ExplicitHeight = 47
        end
        inherited Valor: TEdit
          Width = 482
          ExplicitWidth = 482
        end
        inherited Valor_Ativo: TCheckBox
          Left = 438
          Visible = False
          ExplicitLeft = 438
        end
        inherited Data_Maior: TDateTimePicker
          Left = 332
          Visible = False
          ExplicitLeft = 332
        end
        inherited Data_Menor: TDateTimePicker
          Left = 230
          Visible = False
          ExplicitLeft = 230
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 49
        Width = 491
        Height = 397
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_OCUPACAO'
            Title.Caption = 'C'#243'digo'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CBO'
            Title.Caption = 'C.B.O.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 341
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Title.Caption = 'Obs'
            Visible = False
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitWidth = 491
      ExplicitHeight = 446
      inherited PageControl2: TPageControl
        Width = 491
        Height = 446
        ExplicitWidth = 491
        ExplicitHeight = 446
        inherited Tab_Informacoes: TTabSheet
          ExplicitWidth = 483
          ExplicitHeight = 417
          inherited ScrollBox1: TScrollBox
            Width = 483
            Height = 417
            ExplicitWidth = 483
            ExplicitHeight = 417
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 35
              Height = 12
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 88
              Top = 8
              Width = 24
              Height = 12
              Caption = 'CBO'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 216
              Top = 8
              Width = 29
              Height = 12
              Caption = 'Nome'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 8
              Top = 48
              Width = 21
              Height = 12
              Caption = 'Obs'
              FocusControl = DBEdit4
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 24
              Width = 73
              Height = 20
              Cursor = crNo
              Color = cl3DLight
              DataField = 'ID_OCUPACAO'
              DataSource = DS
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 87
              Top = 24
              Width = 97
              Height = 20
              CharCase = ecUpperCase
              DataField = 'CBO'
              DataSource = DS
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 216
              Top = 24
              Width = 264
              Height = 20
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = DS
              TabOrder = 3
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 64
              Width = 472
              Height = 20
              CharCase = ecUpperCase
              DataField = 'OBS'
              DataSource = DS
              TabOrder = 4
            end
            object BitBtn1: TBitBtn
              Left = 189
              Top = 22
              Width = 23
              Height = 22
              Cursor = crHandPoint
              Hint = 'Procurar na web'
              TabOrder = 2
              OnClick = BitBtn1Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                0800000000000001000000000000000000000001000000010000000000000101
                010002020200020A020003130300041A040004220400062C050008350500093D
                06000B4306000C4806000D4D06000E5007000F5307001156070012580700125F
                07001065060012630700135F0700135D0800135A090013580A0013550C001354
                0D0013530E0015520F00185110001A4F12001C4D13001F4B1300264613002C42
                1200333E12003A3B1300433612004C361200583711005D381100613911006340
                1100653D1200674013006B441300704712006B45130068401500673F1600673E
                1800673C1B00693926006E3531007B2C460092206600AB188800BE12A400D30C
                C100E707DD00F602F400FB01FA00FD00FD00FE00FE00FE00FE00FE00FE00FE00
                FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                FE00FE00FE00FE00FE00FE00FE00FE01FD00FD01FC00F707F200F00DE500E31A
                CF00D32AB200C5399800BA477E00AF596400A7635300A46949009B6C4400A371
                4200A3744200A4784400A47A4600A57C4900A57C4B00A27D4D00A17E5100A07F
                5500A0805B00A1806000A08365009F8569009E876C009A886C009B8E6D009A93
                6E0099996F00969E6F0094A3700092A4720090A675008DA777008AA77B0087A7
                7F0083A784007FA789007BA68F0074A597006AA3A50060A2B60055A0C7004D9E
                D300459CDD003F9AE6003B9AE900399AEC00399AEA00399BE700369ADE00399E
                D200399EC1003AA0AB003B9C95003C958100369C6F00339F5C00309E49002C9C
                36002A9B2800299A1F00289A1F00289B1F00289D2100289E2100299F23002EA0
                2500359E2F00429E3C004AA5470053A94F005BB2560061BB590066BE5D0068C2
                620069C868006DC86C0070C96F0075C9740079CA78007BCA7B007EC97E0081C7
                810087C687008EC38E0096C196009FC09F00A5C0A500A9BAA900ADB8AD00AEB7
                AF00B0B5B000B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
                B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
                C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
                C900CDCDCA00D1D1CB00D7D7CC00DDDDCD00E4E4CF00EBEACF00F1F0CF00F6F5
                D000F9F8D200FBFAD400FCFBD600FCFBD400FCFAD100FCF9CF00FCF8CC00FAF4
                CA00F8F1C800F6EDC600F5EBC400F5E8BF00F4E5BD00F2E2BB00F0DCB600ECD6
                B100E9CFAA00E9CBA300E8C99E00E7C59800E5C19300E4BE9000E8BD8A00E6B8
                8400E7B78000E7B57C00EAB57900EBB47600ECB17100EBB06E00EBAE6C00EBAC
                6900ECA76000ECA25600ED9D4B00ED973F00EC903300EC8C2900EC8A2500EC8A
                2100ED881E00EA851A00EF851800F2841700F0831700F1841800484848484848
                48484848484848488D6F484848484848484848484848488D8880484848486060
                6060609B48488D8885854848FB63625F2D231B1D1F8D8985854848FFF6FBFB2D
                6D6D6D5E248A8585484848F7FDFDFB6DE1D5D4DF6E6F25484848FFFAF9F960CF
                D4D8D6D8DE6A25274848FAF6F5936DD4D7D7D5DEE8E933284848F6F465986ED4
                D7D5D7E8EEE534284848F5F29F9C6DD2D8DAE5E9DDEA322A4848F4EFA6A46AE7
                DDECEAD4CF6013134848F3EFA7ADAC6A72E5E4B3602D12124848489FA7AEAEA6
                9D606061FB2D12484848489DA2A9A9A29C9893F7FD261248484848489D9F9F9C
                9A9494FBFDFD48484848484848489A98941229FD484848484848}
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    Left = 368
    Top = 0
  end
end
