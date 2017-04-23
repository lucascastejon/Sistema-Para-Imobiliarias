inherited CAD_Endereco_Tipo: TCAD_Endereco_Tipo
  Caption = 'Cadastro de Tipos de Endere'#231'o'
  ClientWidth = 435
  ExplicitWidth = 441
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 435
    ExplicitWidth = 435
    inherited Image1: TImage
      Width = 433
      ExplicitWidth = 433
    end
    inherited Btn_Fechar: TBitBtn
      Left = 404
      ExplicitLeft = 404
    end
  end
  inherited PageControl1: TPageControl
    Width = 435
    ExplicitWidth = 435
    inherited Tab_Pesquisa: TTabSheet
      ExplicitWidth = 427
      inherited Panel2: TPanel
        Width = 427
        Height = 49
        ExplicitWidth = 427
        ExplicitHeight = 49
        inherited Image2: TImage
          Width = 384
          Height = 47
          ExplicitWidth = 384
          ExplicitHeight = 47
        end
        inherited Valor: TEdit
          Top = 9
          Width = 418
          ExplicitTop = 9
          ExplicitWidth = 418
        end
        inherited Valor_Ativo: TCheckBox
          Left = 289
          Top = 24
          Visible = False
          ExplicitLeft = 289
          ExplicitTop = 24
        end
        inherited Data_Maior: TDateTimePicker
          Left = 183
          Top = 24
          Visible = False
          ExplicitLeft = 183
          ExplicitTop = 24
        end
        inherited Data_Menor: TDateTimePicker
          Left = 81
          Top = 24
          Visible = False
          ExplicitLeft = 81
          ExplicitTop = 24
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 49
        Width = 427
        Height = 212
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_ENDERECO_TIPO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Title.Caption = 'Telefone'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Title.Caption = 'Endere'#231'o'
            Width = 50
            Visible = True
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitWidth = 427
      inherited PageControl2: TPageControl
        Width = 427
        ExplicitWidth = 427
        ExplicitHeight = 261
        inherited Tab_Informacoes: TTabSheet
          ExplicitWidth = 419
          inherited ScrollBox1: TScrollBox
            Width = 419
            ExplicitWidth = 419
            object Label1: TLabel
              Left = 0
              Top = 8
              Width = 35
              Height = 12
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 1
              Top = 48
              Width = 69
              Height = 12
              Caption = 'Nome do Tipo'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 30
              Top = 116
              Width = 348
              Height = 12
              Caption = 
                'Op'#231#227'o para indicar se o valor criado '#233' listado nas op'#231#245'es inform' +
                'adas.'
            end
            object DBEdit1: TDBEdit
              Left = 0
              Top = 24
              Width = 89
              Height = 20
              Cursor = crNo
              Color = cl3DLight
              DataField = 'ID_ENDERECO_TIPO'
              DataSource = DS
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 3
              Top = 66
              Width = 413
              Height = 20
              CharCase = ecUpperCase
              DataField = 'TIPO'
              DataSource = DS
              TabOrder = 1
              OnMouseMove = DBEdit2MouseMove
            end
            object DBCheckBox1: TDBCheckBox
              Left = 144
              Top = 133
              Width = 135
              Height = 17
              Cursor = crHandPoint
              Caption = 'Listar para Telefone?'
              DataField = 'TELEFONE'
              DataSource = DM_CADASTRO.DS_Endereco_Tipo
              TabOrder = 2
              ValueChecked = 'SIM'
              ValueUnchecked = 'NAO'
              OnMouseMove = DBCheckBox1MouseMove
            end
            object DBCheckBox2: TDBCheckBox
              Left = 144
              Top = 156
              Width = 146
              Height = 17
              Cursor = crHandPoint
              Caption = 'Listar para Endere'#231'o?'
              DataField = 'ENDERECO'
              DataSource = DM_CADASTRO.DS_Endereco_Tipo
              TabOrder = 3
              ValueChecked = 'SIM'
              ValueUnchecked = 'NAO'
              OnMouseMove = DBCheckBox2MouseMove
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM_CADASTRO.Z_Endereco_Tipo
  end
  inherited ZqBusca: TZQuery
    Left = 200
    Top = 32
  end
end
