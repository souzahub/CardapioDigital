object FrmAcesso: TFrmAcesso
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 320
  Caption = 'FrmAcesso'
  OnShow = UnimLoginFormShow
  LayoutConfig.Cls = 'loader'
  BorderIcons = []
  ShowTitle = False
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 0
  PlatformData = {}
  object ContainerPanelPrincipal: TUnimContainerPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 527
    Hint = ''
    Align = alClient
    LayoutConfig.Cls = 'bg-img'
    object sbConectarOs: TUnimBitBtn
      AlignWithMargins = True
      Left = 25
      Top = 432
      Width = 270
      Height = 45
      Hint = ''
      Margins.Left = 25
      Margins.Top = 30
      Margins.Right = 25
      Margins.Bottom = 50
      ParentShowHint = False
      Align = alBottom
      UI = 'round'
      Caption = 'Entrar'
      Font.Color = clWhite
      Font.Height = -27
      Font.Style = [fsBold]
      OnClick = sbConectarOsClick
    end
  end
end