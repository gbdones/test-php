-- Table Turma

CREATE SEQUENCE turma_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE turma_id_seq
  OWNER TO postgres;

CREATE TABLE Turma(
 IDTurma integer NOT NULL DEFAULT nextval('turma_id_seq'),
 Nome Character varying(200),
 IDFuncionario Integer NOT NULL
)
;

-- Add keys for table Turma

ALTER TABLE Turma ADD CONSTRAINT Key1 PRIMARY KEY (IDTurma,IDFuncionario)
;

ALTER TABLE Turma ADD CONSTRAINT TurmaID UNIQUE (IDTurma)
;

-- Table Horario
CREATE SEQUENCE horario_idhorario_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE horario_idhorario_seq
  OWNER TO postgres;

CREATE TABLE Horario(
 IDHorario integer NOT NULL DEFAULT nextval('horario_idhorario_seq'),
 HoraInicio Timestamp(6),
 HoraFim Timestamp(6),
 DataCompleta Timestamp NOT NULL,
 IDTurma Integer NOT NULL
)
;

-- Add keys for table Horario

ALTER TABLE Horario ADD CONSTRAINT Key2 PRIMARY KEY (IDHorario,DataCompleta,IDTurma)
;

ALTER TABLE Horario ADD CONSTRAINT IDHorario UNIQUE (IDHorario)
;

/*
-- Table Data

CREATE TABLE Data(
 DataCompleta Timestamp NOT NULL,
 Dia Numeric(2,0),
 Mes Numeric(2,0),
 Ano Numeric(4,0),
 DiaSemana Character varying(50),
 FinalDeSemana Character varying(1)
)
;

-- Add keys for table Data

ALTER TABLE Data ADD CONSTRAINT Key3 PRIMARY KEY (DataCompleta)
;

ALTER TABLE Data ADD CONSTRAINT DataCompleta UNIQUE (DataCompleta)
;
*/
-- Table Matricula
CREATE SEQUENCE Matricula_IDMatricula_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Matricula_IDMatricula_seq
  OWNER TO postgres;

CREATE TABLE Matricula(
 IDMatricula integer NOT NULL DEFAULT nextval('Matricula_IDMatricula_seq'),
 DataInicio Timestamp,
 DataFim Timestamp,
 ValorDesconto Numeric(10,2),
 Situacao Character varying(50),
 IDTurma Integer NOT NULL
)
;
COMMENT ON COLUMN Matricula.Situacao IS 'Situações do Aluno Portador da Matricula:
Ativo
Inativo
Inadimplente'
;

-- Add keys for table Matricula

ALTER TABLE Matricula ADD CONSTRAINT Key4 PRIMARY KEY (IDMatricula,IDTurma)
;

ALTER TABLE Matricula ADD CONSTRAINT IDMatricula UNIQUE (IDMatricula)
;

-- Table Aluno
CREATE SEQUENCE Aluno_IDAluno_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Aluno_IDAluno_seq
  OWNER TO postgres;


CREATE TABLE Aluno(
 IDAluno integer NOT NULL DEFAULT nextval('Aluno_IDAluno_seq'),
 Nome Character varying(200),
 DataNascimento Timestamp,
 RG Numeric(10,0),
 CPF Character varying(11),
 Email Character varying(100),
 Celular Numeric(12,0),
 Telefone Numeric(12,0),
 Observacao Character varying(500),
 IDSexo Integer NOT NULL,
 IDResponsavel Integer NOT NULL,
 IDMatricula Integer NOT NULL,
 IDEndereco Integer NOT NULL
)
;

-- Add keys for table Aluno

ALTER TABLE Aluno ADD CONSTRAINT Key5 PRIMARY KEY (IDAluno,IDSexo,IDResponsavel,IDMatricula,IDEndereco)
;

ALTER TABLE Aluno ADD CONSTRAINT IDAluno UNIQUE (IDAluno)
;

-- Table Sexo
CREATE SEQUENCE Sexo_IDSexo_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Sexo_IDSexo_seq
  OWNER TO postgres;

CREATE TABLE Sexo(
 IDSexo integer NOT NULL DEFAULT nextval('Sexo_IDSexo_seq'),
 Descricao Character varying(1),
 DescricaoCompleta Character varying(20)
)
;

-- Add keys for table Sexo

ALTER TABLE Sexo ADD CONSTRAINT Key6 PRIMARY KEY (IDSexo)
;

ALTER TABLE Sexo ADD CONSTRAINT IDSexo UNIQUE (IDSexo)
;

-- Table Mensalidade
CREATE SEQUENCE Mensalidade_IDMensalidade_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Mensalidade_IDMensalidade_seq
  OWNER TO postgres;


CREATE TABLE Mensalidade(
 IDMensalidade integer NOT NULL DEFAULT nextval('Mensalidade_IDMensalidade_seq'),
 DataVencimento Timestamp,
 Valor Numeric(10,2),
 DataPgto Numeric(10,2),
 Multa Numeric(10,2),
 IDTipoPagamento Integer NOT NULL,
 IDMatricula Integer NOT NULL
)
;

-- Add keys for table Mensalidade

ALTER TABLE Mensalidade ADD CONSTRAINT Key7 PRIMARY KEY (IDMensalidade,IDTipoPagamento,IDMatricula)
;

ALTER TABLE Mensalidade ADD CONSTRAINT IDMensalidade UNIQUE (IDMensalidade)
;

-- Table TipoPagamento
CREATE SEQUENCE TipoPagamento_IDTipoPagamento_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE TipoPagamento_IDTipoPagamento_seq
  OWNER TO postgres;

CREATE TABLE TipoPagamento(
 IDTipoPagamento integer NOT NULL DEFAULT nextval('TipoPagamento_IDTipoPagamento_seq'),
 TipoPagamentoDesc Character varying(100)
)
;
COMMENT ON COLUMN TipoPagamento.TipoPagamentoDesc IS 'Tipo de Pagamento:
Dinheiro
Cartão de Crédito
Débito'
;

-- Add keys for table TipoPagamento

ALTER TABLE TipoPagamento ADD CONSTRAINT Key8 PRIMARY KEY (IDTipoPagamento)
;

ALTER TABLE TipoPagamento ADD CONSTRAINT IDTipoPagamento UNIQUE (IDTipoPagamento)
;

-- Table Responsavel
CREATE SEQUENCE Responsavel_IDResponsavel_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Responsavel_IDResponsavel_seq
  OWNER TO postgres;


CREATE TABLE Responsavel(
 IDResponsavel integer NOT NULL DEFAULT nextval('Responsavel_IDResponsavel_seq'),
 Nome Character varying(200),
 DataNascimento Timestamp,
 RG Numeric(10,0),
 CPF Character varying(11),
 Email Character varying(100),
 Telefone Numeric(12,0),
 Celular Numeric(12,0),
 IDSexo Integer NOT NULL,
 IDTipoResponsavel Integer NOT NULL,
 IDEndereco Integer NOT NULL
)
;

-- Add keys for table Responsavel

ALTER TABLE Responsavel ADD CONSTRAINT Key10 PRIMARY KEY (IDResponsavel,IDSexo,IDTipoResponsavel,IDEndereco)
;

ALTER TABLE Responsavel ADD CONSTRAINT IDResponsavel UNIQUE (IDResponsavel)
;

-- Table TipoResponsavel
CREATE SEQUENCE TipoResponsavel_IDTipoResponsavel_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE TipoResponsavel_IDTipoResponsavel_seq
  OWNER TO postgres;

CREATE TABLE TipoResponsavel(
 IDTipoResponsavel integer NOT NULL DEFAULT nextval('TipoResponsavel_IDTipoResponsavel_seq'),
 Nome Character varying(200)
)
;

-- Add keys for table TipoResponsavel

ALTER TABLE TipoResponsavel ADD CONSTRAINT Key11 PRIMARY KEY (IDTipoResponsavel)
;

ALTER TABLE TipoResponsavel ADD CONSTRAINT IDTipoResponsavel UNIQUE (IDTipoResponsavel)
;

-- Table Produto
CREATE SEQUENCE Produto_IDProduto_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Produto_IDProduto_seq
  OWNER TO postgres;

CREATE TABLE Produto(
 IDProduto integer NOT NULL DEFAULT nextval('Produto_IDProduto_seq'),
 Descricao Character varying(200),
 Valor Numeric(10,2),
 IDTipoProduto Integer NOT NULL
)
;

-- Add keys for table Produto

ALTER TABLE Produto ADD CONSTRAINT Key12 PRIMARY KEY (IDProduto,IDTipoProduto)
;

ALTER TABLE Produto ADD CONSTRAINT IDTipoEndereco UNIQUE (IDProduto)
;

-- Table TipoProduto
CREATE SEQUENCE TipoProduto_IDTipoProduto_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE TipoProduto_IDTipoProduto_seq
  OWNER TO postgres;

CREATE TABLE TipoProduto(
 IDTipoProduto integer NOT NULL DEFAULT nextval('TipoProduto_IDTipoProduto_seq'),
 Descricao Character varying(100)
)
;
COMMENT ON COLUMN TipoProduto.Descricao IS 'Tipos de Produto:
Estoque
Venda'
;

-- Add keys for table TipoProduto

ALTER TABLE TipoProduto ADD CONSTRAINT Key13 PRIMARY KEY (IDTipoProduto)
;

ALTER TABLE TipoProduto ADD CONSTRAINT IDTipoProduto UNIQUE (IDTipoProduto)
;

-- Table Funcionarios
CREATE SEQUENCE Funcionarios_IDFuncionario_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Funcionarios_IDFuncionario_seq
  OWNER TO postgres;

CREATE TABLE Funcionarios(
 IDFuncionario integer NOT NULL DEFAULT nextval('Funcionarios_IDFuncionario_seq'),
 Nome Character varying(200),
 Telefone Numeric(12,0),
 Celular Numeric(12,0),
 Email Character varying(100),
 CPF Character varying(11),
 RG Numeric(10,0),
 PIS Character varying(20),
 Salario Numeric(10,2),
 DtAdmissao Timestamp,
 IDCargo Integer NOT NULL,
 IDEndereco Integer NOT NULL,
 IDInstituicao Integer NOT NULL
)
;

-- Add keys for table Funcionarios

ALTER TABLE Funcionarios ADD CONSTRAINT Key14 PRIMARY KEY (IDFuncionario,IDCargo,IDEndereco,IDInstituicao)
;

ALTER TABLE Funcionarios ADD CONSTRAINT IDFuncionacio UNIQUE (IDFuncionario)
;

-- Table Cargo
CREATE SEQUENCE Cargo_IDCargo_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Cargo_IDCargo_seq
  OWNER TO postgres;

CREATE TABLE Cargo(
 IDCargo integer NOT NULL DEFAULT nextval('Cargo_IDCargo_seq'),
 Descricao Character varying(100),
 FaixaSalarial Character varying(50)
)
;
COMMENT ON COLUMN Cargo.Descricao IS 'Tipos de Cargo:
Gerente, Professor, Administrador, Assistente de Administrador, Estagiario, etc'
;
COMMENT ON COLUMN Cargo.FaixaSalarial IS 'Formato dos dados:

750 - 1000
1001 - 1500
1501 - 2000'
;

-- Add keys for table Cargo

ALTER TABLE Cargo ADD CONSTRAINT Key15 PRIMARY KEY (IDCargo)
;

ALTER TABLE Cargo ADD CONSTRAINT IDCargo UNIQUE (IDCargo)
;

-- Table ItemPedido
CREATE SEQUENCE ItemPedido_IDItemPedido_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE ItemPedido_IDItemPedido_seq
  OWNER TO postgres;

CREATE TABLE ItemPedido(
 IDItemPedido integer NOT NULL DEFAULT nextval('ItemPedido_IDItemPedido_seq'),
 Quantidade Numeric(10,0),
 Valor Numeric(10,2),
 IDPedido Integer NOT NULL,
 IDProduto Integer NOT NULL
)
;

-- Add keys for table ItemPedido

ALTER TABLE ItemPedido ADD CONSTRAINT Key16 PRIMARY KEY (IDItemPedido,IDPedido,IDProduto)
;

ALTER TABLE ItemPedido ADD CONSTRAINT IDItemPedido UNIQUE (IDItemPedido)
;

-- Table Pedido
CREATE SEQUENCE Pedido_IDPedido_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Pedido_IDPedido_seq
  OWNER TO postgres;

CREATE TABLE Pedido(
 IDPedido integer NOT NULL DEFAULT nextval('Pedido_IDPedido_seq'),
 DataPedido Timestamp(6),
 Valor Numeric(10,2),
 Pago Character varying(1),
 DataEntrega Timestamp(6),
 DataPrevisaoEntrega Timestamp(6),
 IDStatus Integer NOT NULL,
 IDMatricula Integer NOT NULL
)
;
COMMENT ON COLUMN Pedido.Pago IS 'Pago:
S = Sim
N = Não'
;

-- Add keys for table Pedido

ALTER TABLE Pedido ADD CONSTRAINT Key17 PRIMARY KEY (IDPedido,IDStatus,IDMatricula)
;

ALTER TABLE Pedido ADD CONSTRAINT Pedido UNIQUE (IDPedido)
;

-- Table Status
CREATE SEQUENCE Status_IDStatus_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Status_IDStatus_seq
  OWNER TO postgres;

CREATE TABLE Status(
 IDStatus integer NOT NULL DEFAULT nextval('Status_IDStatus_seq'),
 Descricao Character varying(100)
)
;
COMMENT ON COLUMN Status.Descricao IS 'Tipos de Status:
aberto, efetuado, Em andamento ,cancelado'
;

-- Add keys for table Status

ALTER TABLE Status ADD CONSTRAINT Key18 PRIMARY KEY (IDStatus)
;

ALTER TABLE Status ADD CONSTRAINT IDStatus UNIQUE (IDStatus)
;

-- Table Instituicao
CREATE SEQUENCE Instituicao_IDInstituicao_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Instituicao_IDInstituicao_seq
  OWNER TO postgres;

CREATE TABLE Instituicao(
 IDInstituicao integer NOT NULL DEFAULT nextval('Instituicao_IDInstituicao_seq'),
 Descricao Character varying(100),
 Telefone Numeric(12,0),
 IDEndereco Integer NOT NULL
)
;
COMMENT ON COLUMN Instituicao.Descricao IS 'Tipos de Instituição
Matriz
Filial
Filial01
Filial02'
;

-- Add keys for table Instituicao

ALTER TABLE Instituicao ADD CONSTRAINT Key20 PRIMARY KEY (IDInstituicao,IDEndereco)
;

ALTER TABLE Instituicao ADD CONSTRAINT IDInstituicao UNIQUE (IDInstituicao)
;

-- Table Endereco
CREATE SEQUENCE Endereco_IDEndereco_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE Endereco_IDEndereco_seq
  OWNER TO postgres;


CREATE TABLE Endereco(
 IDEndereco integer NOT NULL DEFAULT nextval('Endereco_IDEndereco_seq'),
 Logradouro Character varying(100),
 Complemento Character varying(50),
 Numero Numeric(10,0),
 UF Character varying(2),
 CEP Character varying(9)
)
;

-- Add keys for table Endereco

ALTER TABLE Endereco ADD CONSTRAINT Key21 PRIMARY KEY (IDEndereco)
;

ALTER TABLE Endereco ADD CONSTRAINT IDEndereco UNIQUE (IDEndereco)
;

-- Table ProdutoInstituicao
CREATE SEQUENCE ProdutoInstituicao_IDProdutoInst_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE ProdutoInstituicao_IDProdutoInst_seq
  OWNER TO postgres;

CREATE TABLE ProdutoInstituicao(
 IDProdutoInst integer NOT NULL DEFAULT nextval('ProdutoInstituicao_IDProdutoInst_seq'),
 Descricao Character varying(100),
 Quantidade Numeric(10,0),
 Valor Numeric(10,2),
 IDInstituicao Integer NOT NULL
)
;

-- Add keys for table ProdutoInstituicao

ALTER TABLE ProdutoInstituicao ADD CONSTRAINT Key22 PRIMARY KEY (IDProdutoInst,IDInstituicao)
;

ALTER TABLE ProdutoInstituicao ADD CONSTRAINT IDProdutoInst UNIQUE (IDProdutoInst)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "Horario" ADD CONSTRAINT "TurmaHorario" FOREIGN KEY ("IDTurma") REFERENCES "Turma" ("IDTurma") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Horario" ADD CONSTRAINT "DataHorario" FOREIGN KEY ("DataCompleta") REFERENCES "Data" ("DataCompleta") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Matricula" ADD CONSTRAINT "TurmaMatricula" FOREIGN KEY ("IDTurma") REFERENCES "Turma" ("IDTurma") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Aluno" ADD CONSTRAINT "MatriculaAluno" FOREIGN KEY ("IDMatricula") REFERENCES "Matricula" ("IDMatricula") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Aluno" ADD CONSTRAINT "AlunoSexo" FOREIGN KEY ("IDSexo") REFERENCES "Sexo" ("IDSexo") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Mensalidade" ADD CONSTRAINT "MatriculaMensalidade" FOREIGN KEY ("IDMatricula") REFERENCES "Matricula" ("IDMatricula") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Mensalidade" ADD CONSTRAINT "TipoPagamentoMensalidade" FOREIGN KEY ("IDTipoPagamento") REFERENCES "TipoPagamento" ("IDTipoPagamento") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Aluno" ADD CONSTRAINT "SexoAluno" FOREIGN KEY ("IDSexo") REFERENCES "Sexo" ("IDSexo") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Responsavel" ADD CONSTRAINT "SexoResponsavel" FOREIGN KEY ("IDSexo") REFERENCES "Sexo" ("IDSexo") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Aluno" ADD CONSTRAINT "ResponsavelAluno" FOREIGN KEY ("IDResponsavel") REFERENCES "Responsavel" ("IDResponsavel") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Responsavel" ADD CONSTRAINT "TipoRespRespnsavel" FOREIGN KEY ("IDTipoResponsavel") REFERENCES "TipoResponsavel" ("IDTipoResponsavel") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Produto" ADD CONSTRAINT "TipoProdutoProduto" FOREIGN KEY ("IDTipoProduto") REFERENCES "TipoProduto" ("IDTipoProduto") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Funcionarios" ADD CONSTRAINT "CargoFuncionario" FOREIGN KEY ("IDCargo") REFERENCES "Cargo" ("IDCargo") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "ItemPedido" ADD CONSTRAINT "ProdutoItemPedido" FOREIGN KEY ("IDProduto") REFERENCES "Produto" ("IDProduto") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "ItemPedido" ADD CONSTRAINT "PedidoItemPedido" FOREIGN KEY ("IDPedido") REFERENCES "Pedido" ("IDPedido") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Turma" ADD CONSTRAINT "TurmaFuncionario" FOREIGN KEY ("IDFuncionario") REFERENCES "Funcionarios" ("IDFuncionario") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Pedido" ADD CONSTRAINT "StatusPedido" FOREIGN KEY ("IDStatus") REFERENCES "Status" ("IDStatus") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Funcionarios" ADD CONSTRAINT "InstFuncionario" FOREIGN KEY ("IDInstituicao") REFERENCES "Instituicao" ("IDInstituicao") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Pedido" ADD CONSTRAINT "MatriculaPedido" FOREIGN KEY ("IDMatricula") REFERENCES "Matricula" ("IDMatricula") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Funcionarios" ADD CONSTRAINT "EnderecoFuncionario" FOREIGN KEY ("IDEndereco") REFERENCES "Endereco" ("IDEndereco") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Aluno" ADD CONSTRAINT "EnderecoAluno" FOREIGN KEY ("IDEndereco") REFERENCES "Endereco" ("IDEndereco") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Responsavel" ADD CONSTRAINT "EnderecoResponsavel" FOREIGN KEY ("IDEndereco") REFERENCES "Endereco" ("IDEndereco") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "ProdutoInstituicao" ADD CONSTRAINT "InstProd" FOREIGN KEY ("IDInstituicao") REFERENCES "Instituicao" ("IDInstituicao") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Instituicao" ADD CONSTRAINT "EnderecoInstituicao" FOREIGN KEY ("IDEndereco") REFERENCES "Endereco" ("IDEndereco") ON DELETE NO ACTION ON UPDATE NO ACTION
;