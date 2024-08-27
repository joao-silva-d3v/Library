-- Criar o banco de dados
CREATE DATABASE LibraryDB;
GO

-- Usar o banco de dados criado
USE LibraryDB;
GO

-- Criar as tabelas
CREATE TABLE Autores (
  AutorID INT PRIMARY KEY IDENTITY(1,1),
  Nome VARCHAR(50),
  Sobrenome VARCHAR(50)
);

CREATE TABLE Livros (
  LivroID INT PRIMARY KEY IDENTITY(1,1),
  Titulo VARCHAR(100),
  ISBN VARCHAR(20),
  Editora VARCHAR(50),
  DataPublicacao DATE,
  AutorID INT,
  FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

CREATE TABLE Usuarios (
  UsuarioID INT PRIMARY KEY IDENTITY(1,1),
  Nome VARCHAR(50),
  Sobrenome VARCHAR(50),
  Email VARCHAR(100),
  Telefone VARCHAR(20)
);

CREATE TABLE Emprestimos (
  EmprestimoID INT PRIMARY KEY IDENTITY(1,1),
  LivroID INT,
  UsuarioID INT,
  DataEmprestimo DATE,
  DataDevolucao DATE,
  DataDevolvido DATE,
  FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
  FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Exemplares (
  ExemplarID INT PRIMARY KEY IDENTITY(1,1),
  LivroID INT,
  NumeroExemplar INT,
  Status VARCHAR(20) CHECK(Status IN ('Disponível', 'Emprestado', 'Danificado')),
  FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
);

-- Inserir alguns dados de exemplo
INSERT INTO Autores (Nome, Sobrenome)
VALUES
  ('J.K.', 'Rowling'),
  ('J.R.R.', 'Tolkien'),
  ('George R.R.', 'Martin');

INSERT INTO Livros (Titulo, ISBN, Editora, DataPublicacao, AutorID)
VALUES
  ('Harry Potter e a Pedra Filosofal', '9780747532743', 'Bloomsbury', '1997-06-26', 1),
  ('O Senhor dos Anéis', '9780261103574', 'Allen & Unwin', '1954-07-29', 2),
  ('A Guerra dos Tronos', '9780553103547', 'Bantam Books', '1996-08-01', 3),
  ('Harry Potter e a Câmara Secreta', '9780747532750', 'Bloomsbury', '1998-07-02', 1),
  ('As Duas Torres', '9780261103581', 'Allen & Unwin', '1954-11-11', 2);

INSERT INTO Usuarios (Nome, Sobrenome, Email, Telefone)
VALUES
  ('João', 'Silva', 'joaosilva@example.com', '1234-5678'),
  ('Emily', 'Silva', 'emilysilva@example.com', '9876-5432');

INSERT INTO Emprestimos (LivroID, UsuarioID, DataEmprestimo, DataDevolucao, DataDevolvido)
VALUES
  (1, 1, '2022-01-01', '2022-01-31', NULL),
  (2, 2, '2022-02-01', '2022-02-28', NULL),
  (3, 1, '2022-03-01', '2022-03-31', '2022-03-20');

INSERT INTO Exemplares (LivroID, NumeroExemplar, Status)
VALUES
  (1, 1, 'Emprestado'),
  (1, 2, 'Disponível'),
  (2, 1, 'Disponível'),
  (3, 1, 'Danificado'),
  (4, 1, 'Disponível'),
  (5, 1, 'Disponível');