----------------------------------------------------------
----------------------------------------------------------
-- JUNÇÃO DE TABELAS COM FILTROS E ORDENAÇÃO
----------------------------------------------------------
----------------------------------------------------------
-- Explicação: Aqui obtemos informações sobre voos e os controlados que estão
-- associados a eles levando em conta apenas voos que ocorreram após
-- 2024-11-20. Como resultado, a consulta retorna o nome do controlador, o numero
-- de cauda do avião, o modelo do avião e o destino do voo, ordenados pelo
-- nome do controlador.
SELECT c.nome AS nome_controlador, v.numero_cauda, a.modelo, v.destino
FROM ControladordeVoo c 
JOIN Voo v ON c.id_voo = v.id_voo AND c.codIATA = v.codIATA AND c.codICAO = v.codICAO
JOIN Aviao av ON v.numero_cauda = av.numero_cauda
WHERE v.data_voo > '2024-11-20' ORDER BY c.nome;
