object FrmExibeProduto: TFrmExibeProduto
  Left = 0
  Top = 0
  ClientHeight = 514
  ClientWidth = 334
  Caption = ''
  Color = clWhite
  OnShow = UnimFormShow
  Layout = 'fit'
  ShowTitle = False
  TitleButtons = <>
  ShowAnimation = 'fade'
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 0
  PlatformData = {}
  object pnlPrincipal: TUnimPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 445
    Hint = ''
    Margins.Top = 20
    Align = alClient
    Color = 16250871
    Layout = 'fit'
    LayoutAttribs.Align = 'center'
    LayoutAttribs.Pack = 'center'
    LayoutConfig.Cls = 'pnlround'
    BorderStyle = ubsInset
    Title = 'Produto'
    TitleAlign = taCenter
    ExplicitLeft = 19
    ExplicitTop = 9
    ExplicitWidth = 295
    ExplicitHeight = 430
    DesignSize = (
      334
      445)
    object PnlImagemProduto: TUnimPanel
      Left = 63
      Top = 50
      Width = 209
      Height = 80
      Hint = ''
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      Layout = 'fit'
      LayoutAttribs.Align = 'center'
      LayoutAttribs.Pack = 'center'
      LayoutConfig.Cls = 'pnlround2'
      BorderStyle = ubsSolid
      ExplicitWidth = 170
      ExplicitHeight = 65
      object ImgProduto: TUnimImage
        Left = 0
        Top = 0
        Width = 209
        Height = 80
        Hint = ''
        Align = alClient
        Stretch = True
        Transparent = True
        ExplicitWidth = 170
        ExplicitHeight = 65
      end
    end
    object PnlPrincipalTop: TUnimPanel
      Left = 1
      Top = 1
      Width = 332
      Height = 40
      Hint = ''
      Align = alTop
      Color = 3026478
      ExplicitWidth = 293
    end
    object UnimContainerButtom: TUnimContainerPanel
      Left = 1
      Top = 385
      Width = 332
      Height = 59
      Hint = ''
      Align = alBottom
      Color = 16250871
      ExplicitTop = 370
      ExplicitWidth = 293
      DesignSize = (
        332
        59)
      object BtPedir: TUnimButton
        Left = 69
        Top = 10
        Width = 190
        Height = 43
        Hint = ''
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Pedir'
        IconCls = 'add'
        UI = 'confirm'
        LayoutConfig.Cls = 'btn btn-primary'
        OnClick = BtPedirClick
        ExplicitWidth = 151
      end
    end
    object MemoComposicaoProduto: TUnimMemo
      Left = 1
      Top = 163
      Width = 332
      Height = 222
      Hint = ''
      Align = alBottom
      Lines.Strings = (
        '1 p'#227'o (un.)'
        '1 Hamburguer ou 150 gramas (kg)'
        '1 cebola (un)'
        '10 gramas ketchup (kg)'
        '10 gramas maionese (kg)'
        '100 gramas de catupiry (kg)'
        '100 gramas de queijo (kg)')
      ReadOnly = True
      Color = 16250871
      TabOrder = 4
      ExplicitTop = 148
      ExplicitWidth = 293
    end
    object lblDisplayProduto: TUnimLabel
      AlignWithMargins = True
      Left = 4
      Top = 132
      Width = 326
      Height = 28
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Produto'
      Align = alBottom
      ParentColor = False
      Color = 16250871
      Transparent = False
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ExplicitTop = 117
      ExplicitWidth = 287
    end
  end
  object PnlBottom: TUnimPanel
    Left = 0
    Top = 445
    Width = 334
    Height = 69
    Hint = ''
    Align = alBottom
    Color = 3026478
    BorderStyle = ubsNone
    object LblBottom: TUnimLabel
      Left = 0
      Top = 0
      Width = 334
      Height = 69
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 
        '<i class="fa fa-arrow-alt-circle-left fa-5x" aria-hidden="true">' +
        '</i>'
      Align = alClient
      ParentColor = False
      Color = 3026478
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -13
      OnClick = UnimLabel1Click
    end
  end
  object UniSweetAlert1: TUniSweetAlert
    Title = 'Title'
    TitleText = 'Quem sabe em uma vers'#227'o Futura ?  (91) 980551764'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    AlertType = atInfo
    Padding = 10
    ImageWidth = 150
    Left = 252
    Top = 203
  end
end
