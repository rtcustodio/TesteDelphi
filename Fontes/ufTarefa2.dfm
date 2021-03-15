object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'fTarefa2'
  ClientHeight = 208
  ClientWidth = 140
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
    Top = 5
    Width = 103
    Height = 13
    Caption = 'Intervalo Tarefa 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 103
    Height = 13
    Caption = 'Intervalo Tarefa 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 130
    Width = 47
    Height = 13
    Caption = 'Tarefa 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 163
    Width = 47
    Height = 13
    Caption = 'Tarefa 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtTempoThread1: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '1000'
  end
  object edtTempoThread2: TEdit
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    Text = '500'
  end
  object btnExecutaThread: TBitBtn
    Left = 8
    Top = 99
    Width = 121
    Height = 25
    Caption = 'Executar'
    TabOrder = 2
    OnClick = btnExecutaThreadClick
  end
  object pgBar1: TProgressBar
    Left = 8
    Top = 144
    Width = 121
    Height = 17
    TabOrder = 3
  end
  object pgBar2: TProgressBar
    Left = 8
    Top = 176
    Width = 121
    Height = 17
    TabOrder = 4
  end
end
