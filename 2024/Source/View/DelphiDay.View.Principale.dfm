object DelphiDayViewPrincipale: TDelphiDayViewPrincipale
  Left = 0
  Top = 0
  Caption = 'View'
  ClientHeight = 442
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnEntita: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 25
    Caption = 'Controller Entity'
    TabOrder = 0
    OnClick = btnEntitaClick
  end
  object btnConnessione: TButton
    Left = 8
    Top = 39
    Width = 145
    Height = 25
    Caption = 'Model Connessione'
    TabOrder = 1
    OnClick = btnConnessioneClick
  end
  object btnQuery: TButton
    Left = 8
    Top = 70
    Width = 145
    Height = 25
    Caption = 'Model Query'
    TabOrder = 2
    OnClick = btnQueryClick
  end
  object btnControllerAddSolo: TButton
    Left = 8
    Top = 101
    Width = 145
    Height = 25
    Caption = 'Controller Add'
    TabOrder = 3
    OnClick = btnControllerAddSoloClick
  end
  object mmoLog: TMemo
    Left = 176
    Top = 8
    Width = 678
    Height = 433
    Lines.Strings = (
      'mmoLog')
    TabOrder = 4
  end
  object btnControllerLista: TButton
    Left = 8
    Top = 132
    Width = 145
    Height = 25
    Caption = 'Controller lista'
    TabOrder = 5
    OnClick = btnControllerListaClick
  end
  object btnControllerAdd: TButton
    Left = 8
    Top = 163
    Width = 145
    Height = 25
    Caption = 'Controller Add'
    TabOrder = 6
    OnClick = btnControllerAddClick
  end
  object btnControllerDelete: TButton
    Left = 8
    Top = 194
    Width = 145
    Height = 25
    Caption = 'Controller Delete'
    TabOrder = 7
    OnClick = btnControllerDeleteClick
  end
  object btnControllerEdit: TButton
    Left = 8
    Top = 225
    Width = 145
    Height = 25
    Caption = 'Controller Edit'
    TabOrder = 8
    OnClick = btnControllerEditClick
  end
end
