unit Mainm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, DB,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniBasicGrid, uniDBGrid, unimDBListGrid, uniGUIBaseClasses, unimPanel,
  uniLabel, unimLabel, uniPanel, uniPageControl, unimTabPanel, uniButton,
  unimButton, uniDBText, uniEdit, uniDBEdit, unimDBEdit, unimCarousel,
  unimSegmentedButton, unimScrollBox, uniBitBtn, unimBitBtn, uniScreenMask,
  uniSweetAlert, uniHTMLFrame, unimHTMLFrame, uniURLFrame, unimURLFrame,
  Vcl.Imaging.pngimage, uniImage, unimImage, uDados, uniMemo, unimMemo,
  uniMultiItem, unimList, unimEdit, uFuncoes, unimDBGrid, Datasnap.DBClient;

type
  TMainmForm = class(TUnimForm)
    UnimScrollBox1: TUnimScrollBox;
    TabPai: TUnimTabPanel;
    TabGrupos: TUnimTabSheet;
    ListGrupos: TUnimDBListGrid;
    TabProdutos: TUnimTabSheet;
    ListProdutos: TUnimDBListGrid;
    UnimPanel2: TUnimPanel;
    PnlExibeGrupos: TUnimPanel;
    lblGrupos: TUnimLabel;
    UnimURLFrame1: TUnimURLFrame;
    UnimLabel1: TUnimLabel;
    PnlShop: TUnimContainerPanel;
    BtCarrinho: TUnimButton;
    dsGrupos: TDataSource;
    dsProdutos: TDataSource;
    TabLista: TUnimTabSheet;
    pnlPrincipal: TUnimPanel;
    PnlPrincipalTop: TUnimPanel;
    lbValor: TUnimLabel;
    dsProd: TDataSource;
    UnimDBListGrid1: TUnimDBListGrid;
    BtPedir: TUnimButton;
    cdsProd: TClientDataSet;
    cdsProdID_GRUPO: TIntegerField;
    cdsProdCODIGO: TIntegerField;
    cdsProdDESCRICAO: TStringField;
    cdsProdCOD_USUARIO: TIntegerField;
    cdsProdVALOR: TFloatField;
    procedure ListGruposClick(Sender: TObject);
    procedure ListProdutosSelect(Sender: TObject);
    procedure UnimLabel1Click(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
    procedure UnimFormBeforeShow(Sender: TObject);
    procedure ListProdutosAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UnimFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure ListProdutosFieldImage(const Column: TunimDBListGridColumn;
      const AField: TField; var OutImage: TGraphic; var DoNotDispose: Boolean;
      var ATransparent: TUniTransparentOption);
    procedure UnimList1Click(Sender: TObject);
    procedure BtPedirClick(Sender: TObject);
    procedure RegistraLog(Tipo: String; Historico: String);
  private
    { Private declarations }
  public
    { Public declarations }
    vADMIN, vUSUARIO : Boolean;  // Administrador
    xPedido :Integer;
    xUsuario, xSuaSenha, xPerfil : string; // variavel para chamr o nome do usuario logado
  end;

function MainmForm: TMainmForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uExibeProduto;

function MainmForm: TMainmForm;
begin
  Result := TMainmForm(UniMainModule.GetFormInstance(TMainmForm));
end;
procedure TMainmForm.RegistraLog(Tipo: String; Historico: String);  // procedure gravar log
var
  xERRO: String;
begin
  exit;
  // registra o log ( função Log ) para todos
  dmDados.QueryAuxiliar.Close;
  dmDados.QueryAuxiliar.SQL.Clear;
  dmDados.QueryAuxiliar.SQL.Add('INSERT into LOGSYS values (NULL, :vDIA, :vLOGIN, :vOPERACAO, :vOCORRENCIA )');
  // DIA
  dmDados.QueryAuxiliar.Params[0].DataType := ftDateTime;
  dmDados.QueryAuxiliar.Params[0].Value := DateTimeToStr(now);
  // pega a Data do computador
  // Login
  dmDados.QueryAuxiliar.Params[1].DataType := ftString;
  dmDados.QueryAuxiliar.Params[1].Value := MainModule.UniMainModule.xUsuario;
  // pega o usuario na entrada do sistema ( usuario global )
  // operação
  dmDados.QueryAuxiliar.Params[2].DataType := ftString;
  dmDados.QueryAuxiliar.Params[2].Value := Tipo; // pega esse valor para a função
  // Ocorrencia
  dmDados.QueryAuxiliar.Params[3].DataType := ftString;
  dmDados.QueryAuxiliar.Params[3].Value := Historico;
  // pega esse valor para a função

  dmDados.QueryAuxiliar.ExecSQL(xERRO);

  dmDados.QueryLogSys.Close;
  dmDados.QueryLogSys.Open;
end;

procedure TMainmForm.UnimFormBeforeShow(Sender: TObject);
begin
  UnimURLFrame1.Show ;
end;

procedure TMainmForm.UnimFormShow(Sender: TObject);
begin
  MainmForm.xPedido := 0;
  BtCarrinho.BadgeText := IntToStr( MainmForm.xPedido );

  dmDados.QueryGrupo.Open  ;
  TabPai.ActivePageIndex := 0 ;

end;

procedure TMainmForm.UnimLabel1Click(Sender: TObject);
begin
  dmDados.QueryGrupo.Open ;

  lblGrupos.Caption      := '' ;
  TabPai.ActivePageIndex := 0 ;
end;

procedure TMainmForm.UnimList1Click(Sender: TObject);
var
xCarrinho : integer;
xTotal, xValor: real;

begin
// Deleteta direto na lista

//   ShowMessage(UnimList1.Items.Strings[UnimList1.ItemIndex]+FloatToStr( dmDados.QueryProdutoVALOR.Value ) );

//   UnimEdit1.Text :=FloatToStr( dmDados.QueryProdutoVALOR.Value );
//   xCarrinho := StrToInt( MainmForm.BtCarrinho.BadgeText ) -1;
//
//   UnimList1.Items.Delete( UnimList1.ItemIndex );
//   BtCarrinho.BadgeText:= IntToStr( xCarrinho );
//
//    if UnimList1.Items.Count <= 0 then
//    begin
//     edValorTotal.Text := IntToStr( 0 );
//     exit;
//    end;
//
//   xTotal  :=  StrToFloat( TiraStr( MainmForm.edValorTotal.Text, '.'));
//   xValor := dmDados.QueryProdutoVALOR.Value;
//   edValorTotal.Text := FloatToStr( xTotal - xValor );
//   exit;

end;

procedure TMainmForm.BtPedirClick(Sender: TObject);
var
I : Integer;
xerro : String;
lStart, lEnd: TDateTime;

begin

    // FORMA 1 de Insert
    dmDados.FDQueryFimPedido.Params.ArraySize := cdsProd.RecordCount;

    dmDados.QueryAuxiliar.Close;
    dmDados.QueryAuxiliar.SQL.Clear;
    dmDados.QueryAuxiliar.SQL.Add('INSERT INTO PEDIDO_FINALIZADO (ID_GRUPO, DESCRICAO, VALOR, COD_USUARIO )');
    dmDados.QueryAuxiliar.SQL.Add('values (:vID_GRUPO, :vDESCRICAO, :vVALOR, :vCOD_USUARIO )');

    cdsProd.First;

    for I := 1 to cdsProd.RecordCount do
    begin
     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[0].Value := cdsProd.FieldByName('ID_GRUPO').AsInteger;

     dmDados.QueryAuxiliar.Params[1].DataType := ftString;
     dmDados.QueryAuxiliar.Params[1].Value := cdsProd.FieldByName('DESCRICAO').AsString;

     dmDados.QueryAuxiliar.Params[2].DataType := ftFloat;
     dmDados.QueryAuxiliar.Params[2].Value := cdsProd.FieldByName('VALOR').AsFloat;

     dmDados.QueryAuxiliar.Params[3].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[3].Value := cdsProd.FieldByName('COD_USUARIO').AsInteger;

     dmDados.QueryAuxiliar.ExecSQL( xerro );

     cdsProd.Next;

    end;

    dmDados.FDQueryFimPedido.Close;
    dmDados.FDQueryFimPedido.Open;

    cdsProd.Close;
    cdsProd.CreateDataSet;
    TabPai.ActivePageIndex := 0 ;
//     ShowMessage('Time elapsed: ' + FormatDateTime('hh:nn:ss:zzz', lEnd - lStart));
end;

procedure TMainmForm.ListGruposClick(Sender: TObject);
begin

  TabPai.ActivePageIndex := 1 ;
  lblGrupos.Caption := dmDados.QueryGrupoNOME.AsString ;

  dmDados.QueryProduto.Close;
  dmDados.QueryProduto.SQL.Clear;
  dmDados.QueryProduto.SQL.Add('select ID, ID_GRUPO, CODIGO, DESCRICAO, COMPOSICAO, VALOR, FOTO, GRUPO from PRODUTOS where ID_GRUPO=:vNID_GRUPO order by ID');
  dmDados.QueryProduto.Params[0].DataType := ftInteger;
  dmDados.QueryProduto.Params[0].Value := dmDados.QueryGrupoID.Value ;
  dmDados.QueryProduto.Open;
//
//  With UniMainModule  do // busca por parametro por ID mestre
//   Begin
//     dmDados.QueryProduto.Close;
//     dmDados.QueryProduto.ParamByName('ID_GRUPO').Value := dmDados.QueryGrupoID.Value ;
//     dmDados.QueryProduto.Open ;
//   End;

end;

procedure TMainmForm.UnimFormAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin
//  if SameText(EventName, 'ExibeDetalhe') then
//  begin
//    FrmExibeProduto.Show ;
//  end
end;

procedure TMainmForm.ListProdutosAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);

begin
  if SameText(EventName, 'ExibeDetalhe') then
  begin
    PnlShop.Visible := true ;
    FrmExibeProduto.Show ;
  end;
end;

procedure TMainmForm.ListProdutosFieldImage(const Column: TunimDBListGridColumn;
  const AField: TField; var OutImage: TGraphic; var DoNotDispose: Boolean;
  var ATransparent: TUniTransparentOption);
begin
//
//  if SameText(AField.FieldName, 'FOTO') then
//  begin
//
//    DoNotDispose := True; // we provide an static image so do not free it.
//
//    UniImage1.Picture.LoadFromFile(UniMainModule.FDQryProdutosFOTO.AsString);
//    OutImage := UniImage1.Picture.Graphic  ;
//
//  end;



end;

procedure TMainmForm.ListProdutosSelect(Sender: TObject);
begin
  dmDados.QueryProduto.Close ;
  lblGrupos.Caption      := '' ;
  TabPai.ActivePageIndex := 0 ;
end;

initialization
  RegisterAppFormClass(TMainmForm);

//  UniAddCSSLibrary('toasty/toasty.css', False, [upoFolderFiles, upoPlatformBoth]);
//  UniAddJSLibrary('toasty/toasty.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

end.
