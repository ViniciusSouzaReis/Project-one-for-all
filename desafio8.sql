SELECT 
	art.nome AS artista,
    alb.nome AS album
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns as alb
ON art.artista_id = alb.artista_id
WHERE art.nome = 'Elis Regina'
ORDER BY album ASC;