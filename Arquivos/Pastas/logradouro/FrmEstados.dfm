inherited CAD_Estados: TCAD_Estados
  Caption = 'Cadastro de Estados'
  ClientWidth = 399
  ExplicitWidth = 405
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 399
    ExplicitWidth = 399
    inherited Image1: TImage
      Width = 397
      ExplicitWidth = 397
    end
    inherited Btn_Imprimir: TSpeedButton
      Visible = False
    end
    inherited Btn_Fechar: TBitBtn
      Left = 368
      ExplicitLeft = 368
    end
  end
  inherited PageControl1: TPageControl
    Width = 399
    ExplicitWidth = 399
    inherited Tab_Pesquisa: TTabSheet
      ExplicitWidth = 391
      inherited Panel2: TPanel
        Width = 391
        Height = 41
        ExplicitWidth = 391
        ExplicitHeight = 41
        inherited Image2: TImage
          Width = 84
          Height = 39
          ExplicitWidth = 84
          ExplicitHeight = 47
        end
        inherited Valor: TEdit
          Width = 382
          ExplicitWidth = 382
        end
        inherited Valor_Ativo: TCheckBox
          Left = 334
          Top = 34
          Visible = False
          ExplicitLeft = 334
          ExplicitTop = 34
        end
        inherited Data_Maior: TDateTimePicker
          Left = 228
          Top = 34
          Visible = False
          ExplicitLeft = 228
          ExplicitTop = 34
        end
        inherited Data_Menor: TDateTimePicker
          Left = 126
          Top = 34
          Visible = False
          ExplicitLeft = 126
          ExplicitTop = 34
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 41
        Width = 391
        Height = 220
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_SIGLA'
            Title.Caption = 'C'#243'digo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 249
            Visible = True
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitWidth = 391
      inherited PageControl2: TPageControl
        Width = 391
        Height = 261
        ExplicitWidth = 391
        inherited Tab_Informacoes: TTabSheet
          ExplicitWidth = 383
          inherited ScrollBox1: TScrollBox
            Width = 383
            ExplicitWidth = 383
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 35
              Height = 12
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 39
              Top = 48
              Width = 29
              Height = 12
              Caption = 'Nome'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 8
              Top = 48
              Width = 25
              Height = 12
              Anchors = [akTop, akRight]
              Caption = 'Sigla'
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 24
              Width = 89
              Height = 20
              Cursor = crNo
              Color = cl3DLight
              DataField = 'ID_SIGLA'
              DataSource = DS
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 39
              Top = 66
              Width = 341
              Height = 20
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = DS
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 66
              Width = 25
              Height = 20
              Anchors = [akTop]
              CharCase = ecUpperCase
              DataField = 'SIGLA'
              DataSource = DM_CADASTRO.DS_Estado
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    Left = 320
    Top = 8
  end
end
