unit unPaginacao;
 
interface
         uses SysUtils, ZDataset, FrmPrincipal;
 
type
    TPaginacao = class

private
       attMostrar: Integer; //Mostra somente X por vez na grid.
       attPagina: Integer; //Página atual que está mostrando.
       attFirst: Integer; //Número atual mostrando na grid, e em geral o mesmo número que "Mostrar".
       attSkip: Integer;  //Número atual que é para pular, e em geral é o cálculo da página.
       attLimitador: String;  //String para saber onde inicia a select para ser recolocada o first e o skip
       procedure SetMostrar(const Value: Integer);
       procedure SetPagina(const Value: Integer);
       procedure SetFirst(const Value: Integer);
       procedure SetSkip(const Value: Integer);
       function retirarSelectAntigo(SQL: String): String;

public
      property First:Integer read attFirst write SetFirst;
      property Skip:Integer read attSkip write SetSkip;
      property Mostrar:Integer read attMostrar write SetMostrar;
      property Pagina:Integer read attPagina write SetPagina;
      function maisRegistros(SQL: String): String;
      function menosRegistros(SQL: String): String;
      function calcularTotal(SQL: String; limitador: String): String;
end;
 
implementation

uses DB;
 
{ TPaginacao }
 
procedure TPaginacao.SetFirst(const Value: Integer);
begin
     attFirst := Value;
end;

procedure TPaginacao.SetSkip(const Value: Integer);
begin
     attSkip := Value;
end;

procedure TPaginacao.SetMostrar(const Value: Integer);
begin
     attMostrar := Value;
     attPagina := 1;
     attFirst := attMostrar;
     attSkip := 0;
     attLimitador := '';
end;

procedure TPaginacao.SetPagina(const Value: Integer);
begin
     attPagina := Value;
end;

function TPaginacao.maisRegistros(SQL: String): String;
var novoSQL: String;
Begin
     novoSQL := 'SELECT FIRST '+IntToStr(attFirst)+' SKIP '+IntToStr(attSkip)+' ';
     novoSQL := novoSQL + retirarSelectAntigo(SQL);
     attSkip := attSkip + attFirst;
     attPagina := attPagina + 1;

     result := novoSQL;
end;

function TPaginacao.menosRegistros(SQL: String): String;
var novoSQL: String;
Begin
     if attPagina > 0 then
     Begin
          novoSQL := 'SELECT FIRST '+IntToStr(attFirst)+' SKIP '+IntToStr(attSkip)+' ';
          novoSQL := novoSQL + retirarSelectAntigo(SQL);
          attPagina := attPagina - 1;
          attSkip := attSkip - attFirst;

          if attSkip < 0 then
          Begin
               attSkip := 0;
               attPagina := 1;
          end;

          result := novoSQL;
     end
     else
         result := SQL;
end;



function TPaginacao.retirarSelectAntigo(SQL: String): String;
var novoSQL: String;
    I: Integer;
Begin

     SQL := Trim(StringReplace(UpperCase(SQL),'SELECT','',[rfIgnoreCase]));

     if Length(Trim(attLimitador)) = 0 then
     Begin
          for I := 1 to 5 do
            attLimitador := attLimitador + SQL[I];
     end
     else
         for I := 1 to POS(UpperCase(attLimitador), UpperCase(SQL))-1 do
             SQL[I] := ' ';

     result := Trim(SQL);
end;

function TPaginacao.calcularTotal(SQL: String; limitador: String): String;
var consulta: TZQuery;
    I: Integer;
Begin
     for I := 1 to POS( UpperCase(limitador), UpperCase(SQL))-1 do
         SQL[I] := ' ';

     for I := Length(SQL) downto POS('ORDER', UpperCase(SQL))-1 do
         SQL[I] := ' ';

     SQL := 'SELECT count(1) as TOTAL '+Trim(SQL);

     consulta := TZQuery.Create(nil);
     consulta.Connection := PRINCIPAL.Conexao;
     consulta.SQL.Add(SQL);
     consulta.Open;

     i := consulta.FieldByName('TOTAL').AsInteger;
     consulta.Close;
     FreeAndNil(consulta);

     result := IntToStr(i);
end;


 
end.
