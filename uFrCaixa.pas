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
  Datasnap.DBClient, FireDAC.Comp.DataSet, Data.FMTBcd, Data.SqlExpr,
  uniTabControl;

type
  TfrCaixa = class(TUniFrame)
    PnUsuario: TUniPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniSweetAlert1: TUniSweetAlert;
    dsVendas: TDataSource;
    UniPanel1: TUniPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    dbGridProduto: TUniDBGrid;
    btCliente: TUniBitBtn;
    bdCalcular: TUniButton;
    dsProduto: TDataSource;
    UniNativeImageList1: TUniNativeImageList;
    pnProdutos: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    UniLabel8: TUniLabel;
    ubtSair: TUniFSButton;
    btCancelar: TUniFSButton;
    edTotal: TUniEdit;
    UniLabel3: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    EdPesquisar: TUniEdit;
    UniLabel4: TUniLabel;
    lbDescricao: TUniDBText;
    UniContainerPanel5: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniLabel2: TUniLabel;
    edValor: TUniEdit;
    edPreco: TUniFormattedNumberEdit;
    UniContainerPanel7: TUniContainerPanel;
    edQtd: TUniEdit;
    UniLabel1: TUniLabel;
    edUnid: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    cdVendas: TClientDataSet;
    cdVendasID: TFDAutoIncField;
    cdVendasDESCRICAO: TStringField;
    cdVendasSUBVALOR: TFloatField;
    cdVendasPRECO: TFloatField;
    cdVendasQTD: TIntegerField;
    cdVendasTOTAL: TFloatField;
    cdVendasUNIDADE: TStringField;
    cdVendasCODPRODUTO: TIntegerField;
    edCodigoProduto: TUniDBEdit;
    UniLabel9: TUniLabel;
    edCodVenda: TUniEdit;
    UniLabel10: TUniLabel;
    edNOvaVenda: TUniBitBtn;
    edTotalBruto: TUniFormattedNumberEdit;
    UniTabControl1: TUniTabControl;
    procedure UniSweetAlert1Confirm(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
    procedure btClienteClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure ubtSairClick(Sender: TObject);
    procedure cdVendasxxCalcFields(DataSet: TDataSet);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure EdPesquisarChange(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure cdVendasCalcFields(DataSet: TDataSet);
    procedure GERACODIGO;
    procedure edNOvaVendaClick(Sender: TObject);
    procedure dbGridProdutoDblClick(Sender: TObject); // gera cod para cadastro


  private
    xIncluindo, xDeletando, xEditando, xSoAlerta, xSalvando, xAprovar, xRecusar : Boolean;

  public


  end;

implementation

{$R *.dfm}

uses  ServerModule, Main, uDados, uFormBuscaProduto;

procedure TfrCaixa.GERACODIGO; // gera cod para cadastro
var
   xErro : string;
   cod : Integer;
begin

  cod:=0;
  dmDados.FDQueryCaixa.OPEN;
  dmDados.FDQueryCaixa.Last;
  cod:=dmDados.FDQueryCaixa.FieldByName('COD_VENDA').AsInteger+1;
  dmDados.FDQueryCaixa.Append;
  edCodVenda.Text:= IntToStr(COD);

  dmDados.QueryAuxiliar.Close;
  dmDados.QueryAuxiliar.SQL.Clear;
  dmDados.QueryAuxiliar.SQL.Add('insert into CAIXA (COD_VENDA )');
  dmDados.QueryAuxiliar.SQL.Add('values(:vCOD_VENDA )');
//
  dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
  dmDados.QueryAuxiliar.Params[0].Value := StrToInt( edCodVenda.Text );//
//
  dmDados.QueryAuxiliar.ExecSQL( xErro );
  dmDados.FDQueryCaixa.Close();
  dmDados.FDQueryCaixa.Open();

  exit;

end;

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

procedure TfrCaixa.cdVendasxxCalcFields(DataSet: TDataSet);
begin
 cdVendasTOTAL.AsFloat := cdVendasQTD.AsFloat*cdVendasPRECO.AsFloat;
end;

procedure TfrCaixa.dbGridProdutoDblClick(Sender: TObject);
begin
  cdVendas.Delete;
end;

procedure TfrCaixa.edNOvaVendaClick(Sender: TObject);
begin
// GERACODIGO;
end;

procedure TfrCaixa.EdPesquisarChange(Sender: TObject);
begin
         // pesquisa dinamica na tabela Usuario
  dmDados.QueryProduto.SQL.Clear;
  dmDados.QueryProduto.SQL.Add('select * from PRODUTOS  where');
  dmDados.QueryProduto.SQL.Add('(DESCRICAO LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryProduto.SQL.Add('or ID LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryProduto.SQL.Add(')order by CODIGO ');
  dmDados.QueryProduto.Open;

end;

procedure TfrCaixa.ubtSairClick(Sender: TObject);
var
xQtd : Real;
xTotal, I : Integer;
Total : Currency;

begin
  if edQtd.Text = '0'  then
   begin
   ShowMessage('Informe a Quantidade');
   exit;
  end;

  if (edUnid.Text = 'KG') and (edPreco.Text = '0') then
  begin
   ShowMessage('Informe o Peso');
   exit;
  end;

  if edQtd.Text= '' then
  begin
    ShowMessage('Digite a Quantidade');
    exit;
  end;

   xQtd := StrToFloat( edQtd.Text );
   lbDescricao.Text := dmDados.QueryProdutoDESCRICAO.Value;
   edValor.Text := FormatFloat('#,##0.00', dmDados.QueryProdutoVALOR.Value );
   edUnid.Text := dmDados.QueryProdutoUNIDADE.Value;
   edQtd.Text := FloatToStr( xQtd );

   cdVendas.Insert;
   cdVendas.FieldByName('DESCRICAO').AsString := lbDescricao.Text;
   cdVendas.FieldByName('PRECO').AsFloat := StrToFloat( edValor.Text );
   cdVendas.FieldByName('QTD').AsFloat := StrToInt( edQtd.Text );
   cdVendas.FieldByName('CODPRODUTO').AsInteger := StrToInt( edCodigoProduto.Text );
   cdVendas.FieldByName('UNIDADE').AsString := edUnid.Text;
   cdVendas.Post;

      //  if cdVendas.IsEmpty then exit;

    for I := 1 to cdVendas.RecordCount do
    begin
      cdVendas.First;
      Total := Total + cdVendas.FieldByName('TOTAL').AsCurrency;
      edTotalBruto.Text:= FloatToStr(Total);
      edTotalBruto.Text := FormatFloat('#,0.00', Total);

      cdVendas.Next;

    end;

//  --------------------------------------------
//  Total := 0;

//  try
//  while not cdVendas.EOF  do
//  begin
//    Total := Total + cdVendas.FieldByName('TOTAL').AsCurrency;
//    cdVendas.Next;
//  end;
//
//  finally
//  cdVendas.EnableControls;
//  edTotalBruto.Text := FormatFloat('#,0.00', Total);
// end;

//  ----------------------------


    lbDescricao.Text := '';
    edValor.Text := '0,00';



end;
procedure TfrCaixa.UniBitBtn1Click(Sender: TObject);
var
I : Integer;
xerro : String;
lStart, lEnd: TDateTime;

begin

    // FORMA 1 de Insert
    dmDados.FDQueryCaixa.Params.ArraySize := cdVendas.RecordCount;

    dmDados.QueryAuxiliar.Close;
    dmDados.QueryAuxiliar.SQL.Clear;

    dmDados.QueryAuxiliar.SQL.Add('INSERT INTO CAIXA (DATA_SAIDA, NOMEPRODUTO, PRECO, QT, SUB_PRECO, CODPRODUTO, COD_VENDA )');
    dmDados.QueryAuxiliar.SQL.Add('values (:vDATA_SAIDA, :vNOMEPRODUTO, :vPRECO, :vQT, :vSUB_PRECO, :vCODPRODUTO, :vCOD_VENDA )');
    cdVendas.First;
    for I := 1 to cdVendas.RecordCount do
    begin
     dmDados.QueryAuxiliar.Params[0].DataType := ftDate;
     dmDados.QueryAuxiliar.Params[0].Value := Now;

     dmDados.QueryAuxiliar.Params[1].DataType := ftString;
     dmDados.QueryAuxiliar.Params[1].Value := cdVendas.FieldByName('DESCRICAO').AsString;

     dmDados.QueryAuxiliar.Params[2].DataType := ftFloat;
     dmDados.QueryAuxiliar.Params[2].Value := cdVendas.FieldByName('PRECO').AsFloat;

     dmDados.QueryAuxiliar.Params[3].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[3].Value := cdVendas.FieldByName('QTD').AsInteger;

     dmDados.QueryAuxiliar.Params[4].DataType := ftFloat;
     dmDados.QueryAuxiliar.Params[4].Value := cdVendas.FieldByName('SUBVALOR').AsFloat;

     dmDados.QueryAuxiliar.Params[5].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[5].Value := StrToInt( edCodigoProduto.Text );

     dmDados.QueryAuxiliar.Params[6].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[6].Value := StrToInt( edCodVenda.Text );

     dmDados.QueryAuxiliar.ExecSQL( xerro );

     cdVendas.Next;

    end;

    edCodVenda.Text := '';
    cdVendas.EmptyDataSet; // limpadata Set
    dmDados.FDQueryCaixa.Close;
    dmDados.FDQueryCaixa.Open;


end;

procedure TfrCaixa.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
   lbDescricao.Text := dmDados.QueryProdutoDESCRICAO.Value;
   edValor.Text := FormatFloat('#,##0.00', dmDados.QueryProdutoVALOR.Value );

   try
    edQtd.Text := '1';
   Except

   end;

end;

procedure TfrCaixa.UniFrameCreate(Sender: TObject);
begin
  GERACODIGO;
  dmDados.QueryProduto.Close();
  lbDescricao.Text := '';
  edValor.Text := '0,00';
  edTotal.Text := '0,00';
  edQtd.Text:= '0';
  edCodigoProduto.Text := '';
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



