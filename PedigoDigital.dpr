program PedigoDigital;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  uDados in 'uDados.pas' {dmDados: TDataModule},
  uFrLogSys in 'uFrLogSys.pas' {frLogSys: TUniFrame},
  uFormLogin in 'uFormLogin.pas' {UniLoginForm1: TUniLoginForm},
  Dashboard.Infobox in 'Uses\Dashboard.Infobox.pas',
  Utils in 'Controle\Utils.pas',
  uFrCadProdutos in 'uFrCadProdutos.pas' {frCadProduto: TUniFrame},
  uFrCadGrupo in 'uFrCadGrupo.pas' {frCadGrupo: TUniFrame},
  uFuncoes in 'uFuncoes.pas',
  Mainm in 'Mainm.pas' {MainmForm: TUnimForm},
  uExibeProduto in 'uExibeProduto.pas' {FrmExibeProduto: TUnimForm},
  uAcesso in 'uAcesso.pas' {FrmAcesso: TUnimLoginForm},
  uFrCaixa in 'uFrCaixa.pas' {frCaixa: TUniFrame},
  uFormBuscaProduto in 'uFormBuscaProduto.pas' {formBuscaProduto: TUniForm},
  uFrCadastroUsuario in 'uFrCadastroUsuario.pas' {frCadastroUsuario: TUniFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
