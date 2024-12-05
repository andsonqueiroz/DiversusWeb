<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>

<%
	String erro = (String) request.getAttribute("erro");
	String dataAtual = LocalDate.now().toString();
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/stylecadastro.css">
    <script>
        function confereSenha(){
            const senha = document.querySelector('input[name=senha]');
            const confirma = document.querySelector('input[name=confirmSenha]');

            if(confirma.value === senha.value){
                confirma.setCustomValidity('');
            }
            else{
                confirma.setCustomValidity('As senhas não conferem.');
            }
        }

        function confereEmail(){
            const email = document.querySelector('input[name=email]');
            const confirma = document.querySelector('input[name=confirmEmail]');

            if(confirma.value === email.value){
                confirma.setCustomValidity('');
            }
            else{
                confirma.setCustomValidity('Os emails não conferem.');  
            }
        }

    </script>
</head>
<body>
    <div id="container">
        <div class="imagem-esquerda">
        </div>
        <div class="cadastro">
            <div class="logo">
                <a href="#"> <img src="imagens/logoDiversus.png" alt="Logo Diversus"> </a>  <!--Ligar a tela de Apresentação-->
            </div>
            <div class="form">
                <form action="CadastrarUsuarioServlet" method="POST">
                    <div class="input-group">
                        <div class="input-box">
                            <label for="nome" class="labelNome">Nome</label> <br>
                            <input id="nome" type="text" name="nome" required>
                        </div>
                        <div class="input-box">
                            <label for="especialidade" class="labelEspecialidade">Especialidade</label> <br>
                            <input id="especialidade" type="text" name="especialidade" required>
                        </div>
                        <div class="input-box">
                            <label for="email" class="labelEmail">Email</label> <br>
                            <input id="email" type="email" name="email" onchange="confereEmail()" required>
                        </div>
                        <div class="input-box">
                            <label for="confirmEmail" class="labelConfirmEmail">Confirmar Email</label> <br>
                            <input id="confirmEamil" type="email" name="confirmEmail" onchange="confereEmail()" required>
                        </div>
                        <div class="input-box">
                            <label for="dataNasc" class="labelDataNasc">Data de Nascimento</label> <br>
                            <input id="dataNasc" type="date" name="dataNasc" min="1950-12-30" max="<%= dataAtual %>" required>
                        </div>
                        <div class="input-genero">
                            <label for="genero" class="labelGenero">Genero</label> <br>
                            <input type="radio" name="genero" value="Masc"> Masculino
                            <input type="radio" name="genero" value="Fem"> Feminino
                        </div>
                        <div class="input-box">
                            <label for="senha" class="labelSenha">Senha</label> <br>
                            <input id="senha" type="password" name="senha" onchange="confereSenha()" required>
                        </div>
                        <div class="input-box">
                            <label for="confirmSenha" class="labelconfirmSenha">Confirmar Senha</label> <br>
                            <input id="ConfirmSenha" type="password" name="confirmSenha" onchange="confereSenha()" required>
                        </div>
                    </div>
                    <div class="botton-input">
	                    <p style="color: red; text-align: center; font-family: Krub"> 
	                    		<%
			                    if(erro != null){
			                    	out.print(erro);
			                    }
			                    %> 
			            </p>
                        <button type="submit">Cadastrar</button>
                    </div>
                </form>
                <div class="login">
                    <p>Já possui registro? <span><a href="RedirecionarServlet?action=login" style="text-decoration: none; color: #246CE0; font-weight: bold;">Fazer Login</a></span></p>  
                </div>
            </div>
        </div>
    </div>
    
        
    <div vw class="enabled">
	    <div vw-access-button class="active"></div>
	    <div vw-plugin-wrapper>
	    	<div class="vw-plugin-top-wrapper"></div>
	    </div>
  	</div>
  	<script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
  	<script>
    	new window.VLibras.Widget('https://vlibras.gov.br/app');
  	</script>
    
</body>
</html>