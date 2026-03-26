/* RESPOSTAS FELLIPE DE AGUIAR GOMES, 5 PERIODO DE SISTEMAS DE INFORMAÇÃO*/

/*ATIVIDADE 1 TESTE*/ 
USE ComicCenter;

SELECT 
    Cliente.Cliente_id, Cliente.Nome, Telefone.Numero
FROM
    Cliente
        INNER JOIN
    Telefone ON Cliente.Cliente_id = Telefone.Cliente_id;


USE ComicCenter;

SELECT 
    C.Cliente_id, C.Nome, T.Numero
FROM
    Cliente AS C
        INNER JOIN
    Telefone AS T ON C.Cliente_id = T.Cliente_id;

USE ComicCenter;

SELECT 
    C.Cliente_id, C.Nome, T.Numero, E.Cliente_email
FROM
    Cliente AS C
        INNER JOIN
    Telefone AS T ON C.Cliente_id = T.Cliente_id
        INNER JOIN
    Email AS E ON E.Cliente_id = C.Cliente_id;








/*ATIVIDADE 2 EXERCICIOS DE FIXAÇÃO*/


                 /*1-Nome e Especie*/
SELECT
    c.Name, 
    s.Specie_Name

    FROM `Character` c
        JOIN `Specie` s 
        ON c.`Specie` = s.`Specie_id`
    LIMIT 100;

                 /*2- Nome e Localização */
SELECT
    c.Name, 
    l.Location_Name

    FROM `Character` c
        JOIN `Location` l ON c.`Origin` = l.`Location_id`
    LIMIT 100;

                 /*3- Nome e Localização */
SELECT
    c.Name, 
    l.Location_Name,
    s.Specie_Name

    FROM `Character` c
        LEFT JOIN  `Location` l ON c.`Origin` = l.`Location_id`
        LEFT JOIN `Specie` s ON c.
    LIMIT 100;












 
/*ATIVIDADE 3*/ 
            /*1-Pessoa_Associada e Endereco.*/
SELECT 
    CONCAT(pa.Nome, ' ', pa.Sobrenome) AS 'Nome Completo',
    e.Logradouro,
    e.Numero
FROM academia.Pessoa_Associada pa
JOIN academia.Endereco e 
    ON pa.Endereco_ID = e.Endereco_ID;


            /*2- Pessoa_Associada e Plano*/
SELECT 
    CONCAT(pa.Nome, ' ', pa.Sobrenome) AS 'Nome Completo',
    p.Nome_plano
FROM academia.Pessoa_Associada pa
JOIN academia.Plano p 
    ON pa.`Plano_ID` = p.`Plano_ID` LIMIT 100


            /*3- Pessoa_Associada, telefone, cep*/
SELECT 
    CONCAT(pa.Nome, ' ', pa.Sobrenome) AS 'Nome Completo',
    t.Telefone_Contato AS Telefone, 
    e.CEP
FROM academia.Pessoa_Associada pa
JOIN academia.Telefone t 
    ON pa.`Telefone_ID` = t.`telefone_ID`
JOIN academia.Endereco e 
    ON pa.`Endereco_ID` = e.`Endereco_ID` LIMIT 100


             /*4- Pessoa Treinadora, Telefone, Cep*/
SELECT 
    CONCAT(pa.Nome, ' ', pa.Sobrenome) AS 'Nome Completo',
    t.Telefone_Contato AS Telefone, 
    e.CEP
FROM academia.Pessoa_Associada pa
JOIN academia.Telefone t 
    ON pa.`Telefone_ID` = t.`telefone_ID`
JOIN academia.Endereco e 
    ON pa.`Endereco_ID` = e.`Endereco_ID` LIMIT 100


            /*5-Pessoa Associada, Telefone e Telefone de Emergencia*/
SELECT 
    CONCAT(pa.Nome, ' ', pa.Sobrenome) AS 'Nome Completo',
    COALESCE(t.`Telefone_Emergencia`, 'PENDENTE') AS 'Telefone de Emergencia'
FROM academia.Pessoa_Associada pa
JOIN academia.Telefone t 
    ON pa.`Telefone_ID` = t.`telefone_ID` LIMIT 100


            /*6-Dois Nomes de Pessoas Associadas com o mesmo enedereco*/

SELECT 
    CONCAT(pa1.Nome, ' ', pa1.Sobrenome) AS Nome1,
    CONCAT(pa2.Nome, ' ', pa2.Sobrenome) AS Nome2
    
FROM academia.Pessoa_Associada pa1
JOIN academia.Pessoa_Associada pa2
    ON pa1.`Endereco_ID` = pa2.`Endereco_ID` 
    AND pa1.`Pessoa_Associada_ID` < pa2.`Pessoa_Associada_ID`
    LIMIT 100


            /*7- Dois Nomes de Pessoas Treinadoras com o mesmo endereço*/
SELECT 
    CONCAT(pa1.Nome, ' ', pa1.Sobrenome) AS Nome1,
    CONCAT(pa2.Nome, ' ', pa2.Sobrenome) AS Nome2
FROM academia.`Pessoa_Treinadora` pa1
JOIN academia.`Pessoa_Treinadora` pa2
    ON pa1.`Endereco_ID` = pa2.`Endereco_ID` 
    AND pa1.`Pessoa_Treinadora_ID` < pa2.`Pessoa_Treinadora_ID`
    LIMIT 100

           /*8-Plano e quantas Pessoas Inclusas*/
SELECT 
	p.Nome_Plano,
    COUNT (pa.`Pessoa_Associada_ID`) AS 'Pessoas Inclusa!'
FROM academia.`Plano` p
LEFT JOIN academia.`Pessoa_Associada` pa 
    ON p.`Plano_ID` = p.`Plano_ID` 
 GROUP BY p.`Plano_ID`, p.`Nome_plano`   
 LIMIT 100

	   /*9-Nome da Pessoas e Periodo*/
SELECT 
    CONCAT(pa.Nome, ' ', pa.Sobrenome) AS 'Nome Completo',
    h.Periodo
FROM academia.Pessoa_Associada pa
JOIN academia.`Treino` t 
    ON pa.`Pessoa_Associada_ID` = t.`Pessoa_Associada_ID`
	LEFT JOIN academia.`Horario` h
	ON t.`Horario_ID` = h.`Horario_ID`
LIMIT 100;


           /*10- Nome da Pessoa e Perido, caso não tenha o período é livre*/
SELECT 
    CONCAT(pa.Nome, ' ', pa.Sobrenome) AS 'Nome Completo',
    COALESCE(h.periodo, 'LIVRE') AS Horario
FROM academia.Pessoa_Associada pa
JOIN academia.`Treino` t 
    ON pa.`Pessoa_Associada_ID` = t.`Pessoa_Associada_ID`
	LEFT JOIN academia.`Horario` h
	ON t.`Horario_ID` = h.`Horario_ID`
LIMIT 100