Feature: Cadastro de Cursos
  Como um administrador do sistema
  Eu quero cadastrar cursos na plataforma
  Para que os clientes possam visualizar e se inscrever nos cursos

  Background:
    Given que estou na página de cadastro de cursos

  # Cenários de cadastro bem-sucedido
  Scenario: Cadastro de curso com todos os campos preenchidos corretamente
    Given que eu preenchi todos os campos obrigatórios
    When eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "Curso cadastrado com sucesso" deve aparecer
    And o curso deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso com nome preenchido corretamente
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    Then o campo "Nome do Curso" deve estar preenchido corretamente

  Scenario: Cadastro de curso com descrição preenchida corretamente
    When eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    Then o campo "Descrição do Curso" deve estar preenchido corretamente

  Scenario: Cadastro de curso com instrutor preenchido corretamente
    When eu preencho o campo "Instrutor" com "Gabriel Ulian"
    Then o campo "Instrutor" deve estar preenchido corretamente

  Scenario: Cadastro de curso com URL da imagem de capa preenchida corretamente
    When eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    Then o campo "URL Imagem de Capa" deve estar preenchido corretamente

  Scenario: Cadastro de curso com data de início preenchida corretamente
    When eu preencho o campo "Data de Início" com "01/08/2024"
    Then o campo "Data de Início" deve estar preenchido corretamente

  Scenario: Cadastro de curso com data de fim preenchida corretamente
    When eu preencho o campo "Data de Fim" com "01/09/2024"
    Then o campo "Data de Fim" deve estar preenchido corretamente

  Scenario: Cadastro de curso presencial com número de vagas preenchido corretamente
    When eu preencho o campo "Número de Vagas" com "20"
    And eu seleciono "Presencial"
    And eu preencho o campo "Endereço" com "Rua Exemplo, 123, Bairro Exemplo, Cidade Exemplo, Estado Exemplo, Complemento Exemplo, CEP 12345-678"
    Then o campo "Número de Vagas" deve estar preenchido corretamente

  Scenario: Cadastro de curso EAD com número de vagas preenchido corretamente
    When eu preencho o campo "Número de Vagas" com "30"
    And eu seleciono "EAD"
    Then o campo "Número de Vagas" deve estar preenchido corretamente

  Scenario: Cadastro de curso online com link de acesso preenchido corretamente
    When eu seleciono "EAD"
    And eu preencho o campo "Link de Acesso" com "http://cursoonline.com/acesso"
    Then o campo "Link de Acesso" deve estar preenchido corretamente

  Scenario: Cadastro de curso presencial com endereço preenchido corretamente
    When eu seleciono "Presencial"
    And eu preencho o campo "Endereço" com "Rua Exemplo, 123, Bairro Exemplo, Cidade Exemplo, Estado Exemplo, Complemento Exemplo, CEP 12345-678"
    Then o campo "Endereço" deve estar preenchido corretamente

  # Cenários de erros no cadastro

  Scenario: Cadastro de curso sem nome
    When eu não preencho o campo "Nome do Curso"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Nome do Curso é obrigatório" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso sem descrição
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu não preencho o campo "Descrição do Curso"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Descrição do Curso é obrigatório" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso sem instrutor
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu não preencho o campo "Instrutor"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Instrutor é obrigatório" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso com nome do instrutor inválido
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "12345"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Instrutor deve conter apenas letras" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso sem URL de imagem de capa
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu não preencho o campo "URL Imagem de Capa"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo URL Imagem de Capa é obrigatório" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso com URL de imagem de capa inválida
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "urlinvalido"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo URL Imagem de Capa deve conter um URL válido" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso sem data de início
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu não preencho o campo "Data de Início"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Data de Início é obrigatório" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso com data de início inválida
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu preencho o campo "Data de Início" com "01/08/2023"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "A Data de Início não pode ser anterior à data atual" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso sem data de fim
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu preencho o campo "Data de Início" com "01/08/2024"
    And eu não preencho o campo "Data de Fim"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Data de Fim é obrigatório" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso com data de fim inválida
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu preencho o campo "Data de Início" com "01/08/2024"
    And eu preencho o campo "Data de Fim" com "01/08/2023"
    And eu preencho os outros campos obrigatórios
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "A Data de Fim não pode ser anterior à Data de Início" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso sem número de vagas
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu preencho o campo "Data de Início" com "01/08/2024"
    And eu preencho o campo "Data de Fim" com "01/09/2024"
    And eu não preencho o campo "Número de Vagas"
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Número de Vagas é obrigatório" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso com número de vagas inválido
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu preencho o campo "Data de Início" com "01/08/2024"
    And eu preencho o campo "Data de Fim" com "01/09/2024"
    And eu preencho o campo "Número de Vagas" com "-5"
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Número de Vagas deve conter um número positivo" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso online com link de acesso inválido
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu preencho o campo "Data de Início" com "01/08/2024"
    And eu preencho o campo "Data de Fim" com "01/09/2024"
    And eu seleciono "EAD"
    And eu preencho o campo "Link de Acesso" com "linkinvalido"
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Link de Acesso deve conter um URL válido" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso presencial sem endereço
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu preencho o campo "Data de Início" com "01/08/2024"
    And eu preencho o campo "Data de Fim" com "01/09/2024"
    And eu seleciono "Presencial"
    And eu não preencho o campo "Endereço"
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Endereço é obrigatório" deve aparecer
    And o curso não deve ser adicionado à lista de cursos

  Scenario: Cadastro de curso presencial com endereço inválido
    When eu preencho o campo "Nome do Curso" com "Curso de Programação"
    And eu preencho o campo "Descrição do Curso" com "Curso de programação para iniciantes"
    And eu preencho o campo "Instrutor" com "Gabriel Ulian"
    And eu preencho o campo "URL Imagem de Capa" com "http://imagemdocurso.com/capa.jpg"
    And eu preencho o campo "Data de Início" com "01/08/2024"
    And eu preencho o campo "Data de Fim" com "01/09/2024"
    And eu seleciono "Presencial"
    And eu preencho o campo "Endereço" com "endereço inválido"
    And eu clico no botão "Cadastrar Curso"
    Then uma mensagem de "O campo Endereço deve conter um endereço válido" deve aparecer
    And o curso não deve ser adicionado à lista de cursos
