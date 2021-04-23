object MainmForm: TMainmForm
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 320
  Caption = 'MainmForm'
  Color = clWhite
  OnShow = UnimFormShow
  AlignmentControl = uniAlignmentClient
  Layout = 'fit'
  LayoutConfig.Cls = 'loading'
  DisplayCaption = False
  ScreenMask.WaitData = True
  ScreenMask.Message = 'teste'
  ScreenMask.Target = ListProdutos
  ShowTitle = False
  TitleButtons = <>
  ShowAnimation = 'fade'
  OnAjaxEvent = UnimFormAjaxEvent
  OnBeforeShow = UnimFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 0
  PlatformData = {}
  object UnimScrollBox1: TUnimScrollBox
    Left = 0
    Top = 0
    Width = 320
    Height = 527
    Hint = ''
    Align = alClient
    ScrollIndicators = False
    ScrollHeight = 0
    ScrollWidth = 0
    object TabPai: TUnimTabPanel
      Left = 0
      Top = 0
      Width = 318
      Height = 525
      Hint = ''
      ActivePage = TabProdutos
      Align = alClient
      TabBarVisible = False
      ExplicitLeft = -3
      ExplicitTop = -1
      object TabGrupos: TUnimTabSheet
        Left = 4
        Top = 51
        Width = 310
        Height = 470
        Hint = ''
        Caption = 'Menu'
        object UnimURLFrame1: TUnimURLFrame
          Left = 0
          Top = 0
          Width = 310
          Height = 105
          Hint = ''
          HTML.Strings = (
            '<!DOCTYPE HTML>'
            '<html lang="pt-br">'
            '<head>'
            '<style>'
            ' .bg{'
            #9' background-image: url(/files/logo.jpg);'
            #9' background-repeat: no-repeat ;'
            #9' background-size: cover ;'
            #9' background-position: center ;'
            #9' background-attachment: fixed ;'
            ' }'
            ''
            '.logo img {'
            '    max-width:620px;'
            '    width: auto;'
            ' '
            '   max-height:150px;'
            '    height:auto ;'
            '    display: block;   '
            '   aligin:center ;'
            '}'
            '</style>'
            ''
            '</head>'
            ''
            ''
            '<body>'
            '  <div>'
            '  </div>'
            '</body>'
            '</html>'
            '')
          LayoutConfig.Cls = 'bg'
          Align = alTop
          TabOrder = 1
          ParentColor = False
          Color = clSilver
        end
        object ListGrupos: TUnimDBListGrid
          Left = 0
          Top = 105
          Width = 310
          Height = 365
          Hint = ''
          Align = alClient
          DataSource = dsGrupos
          ClientEvents.ExtEvents.Strings = (
            
              'select=function select(sender, selected, eOpts)'#13#10'{'#13#10'  return fal' +
              'se;'#13#10'}')
          ClientEvents.UniEvents.Strings = (
            
              'beforeInit=function beforeInit(sender, config) '#13#10'{'#13#10' config.load' +
              'ingText='#39'carregando...'#39';'#13#10' config.grouped=false;        '#13#10' confi' +
              'g.itemTpl='#13#10'   '#39'<div class="container">'#39'+'#13#10'            '#39'<div cla' +
              'ss="card-grupo card-left">'#39'+'#13#10'                 '#39'<image src="{3}"' +
              '/>'#39'+ '#13#10'            '#39'</div>'#39'+         '#13#10'            '#39'<div class="' +
              'bloco2 card-left">'#39'+'#13#10'                  '#39'<h2>'#39'+'#13#10'               ' +
              '     '#39'{1}'#39'+'#13#10'                  '#39'</h2>'#39'+  '#13#10'                 '#39'<h4' +
              '>'#39'+ '#13#10'                    '#39'{2}'#39'+  '#13#10'                 '#39'</h4>'#39'+  '#13 +
              #10'            '#39'</div>'#39'+'#13#10'    '#39'</div>'#39';                 '#13#10'        ' +
              '        '#13#10' }')
          Flex = 1
          Options = [dgColLines, dgRowLines, dgConfirmDelete]
          WebOptions.Paged = False
          Striped = True
          DirectionLock = True
          LayoutConfig.Cls = 'loading loading-indicator'
          LayoutConfig.Width = '100%'
          OnClick = ListGruposClick
          Columns = <
            item
              Title.Caption = 'ID'
              FieldName = 'ID'
              Width = 114
            end
            item
              Title.Caption = 'NOME'
              FieldName = 'NOME'
              Width = 334
            end
            item
              Title.Caption = 'DESCRICAO'
              FieldName = 'DESCRICAO'
              Width = 334
            end
            item
              Title.Caption = 'FOTO'
              FieldName = 'FOTO'
              Width = 2204
            end>
        end
      end
      object TabProdutos: TUnimTabSheet
        Left = 4
        Top = 51
        Width = 310
        Height = 470
        Hint = ''
        ClientEvents.ExtEvents.Strings = (
          
            'show=function window.show(sender, eOpts)'#13#10'{'#13#10' '#13#10'        var dom ' +
            '= Ext.dom.Query.select('#39'.x-mask'#39');'#13#10'        var el = Ext.get(dom' +
            '[0]);'#13#10'        el.addCls('#39'customWindow'#39');'#13#10'    '#13#10'}')
        Caption = 'Card'#225'pio'
        object PnlExibeGrupos: TUnimPanel
          Left = 0
          Top = 0
          Width = 310
          Height = 63
          Hint = ''
          Align = alTop
          Color = 3026478
          BorderStyle = ubsNone
          object lblGrupos: TUnimLabel
            Left = 0
            Top = 0
            Width = 238
            Height = 63
            Hint = ''
            AutoSize = False
            Caption = '....'
            Align = alClient
            ParentColor = False
            Color = 3026478
            Transparent = False
            LayoutConfig.Padding = '15px 10px !important'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -24
            Font.Style = [fsBold]
            ExplicitLeft = 32
          end
          object PnlShop: TUnimContainerPanel
            Left = 238
            Top = 0
            Width = 72
            Height = 63
            Hint = ''
            Visible = False
            Align = alRight
            Color = 3026478
            object BtCarrinho: TUnimButton
              Left = 0
              Top = -6
              Width = 72
              Height = 69
              Hint = ''
              BadgeText = '0'
              Align = alBottom
              Caption = '<i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i>'
              LayoutConfig.Cls = 'btn-shop'
            end
          end
        end
        object ListProdutos: TUnimDBListGrid
          Left = 0
          Top = 63
          Width = 310
          Height = 344
          Hint = ''
          Align = alClient
          DataSource = dsProdutos
          ClientEvents.ExtEvents.Strings = (
            
              'select=function select(sender, selected, eOpts)'#13#10'{'#13#10'  return fal' +
              'se;'#13#10'}')
          ClientEvents.UniEvents.Strings = (
            
              'beforeInit='#13#10'function beforeInit(sender, config) '#13#10'{'#13#10#13#10' Ext.uti' +
              'l.Format.thousandSeparator = '#39','#39';'#13#10' Ext.util.Format.decimalSepar' +
              'ator  = '#39','#39';'#13#10#13#10' config.selectedCls = '#39#39';'#13#10' config.loadingText='#39 +
              'carregando...'#39';'#13#10' config.grouped=false; '#13#10' config.itemTpl='#39#39' ;  ' +
              '     '#13#10' config.itemTpl= new Ext.XTemplate'#13#10'  ('#13#10'  '#13#10'    '#39'<div cl' +
              'ass="container">'#39'+'#13#10'            '#39'<div class="card-produtos card-' +
              'left">'#39'+'#13#10'                 '#39'<image src="{4}"/>'#39'+                ' +
              '          '#13#10'                '#13#10'            '#39'</div>'#39'+'#13#10'           ' +
              ' '#39'<div class="bloco2 card-right">'#39'+'#13#10'                  '#39'<h2>'#39'+'#13#10 +
              '                    '#39'{1}'#39'+'#13#10'                  '#39'</h2>'#39'+ '#13#10'       ' +
              '            '#13#10'                 '#39'<h4>'#39'+ '#13#10'                   '#39'{2}' +
              #39'+ '#13#10'                 '#39'</h4>'#39'+  '#13#10'                     '#39'<h2 clas' +
              's="valor">'#39'+'#13#10'                       '#39'R$ {3}'#39'+                  ' +
              '    '#13#10'                     '#39'</h2>'#39'+'#13#10'                     '#39'<butt' +
              'on class="btn" id="ExibeProduto" onclick="javascript:ev_ChamaExi' +
              'beProduto()">Detalhes</button>'#39'+'#13#10'            '#39'</div>'#39'+    '#13#10'   ' +
              ' '#39'</div>'#39' , '#13#10'                 '#13#10'  );'#13#10'                '#13#10'}'#13#10' '#13#10)
          Flex = 1
          Options = [dgRowLines, dgConfirmDelete]
          WebOptions.Paged = False
          Striped = True
          DirectionLock = True
          LayoutConfig.Cls = 'loading loading-indicator'
          LayoutConfig.Width = '100%'
          OnAjaxEvent = ListProdutosAjaxEvent
          OnSelect = ListProdutosSelect
          OnFieldImage = ListProdutosFieldImage
          Columns = <
            item
              Title.Caption = 'CODIGO'
              FieldName = 'CODIGO'
              Width = 114
            end
            item
              Title.Caption = 'DESCRICAO'
              FieldName = 'DESCRICAO'
              Width = 334
            end
            item
              Title.Caption = 'COMPOSICAO'
              FieldName = 'COMPOSICAO'
              Width = 64
            end
            item
              Title.Caption = 'VALOR'
              FieldName = 'VALOR'
              Width = 64
            end
            item
              Title.Caption = 'FOTO'
              FieldName = 'FOTO'
              Width = 64
            end>
        end
        object UnimPanel2: TUnimPanel
          Left = 0
          Top = 407
          Width = 310
          Height = 63
          Hint = ''
          Align = alBottom
          Color = 3026478
          BorderStyle = ubsNone
          object UnimLabel1: TUnimLabel
            Left = 0
            Top = 0
            Width = 310
            Height = 63
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
      end
    end
  end
  object dsGrupos: TDataSource
    AutoEdit = False
    DataSet = dmDados.QueryGrupo
    Left = 188
    Top = 8
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = dmDados.QueryProduto
    Left = 268
    Top = 8
  end
end
