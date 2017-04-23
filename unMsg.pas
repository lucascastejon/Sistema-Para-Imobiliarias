unit unMsg;

interface

uses Dialogs, SysUtils;

Procedure ERRO(X: integer);
Procedure INFORMA(X: integer);

implementation

uses FrmPrincipal, unUtilitario;

Procedure ERRO(X: integer);
Begin

     Case X of
          1: setMensagem('Entre com um valor.', 'erro');
          2: setMensagem('Entre com um Campo.', 'erro');
          3: setMensagem('Entre com um valor exato.', 'erro');
          4: setMensagem('Dados incompletos.', 'erro');
          5: setMensagem('Opção de pesquisa não encontrada.', 'erro');
          6: setMensagem('Escolha uma opção para a pesquisa.', 'erro');
          7: setMensagem('Consulta inválida.', 'erro');
          8: setMensagem('Código não encontrado.', 'erro');
          9: setMensagem('Valor inválido.', 'erro');
          10: setMensagem('Problemas ao inserir o registro PRINCIPAL!'+#13+'Revise as informações do mesmo em busca de erros.'+#13+'Caso continue gerando esta mensagem, use a opção CANCELAR e tente SALVAR novamente.', 'erro');
          11: setMensagem('Problemas ao Excluir!', 'erro');
          12: setMensagem('Este registro possui dependências!', 'erro');
          13: setMensagem('A tabela não está ativa. Cancele o registro e tente novamente.', 'erro');
          14: setMensagem('Limite numério da empresa foi alcançado.', 'erro');
          15: setMensagem('Problemas ao realizar pesquisa.', 'erro');
          16: setMensagem('Já existe um arquivo para este registro no servidor e ele será sobreposto.', 'erro');
          17: setMensagem('Registro padrão. Não pode ser excluído.', 'erro');
          18: setMensagem('Esta informação já existe OU falta salvar o formulário principal antes de continuar.', 'erro');
          19: PRINCIPAL.setMensagem('Desculpe a demora... Problemas ao encontrar a imagem. Verifique se a imagem existe OU verifique o caminho do servidor.');
          20: setMensagem('O formulário para retorno não foi encontrado.', 'erro');
          21: setMensagem('Erro ao retornar os dados.', 'erro');
          22: setMensagem('Registro sem imagem.', 'erro');
          23: setMensagem('O sistema identificou um erro.'+#13+'=> Se você estava no meio de alguma operação, as informações nas quais'+#13+'você estava trabalhando podem ter sito perdidas.'+#13+#13'=> Criamos um relatório de erros que você pode nos'+#13+'enviar posteriormente usando a Central de Erros.', 'erro');
          24: setMensagem('Erro ao salvar o registro. Cancele a entrada e tente novamente.', 'erro');
          25: setMensagem('Erro ao salvar o registro de imagem. Cancele a entrada e tente novamente.', 'erro');
     Else
         setMensagem('Número do erro não catalogado.', 'erro');
     End;
End;

Procedure INFORMA(X: integer);
Begin

     Case X of
          1: PRINCIPAL.setMensagem('O registro foi salvo com sucesso!');
          2: PRINCIPAL.setMensagem('O registro foi excluído com sucesso!');
     Else
         setMensagem('Número do erro não catalogado.', 'erro');
     End;
End;

end.
