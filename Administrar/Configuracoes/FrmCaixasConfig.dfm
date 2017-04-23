inherited CAD_CaixasConfig: TCAD_CaixasConfig
  Caption = 'Configura'#231#245'es Financeiras'
  ClientHeight = 386
  ClientWidth = 456
  ExplicitWidth = 462
  ExplicitHeight = 411
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 456
    ExplicitWidth = 456
    inherited Image1: TImage
      Width = 454
      ExplicitWidth = 454
    end
    inherited Btn_Imprimir: TSpeedButton
      Visible = False
    end
    inherited Btn_Fechar: TBitBtn
      Left = 425
      ExplicitLeft = 425
    end
  end
  inherited PageControl1: TPageControl
    Width = 456
    Height = 356
    ExplicitWidth = 456
    ExplicitHeight = 356
    inherited Tab_Pesquisa: TTabSheet
      OnShow = Tab_PesquisaShow
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 448
      ExplicitHeight = 327
      inherited Panel2: TPanel
        Width = 448
        Height = 41
        ExplicitWidth = 448
        ExplicitHeight = 41
        inherited Image2: TImage
          Width = 443
          Height = 39
          ExplicitWidth = 443
          ExplicitHeight = 39
        end
        inherited Valor: TEdit
          Width = 439
          Text = 'N'#195'O EXISTE BUSCA PARA ESTE FORMUL'#193'RIO'
          ExplicitWidth = 439
        end
        inherited Valor_Ativo: TCheckBox
          Left = 395
          Visible = False
          ExplicitLeft = 395
        end
        inherited Data_Maior: TDateTimePicker
          Left = 289
          Visible = False
          ExplicitLeft = 289
        end
        inherited Data_Menor: TDateTimePicker
          Left = 187
          Visible = False
          ExplicitLeft = 187
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 41
        Width = 448
        Height = 286
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_CAIXA_SIS'
            Title.Caption = 'C'#243'digo'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 223
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COL1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COL2'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COL3'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COL4'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ANOTACAO'
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
            Title.Caption = 'Ativo'
            Visible = True
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 448
      ExplicitHeight = 327
      inherited PageControl2: TPageControl
        Width = 448
        Height = 327
        ExplicitWidth = 448
        ExplicitHeight = 327
        inherited Tab_Informacoes: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 25
          ExplicitWidth = 440
          ExplicitHeight = 298
          inherited ScrollBox1: TScrollBox
            Width = 440
            Height = 298
            ExplicitWidth = 440
            ExplicitHeight = 298
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 35
              Height = 12
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 8
              Top = 48
              Width = 22
              Height = 12
              Caption = 'Tipo'
            end
            object Label3: TLabel
              Left = 8
              Top = 88
              Width = 322
              Height = 12
              Caption = 
                'Nome (n'#227'o use caracteres especiais, principalmente: - : / " ou '#39 +
                ')'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 8
              Top = 128
              Width = 42
              Height = 12
              Caption = '1'#186' Extra'
              FocusControl = DBEdit4
            end
            object Label5: TLabel
              Left = 8
              Top = 166
              Width = 42
              Height = 12
              Caption = '2'#186' Extra'
              FocusControl = DBEdit5
            end
            object Label6: TLabel
              Left = 8
              Top = 208
              Width = 42
              Height = 12
              Caption = '3'#186' Extra'
              FocusControl = DBEdit6
            end
            object Label7: TLabel
              Left = 8
              Top = 248
              Width = 42
              Height = 12
              Caption = '4'#186' Extra'
              FocusControl = DBEdit7
            end
            object Label8: TLabel
              Left = 8
              Top = 288
              Width = 54
              Height = 12
              Caption = 'Anota'#231#245'es'
              FocusControl = DBMemo1
            end
            object Label9: TLabel
              Left = 187
              Top = 66
              Width = 147
              Height = 12
              Caption = '<< M'#225'ximo de 10 Caracteres'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 24
              Width = 124
              Height = 20
              Color = cl3DLight
              DataField = 'ID_CAIXA_SIS'
              DataSource = DS
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 104
              Width = 400
              Height = 20
              CharCase = ecUpperCase
              Color = clYellow
              DataField = 'NOME'
              DataSource = DS
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 144
              Width = 400
              Height = 20
              CharCase = ecUpperCase
              DataField = 'COL1'
              DataSource = DS
              TabOrder = 2
            end
            object DBEdit5: TDBEdit
              Left = 8
              Top = 184
              Width = 400
              Height = 20
              CharCase = ecUpperCase
              DataField = 'COL2'
              DataSource = DS
              TabOrder = 3
            end
            object DBEdit6: TDBEdit
              Left = 8
              Top = 224
              Width = 400
              Height = 20
              CharCase = ecUpperCase
              DataField = 'COL3'
              DataSource = DS
              TabOrder = 4
            end
            object DBEdit7: TDBEdit
              Left = 8
              Top = 264
              Width = 400
              Height = 20
              CharCase = ecUpperCase
              DataField = 'COL4'
              DataSource = DS
              TabOrder = 5
            end
            object DBMemo1: TDBMemo
              Left = 8
              Top = 304
              Width = 400
              Height = 89
              DataField = 'ANOTACAO'
              DataSource = DS
              TabOrder = 6
            end
            object DBCheckBox2: TDBCheckBox
              Left = 138
              Top = 26
              Width = 97
              Height = 17
              Cursor = crHandPoint
              Caption = 'Ativo?'
              DataField = 'ATIVO'
              DataSource = DS
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
              ValueChecked = 'SIM'
              ValueUnchecked = 'NAO'
            end
            object ComboBoxTipo: TDBComboBox
              Left = 8
              Top = 63
              Width = 173
              Height = 20
              Cursor = crHandPoint
              Hint = 'Escolha um valor ou crie um novo!'
              CharCase = ecUpperCase
              Color = clYellow
              DataField = 'TIPO'
              DataSource = DS
              DropDownCount = 10
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ItemHeight = 12
              ParentFont = False
              TabOrder = 8
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    Left = 344
    Top = 8
  end
end
