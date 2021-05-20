object frCaixa: TfrCaixa
  Left = 0
  Top = 0
  Width = 996
  Height = 777
  OnCreate = UniFrameCreate
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  object PnUsuario: TUniPanel
    Left = 0
    Top = 0
    Width = 996
    Height = 777
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'PnUsuario'
    object UniContainerPanel1: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 994
      Height = 56
      Hint = ''
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 9
      Margins.Bottom = 0
      ParentColor = False
      Color = clGray
      Align = alTop
      TabOrder = 1
    end
    object UniPanel1: TUniPanel
      Left = 1
      Top = 97
      Width = 994
      Height = 679
      Hint = ''
      Align = alClient
      TabOrder = 2
      Caption = 'UniPanel1'
      object UniContainerPanel2: TUniContainerPanel
        Left = 629
        Top = 1
        Width = 364
        Height = 677
        Hint = ''
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 9
        Margins.Bottom = 0
        ParentColor = False
        Color = clSilver
        Align = alRight
        TabOrder = 1
        object UniContainerPanel4: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 364
          Height = 42
          Hint = ''
          ParentColor = False
          Color = clBlack
          Align = alTop
          TabOrder = 1
          object btCliente: TUniBitBtn
            AlignWithMargins = True
            Left = 3
            Top = 6
            Width = 358
            Height = 33
            Hint = ''
            Margins.Top = 6
            Caption = 'Buscar Produtos'
            Align = alClient
            ParentFont = False
            Font.Height = -20
            TabOrder = 1
            ImageIndex = 13
            OnClick = btClienteClick
          end
        end
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 130
          Width = 358
          Height = 24
          Hint = ''
          AutoSize = False
          Caption = 'Pre'#231'o '
          Align = alTop
          ParentFont = False
          Font.Height = -20
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object edQtd: TUniEdit
          AlignWithMargins = True
          Left = 95
          Top = 252
          Width = 174
          Height = 45
          Hint = ''
          Margins.Left = 95
          Margins.Right = 95
          Text = ''
          ParentFont = False
          Font.Height = -40
          Align = alTop
          TabOrder = 3
          Color = 12189695
          InputMask.Mask = '9999'
          InputMask.MaskChar = ' '
        end
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 222
          Width = 358
          Height = 24
          Hint = ''
          Margins.Top = 10
          Alignment = taCenter
          AutoSize = False
          Caption = 'Quantidade'
          Align = alTop
          ParentFont = False
          Font.Height = -20
          Font.Style = [fsBold]
          ParentColor = False
          Color = clSilver
          TabOrder = 4
        end
        object bdCalcular: TUniButton
          Left = 0
          Top = 664
          Width = 364
          Height = 13
          Hint = ''
          Visible = False
          Caption = 'Calcular'
          Align = alBottom
          TabOrder = 5
          OnClick = bdCalcularClick
        end
        object edValor: TUniEdit
          AlignWithMargins = True
          Left = 10
          Top = 160
          Width = 351
          Height = 49
          Hint = ''
          Margins.Left = 10
          Text = 'UniEdit1'
          ParentFont = False
          Font.Height = -33
          Align = alTop
          TabOrder = 6
        end
        object pnProdutos: TUniPanel
          Left = 0
          Top = 480
          Width = 364
          Height = 184
          Hint = ''
          Visible = False
          Align = alBottom
          TabOrder = 7
          ShowCaption = False
          Caption = ''
          Color = clBackground
          object UniDBGrid1: TUniDBGrid
            AlignWithMargins = True
            Left = 6
            Top = 88
            Width = 352
            Height = 92
            Hint = ''
            Margins.Left = 5
            Margins.Right = 5
            DataSource = dsProduto
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
            LoadMask.Message = 'Loading data...'
            ForceFit = True
            BorderStyle = ubsNone
            Align = alClient
            TabOrder = 1
            ParentColor = False
            Color = clWindow
            OnCellClick = UniDBGrid1CellClick
            Columns = <
              item
                FieldName = 'ID'
                Title.Caption = 'Cod'
                Width = 42
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRICAO'
                Width = 224
              end
              item
                FieldName = 'VALOR'
                Title.Caption = 'VALOR'
                Width = 63
              end>
          end
          object UniPanel3: TUniPanel
            AlignWithMargins = True
            Left = 4
            Top = 1
            Width = 356
            Height = 36
            Hint = ''
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alTop
            ParentFont = False
            Font.Height = -20
            TabOrder = 2
            Caption = 'Produtos'
            ExplicitLeft = 49
            ExplicitWidth = 362
          end
          object UniPanel4: TUniPanel
            AlignWithMargins = True
            Left = 6
            Top = 40
            Width = 352
            Height = 42
            Hint = ''
            Margins.Left = 5
            Margins.Right = 5
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -20
            Font.Style = [fsBold]
            TabOrder = 3
            BorderStyle = ubsNone
            Caption = ''
            Color = clNone
            object UniLabel8: TUniLabel
              Left = 784
              Top = 24
              Width = 6
              Height = 24
              Hint = ''
              Visible = False
              Caption = '.'
              TabOrder = 1
            end
            object ubtSair: TUniFSButton
              AlignWithMargins = True
              Left = 280
              Top = 6
              Width = 30
              Height = 30
              Hint = ''
              Margins.Left = 4
              Margins.Top = 6
              Margins.Right = 4
              Margins.Bottom = 6
              StyleButton = GoogleBlue3Round
              BadgeText.Text = '0'
              BadgeText.TextColor = '#FFFFFF'
              BadgeText.TextSize = 10
              BadgeText.TextStyle = 'bold'
              BadgeText.BackgroundColor = '#D50000'
              Caption = ''
              Align = alRight
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Roboto'
              Font.Style = [fsBold]
              TabOrder = 2
              ClientEvents.Enabled = False
              Images = UniNativeImageList1
              ImageIndex = 25
              OnClick = ubtSairClick
            end
            object btCancelar: TUniFSButton
              AlignWithMargins = True
              Left = 318
              Top = 6
              Width = 30
              Height = 30
              Hint = ''
              Margins.Left = 4
              Margins.Top = 6
              Margins.Right = 4
              Margins.Bottom = 6
              StyleButton = GoogleBlue3Round
              BadgeText.Text = '0'
              BadgeText.TextColor = '#FFFFFF'
              BadgeText.TextSize = 10
              BadgeText.TextStyle = 'bold'
              BadgeText.BackgroundColor = '#D50000'
              Caption = ''
              Align = alRight
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Roboto'
              Font.Style = [fsBold]
              TabOrder = 3
              ClientEvents.Enabled = False
              Images = UniNativeImageList1
              ImageIndex = 26
              OnClick = btCancelarClick
            end
            object UniContainerPanel3: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 256
              Height = 42
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 4
              ExplicitLeft = -3
              ExplicitTop = 3
              ExplicitHeight = 40
              object EdPesquisar: TUniEdit
                AlignWithMargins = True
                Left = 10
                Top = 5
                Width = 209
                Height = 35
                Hint = ''
                Margins.Left = 10
                Margins.Top = 5
                Margins.Bottom = 2
                ParentShowHint = False
                CharCase = ecUpperCase
                MaxLength = 40
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Style = [fsBold]
                Align = alLeft
                TabOrder = 1
                EmptyText = 'PESQUISAR'
                ClearButton = True
                FieldLabelWidth = 20
                FieldLabelSeparator = ' '
                FieldLabelFont.Color = clBlue
                FieldLabelFont.Height = -19
                FieldLabelFont.Style = [fsBold]
                OnChange = EdPesquisarChange
                ExplicitHeight = 33
              end
              object UniLabel4: TUniLabel
                AlignWithMargins = True
                Left = 225
                Top = 10
                Width = 28
                Height = 29
                Hint = ''
                Margins.Top = 10
                Alignment = taCenter
                TextConversion = txtHTML
                AutoSize = False
                Caption = '<i class="fas fa-search"></i>'
                Align = alClient
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -20
                Font.Style = [fsBold]
                TabOrder = 2
                ExplicitTop = 26
                ExplicitWidth = 204
                ExplicitHeight = 16
              end
            end
          end
        end
        object edTotal: TUniEdit
          AlignWithMargins = True
          Left = 10
          Top = 75
          Width = 351
          Height = 49
          Hint = ''
          Margins.Left = 10
          Text = 'UniEdit1'
          ParentFont = False
          Font.Height = -33
          Align = alTop
          TabOrder = 8
        end
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 45
          Width = 358
          Height = 24
          Hint = ''
          AutoSize = False
          Caption = 'Valor a Pagar'
          Align = alTop
          ParentFont = False
          Font.Height = -20
          Font.Style = [fsBold]
          TabOrder = 9
        end
      end
      object dbGridProduto: TUniDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 622
        Height = 671
        Hint = ''
        DataSource = dsVendas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        ForceFit = True
        Align = alClient
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
        Columns = <
          item
            FieldName = 'ID'
            Title.Caption = 'ID'
            Width = 64
            ReadOnly = True
          end
          item
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRICAO'
            Width = 230
          end
          item
            FieldName = 'QTD'
            Title.Caption = 'QTD'
            Width = 64
          end
          item
            FieldName = 'PRECO'
            Title.Caption = 'PRECO'
            Width = 99
          end
          item
            FieldName = 'TOTAL'
            Title.Caption = 'TOTAL'
            Width = 64
          end>
      end
    end
    object lbDescricao: TUniLabel
      Left = 1
      Top = 57
      Width = 994
      Height = 40
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'UniLabel3'
      Align = alTop
      ParentFont = False
      Font.Height = -33
      ParentColor = False
      Color = clBtnFace
      TabOrder = 3
    end
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
    Left = 116
    Top = 10
  end
  object dsVendas: TDataSource
    AutoEdit = False
    DataSet = cdVendas
    Left = 33
    Top = 138
  end
  object cdVendas: TClientDataSet
    PersistDataPacket.Data = {
      990000009619E0BD010000001800000005000000000003000000990002494404
      0001000200010007535542545950450200490008004175746F696E6300094445
      5343524943414F01004900000001000557494454480200020096000550524543
      4F08000400000000000853554256414C4F520800040000000000035154440400
      01000000000001000C4155544F494E4356414C55450400010001000000}
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdVendasCalcFields
    Left = 17
    Top = 57
    object cdVendasID: TFDAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdVendasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdVendasPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdVendasSUBVALOR: TFloatField
      FieldName = 'SUBVALOR'
    end
    object cdVendasQTD: TIntegerField
      FieldName = 'QTD'
    end
    object cdVendasTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Calculated = True
    end
  end
  object dsProduto: TDataSource
    DataSet = dmDados.QueryProduto
    Left = 144
    Top = 64
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 24
    Top = 8
    Images = {
      1B00000000000000060B0000006E617669636F6E3B66613B00000000060B0000
      006465736B746F703B66613B00000000060C000000656E76656C6F70653B6661
      3B000000000608000000757365723B66613B00000000060E0000006C696E652D
      63686172743B66613B00000000061000000077696E646F772D636C6F73653B66
      613B000000000608000000736176653B66613B00000000060800000065646974
      3B66613B0000000006070000006375743B66613B00000000060D000000626172
      2D63686172743B66613B00000000060D0000007069652D63686172743B66613B
      000000000610000000616464726573732D636172643B66613B00000000060C00
      000063616C656E6461723B66613B000000000608000000666565643B66613B00
      00000006070000006661783B66613B000000000609000000696D6167653B6661
      3B000000000609000000696E626F783B66613B00000000060D0000006261722D
      63686172743B66613B00000000060B00000069642D636172643B66613B000000
      00060D000000757365722D706C75733B66613B00000000060900000074727563
      6B3B66613B00000000060900000075736572733B66613B00000000060C000000
      7369676E2D6F75743B66613B00000000060E000000756E69766572736974793B
      66613B00000000060C00000064617461626173653B66613B0000000006080000
      00706C75733B66613B00000000060900000074696D65733B66613B}
  end
end
