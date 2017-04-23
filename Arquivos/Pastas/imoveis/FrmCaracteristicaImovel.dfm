inherited CAD_CaracteristicaImovel: TCAD_CaracteristicaImovel
  Caption = 'Cadastro de Caracter'#237'sticas de Im'#243'veis'
  ClientHeight = 357
  ClientWidth = 496
  ExplicitWidth = 502
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 496
    ExplicitWidth = 496
    inherited Image1: TImage
      Width = 494
      ExplicitWidth = 494
    end
    inherited Btn_Imprimir: TSpeedButton
      Visible = False
    end
    inherited Btn_Fechar: TBitBtn
      Left = 465
      ExplicitLeft = 465
    end
  end
  inherited PageControl1: TPageControl
    Width = 496
    Height = 327
    ExplicitWidth = 496
    ExplicitHeight = 327
    inherited Tab_Pesquisa: TTabSheet
      ExplicitWidth = 488
      ExplicitHeight = 298
      inherited Panel2: TPanel
        Width = 488
        Height = 41
        ExplicitWidth = 488
        ExplicitHeight = 41
        inherited Image2: TImage
          Width = 181
          Height = 39
          ExplicitWidth = 181
          ExplicitHeight = 39
        end
        inherited Valor: TEdit
          Width = 479
          Text = 'N'#195'O '#201' USADO NENHUM FILTRO DE BUSCA NESTE FORMUL'#193'RIO.'
          ExplicitWidth = 479
        end
        inherited Valor_Ativo: TCheckBox
          Left = 435
          Top = 20
          Visible = False
          ExplicitLeft = 435
          ExplicitTop = 20
        end
        inherited Data_Maior: TDateTimePicker
          Left = 329
          Top = 20
          Visible = False
          ExplicitLeft = 329
          ExplicitTop = 20
        end
        inherited Data_Menor: TDateTimePicker
          Left = 227
          Top = 20
          Visible = False
          ExplicitLeft = 227
          ExplicitTop = 20
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 41
        Width = 488
        Height = 257
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_CARACTERISTICAS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Title.Caption = 'Obs'
            Width = 200
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
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitWidth = 488
      ExplicitHeight = 298
      inherited PageControl2: TPageControl
        Width = 488
        Height = 298
        ExplicitWidth = 488
        ExplicitHeight = 298
        inherited Tab_Informacoes: TTabSheet
          ExplicitWidth = 480
          ExplicitHeight = 269
          inherited ScrollBox1: TScrollBox
            Width = 480
            Height = 269
            ExplicitWidth = 480
            ExplicitHeight = 269
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 35
              Height = 12
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
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
              Left = 8
              Top = 48
              Width = 21
              Height = 12
              Caption = 'Obs'
              FocusControl = DBEdit3
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 24
              Width = 41
              Height = 20
              Cursor = crNo
              DataField = 'ID_CARACTERISTICAS'
              DataSource = DS
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 56
              Top = 24
              Width = 421
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = DS
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 64
              Width = 469
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'OBS'
              DataSource = DS
              TabOrder = 2
            end
            object DBCheckBox2: TDBCheckBox
              Left = 427
              Top = 90
              Width = 50
              Height = 17
              Anchors = [akTop, akRight]
              Caption = 'Ativo'
              DataField = 'ATIVO'
              DataSource = DM_CADASTRO.DS_Imovel_Caracteristica
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
    DataSet = DM_CADASTRO.Z_Imovel_Caracteristica
  end
end
