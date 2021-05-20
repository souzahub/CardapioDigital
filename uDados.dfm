object dmDados: TdmDados
  OldCreateOrder = False
  Height = 605
  Width = 697
  object Toast: TUniFSToast
    TitleSize = 13
    TitleLineHeight = 0
    MsgSize = 12
    MsgLineHeight = 0
    Theme = Dark
    ImageWidth = 0
    MaxWidth = 0
    zIndex = 99999
    Layout = SmallInt
    Balloon = False
    Close = True
    CloseOnEscape = False
    CloseOnClick = False
    RTL = False
    Position = bottomRight
    TimeOut = 5000
    Drag = True
    Overlay = False
    ToastOnce = False
    PauseOnHover = True
    ResetOnHover = False
    ProgressBar = True
    ProgressBarColor = 'rgb(0, 255, 184)'
    ScreenMask.Enabled = False
    Animateinside = True
    TransitionIn = fadeInUp
    TransitionOut = fadeOut
    TransitionInMobile = fadeInUp
    TransitionOutMobile = fadeOutDown
    ButtonTextYes = 'Confirma'
    ButtonTextNo = 'Cancela'
    Left = 608
    Top = 16
  end
  object QueryUsuario: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from USUARIO order by ID asc'
      '')
    Left = 40
    Top = 288
    object QueryUsuarioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object QueryUsuarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QueryUsuarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 150
    end
    object QueryUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
    end
    object QueryUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
    end
    object QueryUsuarioPERFIL: TStringField
      FieldName = 'PERFIL'
      Origin = 'PERFIL'
      Size = 15
    end
    object QueryUsuarioDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object QueryUsuarioEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
  end
  object QueryAuxiliar: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      '')
    Left = 24
    Top = 104
  end
  object QueryLogSys: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from LOGSYS order by ID desc')
    Left = 112
    Top = 104
    object QueryLogSysID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object QueryLogSysDIA: TSQLTimeStampField
      FieldName = 'DIA'
      Origin = 'DIA'
    end
    object QueryLogSysLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 30
    end
    object QueryLogSysOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
      Size = 30
    end
    object QueryLogSysOCORRENCIA: TStringField
      FieldName = 'OCORRENCIA'
      Origin = 'OCORRENCIA'
      Size = 100
    end
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 32
    Top = 24
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\2021\WebPedidoDigital\BD\BD.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 120
    Top = 24
  end
  object QueryGrupo: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM GRUPOS ORDER BY ID DESC')
    Left = 148
    Top = 287
    object QueryGrupoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object QueryGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object QueryGrupoFOTO: TStringField
      FieldName = 'FOTO'
      Origin = 'FOTO'
      Size = 200
    end
    object QueryGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 30
    end
  end
  object QueryProduto: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from PRODUTOS order by ID asc'
      '')
    Left = 256
    Top = 288
    object QueryProdutoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object QueryProdutoID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
    end
    object QueryProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object QueryProdutoCOMPOSICAO: TStringField
      FieldName = 'COMPOSICAO'
      Origin = 'COMPOSICAO'
      Size = 150
    end
    object QueryProdutoFOTO: TStringField
      FieldName = 'FOTO'
      Origin = 'FOTO'
      Size = 200
    end
    object QueryProdutoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QueryProdutoGRUPO: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Size = 40
    end
    object QueryProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 568
    Top = 85
    Images = {
      2300000000000000060A0000007365617263683B66613B00000000060B000000
      6465736B746F703B66613B00000000060C000000656E76656C6F70653B66613B
      000000000608000000757365723B66613B00000000060E0000006C696E652D63
      686172743B66613B00000000061000000077696E646F772D636C6F73653B6661
      3B000000000608000000736176653B66613B000000000608000000656469743B
      66613B0000000006070000006375743B66613B00000000060D0000006261722D
      63686172743B66613B00000000060D0000007069652D63686172743B66613B00
      0000000610000000616464726573732D636172643B66613B00000000060C0000
      0063616C656E6461723B66613B000000000608000000666565643B66613B0000
      000006070000006661783B66613B000000000609000000696D6167653B66613B
      000000000609000000696E626F783B66613B00000000060D0000006261722D63
      686172743B66613B00000000060B00000069642D636172643B66613B00000000
      060D000000757365722D706C75733B66613B000000000609000000747275636B
      3B66613B00000000060900000075736572733B66613B00000000060C00000073
      69676E2D6F75743B66613B00000000060E000000756E69766572736974793B66
      613B00000000060C00000064617461626173653B66613B000000000607000000
      7573643B66613B00000000060E00000063616C63756C61746F723B66613B0000
      0000060B00000070657263656E743B66613B00000000060D000000636172742D
      706C75733B66613B00000000060C00000065786368616E67653B66613B000000
      000613000000636172742D6172726F772D646F776E3B66613B00000000060D00
      000066696C652D746578743B66613B00000000061000000073686F7070696E67
      2D6261673B66613B00000000060C000000626F6F6B6D61726B3B66613B000000
      00060B0000007365617263683B66615F3B}
  end
  object FDQueryFimPedido: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from PEDIDO_FINALIZADO order by ID asc'
      '')
    Left = 40
    Top = 368
    object FDQueryFimPedidoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDQueryFimPedidoID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
    end
    object FDQueryFimPedidoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
    object FDQueryFimPedidoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object FDQueryFimPedidoIDPEDIDO: TIntegerField
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
    end
    object FDQueryFimPedidoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'COD_USUARIO'
    end
  end
end
