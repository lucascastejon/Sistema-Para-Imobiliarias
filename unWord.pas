unit unWord;

interface 

uses SysUtils, Classes, unINI, FrmPrincipal, unUtilitario, ComObj, Dateutils, ZDataset, Windows, ShellAPI, Controls;

procedure setPessoa(id_imovel: integer; id_contrato: integer);
procedure setImovel(codigo: integer);
procedure setContrato(codigo: integer);
//procedure setDetalhes();
procedure criaDocumento(modelo: String);
function salvaDocumento(salvarEm, nomeArquivo: String): String;
procedure setDocumento(tipo, modelo, salvarem: String; qtde, id_pessoa, id_imovel, id_contrato: integer; parametros: array of string);
procedure setWord(varSQL: TZQuery; titulo: String);
procedure setRave(modelo: integer; titulo, recado: String);
procedure setPessoaSozinha(id_pessoa: integer);
procedure setImovelSozinho(id_imovel: integer);
procedure setPessoaImovel(id_imovel: integer);
procedure setHtml(Titulo: String; html: AnsiString);
procedure quebraString(tag, texto: String; word: Variant);
procedure testWord();

implementation

uses unValidacao, DB, FrmDM_REL, ZAbstractDataset;

var
   MSWORD: Variant;
   nomeDocumento: String;
   const contadorCaracteres: integer = 250;

procedure setHtml(Titulo: String; html: AnsiString);
var Arquivo: TextFile;
    nomeArquivo: String;
    htmlTopo: AnsiString;
    Handle: HWnd;
begin
     nomeArquivo := ExtractFilePath(ParamStr(0))+'REL\'+getConf('CLIENTE')+'RELATORIO_HTML.html';
     AssignFile(Arquivo,nomeArquivo);
     Rewrite(Arquivo);

     htmlTopo :=
     '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">'+
     '<html><head><meta content="text/html; charset=UTF-8" http-equiv="content-type"> '+
     '<title>'+UpperCase(Titulo)+'</title><style type="text/css">.quebrapagina { page-break-before: always; } .EntradaTabela { font-family: Verdana, Geneva, sans-serif; font-size: 9px; font-style: normal; color: #090; } '+
     ' .SaidaTabela { font-family: Verdana, Geneva, sans-serif; font-size: 9px; font-style: normal; color: #00F; } '+
     ' .TotalTabela { font-family: Verdana, Geneva, sans-serif; font-size: 9px; font-style: normal; font-weight: bold; color: #000; }</style></head><body>'+
     '<table width="100%" border="0" cellspacing="3" cellpadding="3"><tr><td align="left" valign="middle"><img src="file:///\\'+getUser('SERVIDOR') + '\imobiliaria\IMG\DIVERSO\'+getConf('EMPRESA_LOGO')+'" /></td> '+
     '<td align="center" valign="middle"><h3>'+UpperCase(Titulo)+'</h3> <b>'+getConf('EMPRESA_FANTASIA')+'</b><br />'+getConf('EMPRESA_TELEFONE')+'<br />'+getConf('EMPRESA_EMAIL')+'</td> <td align="center" valign="middle"><b>'+getUser('USUARIO')+'</b><br />'+datetostr(date())+'<br />'+TimeToStr(time())+'</td> </tr> </table>';

     Writeln(Arquivo,htmlTopo);

     Writeln(Arquivo,html);

     Writeln(Arquivo,'</body></html>');

     CloseFile(Arquivo);
     
     ShellExecute(Handle,nil,'iexplore',pchar(nomeArquivo),nil,sw_ShowMaximized);

end;


procedure setRave(modelo: integer; titulo, recado: String);
Begin
     if modelo <= 0 Then
        modelo := 1;

     case modelo of
          1:
            Begin
                 //USUARIO
                 DM_REL.RV_IMPRESSAO.SetParam('varUsuario',getUser('USUARIO'));
                 DM_REL.RV_IMPRESSAO.SetParam('varMaquina',getUser('MAQUINA'));
                 DM_REL.RV_IMPRESSAO.SetParam('varIp',getUser('IP'));
                 DM_REL.RV_IMPRESSAO.SetParam('varEmail',getUser('EMAIL'));
                 DM_REL.RV_IMPRESSAO.SetParam('varCodigo',getUser('CODIGO_USUARIO'));

                 //SISTEMA
                 DM_REL.RV_IMPRESSAO.SetParam('varEmpresa', getConf('EMPRESA_FANTASIA'));
                 DM_REL.RV_IMPRESSAO.SetParam('varSite',getConf('EMPRESA_HOMEPAGE'));
                 DM_REL.RV_IMPRESSAO.SetParam('varLogo','\\'+getUser('SERVIDOR') + '\imobiliaria\IMG\DIVERSO\'+getConf('EMPRESA_LOGO'));
                 DM_REL.RV_IMPRESSAO.SetParam('varMensagem',getConf('EMPRESA_MENSAGEM'));
                 DM_REL.RV_IMPRESSAO.SetParam('varRecado',recado);
                 DM_REL.RV_IMPRESSAO.SetParam('varCreci',getConf('EMPRESA_CRECI'));
                 DM_REL.RV_IMPRESSAO.SetParam('varEmpresaEmail',getConf('EMPRESA_EMAIL'));
                 DM_REL.RV_IMPRESSAO.SetParam('varSlogan',getConf('EMPRESA_SLOGAN'));
                 DM_REL.RV_IMPRESSAO.SetParam('varTelefone',getConf('EMPRESA_TELEFONE'));
                 DM_REL.RV_IMPRESSAO.SetParam('varEndereco',getConf('EMPRESA_ENDERECO'));
                 DM_REL.RV_IMPRESSAO.SetParam('varRazao',getConf('EMPRESA_RAZAO'));
                 DM_REL.RV_IMPRESSAO.SetParam('varCNPJ',getConf('EMPRESA_CNPJ'));
                 DM_REL.RV_IMPRESSAO.SetParam('varTitulo',UpperCase(titulo));
            End;
          2:
            Begin
            
            End;
     end;

     DM_REL.RV_IMPRESSAO.Open;
     DM_REL.RV_IMPRESSAO.Execute;
End;

procedure setDocumento(tipo, modelo, salvarem: String; qtde, id_pessoa, id_imovel, id_contrato: integer; parametros: array of string);
var x: Integer;
    documentoGerado: String;
    Unassigned: Variant;
Begin
     

     if StrPos(Pchar(UpperCase(tipo)),'GERAL_COM_DOCUMENTO') <> nil Then
     Begin
          if Length(modelo) = 0 then
          Begin
               PRINCIPAL.pegaDocumento.Execute;

               IF PRINCIPAL.pegaDocumento.FileName <> '' THEN
               Begin
                    modelo := PRINCIPAL.pegaDocumento.FileName;
                    nomeDocumento := ExtractFileName(PRINCIPAL.pegaDocumento.FileName);
               End
               else
               Begin
                    unUtilitario.setMensagem('Arquivo não encontrato.','informa');
                    exit;
               end;
          End;

          criaDocumento(modelo);

          if qtde <= 0 Then
             qtde := 1;

          for x := 1 to qtde Do
          Begin
               if id_imovel > 0 then  //if id_contrato > 0 then
                  setPessoa(id_imovel,id_contrato); //setPessoa(id_contrato);
               if id_imovel > 0 then
                  setImovel(id_imovel);
               if id_contrato > 0 then
                  setContrato(id_contrato);
          End;
          
          Randomize;

          MSWORD.Content.Find.Execute(FindText := '<@DOCUMENTO_USUARIO_NOME>', ReplaceWith := getUser('USUARIO'));
          documentoGerado := salvaDocumento(salvarem, StringReplace(DateToStr(Date()),'/','_',[rfReplaceAll])+'_DOC_'+IntToStr(id_contrato)+'_'+IntToStr(1 + Random(10000))+'_');
          ShellExecute(PRINCIPAL.Handle, 'open', PChar(documentoGerado), nil, nil, SW_SHOWNORMAL);
     End;

     if StrPos(Pchar(UpperCase(tipo)),'RECIBO_CHAVE') <> nil Then
     Begin
          if Length(modelo) = 0 then
          Begin
               PRINCIPAL.pegaDocumento.Execute;

               IF PRINCIPAL.pegaDocumento.FileName <> '' THEN
               Begin
                    modelo := PRINCIPAL.pegaDocumento.FileName;
                    nomeDocumento := ExtractFileName(PRINCIPAL.pegaDocumento.FileName);
               End
               else
               Begin
                    unUtilitario.setMensagem('Arquivo não encontrato.','informa');
                    exit;
               end;
          End;

          criaDocumento(modelo);

          if qtde <= 0 Then
             qtde := 1;

          for x := 1 to qtde Do
          Begin
               setPessoaSozinha(id_pessoa);
               setImovelSozinho(id_imovel);
          end;

          MSWORD.Content.Find.Execute(FindText := '<@DOCUMENTO_USUARIO_NOME>', ReplaceWith := getUser('USUARIO'));

          salvaDocumento(salvarem, StringReplace(DateToStr(Date()),'/','_',[rfReplaceAll])+'_CHAVES_'+IntToStr(id_contrato)+'_');
     End;


     if StrPos(Pchar(UpperCase(tipo)),'RECIBO_NOVA_CHAVE') <> nil Then
     Begin
          if Length(modelo) = 0 then
          Begin
               PRINCIPAL.pegaDocumento.Execute;

               IF PRINCIPAL.pegaDocumento.FileName <> '' THEN
               Begin
                    modelo := PRINCIPAL.pegaDocumento.FileName;
                    nomeDocumento := ExtractFileName(PRINCIPAL.pegaDocumento.FileName);
               End
               else
               Begin
                    unUtilitario.setMensagem('Arquivo não encontrato.','informa');
                    exit;
               end;
          End;

          criaDocumento(modelo);

          if qtde <= 0 Then
             qtde := 1;

          for x := 1 to qtde Do
          Begin
               MSWORD.Content.Find.Execute(FindText := '@PESSOA_DADOS', ReplaceWith := parametros[0]);
               MSWORD.Content.Find.Execute(FindText := '@IMOVEL_DADOS', ReplaceWith := parametros[1]);
          end;

          MSWORD.Content.Find.Execute(FindText := '<@DOCUMENTO_USUARIO_NOME>', ReplaceWith := getUser('USUARIO'));

          salvaDocumento(salvarem, StringReplace(DateToStr(Date()),'/','_',[rfReplaceAll])+'_CHAVES_'+IntToStr(id_contrato)+'_');
     End;


     if StrPos(Pchar(UpperCase(tipo)),'IMOVEL_PROCESSOS') <> nil Then
     Begin
          if Length(modelo) = 0 then
          Begin
               PRINCIPAL.pegaDocumento.Execute;

               IF PRINCIPAL.pegaDocumento.FileName <> '' THEN
               Begin
                    modelo := PRINCIPAL.pegaDocumento.FileName;
                    nomeDocumento := ExtractFileName(PRINCIPAL.pegaDocumento.FileName);
               End
               else
               Begin
                    unUtilitario.setMensagem('Arquivo não encontrato.','informa');
                    exit;
               end;
          End;

          criaDocumento(modelo);

          if qtde <= 0 Then
             qtde := 1;

          for x := 1 to qtde Do
          Begin
               setPessoaImovel(id_imovel);
               setImovel(id_imovel);
               setContrato(id_contrato);

               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_TIPO>', ReplaceWith := parametros[0]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_FINALIDADE>', ReplaceWith := parametros[1]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_DATA_ENTRADA>', ReplaceWith := parametros[2]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_DATA_SAIDA>', ReplaceWith := parametros[3]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_DATA_CADASTRO>', ReplaceWith := parametros[4]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_HORA_ENTRADA>', ReplaceWith := parametros[5]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_HORA_SAIDA>', ReplaceWith := parametros[6]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_USUARIO>', ReplaceWith := parametros[7]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_CONCLUIDO>', ReplaceWith := parametros[8]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_TEXTO>', ReplaceWith := parametros[9]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_PESSOA1>', ReplaceWith := parametros[10]);
               MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_PROCESSOS_PESSOA2>', ReplaceWith := parametros[11]);
          End;

          MSWORD.Content.Find.Execute(FindText := '<@DOCUMENTO_USUARIO_NOME>', ReplaceWith := getUser('USUARIO'));

          salvaDocumento(salvarem, StringReplace(DateToStr(Date()),'/','_',[rfReplaceAll])+'_DOC_'+IntToStr(id_contrato)+'_');
     End;

End;

procedure criaDocumento(modelo: String);
Begin
     if Length(modelo) = 0 Then
     begin
          unUtilitario.setMensagem('Informe o documento modelo','erro');
          Exit;
     end;
     // Cria objeto principal de controle
     MSWORD := CreateOleObject('Word.Application');
     //Não Mostra o Word
     MSWORD.Visible := True;
     //Abre documento
     //MSWORD.Documents.Open(modelo);

     // Pega uma interface para o objeto que manipula documentos
     MSWORD := MSWORD.Documents;

     // Abre um Documento
     MSWORD := MSWORD.Open(modelo);
End;

function salvaDocumento(salvarEm, nomeArquivo: String): String;
Begin
     if Length(nomeArquivo) = 0 Then
        nomeArquivo := StringReplace(DateToStr(Date()),'/','_',[rfReplaceAll])+' '+StringReplace(TimeToStr(Time()),':','_',[rfReplaceAll])+'_';

     if Length(salvarEm) = 0 Then
     Begin
          ForceDirectories(ExtractFilePath(ParamStr(0))+'DOCUMENTOS');
          Result := ExtractFilePath(ParamStr(0))+'DOCUMENTOS\'+nomeArquivo+nomeDocumento+'.doc';
          MSWORD.SaveAs(Result);
          //MSWORD.ActiveDocument.SaveAs(Result);
     End
     Else
     Begin
          Result := salvarEm+nomeArquivo+nomeDocumento+'.doc';
          //MSWORD.ActiveDocument.SaveAs(Result);
          MSWORD.SaveAs(Result);
     End;
End;

procedure setPessoaSozinha(id_pessoa: integer);
Var varSQL: TZQuery;
    I: integer;
Begin

     // PESSOA QUALQUER DO SISTEMA -------------------------
     varSQL := unUtilitario.getSelect('select first 1 p.*, e.numero, e.complemento, l.tipo, l.nome as RUA, b.nome as bairro, c.nome as CIDADE, u.sigla as UF, '+
     ' t.ddd, t.numero as TELEFONE, te.ddd DDD_CELULAR, te.numero as CELULAR '+
     ' from pessoa p '+
     ' left join endereco e on e.id_pessoa = p.id_pessoa and e.id_endereco_tipo = 1 '+
     ' left join logradouro l on l.id_logradouro = e.id_logradouro '+
     ' left join bairro b on l.id_bairro = b.id_bairro '+
     ' left join cidade c on l.id_cidade = c.id_cidade '+
     ' left join uf u on l.id_sigla = u.id_sigla '+
     ' left join telefone t on t.id_pessoa = p.id_pessoa and t.id_endereco_tipo = 1  '+
     ' left join telefone te on te.id_pessoa = p.id_pessoa and te.id_endereco_tipo = 3 where p.id_pessoa = ' + IntToStr(id_pessoa));

     while not varSQL.Eof do
     Begin
          for i := 0 to varSQL.FieldCount-1 do
              MSWORD.Content.Find.Execute(FindText := '@PESSOA_'+varSQL.Fields[i].FieldName, ReplaceWith := trim(Copy(varSQL.Fields[i].AsString, 0, contadorCaracteres)));

          varSQL.Next;
     End;

     FreeAndNil(varSQL);
End;

procedure setImovelSozinho(id_imovel: integer);
Var varSQL: TZQuery;
    I: integer;
Begin

     // IMOVEL QUALQUER DO SISTEMA -------------------------
     varSQL := unUtilitario.getSelect('select i.*, l.tipo, l.nome as rua, l.cep, b.nome as bairro,'+
     ' c.nome as cidade, u.sigla as estadouf, u.nome as estado, it.nome as LOCAL_TIPO, st.nome as LOCAL_SUBTIPO from logradouro l'+
     ' left join imovel i on i.id_logradouro = l.id_logradouro'+
     ' left join imovel_tipo it on it.id_imovel_tipo = i.id_imovel_tipo '+
     ' left join imovel_subtipo st on st.id_imovel_subtipo = i.id_imovel_subtipo '+
     ' left join bairro b on b.id_bairro = l.id_bairro'+
     ' left join cidade c on c.id_cidade = l.id_cidade'+
     ' left join uf u on u.id_sigla = l.id_sigla where i.id_imovel =' + IntToStr(id_imovel));

     while not varSQL.Eof do
     Begin
          for i := 0 to varSQL.FieldCount-1 do
              MSWORD.Content.Find.Execute(FindText := '@IMOVEL_'+varSQL.Fields[i].FieldName, ReplaceWith := trim(Copy(varSQL.Fields[i].AsString, 0, contadorCaracteres)));

          varSQL.Next;
     End;

     FreeAndNil(varSQL);
End;

procedure setPessoa(id_imovel: integer; id_contrato: integer);
Var varSQL, varSQLConjuge, varSQLExtra, sql: TZQuery;
    I, J, CONTADOR: integer;
    marcador, telefones, where_proprietario, where_pessoas: String;
Begin

     if ( id_contrato <= 0 ) then
     Begin
          where_proprietario :=  ' where pc.id_pessoa_tipo = 3 and pc.id_imovel = '+ IntToStr(id_imovel);
          where_pessoas := ' where pc.id_imovel = ' + IntToStr(id_imovel);
     end
     else
     Begin
          where_proprietario :=  ' where pc.id_pessoa_tipo = 3 and c.id_contrato = ' + IntToStr(id_contrato);
          where_pessoas := ' where pc.id_contrato = ' + IntToStr(id_contrato);
     end;



     // PROPRIETARIO -------------------------
     varSQL := unUtilitario.getSelect('select p.*, '+
     ' oc.nome as Ocupacao, lo.tipo||'' ''||lo.nome as rua, lo.cep, en.numero, '+
     ' en.complemento, ba.nome as bairro, ci.nome as cidade, u.sigla as estadouf, u.nome as estado '+
     ' from pessoa_imovel pc '+
     ' left join pessoa p on p.id_pessoa = pc.id_pessoa '+
     ' left join contrato c on c.id_imovel = pc.id_imovel '+
     ' left join ocupacao oc on oc.id_ocupacao = p.id_ocupacao '+
     ' left join endereco en on en.id_pessoa = p.id_pessoa and en.id_endereco_tipo = 1 '+
     ' left join logradouro lo on lo.id_logradouro = en.id_logradouro '+
     ' left join bairro ba on ba.id_bairro = lo.id_bairro '+
     ' left join cidade ci on ci.id_cidade = lo.id_cidade '+
     ' left join uf u on u.id_sigla = lo.id_sigla '+
     ' '+where_proprietario );

     CONTADOR := 0;
     sql := TZQuery.Create(PRINCIPAL);
     sql.Connection := principal.Conexao;

     
     while not varSQL.Eof do
     Begin
          marcador := '';
          CONTADOR := CONTADOR + 1;
          //rtiaer rtexto maior que X tamanhhho
          for i := 0 to varSQL.FieldCount-1 do
              MSWORD.Content.Find.Execute(FindText := '<@PROPRIETARIO'+IntToStr(CONTADOR)+'_'+varSQL.Fields[i].FieldName+'>', ReplaceWith := trim(Copy(varSQL.Fields[i].AsString, 0, contadorCaracteres)));

          if Length(trim(varSQL.FieldByName('ID_PESSOA').AsString)) > 0 then
          Begin
               sql.Close;
               sql.SQL.Text := 'select et.*, t.* from pessoa p inner join telefone t on p.id_pessoa = t.id_pessoa inner join endereco_tipo et on et.id_endereco_tipo = t.id_endereco_tipo where t.maladireta = ''SIM'' and t.id_pessoa = '+varSQL.FieldByName('ID_PESSOA').AsString+' order by et.tipo';
               sql.Open;
               telefones := '';
               while NOT sql.Eof do
               Begin
                    // RESIDENCIAL (16-91017363) / FAX (16-91017363)
                    telefones := telefones + sql.FieldByName('TIPO').AsString+' ('+sql.FieldByName('DDD').AsString+'-'+sql.FieldByName('NUMERO').AsString+') ';
                    sql.Next;
               end;

               MSWORD.Content.Find.Execute(FindText := '<@PROPRIETARIO'+IntToStr(CONTADOR)+'_TELEFONES>', ReplaceWith := trim(Copy(telefones, 0, contadorCaracteres)));
               sql.Close;
          end;


          //Busca Conjuge
          marcador := varSQL.FieldByName('CONJUGE').AsString;

          if marcador <> '' Then
             if verificaStringInt(marcador) Then
             Begin
                  varSQLConjuge := unUtilitario.getSelect('select p.*,'+
                  ' oc.nome as Ocupacao'+
                  ' from pessoa p '+
                  ' left join ocupacao oc on oc.id_ocupacao = p.id_ocupacao '+
                  ' where p.id_pessoa = '+ varSQL.FieldByName('id_pessoa').AsString);

                  if varSQLConjuge.RecordCount > 0 Then
                     for j := 0 to varSQLConjuge.FieldCount-1 do
                         MSWORD.Content.Find.Execute(FindText := '<@PROPRIETARIO'+IntToStr(CONTADOR)+'_CONJUGE_'+varSQLConjuge.Fields[j].FieldName+'>', ReplaceWith := trim(Copy(varSQLConjuge.Fields[j].AsString, 0, contadorCaracteres)));

                  if Length(trim(varSQLConjuge.FieldByName('ID_PESSOA').AsString)) > 0 then
                  Begin
                       sql.Close;
                       sql.SQL.Text := 'select et.*, t.* from pessoa p inner join telefone t on p.id_pessoa = t.id_pessoa inner join endereco_tipo et on et.id_endereco_tipo = t.id_endereco_tipo where t.maladireta = ''SIM'' and t.id_pessoa = '+varSQLConjuge.FieldByName('ID_PESSOA').AsString+' order by et.tipo';
                       sql.Open;

                       varSQLConjuge.Close;

                       telefones := '';
                       while NOT sql.Eof do
                       Begin
                            // RESIDENCIAL (16-91017363) / FAX (16-91017363)
                            telefones := telefones + sql.FieldByName('TIPO').AsString+' ('+sql.FieldByName('DDD').AsString+'-'+sql.FieldByName('NUMERO').AsString+') ';
                            sql.Next;
                       end;

                       MSWORD.Content.Find.Execute(FindText := '<@PROPRIETARIO'+IntToStr(CONTADOR)+'_CONJUGE_TELEFONES>', ReplaceWith := trim(Copy(telefones, 0, contadorCaracteres)));
                       sql.Close;
                  end;

             End;

          varSQL.Next;
     End;

     varSQL := unUtilitario.getSelect('select pc.tipo, p.*, pc.porcentagem, '+
     ' oc.nome as Ocupacao, lo.tipo||'' ''||lo.nome as rua, lo.cep, en.numero, '+
     ' en.complemento, ba.nome as bairro, ci.nome as cidade, u.sigla as estadouf, u.nome as estado '+
     ' from pessoa_contrato pc '+
     ' left join pessoa p on p.id_pessoa = pc.id_pessoa '+
     ' left join contrato c on c.id_contrato = pc.id_contrato and c.ativo = ''SIM'' '+
     ' left join ocupacao oc on oc.id_ocupacao = p.id_ocupacao '+
     ' left join endereco en on en.id_pessoa = p.id_pessoa and en.id_endereco_tipo = 1 '+
     ' left join logradouro lo on lo.id_logradouro = en.id_logradouro '+
     ' left join bairro ba on ba.id_bairro = lo.id_bairro '+
     ' left join cidade ci on ci.id_cidade = lo.id_cidade '+
     ' left join uf u on u.id_sigla = lo.id_sigla '+
     ' '+where_pessoas); //order by c.id_contrato desc'
     
     while not varSQL.Eof do
     Begin
          marcador := '';
          
          for i := 0 to varSQL.FieldCount-1 do
              MSWORD.Content.Find.Execute(FindText := '<@'+varSQL.FieldByName('TIPO').AsString+'_'+varSQL.Fields[i].FieldName+'>', ReplaceWith := trim(Copy(varSQL.Fields[i].AsString, 0, contadorCaracteres)));

          if Length(trim(varSQL.FieldByName('ID_PESSOA').AsString)) > 0 then
          Begin
               sql.Close;
               sql.SQL.Text := 'select et.*, t.* from pessoa p inner join telefone t on p.id_pessoa = t.id_pessoa inner join endereco_tipo et on et.id_endereco_tipo = t.id_endereco_tipo where t.maladireta = ''SIM'' and t.id_pessoa = '+varSQL.FieldByName('ID_PESSOA').AsString+' order by et.tipo';
               sql.Open;
               telefones := '';
               while NOT sql.Eof do
               Begin
                    // RESIDENCIAL (16-91017363) / FAX (16-91017363)
                    telefones := telefones + sql.FieldByName('TIPO').AsString+' ('+sql.FieldByName('DDD').AsString+'-'+sql.FieldByName('NUMERO').AsString+') ';
                    sql.Next;
               end;

               MSWORD.Content.Find.Execute(FindText := '<@'+varSQL.FieldByName('TIPO').AsString+'_TELEFONES>', ReplaceWith := trim(Copy(telefones, 0, contadorCaracteres)));
               sql.Close;
          end;

          //VALOR PARA CARTA DE COBRANÇAS
          if (varSQL.FieldByName('TIPO').AsString = 'INQUILINO') OR (varSQL.FieldByName('TIPO').AsString = 'LOCATÁRIO') OR (varSQL.FieldByName('TIPO').AsString = 'LOCATARIO') OR (varSQL.FieldByName('TIPO').AsString = 'MORADOR') OR (varSQL.FieldByName('TIPO').AsString = 'COMPRADOR') Then
          Begin
               //Sem multa e juros
               varSQLExtra := unUtilitario.getSelect('select sum(c.valor) from caixa_entrada c where c.data_ref <= CURRENT_DATE and c.data_pgto IS NULL and ativo = ''SIM'' AND C.id_pessoa = '+varSQL.FieldByName('ID_PESSOA').AsString);
               MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_SOMA_PENDENTE>', ReplaceWith := getCurrToStr(varSQLExtra.Fields[0].AsCurrency,True));
               MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_SOMA_PENDENTE_ESCRITO>', ReplaceWith := unValidacao.Extenso(varSQLExtra.Fields[0].AsFloat));
               varSQLExtra.Close;

               //Com multa e juros
               varSQLExtra := unUtilitario.getSelect('select sum((SELECT RESULT FROM spvalorcobranca1('+getConf('EMPRESA_CALCULO')+', c.data_ref, c.data_pgto, c.valor, c.valor_juros, c.valor_multa, c.valor_desconto))) from caixa_entrada c where c.data_ref <= CURRENT_DATE and c.data_pgto IS NULL and ativo = ''SIM'' AND C.id_pessoa = '+varSQL.FieldByName('ID_PESSOA').AsString);
               MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_SOMA_PENDENTE_CALCULADO>', ReplaceWith := getCurrToStr(varSQLExtra.Fields[0].AsCurrency,True));
               MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_SOMA_PENDENTE_ESCRITO_CALCULADO>', ReplaceWith := unValidacao.Extenso(varSQLExtra.Fields[0].AsFloat));
               varSQLExtra.Close;
          End;

          //Busca Conjuge
          marcador := varSQL.FieldByName('CONJUGE').AsString;

          if marcador <> '' Then
             if verificaStringInt(marcador) Then
             Begin
                  varSQLConjuge := unUtilitario.getSelect('select p.*,'+
                  ' oc.nome as Ocupacao'+
                  ' from pessoa p '+
                  ' left join ocupacao oc on oc.id_ocupacao = p.id_ocupacao '+
                  ' where p.id_pessoa = '+ marcador);

                  if varSQLConjuge.RecordCount > 0 Then
                     for j := 0 to varSQLConjuge.FieldCount-1 do
                         MSWORD.Content.Find.Execute(FindText := '<@CONJUGE_'+varSQL.FieldByName('TIPO').AsString+'_'+varSQLConjuge.Fields[j].FieldName+'>', ReplaceWith := trim(Copy(varSQLConjuge.Fields[j].AsString, 0, contadorCaracteres)));

                  if Length(trim(varSQLConjuge.FieldByName('ID_PESSOA').AsString)) > 0 then
                  Begin
                       sql.Close;
                       sql.SQL.Text := 'select et.*, t.* from pessoa p inner join telefone t on p.id_pessoa = t.id_pessoa inner join endereco_tipo et on et.id_endereco_tipo = t.id_endereco_tipo where t.maladireta = ''SIM'' and t.id_pessoa = '+varSQLConjuge.FieldByName('ID_PESSOA').AsString+' order by et.tipo';
                       sql.Open;
                       varSQLConjuge.Close;

                       telefones := '';
                       while NOT sql.Eof do
                       Begin
                            // RESIDENCIAL (16-91017363) / FAX (16-91017363)
                            telefones := telefones + sql.FieldByName('TIPO').AsString+' ('+sql.FieldByName('DDD').AsString+'-'+sql.FieldByName('NUMERO').AsString+') ';
                            sql.Next;
                       end;

                       MSWORD.Content.Find.Execute(FindText := '<@CONJUGE_'+varSQL.FieldByName('TIPO').AsString+'_TELEFONES>', ReplaceWith := trim(Copy(telefones, 0, contadorCaracteres)));
                       sql.Close;
                  end;
             End;

          varSQL.Next;
     End;

     FreeAndNil(varSQL);
     FreeAndNil(varSQLConjuge);
     FreeAndNil(varSQLExtra);
     FreeAndNil(sql);
End;

procedure setPessoaImovel(id_imovel: integer);
Var varSQL, varSQLConjuge, varSQLExtra: TZQuery;
    I, J, CONTADOR: integer;
    marcador: String;
Begin

     // PROPRIETARIO -------------------------
     varSQL := unUtilitario.getSelect('select p.*, '+
     ' oc.nome as Ocupacao, lo.tipo||'' ''||lo.nome as rua, lo.cep, en.numero,  '+
     ' en.complemento, ba.nome as bairro, ci.nome as cidade, u.sigla as estadouf, u.nome as estado '+
     ' from pessoa_imovel pc '+
     ' left join pessoa p on p.id_pessoa = pc.id_pessoa and p.ativo = ''SIM'' '+
     ' left join ocupacao oc on oc.id_ocupacao = p.id_ocupacao  '+
     ' left join endereco en on en.id_pessoa = p.id_pessoa and en.id_endereco_tipo = 1 '+
     ' left join logradouro lo on lo.id_logradouro = en.id_logradouro '+
     ' left join bairro ba on ba.id_bairro = lo.id_bairro '+
     ' left join cidade ci on ci.id_cidade = lo.id_cidade '+
     ' left join uf u on u.id_sigla = lo.id_sigla '+
     ' where pc.id_pessoa_tipo = 3 and pc.id_imovel = ' + IntToStr(id_imovel));

     CONTADOR := 0;
     
     while not varSQL.Eof do
     Begin
          marcador := '';
          CONTADOR := CONTADOR + 1;

          for i := 0 to varSQL.FieldCount-1 do
              MSWORD.Content.Find.Execute(FindText := '<@PROPRIETARIO'+IntToStr(CONTADOR)+'_'+varSQL.Fields[i].FieldName+'>', ReplaceWith := trim(Copy(varSQL.Fields[i].AsString, 0, contadorCaracteres)));

          //Busca Conjuge
          marcador := varSQL.FieldByName('CONJUGE').AsString;

          if marcador <> '' Then
             if verificaStringInt(marcador) Then
             Begin
                  varSQLConjuge := unUtilitario.getSelect('select p.*,'+
                  ' oc.nome as Ocupacao'+
                  ' from pessoa p '+
                  ' left join ocupacao oc on oc.id_ocupacao = p.id_ocupacao '+
                  ' where p.id_pessoa = '+ varSQL.FieldByName('id_pessoa').AsString);

                  if varSQLConjuge.RecordCount > 0 Then
                     for j := 0 to varSQLConjuge.FieldCount-1 do
                         MSWORD.Content.Find.Execute(FindText := '<@PROPRIETARIO'+IntToStr(CONTADOR)+'_CONJUGE_'+varSQLConjuge.Fields[j].FieldName+'>', ReplaceWith := trim(Copy(varSQLConjuge.Fields[j].AsString, 0, contadorCaracteres)));

                  varSQLConjuge.Close;
             End;

          varSQL.Next;
     End;

     varSQL := unUtilitario.getSelect('select pc.tipo, p.*, pc.porcentagem, '+
     ' oc.nome as Ocupacao, lo.tipo||'' ''||lo.nome as rua, lo.cep, en.numero, '+
     ' en.complemento, ba.nome as bairro, ci.nome as cidade, u.sigla as estadouf, u.nome as estado '+
     ' from pessoa_contrato pc '+
     ' left join pessoa p on p.id_pessoa = pc.id_pessoa '+
     ' left join contrato c on c.id_contrato = pc.id_contrato '+
     ' left join ocupacao oc on oc.id_ocupacao = p.id_ocupacao '+
     ' left join endereco en on en.id_pessoa = p.id_pessoa and en.id_endereco_tipo = 1 '+
     ' left join logradouro lo on lo.id_logradouro = en.id_logradouro '+
     ' left join bairro ba on ba.id_bairro = lo.id_bairro '+
     ' left join cidade ci on ci.id_cidade = lo.id_cidade '+
     ' left join uf u on u.id_sigla = lo.id_sigla '+
     ' where pc.id_imovel = ' + IntToStr(id_imovel));

     while not varSQL.Eof do
     Begin
          marcador := '';
          
          for i := 0 to varSQL.FieldCount-1 do
              MSWORD.Content.Find.Execute(FindText := '<@'+varSQL.FieldByName('TIPO').AsString+'_'+varSQL.Fields[i].FieldName+'>', ReplaceWith := trim(Copy(varSQL.Fields[i].AsString, 0, contadorCaracteres)));

          //VALOR PARA CARTA DE COBRANÇAS
          if (varSQL.FieldByName('TIPO').AsString = 'INQUILINO') OR (varSQL.FieldByName('TIPO').AsString = 'LOCATÁRIO') OR (varSQL.FieldByName('TIPO').AsString = 'LOCATARIO') OR (varSQL.FieldByName('TIPO').AsString = 'MORADOR') OR (varSQL.FieldByName('TIPO').AsString = 'COMPRADOR') Then
          Begin
               //Sem multa e juros
               varSQLExtra := unUtilitario.getSelect('select sum(c.valor) from caixa_entrada c where c.data_ref <= CURRENT_DATE and c.data_pgto IS NULL and ativo = ''SIM'' AND C.id_pessoa = '+varSQL.FieldByName('ID_PESSOA').AsString);
               MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_SOMA_PENDENTE>', ReplaceWith := getCurrToStr(varSQLExtra.Fields[0].AsCurrency,True));
               MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_SOMA_PENDENTE_ESCRITO>', ReplaceWith := unValidacao.Extenso(varSQLExtra.Fields[0].AsFloat));
               varSQLExtra.Close;

               //Com multa e juros
               varSQLExtra := unUtilitario.getSelect('select sum((SELECT RESULT FROM spvalorcobranca1('+getConf('EMPRESA_CALCULO')+', c.data_ref, c.data_pgto, c.valor, c.valor_juros, c.valor_multa, c.valor_desconto))) from caixa_entrada c where c.data_ref <= CURRENT_DATE and c.data_pgto IS NULL and ativo = ''SIM'' AND C.id_pessoa = '+varSQL.FieldByName('ID_PESSOA').AsString);
               MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_SOMA_PENDENTE_CALCULADO>', ReplaceWith := getCurrToStr(varSQLExtra.Fields[0].AsCurrency,True));
               MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_SOMA_PENDENTE_ESCRITO_CALCULADO>', ReplaceWith := unValidacao.Extenso(varSQLExtra.Fields[0].AsFloat));
               varSQLExtra.Close;
          End;

          //Busca Conjuge
          marcador := varSQL.FieldByName('CONJUGE').AsString;

          if marcador <> '' Then
             if verificaStringInt(marcador) Then
             Begin
                  varSQLConjuge := unUtilitario.getSelect('select p.*,'+
                  ' oc.nome as Ocupacao'+
                  ' from pessoa p '+
                  ' left join ocupacao oc on oc.id_ocupacao = p.id_ocupacao '+
                  ' where p.id_pessoa = '+ marcador);

                  if varSQLConjuge.RecordCount > 0 Then
                     for j := 0 to varSQLConjuge.FieldCount-1 do
                         MSWORD.Content.Find.Execute(FindText := '<@CONJUGE_'+varSQL.FieldByName('TIPO').AsString+'_'+varSQLConjuge.Fields[j].FieldName+'>', ReplaceWith := trim(Copy(varSQLConjuge.Fields[j].AsString, 0, contadorCaracteres)));

                  varSQLConjuge.Close;
             End;

          varSQL.Next;
     End;

     FreeAndNil(varSQL);
     FreeAndNil(varSQLConjuge);
     FreeAndNil(varSQLExtra);
End;


procedure setImovel(codigo: integer);
Var varSQL: TZQuery;
    i: integer;
    txtVistoria: String;
Begin

     // IMOVEL -------------------------
     varSQL := unUtilitario.getSelect('select i.*, l.tipo, l.nome as rua, l.cep, b.nome as bairro,'+
     ' c.nome as cidade, u.sigla as estadouf, u.nome as estado, it.nome as LOCAL_TIPO, st.nome as LOCAL_SUBTIPO from logradouro l'+
     ' left join imovel i on i.id_logradouro = l.id_logradouro'+
     ' left join imovel_tipo it on it.id_imovel_tipo = i.id_imovel_tipo '+
     ' left join imovel_subtipo st on st.id_imovel_subtipo = i.id_imovel_subtipo '+
     ' left join bairro b on b.id_bairro = l.id_bairro'+
     ' left join cidade c on c.id_cidade = l.id_cidade'+
     ' left join uf u on u.id_sigla = l.id_sigla where i.id_imovel =' + IntToStr(codigo));

     if varSQL.RecordCount = 0 Then
        exit;

     for i := 0 to varSQL.FieldCount-1 do
          MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_'+varSQL.Fields[i].FieldName+'>', ReplaceWith := trim(Copy(varSQL.Fields[i].AsString, 0, contadorCaracteres)));

     //CARACTERÍSTICAS NORMAL
     varSQL := unUtilitario.getSelect('select c.nome as caracteristica, ic.*  from imovel_caracteristica ic inner join caracteristicas c on c.id_caracteristicas = ic.id_caracteristica where ic.tipo = ''NORMAL'' and ic.id_imovel = '+IntToStr(codigo));

     txtVistoria := 'CARACTERÍSTICAS DO IMÓVEL:'+#13;
     while not varSQL.eof do
     begin
          txtVistoria := txtVistoria + varSQL.FieldByName('CARACTERISTICA').AsString+'('+varSQL.FieldByName('QUANTIDADE').AsString+'): '+varSQL.FieldByName('VISTORIA').AsString+#13;
          varSQL.Next;
     end;

     quebraString('<@IMOVEL_CARACTERISTICAS_NORMAL>', txtVistoria, MSWORD);

     //MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_CARACTERISTICAS_NORMAL>', ReplaceWith := txtVistoria);

     //CARACTERÍSTICA VISTORIA
     varSQL := unUtilitario.getSelect('select c.nome as caracteristica, ic.*  from imovel_caracteristica ic inner join caracteristicas c on c.id_caracteristicas = ic.id_caracteristica where ic.tipo = ''VISTORIA'' and ic.id_imovel = '+IntToStr(codigo));

     txtVistoria := #13+'DESCRIÇÃO DO IMÓVEL (VISTORIA):'+#13;
     while not varSQL.eof do
     begin
          txtVistoria := txtVistoria + varSQL.FieldByName('CARACTERISTICA').AsString+' ('+varSQL.FieldByName('QUANTIDADE').AsString+'): '+varSQL.FieldByName('VISTORIA').AsString+#13;
          varSQL.Next;
     end;

     quebraString('<@IMOVEL_CARACTERISTICAS_VISTORIA>', txtVistoria, MSWORD);

     //MSWORD.Content.Find.Execute(FindText := '<@IMOVEL_CARACTERISTICAS_VISTORIA>', ReplaceWith := txtVistoria);

     FreeAndNil(varSQL);
End;

procedure quebraString(tag, texto: String; word: Variant);
var
  I, contadorLetras, contadorTag, contadorTexto: Integer;
  frase: String;
  passouMaisQueCem: Boolean;
Begin
     frase := '';
     contadorTag := 0;
     contadorTexto := Length(texto);
     contadorLetras := 0;
     for I := 1 to contadorTexto do
     Begin

          frase := frase + texto[I];
          passouMaisQueCem := False;
          contadorLetras := contadorLetras+1;

          if contadorLetras = 100 then
          Begin
               if contadorTag = 0 then
               Begin
                    word.Content.Find.Execute(FindText := tag, ReplaceWith := frase+tag+'1');
                    contadorTag := 1;
               end
               else
               Begin
                    tag := tag+IntToStr(contadorTag);
                    contadorTag := contadorTag + 1;                    
                    word.Content.Find.Execute(FindText := tag, ReplaceWith := frase+tag+IntToStr(contadorTag));
               end;

               passouMaisQueCem := True;
               contadorLetras := 0;
               frase := '';
          end;

          if I = contadorTexto then
          Begin
               if passouMaisQueCem then
               Begin
                    tag := tag+IntToStr(contadorTag);
                    contadorTag := contadorTag + 1;
                    word.Content.Find.Execute(FindText := tag, ReplaceWith := frase);
               end
               else
               Begin
                    word.Content.Find.Execute(FindText := tag, ReplaceWith := frase);
               end;

               frase := '';
          end;
          
     end;


End;

procedure setContrato(codigo: integer);
Var varSQL: TZQuery;
    i: integer;
    XANO, XMES, XDIA: Word;
Begin

     varSQL := unUtilitario.getSelect('select * from contrato where id_contrato =' + IntToStr(codigo));

     if varSQL.RecordCount = 0 Then
        exit;

     // CONTRATO -------------------------
     for i := 0 to varSQL.FieldCount-1 do
     Begin
         //if varSQL.Fields[i].FieldName then

          MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_'+varSQL.Fields[i].FieldName+'>', ReplaceWith := trim(Copy(varSQL.Fields[i].AsString, 0, contadorCaracteres)));

     end;
     //TAXA ADMINISTRATIVA ESCRITO
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_COBRANCA_ESCRITO>', ReplaceWith := unValidacao.Extenso(varSQL.FieldByName('VALOR').AsFloat));
     //VALOR ESCRITO
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_TARIFA_ESCRITO>', ReplaceWith := StringReplace(StringReplace(unValidacao.Extenso(varSQL.FieldByName('TARIFA').AsFloat), 'REAIS','', [rfReplaceAll]),'CENTAVOS','',[rfReplaceAll])+ ' POR CENTO' );
     //VALOR DO REPASSE
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_REPASSE>', ReplaceWith := FloatToSTrf((varSQL.FieldByName('VALOR').AsFloat - ((varSQL.FieldByName('VALOR').AsFloat * varSQL.FieldByName('TARIFA').AsFloat)/100)),ffCurrency,18,2));
     //VALOR DO REPASSE ESCRITO
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_REPASSE_ESCRITO>', ReplaceWith := unValidacao.Extenso((varSQL.FieldByName('VALOR').AsFloat - ((varSQL.FieldByName('VALOR').AsFloat * varSQL.FieldByName('TARIFA').AsFloat)/100))));
     //DIA DA COBRANÇA
     DecodeDate(varSQL.FieldByName('VENCIMENTO').AsDATETIME, XANO, XMES, XDIA);
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_COBRANCA_DIA>', ReplaceWith := XDIA);
     //DIA DA COBRANÇA ESCRITA
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_COBRANCA_DIA_ESCRITO>', ReplaceWith := StringReplace(unValidacao.Extenso(XDIA), 'REAIS', '',[rfReplaceAll, rfIgnoreCase]));
     //DATA DA COBRANÇA
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_COBRANCA_DATA>', ReplaceWith := varSQL.FieldByName('VENCIMENTO').AsString);
     //DATA DA COBRANÇA ESCRITA
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_COBRANCA_DATA_ESCRITO>', ReplaceWith := FormatDateTime('dddd"," d "de" mmmm "de" yyyy', varSQL.FieldByName('VENCIMENTO').AsDateTime));
     //DIA DO REPASSE ESCRITO
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_REPASSE_DIA_ESCRITO>', ReplaceWith := StringReplace(unValidacao.Extenso(varSQL.FieldByName('HONORARIO_REPASSE').AsFloat), 'REAIS', '',[rfReplaceAll, rfIgnoreCase]));
     //DATA DO REPASSE
     //Doc.Content.Find.Execute(FindText := '<@CONTRATO_REPASSE_DATA>', ReplaceWith := 'AINDA SEM INFORMAÇÃO.');//DateToStr(StrToDate(DM_ADMIN.Z_ALUGUEL.FieldByName('HONORARIO_REPASSE').AsString+'/'+pchar(XMES)+'/'+pchar(XANO))));
     //DATA DO REPASSE ESCRITO
     //Doc.Content.Find.Execute(FindText := '<@CONTRATO_REPASSE_DATA_ESCRITO>', ReplaceWith := FormatDateTime('"d" de "mmmm" de "yyyy"',StrToDate(DM_ADMIN.Z_ALUGUEL.FieldByName('HONORARIO_REPASSE').AsString+'/'+pchar(XMES)+'/'+pchar(XANO))));
     //DATA FINAL DO CONTRATO
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_FINAL_DATA>', ReplaceWith := IncMonth(varSQL.fieldbyname('VENCIMENTO').AsDateTime, varSQL.fieldbyname('VIGENCIA').AsInteger - 1));
     //DATA FINAL DO CONTRATO ESCRITO
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_FINAL_DATA_ESCRITO>', ReplaceWith := FormatDateTime('dddd"," d "de" mmmm "de" yyyy',IncMonth(varSQL.fieldbyname('VENCIMENTO').AsDateTime, varSQL.fieldbyname('VIGENCIA').AsInteger - 1)));
     //DATA DO CONTRATO ESCRITA
     MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_DATA_ESCRITO>', ReplaceWith := FormatDateTime('dddd"," d "de" mmmm "de" yyyy',varSQL.fieldbyname('DATA').AsDateTime));

     //DADOS DE RENOVAÇÃO
     {
     varSQL := unUtilitario.getSelect('SELECT FIRST 1 CAMPOS FROM LOG WHERE ACAO = ''LOG'' AND ID_CONTA = '+IntToStr(codigo)+' ORDER BY DATA DESC');
     //DATA INICIAL DO CONTRATO ANTIGO
     if varsql.RecordCount = 1 then
     Begin
           texto := varSQL.fieldbyname('CAMPOS').AsString;
           for i:=1 to length(texto) do
           begin
               if texto[i]+texto[i+1]+texto[i+2]+texto[i+3]+texto[i+4]+texto[i+5]+texto[i+6]+texto[i+7]+texto[i+8]+texto[i+9]+texto[i+10]+texto[i+11]+texto[i+12]+texto[i+13] = '| VENCIMENTO =' then //busca | DATA = 8/10/2008
               Begin
                    for j:=i+14 to length(texto) do
                        if texto[j] <> '|' then
                           inicio := inicio+texto[j]
                        else
                            Break;
               end;
           end;

           for i:=1 to length(texto) do
           begin
               if texto[i]+texto[i+1]+texto[i+2]+texto[i+3]+texto[i+4]+texto[i+5]+texto[i+6]+texto[i+7]+texto[i+8]+texto[i+9]+texto[i+10]+texto[i+11] = '| VIGENCIA =' then //busca | DATA = 8/10/2008
               Begin
                    for j:=i+12 to length(texto) do
                        if texto[j] <> '|' then
                           vigencia := vigencia+texto[j]
                        else
                            Break;
               end;
           end;

           //varSQL.Close;

           MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_DATA_ANTIGO_INICIO>', ReplaceWith := FormatDateTime('dddd"," d "de" mmmm "de" yyyy',StrToDate(Trim(inicio))));
           //DATA FINAL DO CONTRATO ANTIGO
           MSWORD.Content.Find.Execute(FindText := '<@CONTRATO_DATA_ANTIGO_FIM>', ReplaceWith := FormatDateTime('dddd"," d "de" mmmm "de" yyyy',IncMonth(StrToDate(inicio),StrToInt(Trim(vigencia))-1)));
     end;
     }

     FreeAndNil(varSQL);
End;

procedure setWord(varSQL: TZQuery; titulo: String);
var
  Word, WordConteudo: Variant;
  col: Integer;
begin

     if NOT varSQL.Active then
        Exit;

     try
        Word := CreateOleObject('Word.Basic');
        Word.AppShow;
        Word.insert(UpperCase(titulo)+#13);
           
           Word.ActiveDocument.Tables.Add(
           Range := Word.Content.Range,
           NumRows := varSQL.RecordCount,
           NumColumns := varSQL.Fields.Count);
           { Escreve na primeira célula }

           varSQL.First;

           while NOT varSQL.Eof Do
           begin
                for col := 0 to varSQL.Fields.Count-1 Do
                Begin
                     Word.Content.TypeText(Text := varSQL.Fields[col].AsString);
                     Word.Content.MoveRight(12);
                End;

                varSQL.Next;
           End;

           { Auto-Formata }
           Word.Content.Tables.Item(1).Select; { Seleciona a 1º tabela }
           Word.Content.Cells.AutoFit;
           { Imprime 1 cópia }
           //Word.ActiveDocument.PrintOut(Copies := 1);
           unUtilitario.setMensagem('Documento salvo no destino: '+ExtractFilePath(ParamStr(0))+'DOCUMENTO_'+StringReplace(DateToStr(Date()),'/','_',[rfReplaceAll])+'_'+inttoStr(Random(10000))+'.doc','informa');
           { Para salvar... }
           Word.Visible := True;

           Randomize;
           Word.ActiveDocument.SaveAs(FileName := ExtractFilePath(ParamStr(0))+'DOCUMENTO_'+StringReplace(DateToStr(Date()),'/','_',[rfReplaceAll])+'_'+inttoStr(Random(10000))+'.doc');
     except
           on e: Exception do
           Begin
              unUtilitario.setMensagem('Erro ao gerar o documento do MS-Word: '+#13+e.Message, 'erro');
              Exit;
           End;
     end;
End;

procedure testWord();
var
  MSWord: Variant;
begin
  MSWord:= CreateOleObject ('Word.Basic');
  MSWord.AppShow;//mostra o word
  //MSWord.FileNew;//inicia um novo documento
  MSWord.insert('Contrato de Locação'); //Escreve algo
  MSWord.insert(#13+'Contrato de Locação');//Pula uma linha e escreve
  MSWord.FontSize(24);//muda o tamanho da fonte
  MSWord.italic;//coloca italico
  MSWord.bold;//coloca negrito
  MSWord.underline;//sublina
  MSWord.insert(#13+'Contrato de Locação');//pula a linha e escreve novamente
  MSWord.FontSize(12);//muda o tamanho da fonte
  MSWord.Font('Arial');//muda a fonte usada
  MSWord.underline(false);//retira o sublinhado
  MSWord.italic(false);//retira o italico
  MSWord.bold(false);//retira o bold
  MSWord.insert(#13 +'teste');
  MSWord.insert(#13+#9 +'teste');//nova linha e um TAB
  MSWord.insert(#13+'EDSON');//insere algo de uma tabela
  MSWord.LineUp(2, 1); //seleciona uma parte do texto
  MSWord.TextToTable(ConvertFrom := 2, NumColumns := 1);// monta uma tabela com o texto selecionado
  MSWord.FileSaveAs('c:temptest.txt', 3); //Salva o arquivo
end;



end.
