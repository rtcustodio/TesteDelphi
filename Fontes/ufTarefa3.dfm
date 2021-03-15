object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'fTarefa3'
  ClientHeight = 355
  ClientWidth = 626
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 112
    Height = 13
    Caption = 'Valores por projeto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 497
    Top = 261
    Width = 44
    Height = 13
    Caption = 'Total R$:'
  end
  object Label3: TLabel
    Left = 497
    Top = 307
    Width = 86
    Height = 13
    Caption = 'Total Divis'#245'es R$:'
  end
  object dbgRegistros: TDBGrid
    Left = 8
    Top = 27
    Width = 610
    Height = 222
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IdProjeto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProjeto'
        Width = 414
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end>
  end
  object edtTotal: TEdit
    Left = 497
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0,00'
  end
  object edtTotalDivisoes: TEdit
    Left = 497
    Top = 326
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0,00'
  end
  object BitBtn1: TBitBtn
    Left = 416
    Top = 278
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 376
    Top = 322
    Width = 115
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
end
