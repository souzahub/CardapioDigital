unit uFrCadProdutos;

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
  uniGroupBox, uniImage, uniDBComboBox, uniDBLookupComboBox, uFuncoes ;

type
  TfrCadProduto = class(TUniFrame)
    PnUsuario: TUniPanel;
    PageCadastro: TUniPageControl;
    Tab1: TUniTabSheet;
    Tab2: TUniTabSheet;
    UniContainerPanel1: TUniContainerPanel;
    cpBusca: TUniContainerPanel;
    cpnPesquisa: TUniContainerPanel;
    EdPesquisar: TUniEdit;
    UniFSButton1: TUniFSButton;
    BtInc: TUniFSButton;
    BtAlt: TUniFSButton;
    BtExc: TUniFSButton;
    BtGrv: TUniFSButton;
    BtCan: TUniFSButton;
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel5: TUniContainerPanel;
    dsCadGrupo: TDataSource;
    dbGridProduto: TUniDBGrid;
    UniSweetAlert1: TUniSweetAlert;
    dsCadProdutos: TDataSource;
    UniContainerPanel2: TUniContainerPanel;
    edValoProduto: TUniFormattedNumberEdit;
    UniLabel2: TUniLabel;
    edFoto: TUniEdit;
    lbFoto: TUniLabel;
    edComposicao: TUniEdit;
    lbCompisicao: TUniLabel;
    edDescricao: TUniEdit;
    lbDescricao: TUniLabel;
    edCodProduto: TUniEdit;
    lbCod: TUniLabel;
    dbcodGrupo: TUniDBEdit;
    UniLabel3: TUniLabel;
    cbGrupos: TUniDBLookupComboBox;
    UniLabel1: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    cpImagem: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniImage1: TUniImage;
    UniFileUpload1: TUniFileUploadButton;
    UniLabel4: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure BtIncClick(Sender: TObject);
    procedure BtAltClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtGrvClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure EdPesquisarChange(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);
    procedure UniSweetAlert1Confirm(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
    procedure UniDbListGruposSelect(Sender: TObject);
    procedure cbGruposChange(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject;
      AStream: TFileStream);


  private
    xIncluindo, xDeletando, xEditando, xSoAlerta, xSalvando, xAprovar, xRecusar : Boolean;
    Procedure GeraCodigo; // gera codigo para o Produto de acordo coom o Grupo

  public


  end;

implementation

{$R *.dfm}

uses  ServerModule, Main, uDados;


Procedure TfrCadProduto.GeraCodigo; // gera codigo para o Produto de acordo coom o Grupo
var
achou:boolean;
Sequencia:integer;

begin

  sequencia:=1;
  edCodProduto.Text:=IntToStr(sequencia);
  edCodProduto.Text:=FormatFloat(dbcodGrupo.Text+'000000',StrToInt(edCodProduto.Text)); //deixa zeros a esquerda .
  achou:=dmDados.QueryProduto.Locate('codigo',edCodProduto.Text,[]); //localiza o codigo '000001' .


  WHILE NOT (ACHOU=FALSE) DO BEGIN  // 'stop' quando o codigo gerado nao for encontrado na tprodutos.

  edCodProduto.Text:=IntToStr(sequencia);
  edCodProduto.Text:=FormatFloat(dbcodGrupo.Text+'000000',StrToInt(edCodProduto.Text)); //deixa zeros a esquerda .
  achou:=dmDados.QueryProduto.Locate('codigo',edCodProduto.Text,[]); //localiza o codigo '000001' .

  IF ACHOU=TRUE THEN         // se localizar na tabela entao aumenta,soma + 1 .
  sequencia:=sequencia+1;    // aqui vai deixar o codigo 000002
  edCodProduto.Text:=IntToStr(sequencia); // aqui vai deixar no edit o  num. '2'
  edCodProduto.Text:=FormatFloat(dbcodGrupo.Text+'000000',StrToInt(edCodProduto.Text)); //formata para zeros a esquerda '000002'
  END;

  UniImage1.Picture := nil;// limpar as imagens da tela

   if not DirectoryExists(UniServerModule.StartPath+'files\Uploads\GRUPO\'+cbGrupos.Text+'\' ) then   // cria pasta para envio de arquivos direcionado pelo numero do processo
  CreateDir(UniServerModule.StartPath+'files\Uploads\GRUPO\'+cbGrupos.Text+'\'   );

  cpImagem.Visible := True;


end;

procedure TfrCadProduto.BtAltClick(Sender: TObject);
begin

    xSoAlerta := False;
    xIncluindo := False;
    xEditando := True;
    xDeletando := False;

      // ler imagem quando editar
   Try
   UniImage1.Picture := nil;// limpar as imagens da tela
    cpImagem.Visible := True;
    UniImage1.Picture.LoadFromFile( dmDados.QueryProdutoFOTO.AsString );
   Except

  End;

// Visualizando a Tab2
    PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
    PageCadastro.Pages[0].TabVisible := False ;
    PageCadastro.Pages[1].TabVisible := True ;

 // Visualizando Botao do Crud
    BtInc.Enabled := False;
    BtAlt.Enabled := False;
    BtExc.Enabled := False;
    BtGrv.Enabled := True;
    BtCan.Enabled := True;

    cpnPesquisa.Visible := False;
    cbGrupos.Text := dmDados.QueryProdutoGRUPO.Value;
    dbcodGrupo.Text := IntToStr( dmDados.QueryProdutoID_GRUPO.Value );
    edCodProduto.Text := IntToStr( dmDados.QueryProdutoCODIGO.Value );
    edDescricao.Text := dmDados.QueryProdutoDESCRICAO.Value;
    edComposicao.Text := dmDados.QueryProdutoCOMPOSICAO.Value;
    edValoProduto.Text := FloatToStr (dmDados.QueryProdutoVALOR.Value );
    edFoto.Text := dmDados.QueryProdutoFOTO.Value;




end;

procedure TfrCadProduto.BtCanClick(Sender: TObject);
begin
//   dmDados.RDWFornec.Cancel;
   PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
   PageCadastro.Pages[0].TabVisible := True ;
   PageCadastro.Pages[1].TabVisible := False ;

   // Visualizando Botao do Crud
   BtInc.Enabled := True;
   BtAlt.Enabled := True;
   BtExc.Enabled := True;
   BtGrv.Enabled := False;
   BtCan.Enabled := False;

   cpnPesquisa.Visible := True;

   dmDados.QueryProduto.Close();
   dmDados.QueryProduto.Open();
//
   btAlt.Enabled := dmDados.QueryProduto.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
   btExc.Enabled := dmDados.QueryProduto.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado

   cpImagem.Visible := False;
   UniImage1.Picture := nil;// limpar as imagens da tela

end;

procedure TfrCadProduto.BtExcClick(Sender: TObject);
begin
  //  Confirmacao da exclusao com SweetAlert1
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := True;

  UniSweetAlert1.Title := 'Deseja excluir esse Produto ?';
  UniSweetAlert1.AlertType := atError;
  UniSweetAlert1.ShowConfirmButton := True;
  UniSweetAlert1.ConfirmButtonText := 'Sim';
  UniSweetAlert1.ShowCancelButton := True;
  UniSweetAlert1.CancelButtonText := 'Não';
  UniSweetAlert1.Show(dmDados.QueryProdutoDESCRICAO.Value);

end;

procedure TfrCadProduto.BtGrvClick(Sender: TObject);
begin
     //  usando  SweetAlert1
          if cbGrupos.Text = '' then
    begin
      xSoAlerta := True;   // bloqueia alerta
      UniSweetAlert1.Title := ('Campo Obrigatório');
      UniSweetAlert1.AlertType := atInfo;
      UniSweetAlert1.ShowConfirmButton := False;
      UniSweetAlert1.ShowCancelButton := True;
      UniSweetAlert1.CancelButtonText := 'Ok';
      UniSweetAlert1.Show('Digite o Nome do Grupo');
      exit;
    end;

       if edDescricao.Text = '' then
    begin
      xSoAlerta := True;   // bloqueia alerta
      UniSweetAlert1.Title := ('Campo Obrigatório');
      UniSweetAlert1.AlertType := atInfo;
      UniSweetAlert1.ShowConfirmButton := False;
      UniSweetAlert1.ShowCancelButton := True;
      UniSweetAlert1.CancelButtonText := 'Ok';
      UniSweetAlert1.Show('Digite o Nome do Produto');
      exit;
    end;

         //  usando  SweetAlert1
       if edFoto.Text = '' then
    begin
      xSoAlerta := True;   // bloqueia alerta
      UniSweetAlert1.Title := ('Atenção');
      UniSweetAlert1.AlertType := atInfo;
      UniSweetAlert1.ShowConfirmButton := False;
      UniSweetAlert1.ShowCancelButton := True;
      UniSweetAlert1.CancelButtonText := 'Ok';
      UniSweetAlert1.Show('Coloque uma Imagem do Produto');
      exit;
    end;

     //  Salvando com SweetAlert1
    xSoAlerta := False;
    UniSweetAlert1.Title := 'Deseja salvar o produto?';
    UniSweetAlert1.AlertType := atQuestion;
    UniSweetAlert1.ShowConfirmButton := True;
    UniSweetAlert1.ConfirmButtonText := 'Sim';
    UniSweetAlert1.ShowCancelButton := True;
    UniSweetAlert1.CancelButtonText := 'Não';
    UniSweetAlert1.Show( edDescricao.Text );

    BtInc.Enabled := True;
    BtAlt.Enabled := True;
    BtExc.Enabled := True;
    BtGrv.Enabled := False;
    BtCan.Enabled := False;

    cpnPesquisa.Visible := True;

    PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
    PageCadastro.Pages[0].TabVisible := True ;
    PageCadastro.Pages[1].TabVisible := False ;

end;

procedure TfrCadProduto.BtIncClick(Sender: TObject);
begin

  xSoAlerta := False;
  xIncluindo := True;
  xEditando := False;
  cbGrupos.ReadOnly := False;

  PageCadastro.ActivePage := Tab2 ;

         // Visualizando a Tab2
  PageCadastro.Pages[0].TabVisible := False ;
  PageCadastro.Pages[1].TabVisible := Visible ;

      // Visualizando Botao do Crud
  BtInc.Enabled := False;
  BtAlt.Enabled := False;
  BtExc.Enabled := False;
  BtGrv.Enabled := True;
  BtCan.Enabled := True;


  UniImage1.Picture := nil;// limpar as imagens da tela
  EdPesquisar.Text := '';
  dbcodGrupo.Text := '';
  cbGrupos.Text := '';
  edDescricao.Text := '';
  edComposicao.Text := '';
  edCodProduto.Text := '';
  edValoProduto.Text := IntToStr( 0 );
  edFoto.Text := '';
  cpnPesquisa.Visible := False;


end;

procedure TfrCadProduto.cbGruposChange(Sender: TObject);
begin

    if xEditando = True then
    begin

     if dmDados.QueryProduto.Locate('CODIGO', edCodProduto.Text, []) then exit;

    end;


  if cbGrupos.ItemIndex < 0 then Exit;

  GeraCodigo; // gera codigo para o Produto de acordo coom o Grupo
end;

procedure TfrCadProduto.EdPesquisarChange(Sender: TObject);
begin
    // pesquisa dinamica na tabela Usuario
  dmDados.QueryProduto.SQL.Clear;
  dmDados.QueryProduto.SQL.Add('select * from PRODUTOS where');
  dmDados.QueryProduto.SQL.Add('(CODIGO LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryProduto.SQL.Add('or DESCRICAO LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryProduto.SQL.Add(')order by ID desc');
  dmDados.QueryProduto.Open;
end;

procedure TfrCadProduto.UniDbListGruposSelect(Sender: TObject);
begin
    if xEditando = True then Exit;
  GeraCodigo;
end;

procedure TfrCadProduto.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
var
  DestName : string;
  DestFolder : string;
  xCodProd :  string;
begin
//     DestFolder         := UniServerModule.StartPath+'files\Uploads\GRUPO\'+cbGrupos.Text+'\'+'Prod_'+edCodProduto.Text; // pasta dos arquivos
    DestFolder         := 'files\Uploads\GRUPO\'+cbGrupos.Text+'\'+'Prod_'+edCodProduto.Text;
    DestName           := DestFolder+ExtractFileName(UniFileUpload1.FileName);

    edFoto.Text := (DestName);
    CopyFile(PChar(AStream.FileName), PChar(DestName), False);
    UniImage1.Picture.LoadFromFile(AStream.FileName);
end;

procedure TfrCadProduto.UniFrameCreate(Sender: TObject);
begin
    dmDados.QueryGrupo.Open;
    EdPesquisarChange(Sender);
    btAlt.Enabled := dmDados.QueryProduto.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
    btExc.Enabled := dmDados.QueryProduto.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado


    PageCadastro.Pages[0].TabVisible := True  ;
    PageCadastro.Pages[1].TabVisible := False ;
    BtInc.Enabled := True;
    BtGrv.Enabled := False;
    BtCan.Enabled := False;
    PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
end;

procedure TfrCadProduto.UniFSButton1Click(Sender: TObject);
begin
   EdPesquisarChange(Sender);
end;


procedure TfrCadProduto.UniSweetAlert1Confirm(Sender: TObject);
  var xErro,vxUsuario, vexUsuario : String;
begin
   if xSoAlerta = True then exit;

   if xIncluindo then
   begin
     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add('insert into PRODUTOS (ID_GRUPO, CODIGO, DESCRICAO, COMPOSICAO, VALOR, FOTO, GRUPO )');
     dmDados.QueryAuxiliar.SQL.Add('values(:vID_GRUPO, :vCODIGO, :vDESCRICAO, :vCOMPOSICAO, :vVALOR, :vFOTO, :vGRUPO )');

     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[0].Value := dbcodGrupo.Text;

     dmDados.QueryAuxiliar.Params[1].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[1].Value := edCodProduto.Text;

     dmDados.QueryAuxiliar.Params[2].DataType := ftString;
     dmDados.QueryAuxiliar.Params[2].Value := edDescricao.Text;

     dmDados.QueryAuxiliar.Params[3].DataType := ftString;
     dmDados.QueryAuxiliar.Params[3].Value := edComposicao.Text;

     dmDados.QueryAuxiliar.Params[4].DataType := ftFloat;
     dmDados.QueryAuxiliar.Params[4].Value := StrToFloat( TiraStr( edValoProduto.Text, '.') );

     dmDados.QueryAuxiliar.Params[5].DataType := ftString;
     dmDados.QueryAuxiliar.Params[5].Value := edFoto.Text;

     dmDados.QueryAuxiliar.Params[6].DataType := ftString;
     dmDados.QueryAuxiliar.Params[6].Value := cbGrupos.Text;

     dmDados.QueryAuxiliar.ExecSQL( xErro );
     dmDados.QueryProduto.Close();
     dmDados.QueryProduto.Open();

     xIncluindo := False;

//     MainForm.RegistraLog('INCLUSÃO', 'INCLUSÃO DO USUÁRIO: '+UniNome.Text);    log

   end;
   if xEditando then
   begin
     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add('update PRODUTOS set ID_GRUPO=:vID_GRUPO, CODIGO=:vCODIGO, DESCRICAO=:vDESCRICAO,'
     +'COMPOSICAO=:vCOMPOSICAO, VALOR=:vVALOR, FOTO=:vFOTO, GRUPO=:vGRUPO where ID=:vID');

     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[0].Value := dbcodGrupo.Text;

     dmDados.QueryAuxiliar.Params[1].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[1].Value := edCodProduto.Text;

     dmDados.QueryAuxiliar.Params[2].DataType := ftString;
     dmDados.QueryAuxiliar.Params[2].Value := edDescricao.Text;

     dmDados.QueryAuxiliar.Params[3].DataType := ftString;
     dmDados.QueryAuxiliar.Params[3].Value := edComposicao.Text;

     dmDados.QueryAuxiliar.Params[4].DataType := ftFloat;
     dmDados.QueryAuxiliar.Params[4].Value := StrToFloat( TiraStr( edValoProduto.Text, '.') );

     dmDados.QueryAuxiliar.Params[5].DataType := ftString;
     dmDados.QueryAuxiliar.Params[5].Value := edFoto.Text;

     dmDados.QueryAuxiliar.Params[6].DataType := ftString;
     dmDados.QueryAuxiliar.Params[6].Value := cbGrupos.Text;

     dmDados.QueryAuxiliar.Params[7].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[7].Value := dmDados.QueryProdutoID.Value;

     dmDados.QueryAuxiliar.ExecSQL( xErro );
     dmDados.QueryProduto.Close();
     dmDados.QueryProduto.Open();
     xEditando := False;
   end;
   if xDeletando then
   begin
     vexUsuario := dmDados.QueryProdutoDESCRICAO.value;

     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add('delete from PRODUTOS where ID=:vID');
     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[0].Value :=  dmDados.QueryProdutoID.Value;

     dmDados.QueryAuxiliar.ExecSQL( xErro );

     dmDados.QueryProduto.Close();
     dmDados.QueryProduto.Open();
     xDeletando := False;

//     MainForm.RegistraLog('EXCLUSÃO', 'EXCLUÍDO DO USUÁRIO: '+vexUsuario);   log
   end;
end;

procedure TfrCadProduto.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := False;
end;

end.



