inherited CAD_Empresa: TCAD_Empresa
  HelpType = htKeyword
  Caption = 'Cadastro de Empresas'
  ExplicitWidth = 626
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited Image1: TImage
      Visible = False
    end
    inherited Btn_Imprimir: TSpeedButton
      Visible = False
    end
    inherited Btn_Novo: TBitBtn
      Visible = False
    end
    inherited Btn_Cancelar: TBitBtn
      Visible = False
    end
  end
  inherited PageControl1: TPageControl
    inherited Tab_Pesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 612
      ExplicitHeight = 261
      inherited Panel2: TPanel
        Height = 41
        ExplicitHeight = 41
        inherited Image2: TImage
          Height = 39
          ExplicitHeight = 39
        end
        inherited Valor: TEdit
          Text = 'ESTE CADASTRO N'#195'O POSSUI PAR'#194'METROS DE BUSCA.'
        end
        inherited Valor_Ativo: TCheckBox
          Visible = False
        end
        inherited Data_Maior: TDateTimePicker
          Visible = False
        end
        inherited Data_Menor: TDateTimePicker
          Visible = False
        end
      end
      inherited Grid_Busca: TDBGrid
        Top = 41
        Height = 220
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_EMPRESA'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAIXA_INICIAL'
            Title.Caption = 'Faixa de C'#243'digo'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAIXA_FINAL'
            Title.Caption = 'C'#243'd Final'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'IPLOCAL'
            Title.Caption = 'End. Local'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'IPWWW'
            Title.Caption = 'End'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Raz'#227'o Social'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FANTASIA'
            Title.Caption = 'Nome Fantasia'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'IM'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NASCIMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'OBS'
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
            FieldName = 'CELULAR'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'FAX'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'RUA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'MENSAGEM'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'LOGO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'FUNDO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DATA'
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
      ExplicitWidth = 612
      ExplicitHeight = 261
      inherited PageControl2: TPageControl
        Height = 261
        inherited Tab_Informacoes: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 25
          ExplicitWidth = 604
          ExplicitHeight = 232
          inherited ScrollBox1: TScrollBox
            VertScrollBar.Position = 50
            object Label1: TLabel
              Left = 8
              Top = -42
              Width = 35
              Height = 12
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 136
              Top = -42
              Width = 112
              Height = 12
              Caption = 'Faixa de C'#243'digo Inicial'
              FocusControl = DBEdit2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 293
              Top = -42
              Width = 105
              Height = 12
              Caption = 'Faixa de C'#243'digo Final'
              FocusControl = DBEdit3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 8
              Top = -2
              Width = 117
              Height = 12
              Caption = 'Endere'#231'o de Rede Local'
              FocusControl = DBEdit4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 212
              Top = -2
              Width = 117
              Height = 12
              Caption = 'Endere'#231'o Remoto - DNS'
              FocusControl = DBEdit5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 8
              Top = 38
              Width = 64
              Height = 12
              Caption = 'Raz'#227'o Social'
              FocusControl = DBEdit6
            end
            object Label7: TLabel
              Left = 8
              Top = 78
              Width = 74
              Height = 12
              Caption = 'Nome Fantasia'
              FocusControl = DBEdit7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 8
              Top = 118
              Width = 28
              Height = 12
              Caption = 'CNPJ'
              FocusControl = DBEdit8
            end
            object Label9: TLabel
              Left = 216
              Top = 158
              Width = 95
              Height = 12
              Caption = 'Inscri'#231#227'o Estadual'
              FocusControl = DBEdit9
            end
            object Label10: TLabel
              Left = 8
              Top = 158
              Width = 99
              Height = 12
              Caption = 'Inscri'#231#227'o Municipal'
              FocusControl = DBEdit10
            end
            object Label11: TLabel
              Left = 216
              Top = 118
              Width = 30
              Height = 12
              Caption = 'E-Mail'
              FocusControl = DBEdit11
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 8
              Top = 198
              Width = 84
              Height = 12
              Caption = 'Data de Registro'
              FocusControl = DBEdit12
            end
            object Label13: TLabel
              Left = 136
              Top = 198
              Width = 61
              Height = 12
              Caption = 'Observa'#231#227'o'
              FocusControl = DBEdit13
            end
            object Label14: TLabel
              Left = 8
              Top = 238
              Width = 58
              Height = 12
              Caption = '1'#186' Telefone'
              FocusControl = DBEdit14
            end
            object Label15: TLabel
              Left = 136
              Top = 238
              Width = 58
              Height = 12
              Caption = '2'#186' Telefone'
              FocusControl = DBEdit15
            end
            object Label16: TLabel
              Left = 264
              Top = 238
              Width = 104
              Height = 12
              Caption = '3'#186' Telefone / Celular'
              FocusControl = DBEdit16
            end
            object Label17: TLabel
              Left = 8
              Top = 278
              Width = 18
              Height = 12
              Caption = 'Fax'
              FocusControl = DBEdit17
            end
            object Label18: TLabel
              Left = 136
              Top = 278
              Width = 19
              Height = 12
              Caption = 'Rua'
              FocusControl = DBEdit18
            end
            object Label19: TLabel
              Left = 8
              Top = 318
              Width = 39
              Height = 12
              Caption = 'N'#250'mero'
              FocusControl = DBEdit19
            end
            object Label20: TLabel
              Left = 381
              Top = 470
              Width = 87
              Height = 12
              Caption = 'DIMOB: SP6425'
              FocusControl = DBEdit20
            end
            object Label21: TLabel
              Left = 136
              Top = 316
              Width = 30
              Height = 12
              Caption = 'Bairro'
              FocusControl = DBEdit21
            end
            object Label22: TLabel
              Left = 8
              Top = 358
              Width = 22
              Height = 12
              Caption = 'CEP'
              FocusControl = DBEdit22
            end
            object Label23: TLabel
              Left = 136
              Top = 358
              Width = 54
              Height = 12
              Caption = 'Mensagem'
              FocusControl = DBMemo1
            end
            object Label24: TLabel
              Left = 8
              Top = 470
              Width = 133
              Height = 12
              Caption = 'DIMOB: Respos'#225'vel Legal'
            end
            object Label25: TLabel
              Left = 148
              Top = 470
              Width = 221
              Height = 12
              Caption = 'DIMOB: CPF do Resp. Legal. (Sem "." e "-")'
            end
            object Label26: TLabel
              Left = 8
              Top = 400
              Width = 86
              Height = 12
              Caption = 'Data de Cadastro'
              FocusControl = DBEdit23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = -26
              Width = 124
              Height = 20
              DataField = 'ID_EMPRESA'
              DataSource = DS
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 136
              Top = -26
              Width = 153
              Height = 20
              CharCase = ecUpperCase
              DataField = 'FAIXA_INICIAL'
              DataSource = DS
              TabOrder = 1
              OnMouseMove = DBEdit2MouseMove
            end
            object DBEdit3: TDBEdit
              Left = 293
              Top = -26
              Width = 0
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'FAIXA_FINAL'
              DataSource = DS
              TabOrder = 2
              OnMouseMove = DBEdit3MouseMove
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 14
              Width = 200
              Height = 20
              DataField = 'IPLOCAL'
              DataSource = DS
              TabOrder = 3
              OnMouseMove = DBEdit4MouseMove
            end
            object DBEdit5: TDBEdit
              Left = 212
              Top = 14
              Width = 73
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              DataField = 'IPWWW'
              DataSource = DS
              TabOrder = 4
              OnMouseMove = DBEdit5MouseMove
            end
            object DBEdit6: TDBEdit
              Left = 8
              Top = 54
              Width = 278
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = DS
              TabOrder = 5
            end
            object DBEdit7: TDBEdit
              Left = 8
              Top = 94
              Width = 276
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'NOME_FANTASIA'
              DataSource = DS
              TabOrder = 6
            end
            object DBEdit8: TDBEdit
              Left = 8
              Top = 134
              Width = 200
              Height = 20
              CharCase = ecUpperCase
              DataField = 'CNPJ'
              DataSource = DS
              TabOrder = 7
              OnExit = DBEdit8Exit
              OnMouseMove = DBEdit8MouseMove
            end
            object DBEdit9: TDBEdit
              Left = 216
              Top = 174
              Width = 65
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'IE'
              DataSource = DS
              TabOrder = 10
            end
            object DBEdit10: TDBEdit
              Left = 8
              Top = 174
              Width = 200
              Height = 20
              CharCase = ecUpperCase
              DataField = 'IM'
              DataSource = DS
              TabOrder = 9
            end
            object DBEdit11: TDBEdit
              Left = 216
              Top = 134
              Width = 68
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'EMAIL'
              DataSource = DS
              TabOrder = 8
              OnMouseMove = DBEdit11MouseMove
            end
            object DBEdit12: TDBEdit
              Left = 8
              Top = 214
              Width = 124
              Height = 20
              CharCase = ecUpperCase
              DataField = 'NASCIMENTO'
              DataSource = DS
              TabOrder = 11
              OnMouseMove = DBEdit12MouseMove
            end
            object DBEdit13: TDBEdit
              Left = 136
              Top = 214
              Width = 145
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'OBS'
              DataSource = DS
              TabOrder = 12
            end
            object DBEdit14: TDBEdit
              Left = 8
              Top = 254
              Width = 123
              Height = 20
              CharCase = ecUpperCase
              DataField = 'TELEFONE1'
              DataSource = DS
              TabOrder = 13
            end
            object DBEdit15: TDBEdit
              Left = 136
              Top = 254
              Width = 123
              Height = 20
              CharCase = ecUpperCase
              DataField = 'TELEFONE2'
              DataSource = DS
              TabOrder = 14
            end
            object DBEdit16: TDBEdit
              Left = 264
              Top = 254
              Width = 40
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'CELULAR'
              DataSource = DS
              TabOrder = 15
            end
            object DBEdit17: TDBEdit
              Left = 8
              Top = 294
              Width = 123
              Height = 20
              CharCase = ecUpperCase
              DataField = 'FAX'
              DataSource = DS
              TabOrder = 16
            end
            object DBEdit18: TDBEdit
              Left = 136
              Top = 294
              Width = 145
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'RUA'
              DataSource = DS
              TabOrder = 17
            end
            object DBEdit19: TDBEdit
              Left = 8
              Top = 334
              Width = 123
              Height = 20
              CharCase = ecUpperCase
              DataField = 'NUMERO'
              DataSource = DS
              TabOrder = 18
            end
            object DBEdit20: TDBEdit
              Left = 389
              Top = 485
              Width = 113
              Height = 20
              CharCase = ecUpperCase
              DataField = 'CIDADE'
              DataSource = DS
              TabOrder = 19
            end
            object DBEdit21: TDBEdit
              Left = 137
              Top = 332
              Width = 144
              Height = 20
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'BAIRRO'
              DataSource = DS
              TabOrder = 20
            end
            object DBEdit22: TDBEdit
              Left = 8
              Top = 374
              Width = 121
              Height = 20
              CharCase = ecUpperCase
              DataField = 'CEP'
              DataSource = DS
              TabOrder = 21
            end
            object DBMemo1: TDBMemo
              Left = 136
              Top = 374
              Width = 145
              Height = 89
              Anchors = [akLeft, akTop, akRight]
              DataField = 'MENSAGEM'
              DataSource = DS
              TabOrder = 22
            end
            object DBEdit23: TDBEdit
              Left = 8
              Top = 416
              Width = 124
              Height = 20
              CharCase = ecUpperCase
              DataField = 'DATA'
              DataSource = DS
              TabOrder = 23
              OnMouseMove = DBEdit23MouseMove
            end
            object DBCheckBox1: TDBCheckBox
              Left = 8
              Top = 443
              Width = 49
              Height = 17
              Caption = 'Ativo'
              DataField = 'ATIVO'
              DataSource = DM_CADASTRO.DS_Empresa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 24
              ValueChecked = 'SIM'
              ValueUnchecked = 'NAO'
            end
            object DBEdit24: TDBEdit
              Left = 8
              Top = 485
              Width = 134
              Height = 20
              Hint = 'Imagem que ser'#225' exibida nos relat'#243'rios'
              DataField = 'LOGO'
              DataSource = DM_CADASTRO.DS_Empresa
              TabOrder = 25
            end
            object DBEdit25: TDBEdit
              Left = 192
              Top = 485
              Width = 73
              Height = 20
              Hint = 'Imagem que ser'#225' exibida em todos os computadores'
              Anchors = [akLeft, akTop, akRight]
              DataField = 'FUNDO'
              DataSource = DM_CADASTRO.DS_Empresa
              TabOrder = 26
            end
          end
        end
      end
    end
  end
end
