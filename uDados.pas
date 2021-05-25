unit uDados;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDWConstsData, uRESTDWPoolerDB, uDWAbout, uniGUIBaseClasses,
  uniGUIClasses, UniFSToast, uniImageList, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TdmDados = class(TDataModule)
    Toast: TUniFSToast;
    QueryUsuario: TFDQuery;
    QueryAuxiliar: TFDQuery;
    QueryLogSys: TFDQuery;
    QueryLogSysID: TIntegerField;
    QueryLogSysDIA: TSQLTimeStampField;
    QueryLogSysLOGIN: TStringField;
    QueryLogSysOPERACAO: TStringField;
    QueryLogSysOCORRENCIA: TStringField;
    FDTransaction1: TFDTransaction;
    FDConnection1: TFDConnection;
    QueryUsuarioID: TIntegerField;
    QueryUsuarioNOME: TStringField;
    QueryUsuarioEMAIL: TStringField;
    QueryUsuarioLOGIN: TStringField;
    QueryUsuarioSENHA: TStringField;
    QueryUsuarioPERFIL: TStringField;
    QueryUsuarioDATA_CADASTRO: TSQLTimeStampField;
    QueryUsuarioEMPRESA: TIntegerField;
    QueryGrupo: TFDQuery;
    QueryGrupoID: TIntegerField;
    QueryGrupoNOME: TStringField;
    QueryProduto: TFDQuery;
    QueryProdutoID: TIntegerField;
    QueryProdutoID_GRUPO: TIntegerField;
    QueryProdutoCODIGO: TIntegerField;
    QueryProdutoCOMPOSICAO: TStringField;
    QueryProdutoFOTO: TStringField;
    QueryProdutoVALOR: TFloatField;
    QueryProdutoGRUPO: TStringField;
    QueryGrupoFOTO: TStringField;
    UniNativeImageList1: TUniNativeImageList;
    QueryGrupoDESCRICAO: TStringField;
    QueryProdutoDESCRICAO: TStringField;
    FDQueryCaixa: TFDQuery;
    QueryProdutoUNIDADE: TStringField;
    FDQueryFimPedido: TFDQuery;
    FDQueryFimPedidoID: TIntegerField;
    FDQueryFimPedidoID_GRUPO: TIntegerField;
    FDQueryFimPedidoDESCRICAO: TStringField;
    FDQueryFimPedidoVALOR: TFloatField;
    FDQueryFimPedidoIDPEDIDO: TIntegerField;
    FDQueryFimPedidoCOD_USUARIO: TIntegerField;
    FDQueryFimPedidoUNIDADE: TStringField;
    FDQueryCaixaDATA_SAIDA: TSQLTimeStampField;
    FDQueryCaixaNOMEPRODUTO: TStringField;
    FDQueryCaixaPRECO: TFloatField;
    FDQueryCaixaQT: TIntegerField;
    FDQueryCaixaSUB_PRECO: TFloatField;
    FDQueryCaixaCODPRODUTO: TIntegerField;
    FDQueryCaixaCOD_BARRA: TIntegerField;
    FDQueryCaixaCOD_CLIENTE: TIntegerField;
    FDQueryCaixaUNIDADE: TStringField;
    FDQueryCaixaINICIO: TSQLTimeStampField;
    FDQueryCaixaCOD_VENDA: TIntegerField;
    FDQueryCaixaID: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function dmDados: TdmDados;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function dmDados: TdmDados;
begin
  Result := TdmDados(UniMainModule.GetModuleInstance(TdmDados));
end;

initialization
  RegisterModuleClass(TdmDados);

end.
