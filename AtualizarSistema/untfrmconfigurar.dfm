object frmconfigurar: Tfrmconfigurar
  Left = 408
  Top = 240
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o'
  ClientHeight = 183
  ClientWidth = 219
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 12
    Width = 43
    Height = 13
    Caption = 'Ftp Host:'
  end
  object Label2: TLabel
    Left = 9
    Top = 36
    Width = 39
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label3: TLabel
    Left = 15
    Top = 59
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object Label4: TLabel
    Left = 16
    Top = 83
    Width = 33
    Height = 13
    Caption = 'Salvar:'
  end
  object Label5: TLabel
    Left = 8
    Top = 107
    Width = 39
    Height = 13
    Caption = 'Arquivo:'
  end
  object editftp: TEdit
    Left = 52
    Top = 8
    Width = 166
    Height = 21
    TabOrder = 0
  end
  object edusuario: TEdit
    Left = 52
    Top = 32
    Width = 166
    Height = 21
    TabOrder = 1
  end
  object edsenha: TEdit
    Left = 52
    Top = 56
    Width = 166
    Height = 21
    PasswordChar = '#'
    TabOrder = 2
  end
  object checkpassivo: TCheckBox
    Left = 53
    Top = 130
    Width = 97
    Height = 17
    Caption = 'Modo Passivo'
    TabOrder = 5
  end
  object edsalvar: TEdit
    Left = 52
    Top = 80
    Width = 166
    Height = 21
    TabOrder = 3
  end
  object edarquivo: TEdit
    Left = 52
    Top = 104
    Width = 166
    Height = 21
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 75
    Top = 150
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 6
    OnClick = BmsXPButton1Click
  end
end
