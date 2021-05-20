object frCadGrupo: TfrCadGrupo
  Left = 0
  Top = 0
  Width = 960
  Height = 626
  OnCreate = UniFrameCreate
  TabOrder = 0
  object PnUsuario: TUniPanel
    Left = 0
    Top = 0
    Width = 960
    Height = 626
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'PnUsuario'
    object PageCadastro: TUniPageControl
      Left = 1
      Top = 43
      Width = 958
      Height = 582
      Hint = ''
      ActivePage = Tab2
      Align = alClient
      TabOrder = 1
      object Tab1: TUniTabSheet
        Hint = ''
        Caption = 'Consulta'
        object frameFornec: TUniDBGrid
          Left = 0
          Top = 0
          Width = 950
          Height = 554
          Hint = ''
          DataSource = dsCadGrupo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          Align = alClient
          TabOrder = 0
          Columns = <
            item
              FieldName = 'NOME'
              Title.Caption = 'Classifica'#231#227'o'
              Width = 184
            end
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 1204
            end>
        end
      end
      object Tab2: TUniTabSheet
        Hint = ''
        Caption = 'Ficha'
        object UniScrollBox1: TUniScrollBox
          Left = 0
          Top = 0
          Width = 950
          Height = 501
          Hint = ''
          Align = alClient
          TabOrder = 0
          ScrollHeight = 497
          ScrollWidth = 934
          object edDescricao: TUniEdit
            Left = 11
            Top = 119
            Width = 414
            Height = 35
            Hint = ''
            BodyRTL = False
            CharCase = ecUpperCase
            MaxLength = 200
            Text = ''
            TabOrder = 0
            ClearButton = True
          end
          object lbDescricao: TUniLabel
            Left = 12
            Top = 100
            Width = 55
            Height = 13
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Style = [fsBold]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object edNome: TUniEdit
            Left = 12
            Top = 56
            Width = 414
            Height = 35
            Hint = ''
            CharCase = ecUpperCase
            MaxLength = 30
            Text = ''
            TabOrder = 2
            ClearButton = True
            OnExit = edNomeExit
          end
          object lbNome: TUniLabel
            Left = 11
            Top = 37
            Width = 32
            Height = 13
            Hint = ''
            Caption = 'Nome'
            ParentFont = False
            Font.Style = [fsBold]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 3
          end
          object UniContainerPanel4: TUniContainerPanel
            Left = 337
            Top = 479
            Width = 256
            Height = 18
            Hint = ''
            ParentColor = False
            TabOrder = 4
          end
          object UniContainerPanel2: TUniContainerPanel
            Left = 607
            Top = 0
            Width = 341
            Height = 499
            Hint = ''
            ParentColor = False
            Align = alRight
            TabOrder = 5
            DesignSize = (
              341
              499)
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
                Left = 26
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
              object UniFileUploadButton1: TUniFileUploadButton
                Left = 26
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
                OnCompleted = UniFileUploadButton1Completed
              end
              object UniLabel4: TUniLabel
                Left = 59
                Top = 84
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
          object edFoto: TUniEdit
            Left = 12
            Top = 193
            Width = 414
            Height = 35
            Hint = ''
            CharCase = ecLowerCase
            MaxLength = 200
            Text = ''
            TabOrder = 6
            ReadOnly = True
          end
          object lbFoto: TUniLabel
            Left = 12
            Top = 174
            Width = 31
            Height = 13
            Hint = ''
            Caption = 'Fotos'
            ParentFont = False
            Font.Style = [fsBold]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 7
          end
        end
        object UniContainerPanel5: TUniContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 509
          Width = 941
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
      Width = 958
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
          TabOrder = 1
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
          TabOrder = 2
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
          TabOrder = 3
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
          TabOrder = 4
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
          TabOrder = 5
          OnClick = BtCanClick
        end
      end
      object cpnPesquisa: TUniContainerPanel
        Left = 490
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
    DataSet = dmDados.QueryGrupo
    Left = 817
    Top = 98
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
    Left = 892
    Top = 98
  end
end
