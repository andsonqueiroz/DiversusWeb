<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String erro = (String) request.getAttribute("erro"); %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/styleadmin.css">
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
                <a href="#"><img class="logotipo" src="imagens/logoDiversusPNG.png" alt="Logo Diversus"></a>
                <p>DIVERSUS</p>
            </div>
            <div class="form">
                <form action="LoginAdmin" method="POST">
                    <div class="input-email">
                        <label for="email" class="labelEmail">Email</label> <br>
                        <input id="email" type="email" name="email" required>
                    </div>
                    <div class="input-senha">
                        <label for="senha">Senha</label> <br>
                        <input id="senha" type="password" name="senha" required>
                    </div>
                    
                    <div class="botaoEntrar">
                      <a href="#"><button class="entrar" type="submit">Entrar</button></a> 
                    </div>
                    <p style="color: red; text-align: center;"> <%
	                    	if(erro != null){
	                    		out.print(erro);
	                    	}
                    	%> 
                    </p>
                </form>
                <div class="cadastre-se">
                    <p>Ir para <span><a href="RedirecionarServlet?action=inicio" style="text-decoration: none; color: #246CE0; font-weight: bold;">Diversus</a></span></p>   <!--Ligar á teça de CADASTRO-->
                </div>
            </div>
        </div>
    </div>
</body>
</html>