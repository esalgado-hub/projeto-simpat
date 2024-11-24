-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS simpat
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

-- Selecionar o banco de dados
USE simpat;

-- Criação da tabela usuario
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT AUTO_INCREMENT,       				-- Identificador único do usuário
    nome VARCHAR(255) NOT NULL,                     				-- Nome completo do usuário
    email VARCHAR(255) UNIQUE NOT NULL,               			  	-- Endereço de e-mail único
    senha VARCHAR(255) NOT NULL,                      				-- Senha criptografada do usuário
    tipo_usuario ENUM('admin', 'comum') DEFAULT 'comum',			-- Tipo de usuário (admin ou comum)
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 				-- Data de cadastro do usuário
    PRIMARY KEY (id_usuario)
) DEFAULT CHARSET = utf8mb4;

-- Criação da tabela bem
CREATE TABLE IF NOT EXISTS bem (
    id_bem INT AUTO_INCREMENT,            			-- Identificador único do bem
    patrim_ebserh INT UNIQUE NOT NULL,                       			-- Número de patrimônio Ebserh
    patrim_fub VARCHAR(50) UNIQUE NOT NULL,                            			-- Patrimônio FUB
    siads VARCHAR(50), 
    descricao_bem VARCHAR(255) NOT NULL,               			 -- Descrição do bem
    estado_conservacao enum("Bom", "Ruim") default 'Bom',         -- Estado de conservação do bem
    PRIMARY KEY (id_bem)
)DEFAULT CHARSET = utf8mb4;

-- Criação da tabela uorg
CREATE TABLE IF NOT EXISTS uorg (
    id_uorg INT AUTO_INCREMENT,           -- Identificador único da Uorg
    descricao VARCHAR(255) UNIQUE NOT NULL,                  -- Descrição da unidade organizacional
    localizacao VARCHAR(255),                          -- Localização da Uorg
    observacao TEXT,									   -- Observações adicionais
    PRIMARY KEY (id_uorg)
)DEFAULT CHARSET = utf8mb4;

-- Criação da tabela numero_serial
CREATE TABLE IF NOT EXISTS numero_serial (
    id_serial INT AUTO_INCREMENT,         				-- Identificador único do número serial
    num_serie VARCHAR(100) UNIQUE NOT NULL,                           -- Número de série do bem
    id_bem INT,                                       -- Identificador do bem relacionado
    id_usuario INT,                                   -- Usuário responsável pela ação
    PRIMARY KEY (id_serial),
    FOREIGN KEY (id_bem) REFERENCES bem(id_bem),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)DEFAULT CHARSET = utf8mb4;

-- Criação da tabela inventario
CREATE TABLE IF NOT EXISTS inventario (
    id_inventario INT AUTO_INCREMENT,    			 -- Identificador único do inventário
    patrim_ebserh INT UNIQUE NOT NULL,                     				 -- Número de patrimônio Ebserh
    patrim_fub INT UNIQUE NOT NULL,                        	  			-- Patrimônio FUB
    siads INT UNIQUE NOT NULL,                        	      			-- Patrimônio FUB no SIADS
    data DATE NOT NULL,                            			 	-- Data do inventário
    hora TIME NOT NULL,                            			    -- Hora do inventário
    descricao_bem VARCHAR(255) NOT NULL,             			 -- Descrição do bem
    estado_conservacao enum("Bom", "Ruim") default 'Bom',         -- Estado de conservação do bem
    local VARCHAR(255),                               			-- Localização do bem
    observacao TEXT,                                  			-- Observações adicionais
    id_usuario INT,                                   			-- Usuário responsável pela ação
    PRIMARY KEY (id_inventario),
    FOREIGN KEY (id_uorg) REFERENCES uorg(id_uorg),  -- Relacionamento com UORG
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) -- Relacionamento com Usuario
)DEFAULT CHARSET = utf8mb4;

-- Criação da tabela movimentacao
CREATE TABLE IF NOT EXISTS movimentacao (
    id_movimentacao INT AUTO_INCREMENT,   -- Identificador único da movimentação
    data DATE NOT NULL,                               -- Data da movimentação
    hora TIME NOT NULL,                               -- Hora da movimentação
    id_bem INT,                                       -- Identificador do bem relacionado
    num_patrimonio VARCHAR(50),                       -- Número de patrimônio complementar
    descricao_bem VARCHAR(255),                       -- Descrição do bem
    estado_conservacao enum("Bom", "Ruim") default 'Bom',         -- Estado de conservação do bem
    origem VARCHAR(255) NOT NULL,                     -- Local de origem da movimentação
    destino VARCHAR(255) NOT NULL,                    -- Local de destino da movimentação
    observacao TEXT,                                  -- Observações adicionais
    id_usuario INT,                                   -- Usuário responsável pela ação
    PRIMARY KEY (id_movimentacao),
    FOREIGN KEY (id_bem) REFERENCES bem(id_bem),
    FOREIGN KEY (id_origem) REFERENCES uorg(id_uorg),
    FOREIGN KEY (id_destino) REFERENCES uorg(id_uorg),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)DEFAULT CHARSET = utf8mb4;
