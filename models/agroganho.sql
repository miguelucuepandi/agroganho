-- ========================================
-- BASE DE DADOS: AGROGANHO
-- Versão: 1.0
-- Data: xx/xx/2025
-- Email: agroganho@gmail.com
-- Telefone: 932083458 /
-- ========================================

-- Remover base de dados se existir 
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
    categoria VARCHAR(200),
    tipo ENUM('Produto', 'Estabelecimentos', 'Dicas', 'Eventos'),
    descricao TEXT,
    icone VARCHAR(500),
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- TABELA: usuario
-- Descrição: Gestão de utilizadores do sistema
-- ========================================
CREATE TABLE usuario (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(500),
    telefone VARCHAR(20),
    email VARCHAR(250) UNIQUE,
    senha VARCHAR(255),
    localizacao varchar(500),
    papel ENUM('admin', 'usuario') DEFAULT 'usuario',
    foto VARCHAR(500),
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataUltimoAcesso TIMESTAMP,
    tokenRecuperacao VARCHAR(250),
    tokenExpiracao TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- TABELA: produto
-- Descrição: Catálogo de produtos
-- ========================================
CREATE TABLE produto (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(500) NOT NULL,
    descricao TEXT,
    idCategoria INT UNSIGNED,
    idUsuario INT UNSIGNED,
    preco DECIMAL(10, 2) DEFAULT 0.00,
    moeda VARCHAR(3) DEFAULT 'AOA',
    foto VARCHAR(500),
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataAtualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idCategoria) REFERENCES categoria(id) ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES usuario(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- INSERÇÃO DE DADOS INICIAIS
-- ========================================

-- Usuário
INSERT INTO usuario (papel, nome, email, telefone, senha) VALUES
('admin', 'Miguel Quintino Ucuepandi', 'miguel@gmail.com', 932083458, '$2y$10$Mz1.Z/YED5vDQCKNWZftOe.xtGKWA1qr8qCYna3MJlUZ2RfOFpM9S'),
('usuario', 'Usuario de teste', 'teste@gmail.com', 900000000, '$2y$10$deZi6rQ7ZFtk4kjPJNtffe0yq05CyLUcvufMW.E/4XBOG6RLAEWP6');


-- Senha => miguel
-- Senha => teste

-- categoria 
INSERT INTO categoria (tipo, categoria) VALUES

-- categoria de produto
('Produto', 'Tuberculos'),
('Produto', 'Horticulas'),
('Produto', 'Sementes'),

-- categoria de eventos
('Eventos', 'Feiras'),
('Eventos', 'Workshops');

-- ========================================
-- FIM DO SCRIPT
-- ========================================

