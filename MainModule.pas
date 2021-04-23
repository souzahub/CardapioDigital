unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, uniGUIBaseClasses, uniGUIClasses,
  UniFSTheme, uDados;

type
  TUniMainModule = class(TUniGUIMainModule)
    FSTheme: TUniFSTheme;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
    procedure UniGUIMainModuleBeforeLogin(Sender: TObject;
      var Handled: Boolean);
    procedure UniGUIMainModuleSessionTimeout(ASession: TObject;
      var ExtendTimeOut: Integer);
  private
    { Private declarations }
  public
    xUsuario : string; // usuario global
    vADMIN : Boolean; // variavei para perfil

  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.UniGUIMainModuleBeforeLogin(Sender: TObject;
  var Handled: Boolean);
begin
    UniSession.AddJS('Ext.Loader.loadScript("/files/style.css?")'  );
//    UniSession.AddJS('Ext.Loader.loadScript("/files/style.css?")'  );
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin

  dmDados.QueryGrupo.open ;
  FSTheme.Aplly;

end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin

  dmDados.QueryProduto.Active     := false  ;
  dmDados.QueryGrupo.Active       := false  ;
  dmDados.FDConnection1.Connected := false  ;

end;

procedure TUniMainModule.UniGUIMainModuleSessionTimeout(ASession: TObject;
  var ExtendTimeOut: Integer);
begin
  ExtendTimeOut := 180000 ;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
