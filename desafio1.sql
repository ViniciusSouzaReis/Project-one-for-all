DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;
CREATE TABLE planos(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    valor DECIMAL(3,2)
);

CREATE TABLE artistas(
	artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL
);

CREATE TABLE albuns(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    ano_lancamento INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY(artista_id) REFERENCES artistas (artista_id)
);

CREATE TABLE cancoes(
	cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
	album_id INT NOT NULL,
    artista_id INT NOT NULL,
    duracao_segundos INT NOT NULL,
    FOREIGN KEY(album_id) REFERENCES albuns (album_id),
    FOREIGN KEY(artista_id) REFERENCES artistas (artista_id)
);

CREATE TABLE usuarios(
	usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY(plano_id) REFERENCES planos (plano_id)
);

CREATE TABLE historico_de_reproducoes(
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    data_reproducao VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY(cancao_id) REFERENCES cancoes (cancao_id)
);

CREATE TABLE seguindo_artistas(
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY(artista_id) REFERENCES artistas (artista_id)
);