inherited CAD_TipoPessoa: TCAD_TipoPessoa
  Caption = 'Cadastro de Tipos de Pessoas'
  ClientHeight = 355
  ClientWidth = 378
  ExplicitWidth = 384
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 378
    ExplicitWidth = 378
    inherited Image1: TImage
      Width = 376
      ExplicitWidth = 376
    end
    inherited Btn_Imprimir: TSpeedButton
      Visible = False
    end
    inherited Btn_Fechar: TBitBtn
      Left = 347
      ExplicitLeft = 347
    end
  end
  inherited PageControl1: TPageControl
    Width = 378
    Height = 325
    ExplicitWidth = 378
    ExplicitHeight = 325
    inherited Tab_Pesquisa: TTabSheet
      ExplicitWidth = 370
      ExplicitHeight = 296
      inherited Panel2: TPanel
        Width = 370
        Height = 43
        ExplicitWidth = 370
        ExplicitHeight = 43
        inherited Image2: TImage
          Width = 357
          Height = 41
          ExplicitWidth = 480
          ExplicitHeight = 47
        end
        inherited Valor: TEdit
          Width = 361
          Text = 'N'#195'O EXISTE BUSCA PARA ESTE FORMUL'#193'RIO'
          ExplicitWidth = 361
        end
        inherited Valor_Ativo: TCheckBox
          Left = 317
          Visible = False
          ExplicitLeft = 317
        end
        inherited Data_Maior: TDateTimePicker
          Left = 211
          Visible = False
          ExplicitLeft = 211
        end
        inherited Data_Menor: TDateTimePicker
          Left = 109
          Visible = False
          ExplicitLeft = 109
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 43
        Width = 370
        Height = 253
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_PESSOA_TIPO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Title.Caption = 'Obs'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Title.Caption = 'Ativo'
            Width = 64
            Visible = True
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitWidth = 370
      ExplicitHeight = 296
      inherited PageControl2: TPageControl
        Width = 370
        Height = 296
        ExplicitWidth = 370
        ExplicitHeight = 296
        inherited Tab_Informacoes: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 25
          ExplicitWidth = 362
          ExplicitHeight = 267
          inherited ScrollBox1: TScrollBox
            Width = 362
            Height = 267
            ExplicitWidth = 362
            ExplicitHeight = 267
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 35
              Height = 12
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 96
              Top = 8
              Width = 29
              Height = 12
              Caption = 'Nome'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 8
              Top = 48
              Width = 21
              Height = 12
              Caption = 'Obs'
              FocusControl = DBMemo1
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 24
              Width = 81
              Height = 20
              Cursor = crNo
              Color = cl3DLight
              DataField = 'ID_PESSOA_TIPO'
              DataSource = DS
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 96
              Top = 24
              Width = 243
              Height = 20
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = DS
              TabOrder = 1
            end
            object DBMemo1: TDBMemo
              Left = 8
              Top = 64
              Width = 331
              Height = 81
              DataField = 'OBS'
              DataSource = DS
              TabOrder = 2
            end
            object DBCheckBox1: TDBCheckBox
              Left = 289
              Top = 151
              Width = 50
              Height = 17
              Caption = 'Ativo'
              DataField = 'ATIVO'
              DataSource = DM_CADASTRO.DS_Pessoa_Tipo
              TabOrder = 3
              ValueChecked = 'SIM'
              ValueUnchecked = 'NAO'
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    Left = 304
    Top = 8
  end
end
