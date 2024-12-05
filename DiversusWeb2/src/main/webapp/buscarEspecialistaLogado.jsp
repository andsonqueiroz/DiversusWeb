<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.Especialista"%>
<%@ page import="model.EspecialistaDao" %>

<%ArrayList <Especialista> especialistas = (ArrayList<Especialista>) request.getAttribute("listaEspecialistas"); %>
<%Especialista especialista = (Especialista) session.getAttribute("usuarioLogado"); %>

<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylebuscarEspecialistaLogado.css">
    <title>Buscar Especialista</title>
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
    <section class="section-main">

        <aside class="aside-esquerdo">
        </aside>


        <main class="container-main">
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
            <div class="container-busca">
                <form action="ListarEspecialistasEspecialidadeServlet" method="POST" class="buscar-form">
                    <input type="text" name="especialidade" id="" placeholder="Busca por especialidade">
                    <button type="submit" class="botao-buscar"><img src="imagens/search.png" alt="" style="width: 25px; height: 25px; margin: 0; padding: 0;"></button>
                </form>
            </div>
            <hr style="width: 713.89px; margin: 2rem;">
            <div class="container-resultado">
                <!--FOR PARA EXIBIR TODOS OS RESULTADOS-->
             <%if(especialistas != null){ %>
                <% for (int i =0; i<especialistas.size(); i++){ %>
                <div>
                    <div class="resultado">
                        <div class="foto-user">
                            <%if(especialistas.get(i).getCaminhoImg() != null){ %>
                     	<a href="RedirecionarServlet?action=perfil&id=<%= especialistas.get(i).getId()%>"> <img src="FotosUser/<%=especialistas.get(i).getCaminhoImg() %>" alt="" class="fotoperfil">	 </a>	<!-- FOTO DO USUARIO | LIGAR A TELA DE PERFIL-->
			                <%}else{ %>
			            <a href="RedirecionarServlet?action=perfil&id=<%= especialistas.get(i).getId()%>"> <img src="imagens/fotoperfil.jpg" alt="" class="fotoperfil"> </a>
			                <%} %>
                        </div>
                        <div class="userinfo-box">
                        	<a href="RedirecionarServlet?action=perfil&id=<%= especialistas.get(i).getId()%>"> <h3><%=especialistas.get(i).getNome()%></h3>	</a>	<!--  LIGAR A TELA DE PERFIL DO USUARIO -->
                            <h4><%=especialistas.get(i).getEspecialidade() %></h4>
                        </div>
                    </div>
                    <hr style="margin: 1rem;">
                </div>
                <%}%>
              <%}%>
            </div>
        </main>



        <aside class="aside-direito">

         	<div class="assinatura" >
                    <h2 style="text-align: center;">Deseja assinar nossa <span style="color: #2b7cff; font-weight: bold;">Newsletter</span>?</h2>
                    <h1 style="text-align: center;">Assine já</h1>
                    <div class="input-newsletter"> 
                        <form action="adicionarUsuario?action=especialistas" method="post" >
                            <input type="email" id="email" name="email" placeholder="Seu email" style="border-radius: 20px;" required>
                            <input type="submit" value="Enviar" class="button_send">
                        </form>
                    </div>
                    <hr>
            </div> 	

            <h4 style="text-align: center;">Categorias</h4>
            <div class="container-temas"> 
                <ul>
                    <li><a href="RedirecionarServlet?action=inclusao">Inclusão Escolar</a></li>
                    <li><a href="RedirecionarServlet?action=acessibilidade">Acessibilidade</a></li>
                    <li><a href="RedirecionarServlet?action=deficiencia">Deficiência Visual</a></li>
                    <li><a href="RedirecionarServlet?action=autismo">Autismo</a></li>
                </ul>
                
            </div>
        </aside>
    </section>

    
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
                    <a href="RedirecionarServlet?action=inicio" class="footer-link">Início</a>   <!--Ligar a tela de INICIO-->
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