SELECT 
	u.nome AS usuario,
	IF(YEAR(MAX(h.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_de_reproducoes AS h 
ON u.usuario_id = h.usuario_id
GROUP BY u.nome
ORDER BY u.nome ASC;