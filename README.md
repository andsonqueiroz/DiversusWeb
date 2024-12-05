DIVERSUS - Projeto WEB

Desenvolvido pelos alunos de ADS do Instituto Federal Baiano - Campus Guanambi:
Andson de Queiroz Domingues,
Paulo José Pereira Trindade,
Breno Ramos Teixeira Soares,
com apoio e orientação do professor:
Woquiton Lima Fernandes.

A Diversus é uma plataforma web, desenvolvida para reunir diversos especialistas em questões inclusivas, principalmente no âmbito escolar. Este projeto foi construído utilizando tecnologias modernas e confiáveis para garantir desempenho, segurança e escalabilidade.

*

Tecnologias Utilizadas
Apache Tomcat v10: Servidor de aplicação responsável pelo gerenciamento das solicitações e resposta aos clientes de maneira eficiente.

MySQL JDBC Driver: Facilita a conexão e comunicação entre o projeto e o banco de dados MySQL.

Javax.mail: Biblioteca utilizada para envio de e-mails, permitindo notificações e comunicação direta com os usuários do sistema.

*

Estrutura do Projeto
Back-end:

Desenvolvido em Java.
Integração com banco de dados MySQL para persistência de dados.
Implementação de funcionalidades com foco em segurança e escalabilidade.

Front-end:

Interfaces web, desenvolvidas em HTML5, JSP e CSS3, com responsividade utilizando media query, e javascript para funções complexos de interface.

*

Funcionalidades:

Criação de cadastro de especialistas, anexando certificado que comprove sua especialidade;
Autenticação segura de usuários;
Criação de publicações sobre temas específicos e comentários;
Visualização de perfis de qualquer especialista cadastrado, com informações de contato e portfólio;
Inserção de foto no perfil;
Envio automatizado de Newsletter por e-mail via protocolo SMTP utilizando a biblioteca javax.mail. e javax.activation;
Gerenciamento de cadastro de novos usuários;
Integração robusta com banco de dados para operações CRUD.

*

Requisitos para Execução:

Java SE 17 ou superior.
Apache Tomcat v10 ou superior.
Banco de dados MySQL configurado e acessível.

Dependências Java:
* Todas as dependências do projeto estão na pasta "\Codigo-fonte\DiversusWeb2\Drivers" *
MySQL Connector/J (JDBC Driver).
Javax.mail.
Javax.activation 

*

CONFIGURAÇÃO:

Crie o banco de dados com o script SQL fornecido no arquivo "Banco de dados Diversus.sql"

Configure o acesso ao banco de dados (host e senha) na classe "Conexao.java" (\java\model\Conexao.java)

* OBSERVAÇÃO *
Todas as imagens que forem inseridas, serão armazenadas em um local absoluto.

Foto de perfil: Para alterar o local onde a foto de perfil de cada usuário será armazenada, vá no Servlet "InserirFotoPerfilServlet" no diretório (\java\controller), e altere a linha 66 do código para o diretório absoluto, ou torne o diretório relativo ao projeto, assim será possível salvar em qualquer servidor sem necessitar de um local absoluto.

Foto da publicação: Para alterar o local onde a foto da publicação criada será armazenada, vá no Servlet "CriarPostServlet" no diretório (\java\controller), e altere a linha 84 do código para armazenar a imagem no local absoluto desejado (ou local relativo).

Configure as credenciais de SMTP no arquivo "EmailSender.java", no diretório (\java\controller) garantir o envio correto de e-mails.

Caso queira alterar o modelo de newsletter que receberá por e-mail, vá no arquivo "admin.java", no diretório (\java\model), e altere o código HTML no método "criarNewsletter".

Para implantação em servidor WEB, exporte o projeto com o formato .WAR, e siga as instruções do manual de instalação do servidor desejado.

* 

Diversus é um projeto em constante evolução. Se você tiver sugestões, críticas ou ideias, sinta-se à vontade para compartilhar! 😊

Desenvolvido com ❤️ por uma equipe dedicada.
Obrigado!
