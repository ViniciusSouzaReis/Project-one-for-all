SELECT 
	c.nome AS nome,
    COUNT(h.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_de_reproducoes AS h ON c.cancao_id = h.cancao_id
INNER JOIN SpotifyClone.usuarios AS u ON u.usuario_id = h.usuario_id
WHERE u.plano_id IN (1, 4)
GROUP BY nome
ORDER BY nome ASC;