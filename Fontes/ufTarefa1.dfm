object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'fTarefa1'
  ClientHeight = 333
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 44
    Height = 13
    Caption = 'Colunas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 199
    Top = 13
    Width = 38
    Height = 13
    Caption = 'Tabela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 390
    Top = 13
    Width = 57
    Height = 13
    Caption = 'Condi'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 158
    Width = 21
    Height = 13
    Caption = 'SQL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mmColunas: TMemo
    Left = 8
    Top = 32
    Width = 185
    Height = 89
    Lines.Strings = (
      'CLI_NOME'
      'CLI_LOGRADOURO'
      'CLI_NUMERO'
      'CLI_BAIRRO')
    TabOrder = 0
  end
  object mmTabela: TMemo
    Left = 199
    Top = 32
    Width = 185
    Height = 89
    Lines.Strings = (
      'cliente')
    TabOrder = 1
  end
  object mmCondicoes: TMemo
    Left = 390
    Top = 32
    Width = 185
    Height = 89
    Lines.Strings = (
      'CLI_NOME = "RODRIGO"'
      'CLI_BAIRRO = "Kennedy"')
    TabOrder = 2
  end
  object mmSQL: TMemo
    Left = 8
    Top = 176
    Width = 567
    Height = 149
    TabOrder = 3
  end
  object btnGeraSQL: TBitBtn
    Left = 8
    Top = 127
    Width = 568
    Height = 25
    Caption = 'Gerar SQL'
    TabOrder = 4
    OnClick = btnGeraSQLClick
  end
  object FDPhysTDataDriverLink1: TFDPhysTDataDriverLink
    Left = 448
    Top = 152
  end
end
