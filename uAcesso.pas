unit uAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniURLFrame, unimURLFrame, uniMultiItem, unimList,
  uniLabel, unimLabel, uniScreenMask, uniButton, uniBitBtn, unimBitBtn,
  unimButton, uniSweetAlert, uniImageList, uniEdit, unimEdit,
  Vcl.Imaging.pngimage, uniImage, unimImage, uFuncoes;

type
  TFrmAcesso = class(TUnimLoginForm)
    CntPnlTop: TUnimContainerPanel;
    cp: TUnimContainerPanel;
    UnimImage1: TUnimImage;
    cpTitulo: TUnimContainerPanel;
    UnimLabel1: TUnimLabel;
    UnimLabel2: TUnimLabel;
    edSenha: TUnimEdit;
    edUsuario: TUnimEdit;
    UnimContainerPanel1: TUnimContainerPanel;
    UnimContainerPanel2: TUnimContainerPanel;
    UnimContainerPanel3: TUnimContainerPanel;
    sbConectarOs: TUnimBitBtn;
    sbSair: TUnimBitBtn;
    UniNativeImageList1: TUniNativeImageList;
    UniSweetAlert1: TUniSweetAlert;
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
  uniGUIVars, MainModule, uniGUIApplication, Mainm, uDados, Main;

function FrmAcesso: TFrmAcesso;
begin
  Result := TFrmAcesso(UniMainModule.GetFormInstance(TFrmAcesso));
end;

procedure TFrmAcesso.sbConectarOsClick(Sender: TObject);
begin
    dmDados.QueryUsuario.Open;


  if dmDados.QueryUsuario.Locate('LOGIN', EdUsuario.Text, []) then
    begin
    if dmDados.QueryUsuarioSENHA.Value <> edSenha.Text then
      begin
      //ShowMessage('ATENÇÃO: USUARIO ou SENHA INVÁLIDA.');
        UniSweetAlert1.InputType := ItNone;
        UniSweetAlert1.AlertType := atWarning;
        UniSweetAlert1.ShowCancelButton := False;
        UniSweetAlert1.ShowConfirmButton := True;
        UniSweetAlert1.Width := 300;
        UniSweetAlert1.Title := 'ATENÇÃO';
        UniSweetAlert1.Show('Usuario / Senha Incorreta');
        edUsuario.SetFocus;
        exit;
      end;

    end
    else
      begin
        //ShowMessage('ATENÇÃO: USUARIO ou SENHA INVÁLIDA.');
        UniSweetAlert1.InputType := ItNone;
        UniSweetAlert1.AlertType := atWarning;
        UniSweetAlert1.ShowCancelButton := False;
        UniSweetAlert1.ShowConfirmButton := True;
        UniSweetAlert1.Width := 300;
        UniSweetAlert1.Title := 'ATENÇÃO';
        UniSweetAlert1.Show('Usuario / Senha Incorreta');
        edUsuario.SetFocus;
        exit;
      end;

    ModalResult := mrOk;

//      MainForm.ExtAlerta('Ola,  '+dmDados.RDWUsuarioNOME.Value, 'Seja Bem Vindo'); // chama o alerta (notificação

  MainmForm.xUsuario := edUsuario.Text; // o edit usuario sempre sera o usuario global

  // registra o log de entrada
  MainmForm.RegistraLog('LOGIN', 'LOGOU NO APP AVALIACAO DE MOTIVO ');

  MainmForm.vADMIN := False;
  if dmDados.QueryUsuarioPERFIL.Value = 'ADMINISTRADOR' then  // admin
      MainmForm.vADMIN := True;

       MainmForm.vUSUARIO := False;
  if dmDados.QueryUsuarioPERFIL.Value = 'ADMINISTRADOR' then  // admin
      MainmForm.vUSUARIO := True;



  MainmForm.xSuaSenha := alltrim( edSenha.Text );

  MainmForm.xPerfil:= dmDados.QueryUsuarioPERFIL.Value; // varialvel para gerenciar tipo de perfil

end;

procedure TFrmAcesso.UnimLoginFormShow(Sender: TObject);
var pathimg:string ;
begin
//    pathimg := 'bg2.jpg' ;
//    UniSession.AddJS('SetBackground("'+pathimg+'")');
end;

initialization
  RegisterAppFormClass(TFrmAcesso);

end.
