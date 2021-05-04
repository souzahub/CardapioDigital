object MainmForm: TMainmForm
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 358
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
    Width = 358
    Height = 527
    Hint = ''
    Align = alClient
    ScrollIndicators = False
    ScrollHeight = 0
    ScrollWidth = 0
    object TabPai: TUnimTabPanel
      Left = 0
      Top = 0
      Width = 356
      Height = 525
      Hint = ''
      ActivePage = TabLista
      Align = alClient
      TabBarVisible = False
      object TabGrupos: TUnimTabSheet
        Left = 4
        Top = 51
        Width = 348
        Height = 470
        Hint = ''
        Caption = 'Menu'
        object UnimURLFrame1: TUnimURLFrame
          Left = 0
          Top = 0
          Width = 348
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
          Width = 348
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
        Width = 348
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
          Width = 348
          Height = 63
          Hint = ''
          Align = alTop
          Color = 3026478
          BorderStyle = ubsNone
          object lblGrupos: TUnimLabel
            Left = 0
            Top = 0
            Width = 276
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
          end
          object PnlShop: TUnimContainerPanel
            Left = 276
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
          Width = 348
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
              Width = 1654
            end
            item
              Title.Caption = 'VALOR'
              FieldName = 'VALOR'
              Width = 114
            end
            item
              Title.Caption = 'FOTO'
              FieldName = 'FOTO'
              Width = 2204
            end>
        end
        object UnimPanel2: TUnimPanel
          Left = 0
          Top = 407
          Width = 348
          Height = 63
          Hint = ''
          Align = alBottom
          Color = 3026478
          BorderStyle = ubsNone
          object UnimLabel1: TUnimLabel
            Left = 0
            Top = 0
            Width = 348
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
      object TabLista: TUnimTabSheet
        Left = 4
        Top = 51
        Width = 348
        Height = 470
        Hint = ''
        Caption = 'Itens'
        object pnlPrincipal: TUnimPanel
          Left = 0
          Top = 0
          Width = 348
          Height = 470
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
          DesignSize = (
            348
            470)
          object PnlPrincipalTop: TUnimPanel
            Left = 1
            Top = 1
            Width = 346
            Height = 56
            Hint = ''
            Align = alTop
            Color = 3026478
            object lbValor: TUnimLabel
              Left = 1
              Top = 1
              Width = 344
              Height = 54
              Hint = ''
              Alignment = taRightJustify
              AutoSize = False
              Caption = ''
              Align = alClient
              ParentColor = False
              Color = 3026478
              Transparent = False
              LayoutConfig.Padding = '15px 10px !important'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -24
              Font.Style = [fsBold]
            end
          end
          object UnimDBListGrid1: TUnimDBListGrid
            Left = 1
            Top = 57
            Width = 346
            Height = 412
            Hint = ''
            Align = alClient
            DataSource = dsProd
            ClientEvents.UniEvents.Strings = (
              
                'beforeInit='#13#10'function beforeInit(sender, config)'#13#10'{'#13#10' '#13#10'config.l' +
                'oadingText='#39'Carregando...'#39';'#13#10'config.grouped=false;'#13#10'config.selec' +
                'tedCls='#39#39';'#13#10'config.itemTpl='#39'<div class="product-info">'#39'+'#13#10'      ' +
                '  // '#39'<p>&nbsp;C'#243'digo: {0}</p>'#39'+ '#13#10'        '#39'<p class="text-black' +
                ' font-weight">&nbsp&nbspC'#243'd Usuario: {3}</p>'#39'+              '#13#10'  ' +
                '      '#39'<p class="text-black font-weight">&nbsp&nbspC'#243'd Prod: {1}' +
                '</p>'#39'+       '#13#10'        '#39'<p class="text-primary font-weight">&nbs' +
                'p&nbspDescri'#231#227'o: {2}</p>'#39'+'#13#10'        '#39'<p class="text-danger font-' +
                'weight-Helvetica">&nbsp&nbspValor: {4}</p>'#39'+        '#13#10'          ' +
                '      '#13#10'        '#39'</div>'#39'; '#13#10'}'#13#10#13#10#13#10)
            Options = [dgColLines, dgRowLines, dgConfirmDelete]
            WebOptions.Paged = False
            DirectionLock = True
            Columns = <
              item
                Title.Caption = 'ID_GRUPO'
                FieldName = 'ID_GRUPO'
                Width = 114
              end
              item
                Title.Caption = 'CODIGO'
                FieldName = 'CODIGO'
                Width = 114
              end
              item
                Title.Caption = 'DESCRICAO'
                FieldName = 'DESCRICAO'
                Width = 1654
              end
              item
                Title.Caption = 'COD_USUARIO'
                FieldName = 'COD_USUARIO'
                Width = 114
              end
              item
                Title.Caption = 'VALOR'
                FieldName = 'VALOR'
                Width = 114
              end>
          end
          object BtPedir: TUnimButton
            Left = 110
            Top = 399
            Width = 123
            Height = 43
            Hint = ''
            Anchors = [akLeft, akRight, akBottom]
            Caption = 'Confirmar'
            IconCls = 'add'
            UI = 'confirm'
            LayoutConfig.Cls = 'btn btn-primary'
            OnClick = BtPedirClick
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
  object dsProd: TDataSource
    AutoEdit = False
    DataSet = cdsProd
    Left = 36
    Top = 208
  end
  object cdsProd: TClientDataSet
    PersistDataPacket.Data = {
      7A0000009619E0BD0100000018000000050000000000030000007A000849445F
      475255504F040001000000000006434F4449474F040001000000000009444553
      43524943414F01004900000001000557494454480200020096000B434F445F55
      53554152494F04000100000000000556414C4F5208000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 100
    Top = 139
    object cdsProdID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object cdsProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdsProdCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object cdsProdVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
end
