unit unImagem;

interface

uses ExtCtrls, Dialogs, Controls, Windows, JPEG,
     Messages, SysUtils, Variants, Classes, Graphics, Forms, ZDataset;


Function getImagem(COMPONENTE: TImage; IMAGEM: string): string;
Function setImagem(REF: Char; COD: string): string;
Function deletaImagem(IMAGEM: string): string;
Function verificaCensura(foto: String): Boolean;
Function trocaCensura(foto: String): String;
Procedure ResizeImage(FileName: string; MaxWidth: Integer; Destino, Nome: String);
procedure alinhaImagens();
procedure confereImagem(imagem:String);
procedure galeriaPostal(id: string);
procedure elaboraXML(listaFoto, listaDescricao: TStringList; tipo: String);
procedure galeriaSimples(id: string);
procedure galeriaMural(id: string);
procedure galeriaSlide(id: string);
procedure recuperaImagem();

type
TRGBArray = array[Word] of TRGBTriple;
pRGBArray = ^TRGBArray;

implementation

uses FrmPrincipal, unMsg, unINI, unUtilitario, FrmImagem;

Function verificaCensura(foto: String): Boolean;
Begin
     if foto <> 'X_Foto.jpg' then
     Begin
         if Pos('%',foto) > 0 then
            Result := true //NÃO PODE MOSTRAR A FOTO
         else
             Result := false; //PODE MOSTRAR A FOTO
     end
     else
         Result := false;
End;

Function trocaCensura(foto: String): String;
Begin
     if foto <> 'X_Foto.jpg' then
         if FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+foto) then
              if verificaCensura(foto) then //TEM CENSURA
              Begin
                   RenameFile('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+foto, '\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+StringReplace(foto,'%','',[rfReplaceAll]));
                   Result := StringReplace(foto,'%','',[rfReplaceAll]);
              end
              Else
              Begin //NÃO TEM CENSURA
                    RenameFile('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+foto, '\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+StringReplace(foto,'.jpg','%.jpg',[rfReplaceAll,rfIgnoreCase]));
                    Result := StringReplace(foto,'.jpg','%.jpg',[rfReplaceAll,rfIgnoreCase]);
              end;
end;

procedure galeriaMural(id: string);
var varSql: TZQuery;
    imagens, descricao: TStringList;
Begin
     if verificaStringInt(id) then
     begin
          varSql := unUtilitario.getSelect('select case when ic.foto1 containing ''%'' then ''X_Foto.jpg'' else ic.foto1 end as foto1, case when ic.foto2 containing ''%'' then ''X_Foto.jpg'' else ic.foto2 end as foto2,'+' case when ic.foto3 containing ''%'' then ''X_Foto.jpg'' else ic.foto3 end as foto3, c.nome from imovel_caracteristica ic '+
          ' inner join caracteristicas c on c.id_caracteristicas = ic.id_caracteristica'+
          ' where ic.tipo <> ''VISTORIA'' and ic.id_imovel = '+id);

          imagens := TStringList.Create;
          descricao := TStringList.Create;

          while not varSql.Eof do
          Begin
               if varSql.FieldByName('FOTO1').AsString <> 'X_Foto.jpg' then
               Begin
                    imagens.Add(varSql.FieldByName('FOTO1').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               if varSql.FieldByName('FOTO2').AsString <> 'X_Foto.jpg' then
               begin
                    imagens.Add(varSql.FieldByName('FOTO2').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               if varSql.FieldByName('FOTO3').AsString <> 'X_Foto.jpg' then
               begin
                    imagens.Add(varSql.FieldByName('FOTO3').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               varSql.Next;
          end;

          elaboraXML(imagens, descricao, 'mural');

          if varSql <> NIL then
             FreeAndNil(varSQL);
     end
     else
         unUtilitario.setMensagem('Nenhuma imagem foi encontrada para o código '+id,'erro');
end;

procedure galeriaSimples(id: string);
var varSql: TZQuery;
    imagens, descricao: TStringList;
Begin
     if verificaStringInt(id) then
     begin
          varSql := unUtilitario.getSelect('select ic.foto1, ic.foto2, ic.foto3, c.nome from imovel_caracteristica ic '+
          ' inner join caracteristicas c on c.id_caracteristicas = ic.id_caracteristica'+
          ' where ic.tipo <> ''VISTORIA'' and ic.id_imovel = '+id);

          imagens := TStringList.Create;
          descricao := TStringList.Create;

          while not varSql.Eof do
          Begin
               if varSql.FieldByName('FOTO1').AsString <> 'X_Foto.jpg' then
               Begin
                    imagens.Add(varSql.FieldByName('FOTO1').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               if varSql.FieldByName('FOTO2').AsString <> 'X_Foto.jpg' then
               begin
                    imagens.Add(varSql.FieldByName('FOTO2').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               if varSql.FieldByName('FOTO3').AsString <> 'X_Foto.jpg' then
               begin
                    imagens.Add(varSql.FieldByName('FOTO3').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               varSql.Next;
          end;

          elaboraXML(imagens, descricao, 'simples');

          if varSql <> NIL then
             FreeAndNil(varSQL);
     end
     else
         unUtilitario.setMensagem('Nenhuma imagem foi encontrada para o código '+id,'erro');
end;

procedure galeriaSlide(id: string);
var varSql: TZQuery;
    imagens, descricao: TStringList;
Begin
     if verificaStringInt(id) then
     begin
          varSql := unUtilitario.getSelect('select case when ic.foto1 containing ''%'' then ''X_Foto.jpg'' else ic.foto1 end as foto1, case when'+' ic.foto2 containing ''%'' then ''X_Foto.jpg'' else ic.foto2 end as foto2, case when ic.foto3 containing ''%'' then ''X_Foto.jpg'' else ic.foto3 end as foto3, c.nome from imovel_caracteristica ic '+
          ' inner join caracteristicas c on c.id_caracteristicas = ic.id_caracteristica'+
          ' where ic.tipo <> ''VISTORIA'' and ic.id_imovel = '+id);

          imagens := TStringList.Create;
          descricao := TStringList.Create;

          while not varSql.Eof do
          Begin
               if varSql.FieldByName('FOTO1').AsString <> 'X_Foto.jpg' then
               Begin
                    imagens.Add(varSql.FieldByName('FOTO1').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               if varSql.FieldByName('FOTO2').AsString <> 'X_Foto.jpg' then
               begin
                    imagens.Add(varSql.FieldByName('FOTO2').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               if varSql.FieldByName('FOTO3').AsString <> 'X_Foto.jpg' then
               begin
                    imagens.Add(varSql.FieldByName('FOTO3').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               varSql.Next;
          end;

          elaboraXML(imagens, descricao, 'slide');

          if varSql <> NIL then
             FreeAndNil(varSQL);
     end
     else
         unUtilitario.setMensagem('Nenhuma imagem foi encontrada para o código '+id,'erro');
end;

procedure galeriaPostal(id: string);
var varSql: TZQuery;
    imagens, descricao: TStringList;
Begin
     if verificaStringInt(id) then
     begin
          varSql := unUtilitario.getSelect('select case when ic.foto1 containing ''%'' then ''X_Foto.jpg'' else ic.foto1 end as foto1, case when ic.foto2 containing ''%'' then ''X_Foto.jpg'' else'+' ic.foto2 end as foto2, case when ic.foto3 containing ''%'' then ''X_Foto.jpg'' else ic.foto3 end as foto3, c.nome from imovel_caracteristica ic '+
          ' inner join caracteristicas c on c.id_caracteristicas = ic.id_caracteristica'+
          ' where ic.tipo <> ''VISTORIA'' and ic.id_imovel = '+id);

          imagens := TStringList.Create;
          descricao := TStringList.Create;

          while not varSql.Eof do
          Begin
               if varSql.FieldByName('FOTO1').AsString <> 'X_Foto.jpg' then
               Begin
                    imagens.Add(varSql.FieldByName('FOTO1').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               if varSql.FieldByName('FOTO2').AsString <> 'X_Foto.jpg' then
               begin
                    imagens.Add(varSql.FieldByName('FOTO2').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               if varSql.FieldByName('FOTO3').AsString <> 'X_Foto.jpg' then
               begin
                    imagens.Add(varSql.FieldByName('FOTO3').AsString);
                    descricao.add(RemoveAcentos(varSql.FieldByName('NOME').AsString));
               end;

               varSql.Next;
          end;

          elaboraXML(imagens, descricao, 'postal');

          if varSql <> NIL then
             FreeAndNil(varSQL);
     end
     else
         unUtilitario.setMensagem('Nenhuma imagem foi encontrada para o código '+id,'erro');
end;

procedure elaboraXML(listaFoto, listaDescricao: TStringList; tipo: String);
var i: integer;
    NomeDoArquivo: string;
    Arquivo: TextFile;
Begin

     if tipo = 'postal' then
        NomeDoArquivo := ExtractFilePath(ParamStr(0))+'REL\postal\gallery.xml';

     if tipo = 'simples' then
        NomeDoArquivo := ExtractFilePath(ParamStr(0))+'REL\simples\gallery.xml';

     if tipo = 'mural' then
        NomeDoArquivo := ExtractFilePath(ParamStr(0))+'REL\mural\gallery.xml';

     if tipo = 'slide' then
        NomeDoArquivo := ExtractFilePath(ParamStr(0))+'REL\slide\gallery.xml';

  AssignFile(Arquivo, NomeDoArquivo);

  //if FileExists(NomeDoArquivo) then
  //   Append(arquivo) { se existir, apenas adiciona linhas }
  //else

  ReWrite(arquivo); { cria um novo se não existir }

  try
      //TOPO
      WriteLn(arquivo,'<?xml version="1.0" encoding="UTF-8" ?>');

      if tipo = 'postal' then
         WriteLn(arquivo,'<gallery cellDimension="850" columns="4" zoomOutPerc="25" zoomInPerc="100" frameWidth="20" frameColor="0xFFFFFF" captionColor="0xFFFFFF" enableRightClickOpen="true" >');

      if tipo = 'simples' then //Está dando pau...
         WriteLn(arquivo,'<simpleviewergallery maxImageWidth="600" maxImageHeight="500" textColor="0xFFFFFF" frameColor="0xFFFFFF" frameWidth="20" stagePadding="40" navPadding="40" thumbnailColumns="3" thumbnailRows="3" navPosition="left" vAlign="center" hAlign="center" title="'+getConf('EMPRESA_FANTASIA')+'" enableRightClickOpen="true" backgroundImagePath="" imagePath="" thumbPath="">');

      if tipo = 'mural' then
         WriteLn(arquivo,'<tiltviewergallery> <photos>');

      if tipo = 'slide' then
         WriteLn(arquivo,'<gallery frameColor="0xFFFFFF" frameWidth="15" imagePadding="20" displayTime="6" enableRightClickOpen="true">');


      //DADOS
      if tipo = 'postal' then
        for I := 0 to listaFoto.Count - 1 do
        begin
             WriteLn(arquivo,'<image> <url>file://///'+getUser('SERVIDOR')+'/imobiliaria/IMG/IMOVEL/'+listaFoto[i]+'</url> <caption>'+listaDescricao[i]+'</caption> </image>');
        end;

      if tipo = 'simples' then
        for I := 0 to listaFoto.Count - 1 do
        begin
             WriteLn(arquivo,'<image> <filename>file://///'+getUser('SERVIDOR')+'/imobiliaria/IMG/IMOVEL/'+listaFoto[i]+'</filename> <caption>'+listaDescricao[i]+'</caption> </image>');
        end;

      if tipo = 'mural' then
        for I := 0 to listaFoto.Count - 1 do
        begin
             WriteLn(arquivo,'<photo imageurl="file://///'+getUser('SERVIDOR')+'/imobiliaria/IMG/IMOVEL/'+listaFoto[i]+'" linkurl="http://'+getConf('EMPRESA_HOMEPAGE')+'"> <title>'+listaDescricao[i]+'</title> </photo>');
        end;

      if tipo = 'slide' then
        for I := 0 to listaFoto.Count - 1 do
        begin
             WriteLn(arquivo,'<image> <url>file://///'+getUser('SERVIDOR')+'/imobiliaria/IMG/IMOVEL/'+listaFoto[i]+'</url> <caption>'+listaDescricao[i]+'</caption> <width>700</width> <height>525</height> </image>');
        end;



        
      //RODAPE
      if tipo = 'postal' then
         WriteLn(arquivo,'</gallery>');

      if tipo = 'simples' then
         WriteLn(arquivo,'</simpleviewergallery>');

      if tipo = 'mural' then
         WriteLn(arquivo,'</photos> </tiltviewergallery>');

      if tipo = 'slide' then
         WriteLn(arquivo,'</gallery>');
         
  finally
         CloseFile(arquivo);
  end;
  
end;


procedure alinhaImagens();
var varSQL: TZQuery;
Begin

     PRINCIPAL.setMensagem('REALIZANDO MANUTENÇÃO DE IMAGENS DE IMÓVEIS NO BANCO, AGUARDE...');

     varSQL := unUtilitario.getSQL('update imovel_caracteristica ic set ic.foto1 = ''X_Foto.jpg'' where ic.foto1 is null');
     varSQL.ExecSQL;

     varSQL := unUtilitario.getSQL('update imovel_caracteristica ic set ic.foto2 = ''X_Foto.jpg'' where ic.foto2 is null');
     varSQL.ExecSQL;

     varSQL := unUtilitario.getSQL('update imovel_caracteristica ic set ic.foto3 = ''X_Foto.jpg'' where ic.foto3 is null');
     varSQL.ExecSQL;

     varSQL := unUtilitario.getSelect('select * from imovel_caracteristica');

     while not varSQL.Eof do
     Begin
          if varSQL.FieldByName('FOTO1').AsString <> 'X_Foto.jpg'  then
             confereImagem(varSQL.FieldByName('FOTO1').AsString);

          if varSQL.FieldByName('FOTO2').AsString <> 'X_Foto.jpg'  then
             confereImagem(varSQL.FieldByName('FOTO2').AsString);

          if varSQL.FieldByName('FOTO3').AsString <> 'X_Foto.jpg'  then
             confereImagem(varSQL.FieldByName('FOTO3').AsString);

          varSQL.Next;
     end;

     PRINCIPAL.setMensagem('MANUTENÇÃO DE IMAGEM CONCLUÍDA!');

     if varSQL <> nil then
        FreeAndNil(varSQL);
End;

procedure confereImagem(imagem:String);
var varSQL: TZQuery;
Begin

if FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\DIVERSO\X_Foto.jpg') then
Begin
     if NOT FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+imagem) then
     Begin
          varSQL := unUtilitario.getSQL('update imovel_caracteristica ic set ic.foto1 = ''X_Foto.jpg'' where ic.foto1 = '''+imagem+''' ');
          varSQL.ExecSQL;

          varSQL := unUtilitario.getSQL('update imovel_caracteristica ic set ic.foto2 = ''X_Foto.jpg'' where ic.foto2 = '''+imagem+''' ');
          varSQL.ExecSQL;

          varSQL := unUtilitario.getSQL('update imovel_caracteristica ic set ic.foto3 = ''X_Foto.jpg'' where ic.foto3 = '''+imagem+''' ');
          varSQL.ExecSQL;
     end;

     if varSQL <> nil then
        FreeAndNil(varSQL);
end;
end;


procedure recuperaImagem();
var varSQL1: TZQuery;
    varSQL2: TZQuery;
    varSQL3: TZQuery;
    IMAGEM, IMAGEM1, IMAGEM2, IMAGEM3: String;
    temImg: Boolean;
Begin

     PRINCIPAL.setMensagem('RECUPERAÇÃO DE FOTOS EM ANDAMENTO...');

     varSQL1 := unUtilitario.getSelect('select id_imovel from IMOVEL where ativo = ''SIM'' order by id_imovel ');
     varSQL2 := unUtilitario.getSelect('select id_caracteristicas from caracteristicas order by id_caracteristicas ');

     while not varSQL1.Eof do
     Begin
          while not varSQL2.Eof do
          Begin

               IMAGEM := 'I_'+varSQL1.FieldByName('id_imovel').AsString+'_'+varSQL2.FieldByName('id_caracteristicas').AsString;
               temImg := False;

               if FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+IMAGEM+'_1.jpg') then
               Begin
                  IMAGEM1 := IMAGEM+'_1.jpg';
                  temImg := True;
               end
               else
                   IMAGEM1 := 'X_Foto.jpg';

               if FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+IMAGEM+'_2.jpg') then
               Begin
                  IMAGEM2 := IMAGEM+'_2.jpg';
                  temImg := True;
               end
               else
                   IMAGEM2 := 'X_Foto.jpg';

               if FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+IMAGEM+'_3.jpg') then
               Begin
                  IMAGEM3 := IMAGEM+'_3.jpg';
                  temImg := True;
               end
               else
                   IMAGEM3 := 'X_Foto.jpg';


               if temImg then
               Begin
                    varSQL3 := unUtilitario.getSQL('INSERT INTO IMOVEL_CARACTERISTICA VALUES (NULL, '+varSQL1.FieldByName('id_imovel').AsString+', '+varSQL2.FieldByName('id_caracteristicas').AsString+', '''+IMAGEM1+''', '''+IMAGEM2+''', '''+IMAGEM3+''', 1, ''RECUPERAÇÃO DE FOTOS'',NULL, ''NORMAL'', current_date); ');
                    //varSQL3.CommitUpdates;
               end;

               varSQL2.Next;
          end;

          varSQL2.First;
          varSQL1.Next;
     end;

     //FreeAndNil(varSQL3);
     //varSQL2.close;
     FreeAndNil(varSQL2);
     //varSQL1.close;
     FreeAndNil(varSQL1);
     PRINCIPAL.setMensagem('RECUPERAÇÃO DE IMAGEM CONCLUÍDA!');

end;

{ FUNÇÃO ANTIGA, ONDE RECUPERAVA SÓ O QUE TINHA NA TABELA DE IMG.
procedure recuperaImagem();
var varSQL1: TZQuery;
    varSQL2: TZQuery;
    IMAGEM: String;
Begin

     PRINCIPAL.setMensagem('RECUPERAÇÃO DE FOTOS EM ANDAMENTO...');

     varSQL1 := unUtilitario.getSelect('select * from IMOVEL_CARACTERISTICA order by ID_MOVEL_CARACTERISTICA');

     while not varSQL1.Eof do
     Begin
          IMAGEM := 'I_'+varSQL1.FieldByName('ID_IMOVEL').AsString+'_'+varSQL1.FieldByName('ID_CARACTERISTICA').AsString;
          
          if FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+IMAGEM+'_1.jpg') then
             varSQL2 := unUtilitario.getSQL('update IMOVEL_CARACTERISTICA set FOTO1 = '''+IMAGEM+'_1.jpg'' where ID_MOVEL_CARACTERISTICA = '+varSQL1.FieldByName('ID_MOVEL_CARACTERISTICA').AsString);

          if FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+IMAGEM+'_2.jpg') then
             varSQL2 := unUtilitario.getSQL('update IMOVEL_CARACTERISTICA set FOTO2 = '''+IMAGEM+'_2.jpg'' where ID_MOVEL_CARACTERISTICA = '+varSQL1.FieldByName('ID_MOVEL_CARACTERISTICA').AsString);

          if FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+IMAGEM+'_3.jpg') then
             varSQL2 := unUtilitario.getSQL('update IMOVEL_CARACTERISTICA set FOTO3 = '''+IMAGEM+'_3.jpg'' where ID_MOVEL_CARACTERISTICA = '+varSQL1.FieldByName('ID_MOVEL_CARACTERISTICA').AsString);

          varSQL1.Next;
     End;

     FreeAndNil(varSQL2);
     FreeAndNil(varSQL1);
     PRINCIPAL.setMensagem('RECUPERAÇÃO DE IMAGEM CONCLUÍDA!');
end; }


Function getImagem(COMPONENTE: TImage; IMAGEM: string): string;
//PEGA IMAGEM DE UM ENDEREÇO E MOSTRA EM UM COMPONENTE DE IMAGEM
Var REF: Char;
    X: integer;
Begin

TRY
     REF := 'X';

     For X := 1 to Length(IMAGEM) do
     Begin
          If IMAGEM[X] <> '_' Then
          Begin
             REF := IMAGEM[X];
          End
          Else
               Break;

     End;

               Case REF of
                    'P':
                        Begin
                             If FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\PESSOA\'+IMAGEM) Then
                                COMPONENTE.Picture.LoadFromFile('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\PESSOA\'+IMAGEM)
                             Else
                                 COMPONENTE.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'REL\X_Foto_Perdida.jpg');
                             Result := 'Concluído!';
                        End;
                    'I':
                        Begin
                             If FileExists('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+IMAGEM) Then
                                COMPONENTE.Picture.LoadFromFile('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\'+IMAGEM)
                             Else
                                 COMPONENTE.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'REL\X_Foto_Perdida.jpg');
                             Result := 'Concluído!';
                        End;
                    'C':
                        Begin
                             //Continuar com os IF's aqui também
                             COMPONENTE.Picture.LoadFromFile('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\CONTRATO\'+IMAGEM);
                             Result := 'Concluído!';
                        End;
                    'G':
                        Begin
                             COMPONENTE.Picture.LoadFromFile('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\GARANTIA\'+IMAGEM);
                             Result := 'Concluído!';
                        End;
                    Else
                        Begin
                             If UpperCase(IMAGEM) <> 'X_FOTO.JPG' Then
                                COMPONENTE.Picture.LoadFromFile('\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\DIVERSO\'+IMAGEM)
                             Else
                                 COMPONENTE.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'REL\X_Foto.jpg');
                             Result := 'Concluído!';
                        End;
               End;
except
      PRINCIPAL.setMensagem('O sistema NÃO encontrou a imagem "'+IMAGEM+'" que foi requisitada pelo registro.');
end;
End;

Function setImagem(REF: Char; COD: string): string;
//BUSCA UMA IMAGEM, GRAVA NO SERVIDOR E RETORNA O NOVO NOME
VAR ARQUIVO: string;
Begin

     PRINCIPAL.Imagem.FileName := '';
     PRINCIPAL.Imagem.Execute;

     If Length(Trim(Principal.Imagem.FileName)) > 0 Then
     Begin
               ARQUIVO := Principal.Imagem.FileName;

               Case REF of
                    'P':
                        Begin
                             Try
                                ResizeImage(ARQUIVO, 800, '\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\PESSOA\', UpCase(REF)+'_'+COD+'.JPG');
                                Result := 'P_'+COD+'.JPG';
                             except
                                unMsg.ERRO(16);
                                Result := 'X_Foto.jpg';
                             end;
                        End;

                    'I':
                        Begin

                             try
                                ResizeImage(ARQUIVO, 800, '\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\IMOVEL\', UpCase(REF)+'_'+COD+'.JPG');
                                Result := 'I_'+COD+'.JPG';
                             except
                                unMsg.ERRO(16);
                                Result := 'X_Foto.jpg';
                             end;
                        End;

                    'C':
                        Begin

                             try
                                ResizeImage(ARQUIVO, 800, '\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\CONTRATO\', UpCase(REF)+'_'+COD+'.JPG');
                                Result := 'C_'+COD+'.JPG';
                             except
                                unMsg.ERRO(16);
                                Result := 'X_Foto.jpg';
                             end;
                        End;

                    'G':
                        Begin

                             try
                                ResizeImage(ARQUIVO, 800, '\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\GARANTIA\', UpCase(REF)+'_'+COD+'.JPG');
                                Result := 'G_'+COD+'.JPG';
                             except
                                unMsg.ERRO(16);
                                Result := 'X_Foto.jpg';
                             end;
                        End;

                    Else
                        Begin

                             try
                                ResizeImage(ARQUIVO, 800, '\\'+getUser('SERVIDOR')+'\IMOBILIARIA\IMG\DIVERSO\', UpCase(REF)+'_'+COD+'.JPG');
                                Result := UpCase(REF)+'_'+COD+'.JPG';
                             except
                                unMsg.ERRO(16);
                                Result := 'X_Foto.jpg';
                             end;
                        End;
               End;
          //End;
     End
     Else
         Result := 'X_Foto.jpg';

End;

Function deletaImagem(IMAGEM: string): string;
//DELETA UM AIMAGEM E RETORNA A IMAGEM PADRÃO
//Var X: integer;
Begin
//NAO DELETA O ARUIVO, SOMENTE RECOLOCA NO BANCO POR SEGURANCA
     Result := 'X_Foto.jpg';
End;

procedure SmoothResize(Src, Dst: TBitmap);
var
   x, y: Integer;
   xP, yP: Integer;
   xP2, yP2: Integer;
   SrcLine1, SrcLine2: pRGBArray;
   t3: Integer;
   z, z2, iz2: Integer;
   DstLine: pRGBArray;
   DstGap: Integer;
   w1, w2, w3, w4: Integer;
begin
     Src.PixelFormat := pf24Bit;
     Dst.PixelFormat := pf24Bit;

     if (Src.Width = Dst.Width) and (Src.Height = Dst.Height) then
        Dst.Assign(Src)
     else
         begin
              DstLine := Dst.ScanLine[0];
              DstGap := Integer(Dst.ScanLine[1]) - Integer(DstLine);

              xP2 := MulDiv(pred(Src.Width), $10000, Dst.Width);
              yP2 := MulDiv(pred(Src.Height), $10000, Dst.Height);
              yP := 0;

              for y := 0 to pred(Dst.Height) do begin
                  xP := 0;

                  SrcLine1 := Src.ScanLine[yP shr 16];

                  if (yP shr 16 < pred(Src.Height)) then
                     SrcLine2 := Src.ScanLine[succ(yP shr 16)]
                  else
                      SrcLine2 := Src.ScanLine[yP shr 16];

                  z2 := succ(yP and $FFFF);
                  iz2 := succ((not yp) and $FFFF);

                  for x := 0 to pred(Dst.Width) do begin
                      t3 := xP shr 16;

                  z := xP and $FFFF;
                  w2 := MulDiv(z, iz2, $10000);
                  w1 := iz2 - w2;
                  w4 := MulDiv(z, z2, $10000);
                  w3 := z2 - w4;
                  DstLine[x].rgbtRed := (SrcLine1[t3].rgbtRed * w1 +
                  SrcLine1[t3 + 1].rgbtRed * w2 +
                  SrcLine2[t3].rgbtRed * w3 + SrcLine2[t3 + 1].rgbtRed * w4) shr 16;
                  DstLine[x].rgbtGreen := (SrcLine1[t3].rgbtGreen * w1 + SrcLine1[t3 + 1].rgbtGreen * w2 + SrcLine2[t3].rgbtGreen * w3 + SrcLine2[t3 + 1].rgbtGreen * w4) shr 16;
                  DstLine[x].rgbtBlue := (SrcLine1[t3].rgbtBlue * w1 +
                  SrcLine1[t3 + 1].rgbtBlue * w2 +
                  SrcLine2[t3].rgbtBlue * w3 +
                  SrcLine2[t3 + 1].rgbtBlue * w4) shr 16;
                  Inc(xP, xP2);
              end; {for}

              Inc(yP, yP2);
              DstLine := pRGBArray(Integer(DstLine) + DstGap);
         end; {for}
     end; {if}
end; {procedure SmoothResize}


function LoadJPEGPictureFile(Bitmap: TBitmap; FilePath, FileName: string): Boolean;
var
   JPEGImage: TJPEGImage;
begin
     if (FileName = '') then // No FileName so nothing
        Result := False //to load - return False...
     else
     begin
          try // Start of try except
              JPEGImage := TJPEGImage.Create; // Create the JPEG image... try // now
              try // to load the file but
                  JPEGImage.LoadFromFile(FilePath + FileName);
                  // might fail...with an Exception.
                  Bitmap.Assign(JPEGImage);
                  // Assign the image to our bitmap.Result := True;
                  // Got it so return True.
              finally
                     FreeAndNil(JPEGImage); // ...must get rid of the JPEG image. finally
              end; {try}
          except
                Result := False; // Oops...never Loaded, so return False.
          end; {try}
     end; {if}
end; {LoadJPEGPictureFile}




function SaveJPEGPictureFile(Bitmap: TBitmap; FilePath, FileName: string; Quality: Integer): Boolean;
begin
     Result := True;
     try
        if ForceDirectories(FilePath) then
        begin
             with TJPegImage.Create do
             begin
                  try
                     Assign(Bitmap);
                     CompressionQuality := Quality;
                     SaveToFile(FilePath + FileName);
                  finally
                         Free;
                  end; {try}
             end; {with}
        end; {if}
     except
           raise;
           Result := False;
     end; {try}
end; {SaveJPEGPictureFile}




procedure ResizeImage(FileName: string; MaxWidth: Integer; Destino, Nome: String);
var
   OldBitmap: TBitmap;
   NewBitmap: TBitmap;
   //aWidth: Integer;
   JPEGImage: TJPEGImage;
begin
     JPEGImage := TJPEGImage.Create;
     JPEGImage.LoadFromFile(FileName);
     OldBitmap := TBitmap.Create;
     
     try
        OldBitmap.Assign(JPEGImage);
        {if LoadJPEGPictureFile(OldBitmap, ExtractFilePath(FileName),ExtractFileName(FileName)) then begin}
        //aWidth := OldBitmap.Width;
        if (OldBitmap.Width > MaxWidth) then
        begin
             //aWidth := MaxWidth;
             NewBitmap := TBitmap.Create;
             try
                NewBitmap.Width := MaxWidth;

                NewBitmap.Height := MulDiv(MaxWidth, OldBitmap.Height, OldBitmap.Width);
                    
                SmoothResize(OldBitmap, NewBitmap);
                //RenameFile(FileName, ChangeFileExt(FileName, '.$$$'));

                //if SaveJPEGPictureFile(NewBitmap, ExtractFilePath(FileName), ExtractFileName(FileName), 75) then
                SaveJPEGPictureFile(NewBitmap, Destino, Nome, 65);
                  // DeleteFile(ChangeFileExt(FileName, '.$$$'))
                //else
                    //RenameFile(ChangeFileExt(FileName, '.$$$'), FileName);
             finally
                    FreeAndNil(NewBitmap);
             end; {try}
        end
        Else
            SaveJPEGPictureFile(OldBitmap, Destino, Nome, 65);

     finally
            FreeAndNil(OldBitmap);
     end; {try}
end;


function JPEGDimensions(Filename : string; var X, Y : Word) : boolean;
var
   SegmentPos : Integer;
   SOIcount : Integer;
   b : byte;
begin
     Result := False;
     with TFileStream.Create(Filename, fmOpenRead or fmShareDenyNone) do
     begin
          try
             Position := 0;
             Read(X, 2);

             if (X <> $D8FF) then
                exit;

             SOIcount := 0;
             Position := 0;

             while (Position + 7 < Size) do
             begin
                  Read(b, 1);

                  if (b = $FF) then
                  begin
                     Read(b, 1);

                     if (b = $D8) then
                        inc(SOIcount);

                     if (b = $DA) then
                        break;
                  end; {if}
             end; {while}

             if (b <> $DA) then
                exit;

             SegmentPos := -1;
             Position := 0;

             while (Position + 7 < Size) do
             begin
                  Read(b, 1);
                  if (b = $FF) then
                  begin
                       Read(b, 1);

                       if (b in [$C0, $C1, $C2]) then
                       begin
                            SegmentPos := Position;
                            dec(SOIcount);

                            if (SOIcount = 0) then
                               break;
                       end; {if}
                  end; {if}
             end; {while}

             if (SegmentPos = -1) then
                exit;

             if (Position + 7 > Size) then
                exit;

             Position := SegmentPos + 3;
             Read(Y, 2);
             Read(X, 2);
             X := Swap(X);
             Y := Swap(Y);
             Result := true;
          finally
                 Free;
          end; {try}
     end; {with}
end; {JPEGDimensions}







end.
