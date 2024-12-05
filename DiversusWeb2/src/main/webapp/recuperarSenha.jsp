<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperação</title>
    <link rel="stylesheet" href="css/stylerecuperarsenha.css">
</head>
<body>
    <div id="container">
        <div id="login">
            <div class="logo">
                <a href="RedirecionarServlet?action=inicio"><img class="logotipo" src="imagens/logoDiversusPNG.png" alt="Logo Diversus"></a>
                <p>DIVERSUS</p>
            </div>
            <p class="descricao">Informe o email da conta que deseja recuperar a senha.</p>
            <div class="form">
                <form action="RecuperarSenhaServlet" method="post">
                    <div class="input-email">
                        <label for="email" class="labelEmail">Email</label> <br>
                        <input id="email" type="email" name="email" required>
                    </div>
                    
                    <div class="botaoEntrar">
                      <button class="entrar" type="submit">Próximo</button>
                    </div>
                </form>
                <div class="voltar">
                    <span><a href="RedirecionarServlet?action=login" style="text-decoration: none; color: #246CE0; font-weight: bold;">Voltar</a></span>
                </div>
                <div class="rodape">
                    <ul>
                        <li><a href="RedirecionarServlet?action=admin" style="text-decoration: none; color: #D9D9D9;">Admin</a></li>   <!--Ligar a tela de CONTATO-->
                        <li><a href="RedirecionarServlet?action=sobre" style="text-decoration: none; color: #D9D9D9;"">Nosso Time</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>