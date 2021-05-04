unit uFrCadGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniSweetAlert, uniScreenMask, uniLabel,
  uniPanel, uniScrollBox, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  UniFSButton, uniEdit, uniPageControl, uniGUIBaseClasses, uniImageList,
  Data.DB, uniRadioGroup, uniDBText, uniMemo, uniDBEdit, uniFileUpload, UniFSiGrowl,
  uniMultiItem, uniListBox, UniFSToast, uniComboBox, UniFSCombobox,
  uniCheckBox, uniDateTimePicker, uniSpinEdit,
  frxClass, frxDBSet, frxGradient, frxExportBaseDialog, frxExportPDF,
  uniGroupBox, uniImage;

type
  TfrCadGrupo = class(TUniFrame)
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
    frameFornec: TUniDBGrid;
    edDescricao: TUniEdit;
    lbDescricao: TUniLabel;
    edNome: TUniEdit;
    lbNome: TUniLabel;
    UniSweetAlert1: TUniSweetAlert;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    cpImagem: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniImage1: TUniImage;
    UniFileUploadButton1: TUniFileUploadButton;
    UniLabel4: TUniLabel;
    edFoto: TUniEdit;
    lbFoto: TUniLabel;
    sbExcluir: TUniFSButton;
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
    procedure UniFileUploadButton1Completed(Sender: TObject;
      AStream: TFileStream);
    procedure sbExcluirClick(Sender: TObject);
    procedure edNomeExit(Sender: TObject);

  private
    { Private declarations }
    xIncluindo, xDeletando, xEditando, xSoAlerta, xSalvando, xAprovar, xRecusar : Boolean;
    procedure deletaImagem; // Deleta Imagens do Upload

  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses  ServerModule, Main, uDados;

procedure TfrCadGrupo.BtAltClick(Sender: TObject);
begin
    xSoAlerta := False;
    xIncluindo := False;
    xEditando := True;
    xDeletando := False;

          // ler imagem quando editar
   Try
    UniImage1.Picture := nil;
    cpImagem.Visible := True;
    UniImage1.Picture.LoadFromFile( dmDados.QueryGrupoFOTO.AsString );
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

    edNome.Text := dmDados.QueryGrupoNOME.Value;
    edDescricao.Text := dmDados.QueryGrupoDESCRICAO.Value;
    edFoto.Text := dmDados.QueryGrupoFOTO.Value;

end;

procedure TfrCadGrupo.deletaImagem; // Deleta Imagens do Upload
 var
  DestName : string;
  DestFolder : string;
  xCodProd :  string;
begin
//     DestFolder         := UniServerModule.StartPath+'files\Uploads\GRUPO\'+cbGrupos.Text+'\'+'Prod_'+edCodProduto.Text; // pasta dos arquivos
  DestFolder         := 'files\Uploads\GRUPO\'+edNome.Text+'\'+'GRUPO_';
  DestName           := DestFolder+ExtractFileName(UniFileUploadButton1.FileName);


    try
      deletefile(DestFolder+ExtractFileName(UniFileUploadButton1.FileName));
      deletefile(dmDados.QueryGrupoFOTO.AsString); // deleta pela query
      edFoto.Text := '';
      UniImage1.Picture := nil;
      exit;
    except
      ShowMessage('Erro ao carregar or arquivo...');

    end;

end;

procedure TfrCadGrupo.edNomeExit(Sender: TObject);
begin
    if not DirectoryExists(UniServerModule.StartPath+'files\Uploads\GRUPO\'+edNome.Text+'\' ) then   // cria pasta para envio de arquivos direcionado pelo numero do processo
  CreateDir(UniServerModule.StartPath+'files\Uploads\GRUPO\'+edNome.Text+'\'   );

  if edNome.Text = '' then
  begin

    cpImagem.Visible := False;
    Exit;

  end
  else
  begin

    cpImagem.Visible := TRue;
    Exit;

  end;


end;

procedure TfrCadGrupo.BtCanClick(Sender: TObject);
begin
  if edNome.Text = '' then
  begin
    cpImagem.Visible := False;

  end;

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

   dmDados.QueryGrupo.Close();
   dmDados.QueryGrupo.Open();
//
   btAlt.Enabled := dmDados.QueryGrupo.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
   btExc.Enabled := dmDados.QueryGrupo.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado

end;

procedure TfrCadGrupo.BtExcClick(Sender: TObject);
begin
  //  Confirmacao da exclusao com SweetAlert1
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := True;

  UniSweetAlert1.Title := 'Deseja excluir esse Grupo ?';
  UniSweetAlert1.AlertType := atError;
  UniSweetAlert1.ShowConfirmButton := True;
  UniSweetAlert1.ConfirmButtonText := 'Sim';
  UniSweetAlert1.ShowCancelButton := True;
  UniSweetAlert1.CancelButtonText := 'Não';
  UniSweetAlert1.Show(dmDados.QueryGrupoNOME.Value);

end;

procedure TfrCadGrupo.BtGrvClick(Sender: TObject);
begin


     //  usando  SweetAlert1
       if edNome.Text = '' then
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


     //  Salvando com SweetAlert1
    xSoAlerta := False;
    UniSweetAlert1.Title := 'Deseja salvar o Grupo?';
    UniSweetAlert1.AlertType := atQuestion;
    UniSweetAlert1.ShowConfirmButton := True;
    UniSweetAlert1.ConfirmButtonText := 'Sim';
    UniSweetAlert1.ShowCancelButton := True;
    UniSweetAlert1.CancelButtonText := 'Não';
    UniSweetAlert1.Show( edNome.Text );

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

procedure TfrCadGrupo.BtIncClick(Sender: TObject);
begin
   
  xSoAlerta := False;
  xIncluindo := True;
  xEditando := False;

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
  edNome.Text := '';
  edDescricao.Text := '';
  edFoto.Text := '';

  cpnPesquisa.Visible := False;

end;

procedure TfrCadGrupo.EdPesquisarChange(Sender: TObject);
begin
    // pesquisa dinamica na tabela Usuario
  dmDados.QueryGrupo.SQL.Clear;
  dmDados.QueryGrupo.SQL.Add('select * from GRUPOS where');
  dmDados.QueryGrupo.SQL.Add('(NOME LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryGrupo.SQL.Add('or DESCRICAO LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.QueryGrupo.SQL.Add(')order by ID desc');
  dmDados.QueryGrupo.Open;
end;

procedure TfrCadGrupo.sbExcluirClick(Sender: TObject);
begin
 deletaImagem; // Deleta Imagens do Upload
end;

procedure TfrCadGrupo.UniFileUploadButton1Completed(Sender: TObject;
  AStream: TFileStream);
  var
  DestName : string;
  DestFolder : string;
  xCodProd :  string;
begin
//     DestFolder         := UniServerModule.StartPath+'files\Uploads\GRUPO\'+cbGrupos.Text+'\'+'Prod_'+edCodProduto.Text; // pasta dos arquivos
    DestFolder         := 'files\Uploads\GRUPO\'+edNome.Text+'\'+'GRUPO_';
    DestName           := DestFolder+ExtractFileName(UniFileUploadButton1.FileName);

    edFoto.Text := (DestName);
    CopyFile(PChar(AStream.FileName), PChar(DestName), False);
    UniImage1.Picture.LoadFromFile(AStream.FileName);
end;

procedure TfrCadGrupo.UniFrameCreate(Sender: TObject);
begin
    dmDados.QueryGrupo.Open;
    btAlt.Enabled := dmDados.QueryGrupo.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado
    btExc.Enabled := dmDados.QueryGrupo.RecordCount > 0; // ferifica se tem registro/ se nao => ele deixa ele desabilitado


    PageCadastro.Pages[0].TabVisible := True  ;
    PageCadastro.Pages[1].TabVisible := False ;
    BtInc.Enabled := True;
    BtGrv.Enabled := False;
    BtCan.Enabled := False;
    PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
end;

procedure TfrCadGrupo.UniFSButton1Click(Sender: TObject);
begin
 EdPesquisarChange(Sender);
end;

procedure TfrCadGrupo.UniSweetAlert1Confirm(Sender: TObject);
  var xErro,vxUsuario, vexUsuario : String;
begin
   if xSoAlerta = True then exit;

   if xIncluindo then
   begin
     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add(' insert into GRUPOS (NOME, DESCRICAO, FOTO)');
     dmDados.QueryAuxiliar.SQL.Add(' values (:vNOME, :vDESCRICAO, :vFOTO )');

     dmDados.QueryAuxiliar.Params[0].DataType := ftString;
     dmDados.QueryAuxiliar.Params[0].Value := edNome.Text;
     dmDados.QueryAuxiliar.Params[1].DataType := ftString;
     dmDados.QueryAuxiliar.Params[1].Value := edDescricao.Text;
     dmDados.QueryAuxiliar.Params[2].DataType := ftString;
     dmDados.QueryAuxiliar.Params[2].Value := edFoto.Text;


     dmDados.QueryAuxiliar.ExecSQL( xErro );
     dmDados.QueryGrupo.Close();
     dmDados.QueryGrupo.Open();
     xIncluindo := False;

//     MainForm.RegistraLog('INCLUSÃO', 'INCLUSÃO DO USUÁRIO: '+UniNome.Text);    log

   end;
   if xEditando then
   begin
     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add('update GRUPOS set NOME=:vNOME, DESCRICAO=:vDESCRICAO, FOTO=:vFOTO where ID=:vID');

     dmDados.QueryAuxiliar.Params[0].DataType := ftString;
     dmDados.QueryAuxiliar.Params[0].Value := edNome.Text;
     dmDados.QueryAuxiliar.Params[1].DataType := ftString;
     dmDados.QueryAuxiliar.Params[1].Value := edDescricao.Text;
     dmDados.QueryAuxiliar.Params[2].DataType := ftString;
     dmDados.QueryAuxiliar.Params[2].Value := edFoto.Text;
     dmDados.QueryAuxiliar.Params[3].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[3].Value := dmDados.QueryGrupoID.Value;

     dmDados.QueryAuxiliar.ExecSQL( xErro );
     dmDados.QueryGrupo.Close();
     dmDados.QueryGrupo.Open();
     xEditando := False;
   end;
   if xDeletando then
   begin
     vexUsuario := dmDados.QueryUsuarioNOME.value;

     dmDados.QueryAuxiliar.Close;
     dmDados.QueryAuxiliar.SQL.Clear;
     dmDados.QueryAuxiliar.SQL.Add('delete from GRUPOS where ID=:vID');
     dmDados.QueryAuxiliar.Params[0].DataType := ftInteger;
     dmDados.QueryAuxiliar.Params[0].Value :=  dmDados.QueryGrupoID.Value;

     dmDados.QueryAuxiliar.ExecSQL( xErro );

     dmDados.QueryGrupo.Close();
     dmDados.QueryGrupo.Open();
     xDeletando := False;

//     MainForm.RegistraLog('EXCLUSÃO', 'EXCLUÍDO DO USUÁRIO: '+vexUsuario);   log
   end;



end;

procedure TfrCadGrupo.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin
  deletaImagem; // Deleta Imagens do Upload
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := False;
end;

end.



