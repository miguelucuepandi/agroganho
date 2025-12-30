-- ========================================
-- BASE DE DADOS: AGROGANHO
-- Versão: 1.0
-- Data: xx/xx/2025
-- Email: agroganho@gmail.com
-- Telefone: +244 932 083 458 / +244 947 444 108
-- ========================================

-- Remover base de dados caso exista
DROP DATABASE IF EXISTS agroganho;

-- Criar base de dados
CREATE DATABASE agroganho
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Usar a base de dados
USE agroganho;

-- ========================================
-- TABELA: categoria
-- Descrição: Classificação de conteúdo
-- ========================================
CREATE TABLE categoria (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(250),
    tipo ENUM('Produto', 'Estabelecimentos', 'Eventos'),
    descricao TEXT,
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- TABELA: unidade
-- Descrição: Classificação de unidades de produtos
-- ========================================
CREATE TABLE unidade (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    unidade VARCHAR(250),
    representacao varchar(10),
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- TABELA: usuario
-- Descrição: Gestão de utilizadores do sistema
-- ========================================
CREATE TABLE usuario (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(250),
    telefone VARCHAR(250),
    email VARCHAR(250) UNIQUE,
    usuario varchar(250) UNIQUE,
    senha VARCHAR(255),
    localizacao varchar(250),
    papel ENUM('admin', 'usuario') DEFAULT 'usuario',
    foto VARCHAR(500),
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataUltimoAcesso TIMESTAMP,
    tokenRecuperacao VARCHAR(250),
    tokenExpiracao TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- TABELA: Dicas
-- Descrição: Dicas 
-- ========================================
CREATE TABLE dica (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(250),
    descricao TEXT,
    idUsuario INT UNSIGNED,
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idUsuario) REFERENCES usuario(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- TABELA: Eventos
-- Descrição: Eventos
-- ========================================
CREATE TABLE evento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(250),
    idCategoria INT UNSIGNED,
    dataInicio DATE,
    horaInicio varchar(250),
    horaFim varchar(250),
    localizacao varchar(250),
    organizador varchar(250),
    descricao TEXT,
    idUsuario INT UNSIGNED,
    foto VARCHAR(500),
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idCategoria) REFERENCES categoria(id) ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES usuario(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- TABELA: Estabelecimentos 
-- Descrição: Estabelecimentos 
-- ========================================
CREATE TABLE estabelecimento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(250),
    telefone varchar(250),
    email varchar(250),
    descricao TEXT,
    idCategoria INT UNSIGNED,
    idUsuario INT UNSIGNED,
    localizacao varchar(250),
    foto VARCHAR(500),
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idCategoria) REFERENCES categoria(id) ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES usuario(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- TABELA: produto
-- Descrição: Catálogo de produtos
-- ========================================
CREATE TABLE produto (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    descricao TEXT,
    idCategoria INT UNSIGNED,
    idUnidade INT UNSIGNED,
    idUsuario INT UNSIGNED,
    idOrigem INT UNSIGNED,
    preco DECIMAL(250, 2) DEFAULT 0.00,
    moeda VARCHAR(3) DEFAULT 'AOA',
    foto VARCHAR(500),
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataAtualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idCategoria) REFERENCES categoria(id) ON DELETE CASCADE,
    FOREIGN KEY(idUnidade) REFERENCES unidade(id) ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES usuario(id) ON DELETE CASCADE
    FOREIGN KEY (idOrigem) REFERENCES estabelecimento(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ========================================
-- INSERÇÃO DE DADOS INICIAIS
-- ========================================

-- Usuário
INSERT INTO usuario (papel, nome, email, telefone, senha) VALUES
('usuario', 'Usuario de teste', 'teste@gmail.com', 900000000, '$2y$10$deZi6rQ7ZFtk4kjPJNtffe0yq05CyLUcvufMW.E/4XBOG6RLAEWP6');

-- Senhas hash
-- usuário => teste

-- Unidades 
INSERT INTO unidade (unidade, representacao) VALUES
('Unidade', 'UN'),
('Kilograma', 'Kg'),
('Litros', 'L');

-- categoria 
INSERT INTO categoria (tipo, categoria) VALUES

-- categoria de produto
('Produto', 'Tuberculos'),
('Produto', 'Horticulas'),
('Produto', 'Frutas'),
('Produto', 'Sementes'),
('Produto', 'Graus e Sereais'),

-- categoria de Estabelecimentos
('Estabelecimentos', 'Fazenda'),
('Estabelecimentos', 'Loja'),

-- categoria de eventos
('Eventos', 'Feira'),
('Eventos', 'Treinamento'),
('Eventos', 'Seminario'),
('Eventos', 'Conferencia'),
('Eventos', 'Workshop');

-- ========================================
-- FIM DO SCRIPT
-- ========================================

