inherited CAD_Cheques: TCAD_Cheques
  Caption = 'Cheques'
  ClientHeight = 395
  ClientWidth = 653
  ExplicitWidth = 659
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 653
    ExplicitWidth = 653
    inherited Image1: TImage
      Width = 651
      ExplicitLeft = 0
      ExplicitWidth = 651
    end
    inherited Btn_Imprimir: TSpeedButton
      Left = 587
      Anchors = [akTop, akRight]
      Visible = False
      ExplicitLeft = 587
    end
    inherited Btn_Fechar: TBitBtn
      Left = 616
      Top = 1
      ExplicitLeft = 616
      ExplicitTop = 1
    end
  end
  inherited PageControl1: TPageControl
    Width = 653
    Height = 365
    ExplicitWidth = 653
    ExplicitHeight = 365
    inherited Tab_Pesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 645
      ExplicitHeight = 336
      inherited Panel2: TPanel
        Width = 645
        Height = 41
        ExplicitWidth = 645
        ExplicitHeight = 41
        inherited Image2: TImage
          Width = 64
          Height = 39
          ExplicitWidth = 64
          ExplicitHeight = 39
        end
        object LabelDatas: TLabel [1]
          Left = 360
          Top = 25
          Width = 206
          Height = 12
          Cursor = crHandPoint
          Alignment = taCenter
          AutoSize = False
          Caption = 'N'#227'o usar datas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = LabelDatasClick
        end
        inherited Valor: TEdit
          Width = 204
          ExplicitWidth = 204
        end
        inherited Valor_Ativo: TCheckBox
          Left = 572
          Top = 6
          Width = 63
          AllowGrayed = True
          Caption = 'Todos'
          Checked = False
          State = cbGrayed
          OnClick = Valor_AtivoClick
          ExplicitLeft = 572
          ExplicitTop = 6
          ExplicitWidth = 63
        end
        inherited Data_Maior: TDateTimePicker
          Left = 466
          Top = 6
          ExplicitLeft = 466
          ExplicitTop = 6
        end
        inherited Data_Menor: TDateTimePicker
          Left = 360
          Top = 6
          ExplicitLeft = 360
          ExplicitTop = 6
        end
        object Valor_Tipo: TComboBox
          Left = 215
          Top = 6
          Width = 139
          Height = 20
          CharCase = ecUpperCase
          Color = 14215660
          ItemHeight = 12
          Sorted = True
          TabOrder = 4
          Items.Strings = (
            'COMPENSADOS'
            'N'#195'O COMPENSADOS'
            'SEM REFER'#202'NCIA')
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 41
        Width = 645
        Height = 295
        OnDrawColumnCell = Grid_BuscaDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_CHEQUE'
            Title.Caption = 'C'#243'digo'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Pessoa'
            Width = 235
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_NORMAL'
            Title.Caption = 'Nome'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Title.Caption = 'Banco'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AGENCIA'
            Title.Caption = 'Ag'#234'ncia'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CC'
            Title.Caption = 'Conta'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_CHEQUE'
            Title.Caption = 'N'#250'mero do Cheque'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_ENTRADA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_FUNCIONARIO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_PESSOA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'RG'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TELEFONE1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TELEFONE2'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_REF'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Title.Caption = 'Observa'#231#245'es'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DATA_BAIXA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME_FANTASIA'
            Visible = False
          end>
      end
    end
    inherited Tab_Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 645
      ExplicitHeight = 336
      inherited PageControl2: TPageControl
        Width = 645
        Height = 336
        ExplicitWidth = 645
        ExplicitHeight = 336
        inherited Tab_Informacoes: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 25
          ExplicitWidth = 637
          ExplicitHeight = 307
          inherited ScrollBox1: TScrollBox
            Width = 637
            Height = 307
            ExplicitWidth = 637
            ExplicitHeight = 307
            object GroupBox2: TGroupBox
              Left = 0
              Top = 0
              Width = 637
              Height = 138
              Align = alTop
              Caption = 'Dados do Cheque'
              TabOrder = 0
              object Label88: TLabel
                Left = 7
                Top = 15
                Width = 31
                Height = 12
                Caption = 'Banco'
              end
              object Label89: TLabel
                Left = 185
                Top = 15
                Width = 41
                Height = 12
                Caption = 'Ag'#234'ncia'
              end
              object Label90: TLabel
                Left = 367
                Top = 15
                Width = 30
                Height = 12
                Caption = 'Conta'
                FocusControl = chequeConta
              end
              object Label91: TLabel
                Left = 471
                Top = 15
                Width = 95
                Height = 12
                Caption = 'N'#250'mero do Cheque'
                FocusControl = chequeNumero
              end
              object Label101: TLabel
                Left = 7
                Top = 57
                Width = 83
                Height = 12
                Caption = 'Valor do Cheque'
                FocusControl = chequeValor
              end
              object Label103: TLabel
                Left = 182
                Top = 57
                Width = 88
                Height = 12
                Caption = 'Data do Cadastro'
                FocusControl = chequeEmissao
              end
              object Label102: TLabel
                Left = 7
                Top = 97
                Width = 499
                Height = 12
                AutoSize = False
                Caption = 
                  'Anota'#231#245'es Gerais (escreva aqui informa'#231#245'es que facilite voc'#234' a e' +
                  'ncontrar este chegue)'
                FocusControl = chequeAnotacoes
              end
              object Label1: TLabel
                Left = 416
                Top = 57
                Width = 113
                Height = 12
                Caption = 'Data da Compensa'#231#227'o'
                FocusControl = DBEdit1
              end
              object Label2: TLabel
                Left = 299
                Top = 57
                Width = 95
                Height = 12
                Caption = 'Data de Refer'#234'ncia'
                FocusControl = DBEdit2
              end
              object Label3: TLabel
                Left = 512
                Top = 91
                Width = 120
                Height = 12
                Caption = 'Marcador de Opera'#231#245'es'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object chequeBanco: TDBComboBox
                Left = 6
                Top = 31
                Width = 173
                Height = 20
                Cursor = crHandPoint
                CharCase = ecUpperCase
                Color = clWhite
                DataField = 'BANCO'
                DataSource = DS
                ItemHeight = 12
                TabOrder = 0
              end
              object chequeAgencia: TDBComboBox
                Left = 184
                Top = 31
                Width = 173
                Height = 20
                Cursor = crHandPoint
                CharCase = ecUpperCase
                Color = clWhite
                DataField = 'AGENCIA'
                DataSource = DS
                ItemHeight = 12
                TabOrder = 1
              end
              object chequeConta: TDBEdit
                Left = 363
                Top = 31
                Width = 102
                Height = 20
                CharCase = ecUpperCase
                DataField = 'CC'
                DataSource = DS
                TabOrder = 2
              end
              object chequeNumero: TDBEdit
                Left = 471
                Top = 31
                Width = 157
                Height = 20
                CharCase = ecUpperCase
                DataField = 'NUM_CHEQUE'
                DataSource = DS
                TabOrder = 3
              end
              object chequeValor: TDBEdit
                Left = 7
                Top = 71
                Width = 169
                Height = 20
                CharCase = ecUpperCase
                Color = clWhite
                DataField = 'VALOR'
                DataSource = DS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
              end
              object chequeEmissao: TDBEdit
                Left = 182
                Top = 71
                Width = 111
                Height = 20
                CharCase = ecUpperCase
                Color = 16759807
                DataField = 'DATA_ENTRADA'
                DataSource = DS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
              end
              object chequeAnotacoes: TDBEdit
                Left = 6
                Top = 112
                Width = 622
                Height = 20
                CharCase = ecUpperCase
                DataField = 'OBS'
                DataSource = DS
                TabOrder = 6
              end
              object DBCheckBox1: TDBCheckBox
                Left = 533
                Top = 72
                Width = 102
                Height = 17
                Cursor = crHandPoint
                Alignment = taLeftJustify
                BiDiMode = bdRightToLeft
                Caption = 'Devolvido?'
                DataField = 'ATIVO'
                DataSource = DS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentBiDiMode = False
                ParentFont = False
                TabOrder = 7
                ValueChecked = 'NAO'
                ValueUnchecked = 'SIM'
              end
              object DBEdit1: TDBEdit
                Left = 416
                Top = 71
                Width = 111
                Height = 20
                CharCase = ecUpperCase
                Color = 8388863
                DataField = 'DATA_BAIXA'
                DataSource = DS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
              end
              object DBEdit2: TDBEdit
                Left = 299
                Top = 71
                Width = 111
                Height = 20
                CharCase = ecUpperCase
                Color = 12550399
                DataField = 'DATA_REF'
                DataSource = DS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
              end
            end
            object GroupBox3: TGroupBox
              Left = 0
              Top = 138
              Width = 637
              Height = 48
              Align = alTop
              Caption = 'Pessoa dona do cheque'
              TabOrder = 1
              object DBEdit3: TDBEdit
                Left = 6
                Top = 18
                Width = 622
                Height = 20
                CharCase = ecUpperCase
                DataField = 'NOME'
                DataSource = DS
                TabOrder = 0
              end
            end
            object GroupBox4: TGroupBox
              Left = 0
              Top = 186
              Width = 637
              Height = 121
              Align = alClient
              Caption = 'Contas vinculadas a este cheque'
              TabOrder = 2
              object DBGrid1: TDBGrid
                Left = 2
                Top = 14
                Width = 633
                Height = 105
                Cursor = crHandPoint
                Hint = 'Clique 2X para recuperar a conta.'
                Align = alClient
                BorderStyle = bsNone
                Color = cl3DLight
                DataSource = DsVinculo
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnDblClick = DBGrid1DblClick
                Columns = <
                  item
                    Color = clBlack
                    Expanded = False
                    FieldName = 'OPERACAO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -9
                    Font.Name = 'Verdana'
                    Font.Style = [fsBold]
                    Title.Caption = 'Caixa'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_CONTA'
                    Title.Caption = 'C'#243'digo da Conta'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_FUNCIONARIO'
                    Title.Caption = 'C'#243'digo do Funcion'#225'rio'
                    Visible = True
                  end>
              end
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    Left = 544
    Top = 8
  end
  inherited ZqBusca: TZQuery
    Left = 496
  end
  object DsVinculo: TDataSource
    DataSet = ZVinculoContas
    Left = 432
    Top = 8
  end
  object ZVinculoContas: TZQuery
    Connection = PRINCIPAL.Conexao
    SQL.Strings = (
      'select cc.* from conta_cheque cc'
      'where cc.id_cheque = 0')
    Params = <>
    Left = 360
    Top = 8
    object ZVinculoContasID_CONTA_CHEQUE: TIntegerField
      FieldName = 'ID_CONTA_CHEQUE'
      Required = True
    end
    object ZVinculoContasID_CHEQUE: TIntegerField
      FieldName = 'ID_CHEQUE'
      Required = True
    end
    object ZVinculoContasID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
      Required = True
    end
    object ZVinculoContasOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Required = True
      Size = 3
    end
    object ZVinculoContasID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Required = True
    end
    object ZVinculoContasOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
end
