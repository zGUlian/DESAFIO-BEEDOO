Feature: Listar Cursos

  Scenario: Acessar o Botão Listar Cursos
    Given que o usuário está na página inicial
    When o usuário clica no botão "Listar Cursos"
    Then uma lista dos cursos cadastrados com sucesso na plataforma deve aparecer

Feature: Editar Curso

  Scenario: Editar Curso Cadastrado na plataforma
    Given que o usuário está na página de "Listar Cursos"
    And um curso está cadastrado na plataforma
    When o usuário clica em um curso
    Then deve abrir uma janela onde será possível editar as informações do curso
    And a janela deve ser similar à de cadastramento de cursos

Feature: Excluir Curso

  Scenario: Excluir Curso Cadastrado na plataforma
    Given que o usuário está na página de "Listar Cursos"
    And um curso está cadastrado na plataforma
    When o usuário clica no botão "Excluir" ao lado de um curso
    Then o curso deve ser excluído da lista de cursos
