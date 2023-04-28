/* 1.3 Segundo Desafio da fase: Comandos DQL (Data Query Language) */


/*a) Crie uma consulta SQL por meio do comando SELECT que exiba informa��es das categorias de produto e respectivos produtos de cada categoria.  Exiba as seguintes 
informa��es: c�digo e nome da categoria, c�digo e descri��o do produto, valor unit�rio, tipo de embalagem e percentual do lucro de cada produto. 
Caso exista alguma categoria sem produto, favor exibir a categoria e deixar os dados do produto em branco. Classifique a consulta em ordem de categoria e nome de produto de forma ascendente. */

-- * Comando SQL item a)
SELECT CP.CD_CATEGORIA as Categoria, CP.DS_CATEGORIA as Nome_Categoria, P.CD_PRODUTO as C�digo_Produto, P.DS_PRODUTO as Descri��o_Produto, 
P.VL_UNITARIO as Valor_Unit�rio, P.TP_EMBALAGEM as Tipo_Embalagem, P.VL_PERC_LUCRO as Lucro
FROM MC_CATEGORIA_PROD CP LEFT JOIN MC_PRODUTO P ON CP.CD_CATEGORIA = P.CD_CATEGORIA
ORDER BY CP.CD_CATEGORIA ASC, P.DS_PRODUTO ASC;


/*b) Crie uma instru��o SQL que exiba os dados dos clientes pessoas f�sicas. Exiba as seguintes informa��es: c�digo e nome do cliente, e-mail, telefone, 
login, data de nascimento, dia da semana de nascimento, anos de vida, sexo biol�gico e CPF.  */

-- * Comando SQL item b)
SELECT C.NR_CLIENTE as C�digo_Cliente, C.NM_CLIENTE as Nome_Cliente, C.DS_EMAIL as Email, C.NR_TELEFONE as Telefone, 
C.NM_LOGIN as Login, CF.DT_NASCIMENTO as Data_Nascimento, TRUNC(MONTHS_BETWEEN(SYSDATE, CF.DT_NASCIMENTO)/12) as Anos_Vida, CF.FL_SEXO_BIOLOGICO as Sexo_Biol�gico, CF.NR_CPF
FROM MC_CLIENTE C LEFT JOIN MC_CLI_FISICA CF ON C.NR_CLIENTE = CF.NR_CLIENTE;


/*c) Crie uma instru��o SQL que exiba os dados dos clientes pessoa jur�dica. Exiba as seguintes informa��es: 
c�digo e nome do cliente, e-mail, telefone, login, data de funda��o, dia da semana da funda��o, anos de vida da empresa e CNPJ. */

-- * Comando SQL item c)
SELECT C.NR_CLIENTE as C�digo_Cliente, C.NM_CLIENTE as Nome_Cliente, C.DS_EMAIL as Email, C.NR_TELEFONE as Telefone, 
C.NM_LOGIN as Login, CJ.DT_FUNDACAO as Data_Funda��o, TO_CHAR(CJ.DT_FUNDACAO, 'DAY') as Dia_Semana_Fundac, TRUNC(MONTHS_BETWEEN(SYSDATE, CJ.DT_FUNDACAO)/12) as Anos_Vida_Emp, CJ.NR_CNPJ as CNPJ
FROM MC_CLIENTE C LEFT JOIN MC_CLI_JURIDICA CJ ON C.NR_CLIENTE = CJ.NR_CLIENTE; 

/*Exiba as seguintes informa��es da tabela de visualiza��o dos v�deos dos produtos: 
c�digo do produto, nome do produto, data e hora de visualiza��o do produto. Exiba essas informa��es classificadas pela data e hora mais recente.*/

-- * Comando SQL item d)
SELECT P.CD_PRODUTO as C�d_Produto, P.DS_PRODUTO as Nome_Produto, VV.DT_VISUALIZACAO as DT_Visualiza��o, VV.NR_HORA_VISUALIZACAO as Hora_Visualiza��o
FROM MC_SGV_VISUALIZACAO_VIDEO VV
LEFT JOIN MC_PRODUTO P ON VV.CD_PRODUTO = P.CD_PRODUTO
ORDER BY VV.NR_HORA_VISUALIZACAO, VV.DT_VISUALIZACAO;