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
  Vcl.Imaging.pngimage, uniImage, unimImage, uDados;

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
  private
    { Private declarations }
  public
    { Public declarations }
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

procedure TMainmForm.UnimFormBeforeShow(Sender: TObject);
begin
  UnimURLFrame1.Show ;
end;

procedure TMainmForm.UnimFormShow(Sender: TObject);
begin

  dmDados.QueryGrupo.Open  ;
  TabPai.ActivePageIndex := 0 ;

end;

procedure TMainmForm.UnimLabel1Click(Sender: TObject);
begin
  dmDados.QueryGrupo.Open ;

  lblGrupos.Caption      := '' ;
  TabPai.ActivePageIndex := 0 ;
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
