<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model.Especialista" %>
<%@ page import="model.EspecialistaDao" %>

<%@ page import="model.Post" %>
<%@ page import="model.ExperienciaProjeto" %>
<%@ page import="model.Formacao" %>
<%@ page import="model.ExperienciaDao" %>
<%@ page import="model.FormacaoDao" %>
<%@ page import="model.PostDao" %>

<%@ page import="java.util.ArrayList" %>

<%Especialista especialista = (Especialista) request.getAttribute("especialista"); %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylePerfil.css">

    <title>Perfil</title>
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

<div class="container-pagina-total" style="display: flex; flex-direction: column; align-items: center;">
    <div class="conteudo-perfil">

        <div class="capa-info" style="display: flex; flex-direction: column; justify-content: end;">

            <div class="informacoes" style="display: flex; justify-content: space-between; padding: 50px 50px;">
                <div style="display: flex; align-items: center; gap: 30px;">
                    <div>
                    <%if(especialista.getCaminhoImg() != null){ %>
                    	<img class="foto-perfil" src="FotosUser/<%= especialista.getCaminhoImg() %>" alt="" width="150px" height="150px">
                    <%}else{ %>
                        <img class="foto-perfil" src="imagens/fotoperfil.jpg" alt="" width="150px" height="150px">
                    <%} %>
                    </div>
                   <div>
                        <h5 id="especialista">Especialista</h5>
                        <h3 id="nome-especialista"><%= especialista.getNome() %></h3>
                        <h5 id="especialidade"><%= especialista.getEspecialidade() %></h5>
                    </div>
                </div>
                <div class="cidade-info">
                    <%if(especialista.getCidade() != null){ %>
                    <h5 id="formacao">Cidade</h5>
                    <h5 id="cidade"><%= especialista.getCidade() %></h5>
                    <%} %>
                </div>
            </div>
            
        </div>

        <h3 id="contato">Contato</h3>

        <div class="informacao-especialista">

            <div >
                <a class="end-email" href=""><%= especialista.getEmail() %></a>
                <h4 id="email">E-mail</h4>
            </div>
            <%if(especialista.getTelefone() != null){ %>
            <div>
                <a class="num-telefone" href=""><%= especialista.getTelefone() %></a>
                <h4 id="telefone">Telefone</h4>
            </div>
            <%} %>
        </div>

        <hr id="hr1">
        
        <div style="display: flex;">
	        <h3 id="experiencia">Experiência e projetos</h3>        
        </div>

        <div class="informacao-especialista2">
        <%if(especialista.getExperiencias() != null){ %>
        <!-- FOR PARA EXIBIR FEXPERIENCIAS E PROJETOS DO USUARIO -->
        <%for(int i = especialista.getExperiencias().size()-1; i >= 0; i--){ %>
        
            <div>
                <h4 id="ano"><%= especialista.getExperiencias().get(i).getAno() %></h4>
                <h4 id="creche"><%= especialista.getExperiencias().get(i).getConteudo() %></h4>
                <h4 id="cidade-experiencia"><%= especialista.getExperiencias().get(i).getCidade() %></h4>
                
            </div>
		<%} %>
		<!-- FIM DO FOR DE EXPERIENCIAS E PROJETOS -->
		<%} %>
        </div>

        <hr id="hr2">

		<div style="display: flex;">
	        <h3 id="formacoes">Formações</h3>
		</div>


        <div class="informacao-especialista3">
        <%if(especialista.getFormacoes() != null){ %>
         <!-- FOR PARA EXIBIR FORMAÇÕES DO USUARIO -->
         <%for(int i = especialista.getFormacoes().size()-1; i>=0; i--){ %>
        
            <div>
                <h4 id="ano4"><%= especialista.getFormacoes().get(i).getAno() %></h4>
                <h4 id="tipo-formacao"><%= especialista.getFormacoes().get(i).getConteudo() %></h4>
                <h4 id="cidade-formacao"><%= especialista.getFormacoes().get(i).getCidade() %></h4>
               
            </div>
            <%} %>
        <!-- FIM DO FOR DE FORMAÇÕES -->
        <%} %>
        </div>

        <hr id="hr3">

        <h3 id="publicacoes"> <center>Publicações</center></h3>
        <hr class="hr-azul">
        <hr>
        <section class="container-posts">   <!--COLOCAR UM FOR PARA IMPRIMIR TODOS OS POSTS (ARRAYLIST)-->
         <%if(especialista.getPostsUser() != null){ %>
            <%for(int i = especialista.getPostsUser().size()-1; i >=0 ; i--){ %>
                <div class="post">

                    <div class="img">
                    	<%if(especialista.getPostsUser().get(i).getCaminhoImg() != null){ %>
                        <a href="RedirecionarServlet?action=post&id=<%= especialista.getPostsUser().get(i).getId() %>&tema=<%=especialista.getPostsUser().get(i).getTemaPredominante() %>"><img src="FotosPost/<%= especialista.getPostsUser().get(i).getCaminhoImg() %>" alt="" class="imagem-post"></a>        <!--COLOCAR IMAGEM DO POST e LIGAR A PAGINA DO POST-->
                    	<%}else{ %>
                    		<%if(especialista.getPostsUser().get(i).getTemaPredominante().equalsIgnoreCase("Inclusão Educacional")){ %>
                    	 	
                    	 		<a href="RedirecionarServlet?action=post&id=<%= especialista.getPostsUser().get(i).getId() %>&tema=<%=especialista.getPostsUser().get(i).getTemaPredominante() %>"><img src="imagens/padraoInclusao.png" alt="" class="imagem-post"></a> 
                    	 	
                    	 	<%}else if(especialista.getPostsUser().get(i).getTemaPredominante().equalsIgnoreCase("Acessibilidade")){ %>
                    	 	
                    	 		<a href="RedirecionarServlet?action=post&id=<%= especialista.getPostsUser().get(i).getId() %>&tema=<%=especialista.getPostsUser().get(i).getTemaPredominante() %>"><img src="imagens/padraoAcessibilidade.png" alt="" class="imagem-post"></a> 
                    	 	
                    	 	<%}else if(especialista.getPostsUser().get(i).getTemaPredominante().equalsIgnoreCase("Deficiência Visual")){ %>
                    	 		
                    	 		<a href="RedirecionarServlet?action=post&id=<%= especialista.getPostsUser().get(i).getId() %>&tema=<%=especialista.getPostsUser().get(i).getTemaPredominante() %>"><img src="imagens/padraoDeficiencia.png" alt="" class="imagem-post"></a> 

                    	 	<%}else if(especialista.getPostsUser().get(i).getTemaPredominante().equalsIgnoreCase("Autismo")){ %>

                    	 		<a href="RedirecionarServlet?action=post&id=<%= especialista.getPostsUser().get(i).getId() %>&tema=<%=especialista.getPostsUser().get(i).getTemaPredominante() %>"><img src="imagens/padraoAutismo.png" alt="" class="imagem-post"></a> 

                    	 	<%} %>
                    	 <%} %>
                    </div>

                    <div>
                        <div class="user-tema">
                            <div class="img-username">
                    <%if(EspecialistaDao.buscarEspecialistaPorId(especialista.getPostsUser().get(i).getIduser()).getCaminhoImg() != null){ %>
                       <a href="RedirecionarServlet?action=perfil&id=<%= EspecialistaDao.buscarEspecialistaPorId(especialista.getPostsUser().get(i).getIduser()).getId()%>"> <img src="imagens/dev1.jpeg" alt="" class="fotouser"> </a>	<!--COLOCAR IMAGEM DO USUARIO e LIGAR AO PERFIL DO USUARIO-->
                    <%}else{ %>
                    	<a href="RedirecionarServlet?action=perfil&id=<%= EspecialistaDao.buscarEspecialistaPorId(especialista.getPostsUser().get(i).getIduser()).getId()%>"> <img src="imagens/userpadrao.png" alt="" class="fotouser"> </a>
                    <%} %>  
                                <a href="RedirecionarServlet?action=perfil&id=<%= EspecialistaDao.buscarEspecialistaPorId(especialista.getPostsUser().get(i).getIduser()).getId()%>"><p><%= EspecialistaDao.buscarEspecialistaPorId(especialista.getPostsUser().get(i).getIduser()).getNome() %></p></a>       <!--COLOCAR NOME DO USUARIO (ESPECIALISTA.GETNOME()) e LIGAR AO PERFIL DO USUARIO-->
                            </div>
                            <span>•</span>
                            
                            <%String tema = ""; %>
                            <%if(especialista.getPostsUser().get(i).getTemaPredominante().equals("Inclusão Educacional")){ %>
                            	<%tema = "inclusao"; %>
                           <% }else if(especialista.getPostsUser().get(i).getTemaPredominante().equals("Acessibilidade")){ %>
                            	<%tema = "acessibilidade"; %>
                           <% }else if(especialista.getPostsUser().get(i).getTemaPredominante().equals("Deficiência Visual")){ %>
                            	<%tema = "deficiencia"; %>
                           <% }else if(especialista.getPostsUser().get(i).getTemaPredominante().equals("Autismo")){ %>
                            	<%tema = "autismo"; %>
                           <%} %>
                            
                           
                            <a href="RedirecionarServlet?action=<%=tema %>" style="color: #246CE0; font-weight: bold; text-decoration: none;"><span><%= especialista.getPostsUser().get(i).getTemaPredominante() %></span></a>    <!--COLOCAR O TEMA DO POST e LIGAR A PAGINA DO TEMA ESPECIFICO-->
                        </div>
    
                        <div class="titulo-post">
                            <a href="RedirecionarServlet?action=post&id=<%= especialista.getPostsUser().get(i).getId() %>&tema=<%=especialista.getPostsUser().get(i).getTemaPredominante() %>"><h3><%= especialista.getPostsUser().get(i).getTitulo() %></h3></a>   <!--COLOCAR O TITULO DA POSTAGEM-->
                            <p><%= especialista.getPostsUser().get(i).getSubtitulo() %></p>  <!--COLOCAR O SUBTITULO DA POSTAGEM-->
                        </div>
                        
                        <div class="data-comentarios">
                            <div class="data">
                                <p><%=PostDao.exibirHorarioPub(especialista.getPostsUser().get(i).getId()) %></p>     <!--COLOCAR A DATA ATUAL - DATA DE POSTAGEM-->
                            </div>
                            <span>•</span>
                            <p><%= PostDao.exibirTotalComentarios(especialista.getPostsUser().get(i).getId()) %> comentários</p>    <!--COLOCAR TOTAL DE COMENTARIOS-->
                        </div>
                    </div>
                    
                </div>
                <hr style="margin: 1rem 0; padding: 0;">
                <%} %>
             <%} %>
                <h2 style="text-align: center; color: #dfdfdf; padding: 2rem 0;">Parece que você chegou ao fim</h2>
            </section>
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