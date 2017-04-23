unit unErros;

interface

uses SysUtils, ZDataset, Forms, Dialogs;

procedure enviaErros();

implementation

uses unUtilitario, unINI;

procedure enviaErros();
Begin
        //varSQL := unUtilitario.getSQL('INSERT INTO ''mantis_bug_table'' VALUES(6, 1, 1, 0, 0, 30, 50, 100, 10, 10, 10, ''Outros'', ''2008-06-27 17:54:11'', ''2008-06-27 17:54:11'', 10, 6, '''', '''', '''', ''1.5'', '''', '''', 0, 50, ''AQUI VAI O RESUMO DO PROBLEMA.'', 0, 0, '''');');
        //varSQL := unUtilitario.getSQL('INSERT INTO ''mantis_bug_text_table'' VALUES(6, ''AQUI VAI A DESCRIÇÃO DO PROBLEMA.'', '''', ''AQUI VAI ALGUMAS INFORMAÇÕES ADICIONAIS DO PROBLEMA.''');

End;

end.
