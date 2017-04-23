inherited CAD_Bairro: TCAD_Bairro
  Caption = 'Cadastro de Bairros'
  ClientHeight = 362
  ClientWidth = 644
  ExplicitWidth = 650
  ExplicitHeight = 387
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 644
    ExplicitWidth = 526
    inherited Image1: TImage
      Width = 642
      ExplicitWidth = 427
    end
    inherited Btn_Fechar: TBitBtn
      Left = 613
      ExplicitLeft = 495
    end
  end
  inherited PageControl1: TPageControl
    Width = 644
    Height = 332
    ExplicitWidth = 526
    ExplicitHeight = 332
    inherited Tab_Pesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 518
      ExplicitHeight = 303
      inherited Panel2: TPanel
        Width = 636
        Height = 49
        ExplicitWidth = 518
        ExplicitHeight = 49
        inherited Image2: TImage
          Width = 599
          Height = 47
          ExplicitWidth = 384
          ExplicitHeight = 47
        end
        inherited Valor: TEdit
          Top = 8
          Width = 627
          ExplicitTop = 8
          ExplicitWidth = 509
        end
        inherited Valor_Ativo: TCheckBox
          Left = 370
          Top = 26
          Visible = False
          ExplicitLeft = 252
          ExplicitTop = 26
        end
        inherited Data_Maior: TDateTimePicker
          Left = 527
          Top = 24
          Visible = False
          ExplicitLeft = 409
          ExplicitTop = 24
        end
        inherited Data_Menor: TDateTimePicker
          Left = 425
          Top = 24
          Visible = False
          ExplicitLeft = 307
          ExplicitTop = 24
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 49
        Width = 636
        Height = 254
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_BAIRRO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 398
            Visible = True
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 518
      ExplicitHeight = 303
      inherited PageControl2: TPageControl
        Width = 636
        Height = 303
        ExplicitWidth = 518
        ExplicitHeight = 303
        inherited Tab_Informacoes: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 25
          ExplicitWidth = 510
          ExplicitHeight = 274
          inherited ScrollBox1: TScrollBox
            Width = 628
            Height = 274
            ExplicitWidth = 510
            ExplicitHeight = 274
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
              Width = 258
              Height = 12
              Caption = 'Nome do Bairro (Verifique se j'#225' exista cadastrado!)'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 135
              Top = 8
              Width = 59
              Height = 12
              Hint = 'Ajuda a organizar os bairros em n'#250'cleos'
              Caption = 'Quadrantes'
              FocusControl = DBEdit1
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 24
              Width = 121
              Height = 20
              Cursor = crNo
              BevelInner = bvNone
              BevelOuter = bvNone
              BevelKind = bkFlat
              Color = cl3DLight
              DataField = 'ID_BAIRRO'
              DataSource = DS
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 64
              Width = 617
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = DS
              TabOrder = 1
              ExplicitWidth = 499
            end
            object comboQuadrante: TComboBox
              Left = 135
              Top = 24
              Width = 145
              Height = 20
              Hint = 'Ajuda a organizar os bairros em n'#250'cleos'
              ItemHeight = 12
              TabOrder = 2
              OnCloseUp = comboQuadranteCloseUp
              Items.Strings = (
                ''
                'Quadrante Centro'
                'Quadrante 1'
                'Quadrante 2'
                'Quadrante 3'
                'Quadrante 4'
                'Nenhum')
            end
          end
        end
        object TabQuadrantes: TTabSheet
          Caption = 'Quadrantes'
          ImageIndex = 60
          OnShow = TabQuadrantesShow
          ExplicitWidth = 510
          object Label4: TLabel
            Left = 127
            Top = 8
            Width = 63
            Height = 12
            Caption = 'Quadrante 1'
            FocusControl = DBEdit1
          end
          object Label5: TLabel
            Left = 254
            Top = 8
            Width = 63
            Height = 12
            Caption = 'Quadrante 2'
            FocusControl = DBEdit1
          end
          object Label6: TLabel
            Left = 381
            Top = 8
            Width = 63
            Height = 12
            Caption = 'Quadrante 3'
            FocusControl = DBEdit1
          end
          object Label7: TLabel
            Left = 508
            Top = 8
            Width = 63
            Height = 12
            Caption = 'Quadrante 4'
            FocusControl = DBEdit1
          end
          object Label8: TLabel
            Left = 0
            Top = 13
            Width = 90
            Height = 12
            Caption = 'Quadrante Centro'
            FocusControl = DBEdit1
          end
          object listaQuadrante1: TListBox
            Left = 127
            Top = 26
            Width = 121
            Height = 245
            Cursor = crHandPoint
            ItemHeight = 12
            TabOrder = 0
            OnDblClick = listaQuadrante1DblClick
          end
          object listaQuadrante2: TListBox
            Left = 254
            Top = 26
            Width = 121
            Height = 245
            Cursor = crHandPoint
            ItemHeight = 12
            TabOrder = 1
            OnDblClick = listaQuadrante2DblClick
          end
          object listaQuadrante3: TListBox
            Left = 381
            Top = 26
            Width = 121
            Height = 245
            Cursor = crHandPoint
            ItemHeight = 12
            TabOrder = 2
            OnDblClick = listaQuadrante3DblClick
          end
          object listaQuadrante4: TListBox
            Left = 508
            Top = 26
            Width = 121
            Height = 245
            Cursor = crHandPoint
            ItemHeight = 12
            TabOrder = 3
            OnDblClick = listaQuadrante4DblClick
          end
          object listaQuadrante0: TListBox
            Left = 0
            Top = 26
            Width = 121
            Height = 245
            Cursor = crHandPoint
            ItemHeight = 12
            TabOrder = 4
            OnDblClick = listaQuadrante0DblClick
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DM_CADASTRO.Z_Bairro
    Left = 312
    Top = 8
  end
end
