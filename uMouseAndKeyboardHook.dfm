object frmMouseAndKeyboardHook: TfrmMouseAndKeyboardHook
  Left = 343
  Top = 262
  Width = 426
  Height = 153
  Caption = #40736#26631#38190#30424#21160#20316#26816#27979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 50
    Width = 106
    Height = 13
    AutoSize = False
    Caption = #40736#26631#38190#30424#26080#21160#20316
  end
  object Label2: TLabel
    Left = 213
    Top = 50
    Width = 80
    Height = 13
    AutoSize = False
    Caption = #20998#38047#21518#35302#21457
  end
  object edtTriggerTime: TEdit
    Left = 144
    Top = 46
    Width = 57
    Height = 21
    TabOrder = 0
    Text = '3'
  end
  object btnSetTriggerTime: TButton
    Left = 295
    Top = 44
    Width = 75
    Height = 25
    Caption = #35774#32622
    TabOrder = 1
    OnClick = btnSetTriggerTimeClick
  end
  object tmrCheckLastActionTime: TTimer
    Interval = 5000
    OnTimer = tmrCheckLastActionTimeTimer
    Left = 16
    Top = 8
  end
end
