<%@page import="model.PostDao"%>
<%@page import="model.EspecialistaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Post" %>
<%@ page import="model.Comentario" %>
<%@page import="model.Especialista"%>

<%Post post = (Post) request.getAttribute("post"); %>
<%String tema = (String) request.getAttribute("tema"); %>
<%Especialista especialista = (Especialista) session.getAttribute("usuarioLogado"); %>
<%ArrayList<Comentario> comentarios = (ArrayList<Comentario>) request.getAttribute("comentarios"); %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Início</title>
    <link rel="stylesheet" href="css/stylepaginapost.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            <div class="titulo-box">
                <a href="RedirecionarServlet?action=inicio"><img src="imagens/left.png" alt="" class="icone-titulo-box"></a>
                <h4 style="color: #246CE0; margin: 0; padding: 0;"><%=tema %></h4>    <!--COLOCAR O TEMA (NOME DA TABELA)-->
            </div>
            <section class="container-posts">   <!--COLOCAR AS VARIÁVEIS DE POST-->
                <div class="fotopost-titulo">
                    <%if(post.getCaminhoImg() != null){ %>
                        <a href="#"><img src="FotosPost/<%= post.getCaminhoImg() %>" alt="" class="fotopost"></a>        <!--COLOCAR IMAGEM DO POST e LIGAR A PAGINA DO POST-->
                    	<%}else{ %>
                    		<%if(post.getTemaPredominante().equalsIgnoreCase("Inclusão Educacional")){ %>
                    	 	
                    	 		<a href="RedirecionarServlet?action=post&id=<%= post.getId() %>&tema=<%=post.getTemaPredominante() %>"><img src="imagens/padraoInclusao.png" alt="" class="fotopost"></a> 
                    	 	
                    	 	<%}else if(post.getTemaPredominante().equalsIgnoreCase("Acessibilidade")){ %>
                    	 	
                    	 		<a href="RedirecionarServlet?action=post&id=<%= post.getId() %>&tema=<%=post.getTemaPredominante() %>"><img src="imagens/padraoAcessibilidade.png" alt="" class="fotopost"></a> 
                    	 	
                    	 	<%}else if(post.getTemaPredominante().equalsIgnoreCase("Deficiência Visual")){ %>
                    	 		
                    	 		<a href="RedirecionarServlet?action=post&id=<%= post.getId() %>&tema=<%=post.getTemaPredominante() %>"><img src="imagens/padraoDeficiencia.png" alt="" class="fotopost"></a> 

                    	 	<%}else if(post.getTemaPredominante().equalsIgnoreCase("Autismo")){ %>

                    	 		<a href="RedirecionarServlet?action=post&id=<%= post.getId() %>&tema=<%=post.getTemaPredominante() %>"><img src="imagens/padraoAutismo.png" alt="" class="fotopost"></a> 

                    	 	<%} %>
                    	 <%} %>
                    	 
                    <h2><%= post.getTitulo() %></h2>     <!--COLOCAR O TITULO DA POSTAGEM (post.getTitulo())-->
                    <p class="subtituloPost"><%=post.getSubtitulo() %></p>    <!--COLOCAR O SUBTITULO DA POSTAGEM (post.getsSubtitulo())-->
                    <div style="display: flex; align-items: center; justify-content: center; padding-bottom: 8px;">
                    
                    <%if(EspecialistaDao.buscarEspecialistaPorId(post.getIduser()).getCaminhoImg() != null){ %>
                        <img src="FotosUser/<%= EspecialistaDao.buscarEspecialistaPorId(post.getIduser()).getCaminhoImg() %>" alt="" class="fotouser">		<!-- FOTO DO USUARIO -->
                    <%}else{ %>
                    	<img src="imagens/userpadrao.png" alt="" class="fotouser">
                    <%} %>
                        <p class="nomeUser"><%=EspecialistaDao.buscarEspecialistaPorId(post.getIduser()).getNome() %></p>   <!--Colocar o nome do usuário do post-->
                        <span>•</span>
                        <p class="horarioPost"><%=PostDao.exibirHorarioPub(post.getId()) %></p> <!--COLOCAR O TEMPO PERCORRIDO DA POSTAGEM (chamar a função de PostDao)-->
                    </div>
                </div>
                <div class="conteudo">
                    <p><%=post.getConteudo() %></p>     <!--COLOCAR O CONTEUDO DA POSTAGEM post.getConteudo()-->
                </div>

                <hr style="margin: 2rem 0; padding: 0;">
                <h3 style="color: #242424; padding-bottom: 15px;">Comentários</h3>
				<p style="font-family: Krub; color: #e2e2e2; font-style: italic;">Faça login para comentar</p>
				<hr style="margin: 20px 0;">
                <!--UM FOR PARA IMPRIMIR TODOS OS COMENTARIOS DO POST-->
                <%if(comentarios != null){ %>
                	<%for(int i = comentarios.size()-1; i>=0; i--){ %>
		                <div class="container-comentarios"> 
		                    <div class="user-box">
		                        <div class="fotouser-comentario">
		                            <%if(EspecialistaDao.buscarEspecialistaPorId(comentarios.get(i).getIdUser()).getCaminhoImg() != null){ %>
				                       <a href="RedirecionarServlet?action=perfil&id=<%= comentarios.get(i).getIdUser()%>"> <img src="FotosUser/<%= EspecialistaDao.buscarEspecialistaPorId(comentarios.get(i).getIdUser()).getCaminhoImg() %>" alt="" class="fotouser"> </a>	<!--COLOCAR IMAGEM DO USUARIO e LIGAR AO PERFIL DO USUARIO-->
				                    <%}else{ %>
				                    	<a href="RedirecionarServlet?action=perfil&id=<%= comentarios.get(i).getIdUser()%>"> <img src="imagens/userpadrao.png" alt="" class="fotouser"> </a>
				                    <%} %>   <!--COLOCAR O ENDEREÇO DA FOTO DO USUARIO-->
		                        </div>
		                        <div class="nomeUser-comentario">
		                            <a href="RedirecionarServlet?action=perfil&id=<%= comentarios.get(i).getIdUser()%>"><%=EspecialistaDao.buscarEspecialistaPorId(comentarios.get(i).getIdUser()).getNome() %></a>      <!--COLOCAR O NOME DO USUARIO-->
		                            <p style="color: #246CE0; font-weight: bold;"><%=EspecialistaDao.buscarEspecialistaPorId(comentarios.get(i).getIdUser()).getEspecialidade() %></p>    <!--COLOCAR A ESPECIALIDADE DO USUARIO-->
		                        </div>
		                    </div>
		                    <div class="conteudo-comentario">
		                        <p><%=comentarios.get(i).getConteudo() %> </p> <!--COLOCAR O CONTEUDO DO COMENTÁRIO-->
		                    </div>
		                </div>
                	<%} %>
                <%} %>
                <!--FIM DO FOR DOS COMENTÁRIOS-->

                <hr>
            </section>
        </main>

        <aside class="aside-direito">

         	<div class="assinatura" >
                    <h2 style="text-align: center;">Deseja assinar nossa <span style="color: #2b7cff; font-weight: bold;">Newsletter</span>?</h2>
                    <h1 style="text-align: center;">Assine já</h1>
                    <div class="input-newsletter"> 
                        <form action="adicionarUsuario?action=post&idPost=<%= post.getId() %>" method="post" >
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
                    <a href="#" class="footer-link">Início</a>   <!--Ligar a tela de INICIO-->
                </li>
                <li>
                    <a href="sobre.html" class="footer-link">Sobre</a>
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