SELECT 
	COUNT(h.cancao_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_de_reproducoes AS h
INNER JOIN SpotifyClone.usuarios AS u ON u.usuario_id = h.usuario_id
WHERE u.nome = 'Barbara Liskov';