object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'fPrincipal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object actmgrMenuPrincipal: TActionManager
    Left = 400
    Top = 64
    StyleName = 'Platform Default'
    object actTarefa1: TAction
      Category = 'Tarefas'
      Caption = 'Tarefa 1'
      OnExecute = actTarefa1Execute
    end
    object actTarefa2: TAction
      Category = 'Tarefas'
      Caption = 'Tarefa 2'
      OnExecute = actTarefa2Execute
    end
    object actTarefa3: TAction
      Category = 'Tarefas'
      Caption = 'Tarefa 3'
      OnExecute = actTarefa3Execute
    end
  end
  object mmMenu: TMainMenu
    Left = 344
    Top = 64
    object arefas1: TMenuItem
      Caption = 'Tarefas'
      object actTarefa11: TMenuItem
        Action = actTarefa1
      end
      object actTarefa21: TMenuItem
        Action = actTarefa2
      end
      object acttarefa31: TMenuItem
        Action = actTarefa3
      end
    end
  end
end
