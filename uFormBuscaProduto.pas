unit uFormBuscaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniDBNavigator, uniLabel, uniEdit, uniPanel,
  uniGUIBaseClasses, uniImageList, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, Data.DB, UniFSButton, uFrCadProdutos ;

type
  TformBuscaProduto = class(TUniForm)
    dsProduto: TDataSource;
    UniDBGrid1: TUniDBGrid;
    UniNativeImageList1: TUniNativeImageList;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniLabel8: TUniLabel;
    EdPesquisar: TUniEdit;
    ubtSair: TUniFSButton;
    btCancelar: TUniFSButton;
    procedure UniFormCreate(Sender: TObject);
    procedure UniDBGrid1DblClick(Sender: TObject);
    procedure EdPesquisarChange(Sender: TObject);
    procedure ubtSairClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function formBuscaProduto: TformBuscaProduto;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDados, Main, uFrCaixa, uFuncoes;

function formBuscaProduto: TformBuscaProduto;
begin
  Result := TformBuscaProduto(UniMainModule.GetFormInstance(TformBuscaProduto));
end;

procedure TformBuscaProduto.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TformBuscaProduto.EdPesquisarChange(Sender: TObject);
begin

  // pesquisa dinamica na tabela Usuario
  dmDados.QueryProduto.SQL.Clear;
  dmDados.QueryProduto.SQL.Add('select * from PRODUTOS  where');
  dmDados.QueryProduto.SQL.Add('(DESCRICAO LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryProduto.SQL.Add('or ID LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryProduto.SQL.Add(')order by ID ');
  dmDados.QueryProduto.Open;

end;
//
procedure TformBuscaProduto.ubtSairClick(Sender: TObject);
var
xDescricao : string;
begin


end;

procedure TformBuscaProduto.UniDBGrid1DblClick(Sender: TObject);
begin
  ubtSairClick(Sender);
end;

procedure TformBuscaProduto.UniFormCreate(Sender: TObject);
begin

  dmDados.QueryProduto.Close;
  EdPesquisar.Text := '';

end;

end.
