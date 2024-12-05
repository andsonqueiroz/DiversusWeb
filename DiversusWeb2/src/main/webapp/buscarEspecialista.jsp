<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.Especialista"%>
<%ArrayList <Especialista> especialistas = (ArrayList<Especialista>) request.getAttribute("listaEspecialistas"); %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylebuscarEspecialista.css">
    <title>Buscar Especialista</title>
</head>

<nav>
    <div class="logotipo">
        <img src="imagens/logo2Diversus.jpg" alt="logo" class="logo">
        <a href="RedirecionarServlet?action=inicio" class="text-logo">DIVERSUS</a>
        <div class="menu">
            <ul class="menu-list">
                <li><a href="RedirecionarServlet?action=inicio">Início</a></li>	<!-- LIGAR A TELA DE INCIO/FEED -->
                <li><a href="RedirecionarServlet?action=especialistas">Especialistas</a></li> <!--  LIGAR A TELA DE ESPECIALISTAS -->
                <li><a href="RedirecionarServlet?action=sobre">Sobre nós</a></li>
            </ul>
    </div>
    </div>
    <div>
       <ul class="nav-list">
        <li><a href="RedirecionarServlet?action=login" class="entrar">Entrar</a></li>
        <li><a href="RedirecionarServlet?action=cadastro" class="cadastro">Cadastre-se</a></li>
    </ul> 
    </div>
    
</nav>

<body>
    <section class="section-main">

        <aside class="aside-esquerdo">
        </aside>


        <main class="container-main">
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