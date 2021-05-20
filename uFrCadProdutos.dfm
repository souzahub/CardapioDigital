object frCadProduto: TfrCadProduto
  Left = 0
  Top = 0
  Width = 1101
  Height = 634
  OnCreate = UniFrameCreate
  TabOrder = 0
  object PnUsuario: TUniPanel
    Left = 0
    Top = 0
    Width = 1101
    Height = 634
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'PnUsuario'
    ExplicitWidth = 993
    ExplicitHeight = 716
    object PageCadastro: TUniPageControl
      Left = 1
      Top = 43
      Width = 1099
      Height = 590
      Hint = ''
      ActivePage = Tab2
      Align = alClient
      TabOrder = 1
      object Tab1: TUniTabSheet
        Hint = ''
        Caption = 'Consulta'
        object dbGridProduto: TUniDBGrid
          Left = 0
          Top = 0
          Width = 1091
          Height = 562
          Hint = ''
          DataSource = dsCadProdutos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          Align = alClient
          TabOrder = 0
          ParentColor = False
          Color = clBtnFace
          Columns = <
            item
              FieldName = 'CODIGO'
              Title.Caption = 'CODIGO'
              Width = 90
            end
            item
              FieldName = 'GRUPO'
              Title.Caption = 'GRUPO'
              Width = 244
            end
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'DESCRICAO'
              Width = 304
            end>
        end
      end
      object Tab2: TUniTabSheet
        Hint = ''
        Caption = 'Ficha'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniScrollBox1: TUniScrollBox
          Left = 0
          Top = 0
          Width = 1091
          Height = 509
          Hint = ''
          Align = alClient
          TabOrder = 0
          ScrollWidth = 1089
          object UniContainerPanel2: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 748
            Height = 507
            Hint = ''
            ParentColor = False
            Align = alLeft
            TabOrder = 0
            ExplicitLeft = -6
            ExplicitTop = 3
            object edValoProduto: TUniFormattedNumberEdit
              Left = 458
              Top = 286
              Width = 111
              Hint = ''
              TabOrder = 1
              Color = 12189695
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel2: TUniLabel
              Left = 458
              Top = 267
              Width = 115
              Height = 13
              Hint = ''
              Caption = 'Valor do Produto R$ '
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 2
            end
            object edFoto: TUniEdit
              Left = 18
              Top = 273
              Width = 414
              Height = 35
              Hint = ''
              CharCase = ecLowerCase
              MaxLength = 200
              Text = ''
              TabOrder = 3
              ReadOnly = True
            end
            object lbFoto: TUniLabel
              Left = 18
              Top = 254
              Width = 31
              Height = 13
              Hint = ''
              Caption = 'Fotos'
              ParentFont = False
              Font.Style = [fsBold]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 4
            end
            object edComposicao: TUniEdit
              Left = 18
              Top = 203
              Width = 414
              Height = 35
              Hint = ''
              BodyRTL = False
              CharCase = ecUpperCase
              MaxLength = 200
              Text = ''
              TabOrder = 5
              ClearButton = True
            end
            object lbCompisicao: TUniLabel
              Left = 19
              Top = 184
              Width = 68
              Height = 13
              Hint = ''
              Caption = 'Composi'#231#227'o'
              ParentFont = False
              Font.Style = [fsBold]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 6
            end
            object edDescricao: TUniEdit
              Left = 18
              Top = 139
              Width = 414
              Height = 35
              Hint = ''
              BodyRTL = False
              CharCase = ecUpperCase
              MaxLength = 200
              Text = ''
              TabOrder = 7
              ClearButton = True
            end
            object lbDescricao: TUniLabel
              Left = 19
              Top = 120
              Width = 55
              Height = 13
              Hint = ''
              Caption = 'Descri'#231#227'o'
              ParentFont = False
              Font.Style = [fsBold]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 8
            end
            object edCodProduto: TUniEdit
              Left = 458
              Top = 139
              Width = 287
              Height = 35
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 30
              Text = ''
              TabOrder = 9
              ReadOnly = True
            end
            object lbCod: TUniLabel
              Left = 458
              Top = 120
              Width = 96
              Height = 13
              Hint = ''
              Caption = 'C'#243'dio do Produto'
              ParentFont = False
              Font.Style = [fsBold]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 10
            end
            object dbcodGrupo: TUniDBEdit
              Left = 272
              Top = 56
              Width = 85
              Height = 22
              Hint = ''
              DataField = 'ID'
              DataSource = dsCadGrupo
              TabOrder = 11
              FieldLabelAlign = laTop
              FieldLabelFont.Style = [fsBold]
            end
            object UniLabel3: TUniLabel
              Left = 272
              Top = 37
              Width = 85
              Height = 13
              Hint = ''
              Caption = 'C'#243'dio do Grupo'
              ParentFont = False
              Font.Style = [fsBold]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 12
            end
            object cbGrupos: TUniDBLookupComboBox
              Left = 18
              Top = 56
              Width = 223
              Hint = ''
              ListField = 'NOME'
              ListSource = dsCadGrupo
              KeyField = 'ID'
              ListFieldIndex = 0
              TabOrder = 13
              Color = clWindow
              FieldLabelAlign = laTop
              ForceSelection = True
              OnChange = cbGruposChange
            end
            object UniLabel1: TUniLabel
              Left = 18
              Top = 37
              Width = 40
              Height = 13
              Hint = ''
              Caption = 'Grupos'
              ParentFont = False
              Font.Style = [fsBold]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 14
            end
          end
          object UniContainerPanel4: TUniContainerPanel
            Left = 748
            Top = 0
            Width = 341
            Height = 507
            Hint = ''
            ParentColor = False
            Align = alRight
            TabOrder = 1
            DesignSize = (
              341
              507)
            object cpImagem: TUniContainerPanel
              Left = 24
              Top = 16
              Width = 297
              Height = 388
              Hint = ''
              Visible = False
              ParentColor = False
              Anchors = [akTop, akRight]
              TabOrder = 1
              object UniContainerPanel3: TUniContainerPanel
                Left = 24
                Top = 104
                Width = 249
                Height = 225
                Hint = ''
                ParentColor = False
                TabOrder = 1
                object UniImage1: TUniImage
                  Left = 0
                  Top = 0
                  Width = 249
                  Height = 225
                  Hint = ''
                  Stretch = True
                  Align = alClient
                end
              end
              object UniFileUpload1: TUniFileUploadButton
                Left = 24
                Top = 104
                Width = 249
                Height = 225
                Hint = ''
                Caption = ''
                Filter = 'image/*'
                ImageIndex = 0
                Messages.Uploading = 'Uploading...'
                Messages.PleaseWait = 'Please Wait'
                Messages.UploadError = 'Upload Error'
                Messages.UploadTimeout = 'Timeout occurred...'
                Messages.MaxSizeError = 'File is bigger than maximum allowed size'
                Messages.MaxFilesError = 'You can upload maximum %d files.'
                AllowDragDrop = True
                ButtonVisible = False
                ShowUploadingMsg = False
                OnCompleted = UniFileUpload1Completed
              end
              object UniLabel4: TUniLabel
                Left = 43
                Top = 77
                Width = 165
                Height = 13
                Hint = ''
                Caption = 'Solte o arquivo ou clique aqui'
                ParentFont = False
                Font.Style = [fsBold]
                ParentColor = False
                Color = clBtnFace
                TabOrder = 3
              end
            end
          end
        end
        object UniContainerPanel5: TUniContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 517
          Width = 1082
          Height = 37
          Hint = ''
          Margins.Top = 8
          Margins.Right = 6
          Margins.Bottom = 8
          ParentColor = False
          Align = alBottom
          TabOrder = 1
          LayoutConfig.Margin = '0'
        end
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 1099
      Height = 42
      Hint = ''
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 9
      Margins.Bottom = 0
      ParentColor = False
      Color = clBlack
      Align = alTop
      TabOrder = 2
      object cpBusca: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 225
        Height = 42
        Hint = ''
        ParentColor = False
        Color = clBlack
        Align = alLeft
        TabOrder = 1
        object BtInc: TUniFSButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = Danger
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="fas fa-plus "></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 0
          OnClick = BtIncClick
        end
        object BtAlt: TUniFSButton
          AlignWithMargins = True
          Left = 45
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = Danger
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="far fa-edit"></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 1
          OnClick = BtAltClick
        end
        object BtExc: TUniFSButton
          AlignWithMargins = True
          Left = 87
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = Danger
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="far fa-trash-alt"></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 2
          OnClick = BtExcClick
        end
        object BtGrv: TUniFSButton
          AlignWithMargins = True
          Left = 129
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = Danger
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="fas fa-save"></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 3
          OnClick = BtGrvClick
        end
        object BtCan: TUniFSButton
          AlignWithMargins = True
          Left = 171
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          StyleButton = Danger
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = '<i class="fas fa-sync"></i>'
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          TabOrder = 4
          OnClick = BtCanClick
        end
      end
      object cpnPesquisa: TUniContainerPanel
        Left = 631
        Top = 0
        Width = 468
        Height = 42
        Hint = ''
        ParentColor = False
        Color = clBlack
        Align = alRight
        TabOrder = 2
        object EdPesquisar: TUniEdit
          AlignWithMargins = True
          Left = 8
          Top = 3
          Width = 408
          Height = 36
          Hint = ''
          Margins.Left = 0
          Margins.Right = 10
          ParentShowHint = False
          CharCase = ecUpperCase
          MaxLength = 40
          CharEOL = #13
          Text = ''
          Align = alRight
          TabOrder = 1
          EmptyText = 'PESQUISA DINAMICA'
          ClearButton = True
          OnChange = EdPesquisarChange
        end
        object UniFSButton1: TUniFSButton
          AlignWithMargins = True
          Left = 426
          Top = 5
          Width = 34
          Height = 29
          Hint = ''
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 8
          Margins.Bottom = 8
          StyleButton = Danger
          BadgeText.Text = '0'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = ''
          Align = alRight
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10'   Ext.creat' +
              'e('#39'Ext.tip.ToolTip'#39', {'#13#10'   target: sender.getEl(),'#13#10'   showDelay' +
              ':50,'#13#10'   hideDelay: 50,'#13#10'   html: "Buscar"'#13#10'  });'#13#10'}')
          ScreenMask.Enabled = True
          ScreenMask.Message = 'Carregando...'
          Images = dmDados.UniNativeImageList1
          ImageIndex = 34
          OnClick = UniFSButton1Click
        end
      end
    end
  end
  object dsCadGrupo: TDataSource
    AutoEdit = False
    DataSet = dmDados.QueryGrupo
    Left = 97
    Top = 578
  end
  object UniSweetAlert1: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'Sim'
    CancelButtonText = 'N'#227'o'
    ConfirmButtonColor = clMaroon
    CancelButtonColor = 6835774
    Padding = 20
    OnDismiss = UniSweetAlert1Dismiss
    OnConfirm = UniSweetAlert1Confirm
    Left = 260
    Top = 586
  end
  object dsCadProdutos: TDataSource
    AutoEdit = False
    DataSet = dmDados.QueryProduto
    Left = 25
    Top = 578
  end
end
