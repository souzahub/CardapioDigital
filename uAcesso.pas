unit uAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniURLFrame, unimURLFrame, uniMultiItem, unimList,
  uniLabel, unimLabel, uniScreenMask, uniButton, uniBitBtn, unimBitBtn,
  unimButton;

type
  TFrmAcesso = class(TUnimLoginForm)
    ContainerPanelPrincipal: TUnimContainerPanel;
    sbConectarOs: TUnimBitBtn;
    procedure UnimLoginFormShow(Sender: TObject);
    procedure sbConectarOsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmAcesso: TFrmAcesso;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Mainm;

function FrmAcesso: TFrmAcesso;
begin
  Result := TFrmAcesso(UniMainModule.GetFormInstance(TFrmAcesso));
end;

procedure TFrmAcesso.sbConectarOsClick(Sender: TObject);
begin
  Mainm.MainmForm.Show;
end;

procedure TFrmAcesso.UnimLoginFormShow(Sender: TObject);
var pathimg:string ;
begin
    pathimg := 'bg2.jpg' ;
    UniSession.AddJS('SetBackground("'+pathimg+'")');
end;

initialization
  RegisterAppFormClass(TFrmAcesso);

end.
