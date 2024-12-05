<%@page import="model.PostDao"%>
<%@page import="model.EspecialistaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Post" %>

<%ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("postsTema"); %>
<%String tema = (String) request.getAttribute("tema"); %>

<% String temaPagina = ""; %>
<%if(tema.equalsIgnoreCase("Inclusão Escolar")){ 
	temaPagina = "inclusao";
}else if(tema.equalsIgnoreCase("Acessibilidade")){
	temaPagina = "acessibilidade";
}else if(tema.equalsIgnoreCase("Deficiência Visual")){
	temaPagina = "deficiencia";
}else if(tema.equalsIgnoreCase("Autismo")){
	temaPagina = "autismo";
}
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><%=tema %></title>
    <link rel="stylesheet" href="css/styleiniciotema.css">
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
                <h1 class="titulo">Publicações sobre <span style="color: #246CE0;"><%=tema %></span></h1>
            </div>
            <hr>
            <section class="container-posts">   <!--COLOCAR UM FOR PARA IMPRIMIR TODOS OS POSTS (ARRAYLIST)-->
         <%if(posts != null){ %>
            <%for(int i = posts.size() - 1; i>=0; i--){ %>
                <div class="post">

                    <div class="img">
                    	<%if(posts.get(i).getCaminhoImg() != null){ %>
                        <a href="RedirecionarServlet?action=post&id=<%= posts.get(i).getId() %>&tema=<%=posts.get(i).getTemaPredominante() %>"><img src="FotosPost/<%= posts.get(i).getCaminhoImg() %>" alt="" class="imagem-post"></a>        <!--COLOCAR IMAGEM DO POST e LIGAR A PAGINA DO POST-->
                    	<%}else{ %>
                    		<%if(posts.get(i).getTemaPredominante().equalsIgnoreCase("Inclusão Educacional")){ %>
                    	 	
                    	 		<a href="RedirecionarServlet?action=post&id=<%= posts.get(i).getId() %>&tema=<%=posts.get(i).getTemaPredominante() %>"><img src="imagens/padraoInclusao.png" alt="" class="imagem-post"></a> 
                    	 	
                    	 	<%}else if(posts.get(i).getTemaPredominante().equalsIgnoreCase("Acessibilidade")){ %>
                    	 	
                    	 		<a href="RedirecionarServlet?action=post&id=<%= posts.get(i).getId() %>&tema=<%=posts.get(i).getTemaPredominante() %>"><img src="imagens/padraoAcessibilidade.png" alt="" class="imagem-post"></a> 
                    	 	
                    	 	<%}else if(posts.get(i).getTemaPredominante().equalsIgnoreCase("Deficiência Visual")){ %>
                    	 		
                    	 		<a href="RedirecionarServlet?action=post&id=<%= posts.get(i).getId() %>&tema=<%=posts.get(i).getTemaPredominante() %>"><img src="imagens/padraoDeficiencia.png" alt="" class="imagem-post"></a> 

                    	 	<%}else if(posts.get(i).getTemaPredominante().equalsIgnoreCase("Autismo")){ %>

                    	 		<a href="RedirecionarServlet?action=post&id=<%= posts.get(i).getId() %>&tema=<%=posts.get(i).getTemaPredominante() %>"><img src="imagens/padraoAutismo.png" alt="" class="imagem-post"></a> 

                    	 	<%} %>
                    	 <%} %>
                    </div>

                    <div>
                        <div class="user-tema">
                            <div class="img-username">
                                
								<%if(EspecialistaDao.buscarEspecialistaPorId(posts.get(i).getIduser()).getCaminhoImg() != null){ %>
			                     <a href="RedirecionarServlet?action=perfil&id=<%= posts.get(i).getIduser()%>"> <img src="FotosUser/<%=EspecialistaDao.buscarEspecialistaPorId(posts.get(i).getIduser()).getCaminhoImg() %>" alt="" class="fotouser"> </a> 	<!--COLOCAR IMAGEM DO USUARIO e LIGAR AO PERFIL DO USUARIO-->
			                    <%}else{ %>
			                    	<a href="RedirecionarServlet?action=perfil&id=<%= posts.get(i).getIduser()%>"> <img src="imagens/userpadrao.png" alt="" class="fotouser"> </a>
			                    <%} %>                                
                                <a href="RedirecionarServlet?action=perfil&id=<%= posts.get(i).getIduser()%>"><p><%= EspecialistaDao.buscarEspecialistaPorId(posts.get(i).getIduser()).getNome() %></p></a>       <!--COLOCAR NOME DO USUARIO (ESPECIALISTA.GETNOME()) e LIGAR AO PERFIL DO USUARIO-->
                            </div>
                            <span>•</span>
                            <% String temaBD = ""; %>
                            <%if(tema.equalsIgnoreCase("Inclusão Escolar")){ 
                            	temaBD = "inclusao";
                            }else if(tema.equalsIgnoreCase("Acessibilidade")){
                            	temaBD = "acessibilidade";
                            }else if(tema.equalsIgnoreCase("Deficiência Visual")){
                            	temaBD = "deficiencia";
                            }else if(tema.equalsIgnoreCase("Autismo")){
                            	temaBD = "autismo";
                            }
                            %>
                            <a href="RedirecionarServlet?action=<%= temaBD %>" style="color: #246CE0; font-weight: bold; text-decoration: none;"><span><%=tema %></span></a>    <!--COLOCAR O TEMA DO POST e LIGAR A PAGINA DO TEMA ESPECIFICO-->
                        </div>
    
                        <div class="titulo-post">
                            <a href="RedirecionarServlet?action=post&id=<%= posts.get(i).getId() %>&tema=<%=tema %>"><h3><%= posts.get(i).getTitulo() %></h3></a>   <!--COLOCAR O TITULO DA POSTAGEM-->
                            <p><%= posts.get(i).getSubtitulo() %></p>  <!--COLOCAR O SUBTITULO DA POSTAGEM-->
                        </div>
                        
                        <div class="data-comentarios">
                            <div class="data">
                                <p><%=PostDao.exibirHorarioPub(posts.get(i).getId()) %></p>     <!--COLOCAR A DATA ATUAL - DATA DE POSTAGEM-->
                            </div>
                            <span>•</span>
                            <p><%= PostDao.exibirTotalComentarios(posts.get(i).getId()) %> comentários</p>    <!--COLOCAR TOTAL DE COMENTARIOS-->
                        </div>
                    </div>
                    
                </div>
                <hr style="margin: 2rem 0; padding: 0;">
                <%} %>
             <%} %>
            </section>
        </main>

        <aside class="aside-direito">

         	<div class="assinatura" >
                    <h2 style="text-align: center;">Deseja assinar nossa <span style="color: #2b7cff; font-weight: bold;">Newsletter</span>?</h2>
                    <h1 style="text-align: center;">Assine já</h1>
                    <div class="input-newsletter"> 
                        <form action="adicionarUsuario?action=tema&temaPagina=<%= temaPagina %>" method="post" >
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