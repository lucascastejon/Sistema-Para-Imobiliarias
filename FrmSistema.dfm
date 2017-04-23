inherited CAD_Sistema: TCAD_Sistema
  Caption = 'Configura'#231#245'es do Sistema'
  ClientWidth = 423
  ExplicitWidth = 429
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 423
    ExplicitWidth = 423
    inherited Image1: TImage
      Width = 421
      ExplicitWidth = 421
    end
    inherited Btn_Imprimir: TSpeedButton
      Visible = False
    end
    object SpeedButton1: TSpeedButton [4]
      Left = 345
      Top = 2
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = 'Atualizar Sistema On-line!'
      Flat = True
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
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004B4E51004B5258004F565F00535A6600555E6C005761
        7200576376005764780056657B0055657C0054657D0052657D0051657D005066
        81004D6784004C6886004A698900496A8B00476E940045729D004375A4004478
        A900447AAD00427BB2003E7BB6003B7BB9003A7ABB00387EC3003B7ABA003E7A
        B800447AB3004B7AAD00517AA6005577A000597599005E729000646F87006D6E
        7E0074707B0083777A00907D7800A1847600AF8A7400B78E7400BE917400C393
        7400C8957400CC977400CF997500D29A7400D49B7300D49B7400D69C7400D79D
        7500D89E7400D99F7500D89E7500D69C7400D4997200D1967100CF936E00CE91
        6D00CA8D6B00C4866900BF816600BB7D6400B7796100B2745F00AF715D00AB6F
        5D00A86D5D00A56B5D00A46A5D00A3695D00A2685D00A0685D009F675F00A067
        6100A1686300A2686500A2686700A3686800A4686800A4696900A5696A00A56C
        6B00A7726F00AA7A7500AC817A00AD857E00AF898200B18D8700B3928C00B496
        9000B79A9400BB9F9800C0A59F00C6AFA700CDB8AD00D3BDB200D6C0B500D7C0
        B300D7BFB100D7BEAF00D7BDAD00D7BDAD00D7BCAC00D7BCAB00D7BBAB00D6BB
        AA00D6BAA900D5BAAA00D4BAAB00D4B9AB00D3B8AB00D3B1AE00D4A8B200D59B
        B700D792BA00DA88BE00DC7DC200DF71C600E265CA00E45ECE00E657D200E94C
        D800ED3FDF00F22EE700F61DF000FA10F700FC07FB00FE03FD00FE01FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE02FD00FE04FC00FE08FA00FC1C
        ED00F93DD900F565C000F18CA800EFA39A00EDB29000ECBC8A00ECC08800ECC2
        8800EDC38900EDC58B00EDC79100EEC99600EFCC9C00F0CFA200F1D2A900F2D6
        B000F3D8B400F4DBBB00F5DFC000F6E3CA00F7E7D100F8EBDA00FAF0E400FAF3
        EB00FCF8F100FDFAF500FDFCF900FDFCFA00FDFBF900FDFBF800D7D79E9E9E9E
        9E9E9E9E9E9E9E9E9ED7D7D74EF5F2F0EFEDEBE9E9E9E9EB9ED7D7646770F3F1
        F0EEECEAE7E7E7EA9ED7D7D7676771F3F1F0EEEDE9E7E7EA9ED7D7D797676759
        F3F1EFEEECE9E8EA9ED7D7D7A2FA676298A498A37CECE9EB9ED7D7D7A2FDF8A7
        A7BAF2BA767CECEB9ED7D7D78CFDFAA5B1F5F4FBBFA3EEEE9ED7D7D78CFDFD98
        F7F7F5FAF298EFEF9ED7D7D788FDFDA6B0F8F7F7BAA4F2EF9ED7D7D788FDFDB0
        AAB0F7B1A776B1AA9ED7D7D781FDFDFDB0A698A5AC9393939ED7D7D781FDFDFD
        FDFDFDFCB093828990D7D7D783FDFDFDFDFDFDFDB093E78ED7D7D7D783FAF9F9
        F9F9F9F9B0938BD7D7D7D7D783888888888888888893D7D7D7D7}
      OnClick = Btn_ImprimirClick
      OnMouseMove = SpeedButton1MouseMove
    end
    inherited Btn_Novo: TBitBtn
      Enabled = False
      Visible = False
    end
    inherited Btn_Excluir: TBitBtn
      Enabled = False
      Visible = False
    end
    inherited Btn_Fechar: TBitBtn
      Left = 392
      ExplicitLeft = 392
    end
  end
  inherited PageControl1: TPageControl
    Width = 423
    ExplicitWidth = 423
    inherited Tab_Pesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 415
      ExplicitHeight = 261
      inherited Panel2: TPanel
        Width = 415
        Height = 41
        ExplicitWidth = 415
        ExplicitHeight = 41
        inherited Image2: TImage
          Width = 392
          Height = 39
          ExplicitWidth = 392
          ExplicitHeight = 39
        end
        inherited Valor: TEdit
          Width = 406
          Text = 'N'#195'O EXISTE BUSCA PARA ESTE FORMUL'#193'RIO'
          ExplicitWidth = 406
        end
        inherited Valor_Ativo: TCheckBox
          Left = 362
          Visible = False
          ExplicitLeft = 362
        end
        inherited Data_Maior: TDateTimePicker
          Left = 256
          Visible = False
          ExplicitLeft = 256
        end
        inherited Data_Menor: TDateTimePicker
          Left = 154
          Visible = False
          ExplicitLeft = 154
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 41
        Width = 415
        Height = 220
        Color = cl3DLight
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Width = 212
            Visible = True
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 415
      ExplicitHeight = 261
      inherited PageControl2: TPageControl
        Width = 415
        ExplicitWidth = 415
        ExplicitHeight = 261
        inherited Tab_Informacoes: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 25
          ExplicitWidth = 407
          ExplicitHeight = 232
          inherited ScrollBox1: TScrollBox
            Width = 407
            ExplicitWidth = 407
            object Label1: TLabel
              Left = 3
              Top = 0
              Width = 22
              Height = 12
              Caption = 'Tipo'
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 3
              Top = 40
              Width = 27
              Height = 12
              Caption = 'Valor'
              FocusControl = DBEdit2
            end
            object DBEdit1: TDBEdit
              Left = 3
              Top = 16
              Width = 401
              Height = 20
              Cursor = crNo
              BorderStyle = bsNone
              Color = cl3DLight
              DataField = 'TIPO'
              DataSource = DS
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -17
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 3
              Top = 56
              Width = 401
              Height = 20
              DataField = 'VALOR'
              DataSource = DS
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    Left = 400
    Top = 0
  end
end
