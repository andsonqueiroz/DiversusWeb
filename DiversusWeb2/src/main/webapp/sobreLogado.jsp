<%@page import="model.Especialista"%>
<%@page import="model.EspecialistaDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%Especialista especialista = (Especialista) session.getAttribute("usuarioLogado"); %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sobre nós</title>
    <link rel="stylesheet" href="css/stylesobrelogado.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<script>
    document.addEventListener('DOMContentLoaded', () => {
    const postarButtons = document.getElementsByClassName('postar-buttom');
    const postarContainer = document.getElementById('postar-container');

    // Adicionar evento de clique a cada botão
    Array.from(postarButtons).forEach((button) => {
        button.addEventListener('click', (event) => {
            event.stopPropagation();
            if (postarContainer.style.display === 'none' || !postarContainer.style.display) {
                postarContainer.style.display = 'block';
            } else {
                postarContainer.style.display = 'none';
            }
        });
    });

    document.addEventListener('click', (event) => {
        if (
            !postarContainer.contains(event.target) && 
            !Array.from(postarButtons).includes(event.target)
        ) {
            postarContainer.style.display = 'none';
        }
    });
});
</script>

<nav>

    <div class="logotipo">
        <div class="logotipo-box">
            <img src="imagens/logo2Diversus.jpg" alt="logo" class="logo">
            <a href="RedirecionarServlet?action=inicio" class="text-logo">DIVERSUS</a>
            <div class="menu">
                <ul class="menu-list">
                    <li><a href="RedirecionarServlet?action=inicio">Início</a></li>
                    <li><a href="RedirecionarServlet?action=especialistas">Especialistas</a></li>
                    <li><a href="RedirecionarServlet?action=sobre">Sobre nós</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="submenu-box">
        <div class="postar-box">
            <button id="postar-buttom" class="postar-buttom">Postar</button>
            <img src="imagens/notification.png" alt="notificacao" class="notificacao"> 
        </div>
        <ul class="submenu-list">
            <li class="drop"> 
                <%if(EspecialistaDao.buscarEspecialistaPorId(especialista.getId()).getCaminhoImg() != null){ %>
                        <img src="FotosUser/<%=EspecialistaDao.buscarEspecialistaPorId(especialista.getId()).getCaminhoImg() %>" alt="" class="fotoperfil">		<!-- FOTO DO USUARIO -->
                <%}else{ %>
                    	<img src="imagens/fotoperfil.jpg" alt="" class="fotoperfil">
                <%} %>
                <ul class="dropdown-menu">
                    <li class="submenu-li"><a href="RedirecionarServlet?action=perfil&id=<%= especialista.getId()%>">Perfil</a></li>
                    <li class="submenu-li"><a href="RedirecionarServlet?action=configuracoes">Config</a></li>
                    <li class="submenu-li"><a href="LogoutServlet">Sair</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="nav-background"></div>
</nav>
<body>
    <div class="postar-container" id="postar-container">
        <div class="postar-form">
            <form action="CriarPostServlet" method="POST" enctype="multipart/form-data">
                <br><br>
                <fieldset>
                    <div class="campo">
                        <input type="text" name="titulo" size="30px" placeholder="Título" required>
                    </div>
                    <div class="campo">
                        <input type="text" name="subtitulo" size="30px" placeholder="Subtítulo" required> 
                    </div>
                </fieldset>

                
                <fieldset>
                    <div class="campo">
                        <textarea name="conteudo" id="conteudo" placeholder="Sobre o que você quer falar?" row="6" style="width: 100%; height: 100px; max-height: 200px; font-family: Krub;" required></textarea>
                    </div>
                </fieldset>
                <fieldset>
                    <div class="campo" id="checkbox">
                        <input type="checkbox" name="inclusao" value="inclusao">
                        <label for="inclusao">Inclusão Educacional</label>
                        <input type="checkbox" name="acessibilidade" value="acessibilidade">
                        <label for="acess">Acessibilidade</label>
                        <input type="checkbox" name="autismo" value="autismo">
                        <label for="autismo">Autismo</label>
                        <input type="checkbox" name="deficiencia" value="deficiencia">
                        <label for="deficiencia">Deficiência Visual</label>
                    </div>
                </fieldset>
                <br>
                <fieldset>
                    <div class="campo" id="campofotopost">
                        <br>
                        <input type="file" name="fotopost" class="fotopost">
                        <label for="fotopost" class="labelfotopost"><img src="imagens/iconimg.png" alt=""></label>
                    </div>
                </fieldset>
                <hr style="margin: 20px 0;">
                <div class="botaopostar">
                    <button type="submit" id="botaopostar">Postar</button>
                </div>

            </form>
        </div>
    </div>
    <div class="titulo-box">
        <h1 class="titulo">Nós somos o time que levantaram o Diversus</h1>
        <p>Não basta crer no trabalho em equipe, é preciso acreditar na equipe de trabalho</p>
    </div>
    <hr>
    <div class="devs">
        <div class="dev1">
            <img src="imagens/dev1.jpeg" alt="Andson Queiroz">
            <h5>Full Stack Developer</h5>
            <p>Andson de Queiroz Domingues</p>
        </div>
        <div class="dev2">
            <img src="imagens/dev2.jpeg" alt="Paulo José">
            <h5>Full Stack Developer</h5>
            <p>Paulo José</p>
        </div>
        <div class="dev3">
            <img src="imagens/dev3.jpg" alt="Paulo José">
            <h5>Full Stack Developer</h5>
            <p>Breno Ramos</p>
        </div>
    </div>
    <div class="orientador">
        <div class="dev4">
            <img src="imagens/dev4.jpeg" alt="Woquiton">
            <h5>Orientador</h5>
            <p>Woquiton Fernandes</p>
        </div>
    </div>
    <hr>
    <div class="about-container">
        <div class="titulo-about">
            <h2>Bem vindo ao Diversus!</h2>
        </div>
        <div class="about-box1">
            <div class="text1-box">
                <p>No Diversus, acreditamos na inclusão escolar como um direito de todos. 
                    Nossa missão é fornecer um espaço onde especialistas, professores, gestores, 
                    famílias e todos os interessados possam se conectar, aprender e colaborar para promover 
                    uma educação inclusiva e acessível.
                </p>
            </div>
            <div class="imagem1-box">
                <img src="imagens/pexels-cdc-library-3992949.jpg" alt="image1">
            </div>
        </div>
        <div class="about-box2">
            <div class="imagem2-box">
                <img src="imagens/pexels-cottonbro-6195665.jpg" alt="image2">
            </div>
            <div class="text2-box">
                <div>
                    <h5>Por que escolher o Diversus?</h5>
                <p>
                    O Diversus é mais do que uma plataforma; é um hub dedicado à inclusão escolar, projetado para compartilhar 
                    conhecimentos, boas práticas e inovações na área. Nossa plataforma não só facilita a comunicação entre 
                    especialistas, mas também serve como um recurso valioso para professores, gestores, famílias e outros 
                    profissionais interessados em inclusão educacional. No contexto escolar inclusivo, adaptações pedagógicas, acessibilidade arquitetônica 
                    e a presença de profissionais capacitados, como professores especializados e mediadores, 
                    são essenciais para atender às necessidades específicas dos alunos.
                </p>
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
    
    <footer>
        <div id="footer_content">
            <div id="footer_contacts">
                <h1>DIVERSUS</h1>
                <p>Created by Andson Q.</p>

                <div id="footer_social_media">
                    <a href="https://www.instagram.com/obemo" class="footer-link" id="instagram">
                        <i class="fa-brands fa-instagram"></i>
                    </a>

                    <a href="https://www.linkedin.com/in/andson-queiroz/" class="footer-link" id="linkedin">
                        <i class="fa-brands fa-linkedin"></i>
                    </a>
                </div>
            </div>
            
            <ul class="footer-list">
                <li>
                    <h3>Blog</h3>
                </li>
                <li>
                    <a href="RedirecionarServlet?action=acessibilidade" class="footer-link">Acessibilidade</a>  <!--Ligar a tela do tema Acessibilidade-->
                </li>
                <li>
                    <a href="RedirecionarServlet?action=inclusao" class="footer-link">Inclusão Escolar</a>    <!--Ligar a tela do tema Inclusao-->
                </li>
                <li>
                    <a href="RedirecionarServlet?action=autismo" class="footer-link">Autismo</a>     <!--Ligar a tela do tema Autismo-->
                </li>
            </ul>

            <ul class="footer-list">
                <li>
                    <h3>Links</h3>
                </li>
                <li>
                    <a href="RedirecionarServlet?action=inicio" class="footer-link">Início</a>
                </li>
                <li>
                    <a href="RedirecionarServlet?action=sobre" class="footer-link">Sobre</a>
                </li>
            </ul>

            <div id="footer_contato">
                <h3>Contato</h3>

                <p>
                    Entre em contato com nossa equipe pelo email:
                    <br>
                   <span style="color: #000000;">mrpewceful@gmail.com</span> 
                </p>
            </div>
        </div>

        <div id="footer_copyright" style="color: #246CE0;">
            &#169
            2024 todos os direitos reservados
        </div>
    </footer>
</body>
</html>