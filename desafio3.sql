SELECT 
	u.nome AS usuario, 
	COUNT(h.usuario_id) AS qt_de_musicas_ouvidas,
  ROUND((SUM(c.duracao_segundos) / 60), 2) AS total_minutos
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_de_reproducoes AS h ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.cancoes AS c ON h.cancao_id = c.cancao_id
GROUP BY u.nome
ORDER BY u.nome ASC;