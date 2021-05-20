unit uFrCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniSweetAlert, uniScreenMask, uniLabel,
  uniPanel, uniScrollBox, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  UniFSButton, uniEdit, uniPageControl, uniGUIBaseClasses, uniImageList,
  Data.DB, uniRadioGroup, uniDBText, uniMemo, uniDBEdit, uniFileUpload, UniFSiGrowl,
  uniMultiItem, uniListBox, UniFSToast, uniComboBox, UniFSCombobox,
  uniCheckBox, uniDateTimePicker,  uniSpinEdit,
  frxClass, frxDBSet, frxGradient, frxExportBaseDialog, frxExportPDF,
  uniGroupBox, uniImage, uniDBComboBox, uniDBLookupComboBox, uFuncoes,
  Datasnap.DBClient, FireDAC.Comp.DataSet;

type
  TfrCaixa = class(TUniFrame)
    PnUsuario: TUniPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniSweetAlert1: TUniSweetAlert;
    dsVendas: TDataSource;
    UniPanel1: TUniPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edQtd: TUniEdit;
    UniLabel1: TUniLabel;
    dbGridProduto: TUniDBGrid;
    btCliente: TUniBitBtn;
    bdCalcular: TUniButton;
    cdVendas: TClientDataSet;
    cdVendasID: TFDAutoIncField;
    cdVendasDESCRICAO: TStringField;
    cdVendasPRECO: TFloatField;
    cdVendasSUBVALOR: TFloatField;
    cdVendasQTD: TIntegerField;
    dsProduto: TDataSource;
    UniNativeImageList1: TUniNativeImageList;
    edValor: TUniEdit;
    lbDescricao: TUniLabel;
    pnProdutos: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    UniLabel8: TUniLabel;
    ubtSair: TUniFSButton;
    btCancelar: TUniFSButton;
    edTotal: TUniEdit;
    UniLabel3: TUniLabel;
    cdVendasTOTAL: TFloatField;
    UniContainerPanel3: TUniContainerPanel;
    EdPesquisar: TUniEdit;
    UniLabel4: TUniLabel;
    procedure UniSweetAlert1Confirm(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
    procedure btClienteClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure bdCalcularClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure EdPesquisarChange(Sender: TObject);
    procedure ubtSairClick(Sender: TObject);
    procedure cdVendasCalcFields(DataSet: TDataSet);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);


  private
    xIncluindo, xDeletando, xEditando, xSoAlerta, xSalvando, xAprovar, xRecusar : Boolean;

  public


  end;

implementation

{$R *.dfm}

uses  ServerModule, Main, uDados, uFormBuscaProduto;

procedure TfrCaixa.btCancelarClick(Sender: TObject);
begin
   pnProdutos.Visible := False;
   dmDados.QueryProduto.Close;
end;

procedure TfrCaixa.btClienteClick(Sender: TObject);
begin
  dmDados.QueryProduto.open;
  pnProdutos.Visible := True;

end;

procedure TfrCaixa.cdVendasCalcFields(DataSet: TDataSet);
begin
 cdVendasTOTAL.AsFloat := cdVendasQTD.AsFloat*cdVendasPRECO.AsFloat;
end;

procedure TfrCaixa.EdPesquisarChange(Sender: TObject);
begin
    // pesquisa dinamica na tabela Usuario
  dmDados.QueryProduto.SQL.Clear;
  dmDados.QueryProduto.SQL.Add('select * from PRODUTOS  where');
  dmDados.QueryProduto.SQL.Add('(DESCRICAO LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryProduto.SQL.Add('or ID LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryProduto.SQL.Add(')order by ID ');
  dmDados.QueryProduto.Open;

end;

procedure TfrCaixa.ubtSairClick(Sender: TObject);
var
xQtd : Real;
begin
  if edQtd.Text= '' then
  begin
    ShowMessage('Digite a Quantidade');
    exit;
  end;
    xQtd := StrToFloat( edQtd.Text );
    lbDescricao.Text := dmDados.QueryProdutoDESCRICAO.Value;
    edValor.Text := FormatFloat('#,##0.00', dmDados.QueryProdutoVALOR.Value );
    edQtd.Text := FloatToStr( xQtd );
    bdCalcularClick(Sender);

    lbDescricao.Text := '';
    edValor.Text := '0,00';
    edTotal.Text := '0,00';
    edQtd.Text:= '';

end;
procedure TfrCaixa.bdCalcularClick(Sender: TObject);
begin
//  if cdVendas.IsEmpty then exit;
  cdVendas.Insert;
  cdVendas.FieldByName('DESCRICAO').AsString := lbDescricao.Text;
  cdVendas.FieldByName('PRECO').AsFloat := StrToFloat( edValor.Text );
  cdVendas.FieldByName('QTD').AsFloat := StrToInt( edQtd.Text );
  cdVendas.Post;


end;

procedure TfrCaixa.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
   lbDescricao.Text := dmDados.QueryProdutoDESCRICAO.Value;
   edValor.Text := FormatFloat('#,##0.00', dmDados.QueryProdutoVALOR.Value );

   try
    edQtd.Text := '';
   Except

   end;

end;

procedure TfrCaixa.UniFrameCreate(Sender: TObject);
begin
  dmDados.QueryProduto.Open();
  lbDescricao.Text := '';
  edValor.Text := '0,00';
  edTotal.Text := '0,00';
  edQtd.Text:= '';
end;

procedure TfrCaixa.UniSweetAlert1Confirm(Sender: TObject);

begin
//   if xSoAlerta = True then exit;
//
//   if xIncluindo then
//   begin
//     dmDados.QueryAuxiliar.Close;
//     dmDados.QueryAuxiliar.SQL.Clear;
//     dmDados.QueryAuxiliar.SQL.Add('insert into PRODUTOS (ID_GRUPO, CODIGO, DESCRICAO, COMPOSICAO, VALOR, FOTO, GRUPO )');
//     dmDados.QueryAuxiliar.SQL.Add('values(:vID_GRUPO, :vCODIGO, :vDESCRICAO, :vCOMPOSICAO, :vVALOR, :vFOTO, :vGRUPO )');
//
//     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
//     dmDados.QueryAuxiliar.Params[0].Value := dbcodGrupo.Text;
//
//     dmDados.QueryAuxiliar.Params[1].DataType := ftInteger;
//     dmDados.QueryAuxiliar.Params[1].Value := edCodProduto.Text;
//
//     dmDados.QueryAuxiliar.Params[2].DataType := ftString;
//     dmDados.QueryAuxiliar.Params[2].Value := edDescricao.Text;
//
//     dmDados.QueryAuxiliar.Params[3].DataType := ftString;
//     dmDados.QueryAuxiliar.Params[3].Value := edComposicao.Text;
//
//     dmDados.QueryAuxiliar.Params[4].DataType := ftFloat;
//     dmDados.QueryAuxiliar.Params[4].Value := StrToFloat( TiraStr( edValoProduto.Text, '.') );
//
//     dmDados.QueryAuxiliar.Params[5].DataType := ftString;
//     dmDados.QueryAuxiliar.Params[5].Value := edFoto.Text;
//
//     dmDados.QueryAuxiliar.Params[6].DataType := ftString;
//     dmDados.QueryAuxiliar.Params[6].Value := cbGrupos.Text;
//
//     dmDados.QueryAuxiliar.ExecSQL( xErro );
//     dmDados.QueryProduto.Close();
//     dmDados.QueryProduto.Open();
//
//     xIncluindo := False;
//
////     MainForm.RegistraLog('INCLUSÃO', 'INCLUSÃO DO USUÁRIO: '+UniNome.Text);    log
//
//   end;
//   if xEditando then
//   begin
//     dmDados.QueryAuxiliar.Close;
//     dmDados.QueryAuxiliar.SQL.Clear;
//     dmDados.QueryAuxiliar.SQL.Add('update PRODUTOS set ID_GRUPO=:vID_GRUPO, CODIGO=:vCODIGO, DESCRICAO=:vDESCRICAO,'
//     +'COMPOSICAO=:vCOMPOSICAO, VALOR=:vVALOR, FOTO=:vFOTO, GRUPO=:vGRUPO where ID=:vID');
//
//     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
//     dmDados.QueryAuxiliar.Params[0].Value := dbcodGrupo.Text;
//
//     dmDados.QueryAuxiliar.Params[1].DataType := ftInteger;
//     dmDados.QueryAuxiliar.Params[1].Value := edCodProduto.Text;
//
//     dmDados.QueryAuxiliar.Params[2].DataType := ftString;
//     dmDados.QueryAuxiliar.Params[2].Value := edDescricao.Text;
//
//     dmDados.QueryAuxiliar.Params[3].DataType := ftString;
//     dmDados.QueryAuxiliar.Params[3].Value := edComposicao.Text;
//
//     dmDados.QueryAuxiliar.Params[4].DataType := ftFloat;
//     dmDados.QueryAuxiliar.Params[4].Value := StrToFloat( TiraStr( edValoProduto.Text, '.') );
//
//     dmDados.QueryAuxiliar.Params[5].DataType := ftString;
//     dmDados.QueryAuxiliar.Params[5].Value := edFoto.Text;
//
//     dmDados.QueryAuxiliar.Params[6].DataType := ftString;
//     dmDados.QueryAuxiliar.Params[6].Value := cbGrupos.Text;
//
//     dmDados.QueryAuxiliar.Params[7].DataType := ftInteger;
//     dmDados.QueryAuxiliar.Params[7].Value := dmDados.QueryProdutoID.Value;
//
//     dmDados.QueryAuxiliar.ExecSQL( xErro );
//     dmDados.QueryProduto.Close();
//     dmDados.QueryProduto.Open();
//     xEditando := False;
//   end;
//   if xDeletando then
//   begin
//     vexUsuario := dmDados.QueryProdutoDESCRICAO.value;
//
//     dmDados.QueryAuxiliar.Close;
//     dmDados.QueryAuxiliar.SQL.Clear;
//     dmDados.QueryAuxiliar.SQL.Add('delete from PRODUTOS where ID=:vID');
//     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
//     dmDados.QueryAuxiliar.Params[0].Value :=  dmDados.QueryProdutoID.Value;
//
//     dmDados.QueryAuxiliar.ExecSQL( xErro );
//
//     dmDados.QueryProduto.Close();
//     dmDados.QueryProduto.Open();
//     xDeletando := False;
//
////     MainForm.RegistraLog('EXCLUSÃO', 'EXCLUÍDO DO USUÁRIO: '+vexUsuario);   log
//   end;
end;

procedure TfrCaixa.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := False;
end;

end.



