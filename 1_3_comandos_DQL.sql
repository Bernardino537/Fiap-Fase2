/* 1.3 Segundo Desafio da fase: Comandos DQL (Data Query Language) */


/*a) Crie uma consulta SQL por meio do comando SELECT que exiba informações das categorias de produto e respectivos produtos de cada categoria.  Exiba as seguintes 
informações: código e nome da categoria, código e descrição do produto, valor unitário, tipo de embalagem e percentual do lucro de cada produto. 
Caso exista alguma categoria sem produto, favor exibir a categoria e deixar os dados do produto em branco. Classifique a consulta em ordem de categoria e nome de produto de forma ascendente. */

-- * Comando SQL item a)
SELECT CP.CD_CATEGORIA as Categoria, CP.DS_CATEGORIA as Nome_Categoria, P.CD_PRODUTO as Código_Produto, P.DS_PRODUTO as Descrição_Produto, 
P.VL_UNITARIO as Valor_Unitário, P.TP_EMBALAGEM as Tipo_Embalagem, P.VL_PERC_LUCRO as Lucro
FROM MC_CATEGORIA_PROD CP LEFT JOIN MC_PRODUTO P ON CP.CD_CATEGORIA = P.CD_CATEGORIA
ORDER BY CP.CD_CATEGORIA ASC, P.DS_PRODUTO ASC;


/*b) Crie uma instrução SQL que exiba os dados dos clientes pessoas físicas. Exiba as seguintes informações: código e nome do cliente, e-mail, telefone, 
login, data de nascimento, dia da semana de nascimento, anos de vida, sexo biológico e CPF.  */

-- * Comando SQL item b)
SELECT C.NR_CLIENTE as Código_Cliente, C.NM_CLIENTE as Nome_Cliente, C.DS_EMAIL as Email, C.NR_TELEFONE as Telefone, 
C.NM_LOGIN as Login, CF.DT_NASCIMENTO as Data_Nascimento, TRUNC(MONTHS_BETWEEN(SYSDATE, CF.DT_NASCIMENTO)/12) as Anos_Vida, CF.FL_SEXO_BIOLOGICO as Sexo_Biológico, CF.NR_CPF
FROM MC_CLIENTE C LEFT JOIN MC_CLI_FISICA CF ON C.NR_CLIENTE = CF.NR_CLIENTE;


/*c) Crie uma instrução SQL que exiba os dados dos clientes pessoa jurídica. Exiba as seguintes informações: 
código e nome do cliente, e-mail, telefone, login, data de fundação, dia da semana da fundação, anos de vida da empresa e CNPJ. */

-- * Comando SQL item c)
SELECT C.NR_CLIENTE as Código_Cliente, C.NM_CLIENTE as Nome_Cliente, C.DS_EMAIL as Email, C.NR_TELEFONE as Telefone, 
C.NM_LOGIN as Login, CJ.DT_FUNDACAO as Data_Fundação, TO_CHAR(CJ.DT_FUNDACAO, 'DAY') as Dia_Semana_Fundac, TRUNC(MONTHS_BETWEEN(SYSDATE, CJ.DT_FUNDACAO)/12) as Anos_Vida_Emp, CJ.NR_CNPJ as CNPJ
FROM MC_CLIENTE C LEFT JOIN MC_CLI_JURIDICA CJ ON C.NR_CLIENTE = CJ.NR_CLIENTE; 

/*Exiba as seguintes informações da tabela de visualização dos vídeos dos produtos: 
código do produto, nome do produto, data e hora de visualização do produto. Exiba essas informações classificadas pela data e hora mais recente.*/

-- * Comando SQL item d)
SELECT P.CD_PRODUTO as Cód_Produto, P.DS_PRODUTO as Nome_Produto, VV.DT_VISUALIZACAO as DT_Visualização, VV.NR_HORA_VISUALIZACAO as Hora_Visualização
FROM MC_SGV_VISUALIZACAO_VIDEO VV
LEFT JOIN MC_PRODUTO P ON VV.CD_PRODUTO = P.CD_PRODUTO
ORDER BY VV.NR_HORA_VISUALIZACAO, VV.DT_VISUALIZACAO;