unit uExibeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniLabel, unimLabel, uniGUIBaseClasses, unimPanel, uniButton, unimButton,
  uniImage, unimImage, uniBitBtn, unimBitBtn, uniMemo, uniScreenMask, uniSweetAlert,
  unimMemo, uDados, Mainm, uFuncoes;

type
  TFrmExibeProduto = class(TUnimForm)
    pnlPrincipal: TUnimPanel;
    PnlImagemProduto: TUnimPanel;
    PnlPrincipalTop: TUnimPanel;
    ImgProduto: TUnimImage;
    UnimContainerButtom: TUnimContainerPanel;
    BtPedir: TUnimButton;
    lblDisplayProduto: TUnimLabel;
    UniSweetAlert1: TUniSweetAlert;
    PnlBottom: TUnimPanel;
    LblBottom: TUnimLabel;
    MemoComposicaoProduto: TUnimMemo;
    procedure UnimLabel1Click(Sender: TObject);
    procedure BtPedirClick(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmExibeProduto: TFrmExibeProduto;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FrmExibeProduto: TFrmExibeProduto;
begin
  Result := TFrmExibeProduto(UniMainModule.GetFormInstance(TFrmExibeProduto));
end;

procedure TFrmExibeProduto.BtPedirClick(Sender: TObject);
 var
xInc, xValor, I :Integer;
vSoma, vQUANTIDADE : Real;
xTotal: real;

begin

 //-------------------------------------------------------------------------------------------------------------------------------------------------------------
 xValor := StrToInt( MainmForm.BtCarrinho.BadgeText );
 inc (xValor);
 MainmForm.BtCarrinho.BadgeText := IntToStr( xValor );


  MainmForm.cdsProd.Append;
  MainmForm.cdsProd.FieldByName('ID_GRUPO').AsInteger := dmDados.QueryProdutoID_GRUPO.value;
  MainmForm.cdsProd.FieldByName('CODIGO').AsInteger := dmDados.QueryProdutoCODIGO.value;
  MainmForm.cdsProd.FieldByName('DESCRICAO').AsString := dmDados.QueryProdutoDESCRICAO.value;
  MainmForm.cdsProd.FieldByName('VALOR').AsFloat := dmDados.QueryProdutoVALOR.value;
  MainmForm.cdsProd.FieldByName('COD_USUARIO').AsInteger := dmDados.QueryUsuarioID.value;



//  xTotal:= MainmForm.cdsProd.FieldByName('VALOR').Value;
  MainmForm.lbValor.Caption := 'Total R$  : '+(FormatFloat('#,##0.00', +xTotal));
  MainmForm.cdsProd.Post;


{ insert in List

 MainmForm.lbValor.Caption := 'Total R$:';

 //-------------------------------------------------------------------------------------------------------------------------------------------------------------
 xValor := StrToInt( MainmForm.BtCarrinho.BadgeText );
 inc (xValor);
 MainmForm.BtCarrinho.BadgeText := IntToStr( xValor );

  for I := 1 to 1 do
    MainmForm.UnimList1.Items.Add(dmDados.QueryProdutoDESCRICAO.AsString +' - '+'Qt. '+ IntToStr(I)+' - '+'R$ '+FloatToStr(dmDados.QueryProdutoVALOR.Value));
 //-------------------------------------------------------------------------------------------------------------------------------------------------------------
   if MainmForm.edValorTotal.Text = '' then
   begin
    MainmForm.edValorTotal.Text := FloatToStr( dmDados.QueryProdutoVALOR.Value );
    close;
    exit;
   end;

   vQUANTIDADE := StrToFloat( TiraStr( MainmForm.edValorTotal.Text, '.'));

   vTOTAL := vQUANTIDADE + dmDados.QueryProdutoVALOR.Value ;

   MainmForm.edValorTotal.Text := FloatToStr( vTOTAL );
   close ;
   exit;
end;

procedure TFrmExibeProduto.UnimFormShow(Sender: TObject);
begin

  lblDisplayProduto.Caption        := dmDados.QueryProdutoDESCRICAO.AsString ;
  MemoComposicaoProduto.Lines.Text := dmDados.QueryProdutoCOMPOSICAO.AsString ;
  try
      ImgProduto.Picture.LoadFromFile( dmDados.QueryProdutoFOTO.AsString);
  except
  end; }



end;

procedure TFrmExibeProduto.UnimFormShow(Sender: TObject);
begin

  lblDisplayProduto.Caption        := dmDados.QueryProdutoDESCRICAO.AsString ;
  MemoComposicaoProduto.Lines.Text := dmDados.QueryProdutoCOMPOSICAO.AsString ;
  try
      ImgProduto.Picture.LoadFromFile( dmDados.QueryProdutoFOTO.AsString);
  except
  end;

end;

procedure TFrmExibeProduto.UnimLabel1Click(Sender: TObject);
begin
  close ;
end;

end.
