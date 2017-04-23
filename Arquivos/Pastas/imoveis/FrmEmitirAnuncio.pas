unit FrmEmitirAnuncio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, ZDataset, ZAbstractRODataset;

type
  TCAD_EmitirAnuncio = class(TForm)
    Btn_Imprimir: TBitBtn;
    Grid_Busca: TDBGrid;
    DS: TDataSource;
    ListRegistros: TListBox;
    DBMemo1: TDBMemo;
    procedure Btn_ImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
        SQLImovel: TZQuery;
        SQL1: TZQuery;
        WHERE: String;
        procedure pegaWhere();
        procedure incrementaContador();
    { Public declarations }
  end;

var
  CAD_EmitirAnuncio: TCAD_EmitirAnuncio;
  DATAS: TDataSource;
  QUERY: TZQuery;
  OBS: String;

implementation

uses FrmDM_ADMIN, unCamposBusca, FrmDM_Cadastro, unMsg, FrmPrincipal, FrmDM_REL,
  unINI, unWord, unUtilitario;

{$R *.dfm}

procedure TCAD_EmitirAnuncio.pegaWhere();
Var i: integer;
Begin
          WHERE := '';
          
          For i := 0 to ListRegistros.Items.Count - 1 Do
          Begin
               WHERE := WHERE + ' A.ID_IMOVEL = '+ ListRegistros.Items.Strings[i];

               If i < ListRegistros.Items.Count - 1 Then
               Where := Where + ' OR ';
          End;
End;

procedure TCAD_EmitirAnuncio.FormCreate(Sender: TObject);
Var I: integer;
begin
     SQLImovel := TZQuery.Create(self);
     SQL1 := TZQuery.Create(self);

     SQLImovel.Connection := PRINCIPAL.Conexao;
     SQL1.Connection := PRINCIPAL.Conexao;

     DS := TDataSource.Create(self);

     ListRegistros.Items := PRINCIPAL.SELECAO;

     pegaWhere();

     for I := 0 to ListRegistros.Count - 1 do
     Begin
          SQLImovel.Close;
          SQLImovel.SQL.Clear;
          SQLImovel.SQL.Add('select I.numero, I.dormitorios from imovel I where i.id_imovel = ' + ListRegistros.Items.Strings[I]);
          SQLImovel.Open;

          ListRegistros.Items.Strings[I] := 'Cód: '+ListRegistros.Items.Strings[I]+' Nº: '+SQLImovel.FieldByName('numero').AsString+' Dormitórios: '+ SQLImovel.FieldByName('dormitorios').AsString;
     end;
       
     SQLImovel.Close;
     SQLImovel.SQL.Clear;


  DS.DataSet := DM_ADMIN.Z_ANUNCIO;

  DM_ADMIN.Z_ANUNCIO.SQL.Clear;
  DM_ADMIN.Z_ANUNCIO.SQL.Add('select A.*,I.imprimir , I.id_imovel XCODIGO, I.numero XNUMERO, I.valor_venda XVALORVENDA, I.valor_aluquel XVALORALUGUEL, I.status XSTATUS, I.finalidade XFINALIDADE,'+' IT.nome XTIPO, ISU.nome XSUBTIPO from anuncio A left join imovel I on I.id_imovel = A.id_imovel left join logradouro L on L.id_logradouro = I.id_logradouro left join bairro B '+'on L.id_bairro = B.id_bairro left join imovel_tipo IT on IT.id_imovel_tipo = I.id_imovel_tipo left join imovel_subtipo ISU on ISU.id_imovel_subtipo = I.id_imovel_subtipo where (A.ativo = ''SIM'') AND (MEIO <> ''INTERNET'') and (' + Where + ') ORDER BY I.id_imovel');


  DM_ADMIN.Z_ANUNCIO.Open;

  DM_ADMIN.Z_ANUNCIO.Edit;
end;

procedure TCAD_EmitirAnuncio.Btn_ImprimirClick(Sender: TObject);
Var Escolha: String;
begin
     if MessageDlg('Deseja efetuar a emissão dos anúncios?', mtConfirmation,[mbYes, mbNo],0) = mrYes Then
     Begin
          try
          //LOG
             DM_ADMIN.Z_ANUNCIO.Edit;
             DM_ADMIN.Z_ANUNCIO.post;
             DM_ADMIN.Z_ANUNCIO.ApplyUpdates;
             DM_ADMIN.Z_ANUNCIO.refresh;
          except
                on e: Exception do
                Begin
                   unUtilitario.setMensagem('Erro ao salvar as alterações','erro');
                   exit;
                End;
          end;

          Escolha := InputBox('Escolha o tipo de relatório:','1-Normal'+#13+'2-Resumido' +#13+'3-Super Resumido'+#13+'4-Word','3');

          DM_REL.RV_IMPRESSAO.Close;

          principal.setLogo(DM_REL.RV_IMPRESSAO);
          DM_REL.RV_IMPRESSAO.SetParam('empresa', getConf('EMPRESA_FANTASIA'));

          if Escolha = '1' then
             DM_REL.RV_IMPRESSAO.ProjectFile := ExtractFilePath(ParamStr(0))+'REL\RV_ANUNCIO.rav'
          Else
          if Escolha = '2' then
             DM_REL.RV_IMPRESSAO.ProjectFile := ExtractFilePath(ParamStr(0))+'REL\RV_ANUNCIO_SIMPLES.rav'
          Else
          if Escolha = '3' then
          Begin
             DM_REL.RV_IMPRESSAO.ProjectFile := ExtractFilePath(ParamStr(0))+'REL\RV_15_ANUNCIO_SUPER_SIMPLES.rav';
          end
          Else
          if Escolha = '4' then
          Begin
               setWord(DM_ADMIN.Z_ANUNCIO,'- ANÚNCIOS -');
          End;

          DM_REL.RV_Query.DataSet := DM_ADMIN.Z_ANUNCIO;
          OBS := Trim(InputBox('- Observação Personalizada -','Escreva uma OBS personalizada para ser impressa junto com o relatório:',''));
          DM_REL.RV_IMPRESSAO.SetParam('OBS', OBS);
          setRave(1,'',OBS);


          if unUtilitario.setMensagem('Deseja que o sistema ACOMPANHE essa impressão dos anúncios?'+#13+'O sistema vai gravar um log dessa impressão.','confirma') = IDYES Then
             incrementaContador();

          //Volta ao estado de ativo, mesmo se o usuário colocou para não sair no relatório.
          DM_ADMIN.Z_ANUNCIO.First;
          while NOT DM_ADMIN.Z_ANUNCIO.Eof do
          Begin
               DM_ADMIN.Z_ANUNCIO.Edit;
               DM_ADMIN.Z_ANUNCIO.FieldByName('ATIVO').AsString := 'SIM';
               DM_ADMIN.Z_ANUNCIO.FieldByName('DATA_FIM').AsDateTime := Date();
               DM_ADMIN.Z_ANUNCIO.Post;
               DM_ADMIN.Z_ANUNCIO.ApplyUpdates;
               DM_ADMIN.Z_ANUNCIO.Next;
          end;

     End;
end;

procedure TCAD_EmitirAnuncio.incrementaContador();
Var varSQL: TZQuery;
Begin

     if DM_ADMIN.Z_ANUNCIO.Active Then
     Begin
          DM_ADMIN.Z_ANUNCIO.First;
          
          while NOT DM_ADMIN.Z_ANUNCIO.Eof do
          Begin
               varSQL := unUtilitario.getSQL('INSERT INTO LOG (ACAO, COMPONENTE, DATA, ID_FUNC, ID_CONTA, OBS, ATIVO) VALUES (''LOG'', ''ANUNCIO'', current_timestamp, '+getUser('CODIGO_USUARIO')+', '+DM_ADMIN.Z_ANUNCIO.FieldByName('ID_IMOVEL').AsString+', '''+OBS+'-'+DM_ADMIN.Z_ANUNCIO.FieldByName('ID_ANUNCIO').AsString+''', ''SIM'')');
               varSQL.ApplyUpdates;

               DM_ADMIN.Z_ANUNCIO.Next;
          End;
          FreeAndNil(varSQL);
     End;

End;

end.
