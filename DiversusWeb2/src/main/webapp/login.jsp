<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String erro = (String) request.getAttribute("erro"); 
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/stylelogin.css">
</head>
<body>
    <div id="container">
        <div class="imagem-esquerda">
            <h1 id="texto-esquerda"> <span style="color: #246CE0;">Inclusão</span> é simplesmente fazer tudo pensando nas pessoas que <span style="color: #246CE0;">existem</span> 
                E não considerando pessoas que você 
                gostaria que existissem.</h1>
        </div>
        <div id="login">
            <div class="logo">
                <a href="RedirecionarServlet?action=inicio"><img class="logotipo" src="imagens/logoDiversus.png" alt="Logo Diversus"></a>   <!--Ligar á tela de APRESENTAÇÃO-->
                <p>DIVERSUS</p>
            </div>
            <div class="form">
                <form method="POST" action="LoginServlet">
                    <div class="input-email">
                        <label for="email" class="labelEmail">Email</label> <br>
                        <input id="email" type="email" name="email" required>
                    </div>
                    <div class="input-senha">
                        <label for="senha">Senha</label> <br>
                        <input id="senha" type="password" name="senha" required>
                    </div>
                    <div class="esqueciSenha">
                        <span><a href="RedirecionarServlet?action=esqueci" style="font-size: 0.8rem; text-decoration: none; color: black;">Esqueci minha senha</a></span> <br>    <!--Ligar á tela de RECUPERAR SENHA-->
                    </div>
                    <div class="botaoEntrar">
                      <a href="#"><button class="entrar" type="submit">Entrar</button></a>     <!--Ligar á tela de FEED quando logar-->
                    </div>
                    <p style="color: red; text-align: center;"> <%
	                    	if(erro != null){
	                    		out.print(erro);
	                    	}
                    	%> 
                    </p>
                </form>
                <div class="cadastre-se">
                    <p>Novo por aqui? <span><a href="RedirecionarServlet?action=cadastro" style="text-decoration: none; color: #246CE0; font-weight: bold;">Cadastre-se</a></span></p>   <!--Ligar á teça de CADASTRO-->
                </div>
                <div class="rodape">
                    <ul>
                        <li><a href="RedirecionarServlet?action=admin" style="text-decoration: none; color: black;">Admin</a></li>   <!--Ligar a tela de CONTATO-->
                        <li><a href="RedirecionarServlet?action=sobre" style="text-decoration: none; color: black;">Nosso Time</a></li>
                    </ul>
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