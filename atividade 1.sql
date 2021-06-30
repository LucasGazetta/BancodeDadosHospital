use atividade1;

CREATE TABLE tipo_local(
idtipo_local INT,
clinica VARCHAR(45),
UPA VARCHAR(45),
local_atendimento_idlocal_atendimento INT,
local_atendimento_medico_idmedico INT,
FOREIGN KEY fk_local_atendimento(local_atendimento_idlocal_atendimento) REFERENCES local_atendimento(idlocal_atendimento),
FOREIGN KEY fk_local_medicoid(local_atendimento_medico_idmedico) REFERENCES local_atendimento(medico_idmedico),
PRIMARY KEY (idtipo_local));

CREATE TABLE local_atendimento(
idlocal_atendimento INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cnpj INT NOT NULL,
telefone VARCHAR(10),
medico_idmedico INT,
FOREIGN KEY fk_medico(`medico_idmedico`) REFERENCES medico(idmedico));

CREATE TABLE medico(
idmedico INT NOT NULL PRIMARY KEY,
nome VARCHAR(150),
funcao VARCHAR(45),
`local` VARCHAR(10),
turno VARCHAR(45),
telefone VARCHAR(45));

CREATE TABLE funcao(
idfuncao INT PRIMARY KEY,
medico VARCHAR(45),
enfermeiro VARCHAR(45),
zelador VARCHAR(45),
medico_idmedico INT,
FOREIGN KEY fk_md(medico_idmedico) REFERENCES medico(idmedico));

CREATE TABLE endereco(
rua VARCHAR(15),
numero INT,
bairo VARCHAR(20),
cep VARCHAR(20),
paciente_idpaciente INT,
local_atendimento_idlocal_atendimento INT,
local_atendimento_medico_idmedico INT,
medico_idmedico INT,
FOREIGN KEY	fk_pidp(paciente_idpaciente) REFERENCES paciente(idpaciente),
FOREIGN KEY fk_laida(local_atendimento_idlocal_atendimento) REFERENCES local_atendimento(idlocal_atendimento),
FOREIGN KEY fk_lamidm(local_atendimento_medico_idmedico) REFERENCES local_atendimento(medico_idmedico),
FOREIGN KEY fk_midm(medico_idmedico) REFERENCES medico(idmedico));

CREATE TABLE paciente(
idpaciente INT PRIMARY KEY,
nome VARCHAR(150),
cpf INT,
telefone INT,
medico_idmedico INT,
local_atendimento_idlocal_atendimento INT,
local_atendimento_medico_idmedico INT,
FOREIGN KEY fk_midm(medico_idmedico) REFERENCES medico(idmedico),
FOREIGN KEY fk_laidla(local_atendimento_idlocal_atendimento) REFERENCES local_atendimento(idlocal_atendimento),
FOREIGN KEY fk_lamidm(local_atendimento_medico_idmedico) REFERENCES local_atendimento(medico_idmedico));

CREATE TABLE pessoa_con(
nome VARCHAR(150),
paciente_idpaciente INT,
FOREIGN KEY fk_pidp(paciente_idpaciente) REFERENCES paciente(idpaciente));

CREATE TABLE exame(
idexame INT PRIMARY KEY,
resultado VARCHAR(45),
paciente_idpaciente INT,
medico_idmedico INT,
FOREIGN KEY fk_pidp(paciente_idpaciente) REFERENCES paciente(idpaciente),
FOREIGN KEY fk_midm(medico_idmedico) REFERENCES medico(idmedico));

CREATE TABLE prontuario(
idprontuario INT PRIMARY KEY,
origem_paciente VARCHAR(45),
locais_atendimento VARCHAR(45),
paciente_idpaciente INT,
paciente_idpaciente1 INT,
paciente_local_atendimento_idlocal_atendimento INT,
paciente_local_atendimento_medico_idmedico INT,
FOREIGN KEY fk_pidp(paciente_idpaciente) REFERENCES paciente(idpaciente),
FOREIGN KEY fk_pidp1(paciente_idpaciente1) REFERENCES paciente(idpaciente),
FOREIGN KEY plaidla(paciente_local_atendimento_idlocal_atendimento) REFERENCES paciente(local_atendimento_idlocal_atendimento),
FOREIGN KEY plamidm(paciente_local_atendimento_medico_idmedico) REFERENCES paciente(local_atendimento_medico_idmedico));

CREATE TABLE diagnostico(
iddiagnostico INT PRIMARY KEY,
`status` VARCHAR(1),
prontuario_idprontuario INT,
FOREIGN KEY fk_pidp(prontuario_idprontuario) REFERENCES prontuario(idprontuario));
