unit uExibeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniLabel, unimLabel, uniGUIBaseClasses, unimPanel, uniButton, unimButton,
  uniImage, unimImage, uniBitBtn, unimBitBtn, uniMemo, uniScreenMask, uniSweetAlert,
  unimMemo, uDados;

type
  TFrmExibeProduto = class(TUnimForm)
    pnlPrincipal: TUnimPanel;
    PnlImagemProduto: TUnimPanel;
    PnlPrincipalTop: TUnimPanel;
    ImgProduto: TUnimImage;
    UnimContainerButtom: TUnimContainerPanel;
    BtPedir: TUnimButton;
    MemoComposicaoProduto: TUnimMemo;
    lblDisplayProduto: TUnimLabel;
    PnlBottom: TUnimPanel;
    LblBottom: TUnimLabel;
    UniSweetAlert1: TUniSweetAlert;
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
begin
  UniSweetAlert1.Show;
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
