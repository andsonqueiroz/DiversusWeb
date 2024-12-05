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
<%Especialista especialistaLogado = (Especialista) session.getAttribute("usuarioLogado"); %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylePerfilLogado.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Perfil</title>
</head>

<script>
    document.addEventListener('DOMContentLoaded', () => {
    const postarButtons = document.getElementsByClassName('postar-buttom'); // Coleção de botões
    const postarContainer = document.getElementById('postar-container');

    // Adicionar evento de clique a cada botão
    Array.from(postarButtons).forEach((button) => {
        button.addEventListener('click', (event) => {
            event.stopPropagation(); // Impede que o clique no botão feche o container
            if (postarContainer.style.display === 'none' || !postarContainer.style.display) {
                postarContainer.style.display = 'block';
            } else {
                postarContainer.style.display = 'none';
            }
        });
    });

    // Fechar o container ao clicar fora dele
    document.addEventListener('click', (event) => {
        if (
            !postarContainer.contains(event.target) && 
            !Array.from(postarButtons).includes(event.target)
        ) {
            postarContainer.style.display = 'none';
        }
    });
});
    
    function exibirTelaInsercao() {
        document.getElementById("telaInsercao").style.display = "block";
    }

    function fecharTela() {
        document.getElementById("telaInsercao").style.display = "none";
    }

    
    function exibirTelaInsercao2() {
        document.getElementById("telaInsercao2").style.display = "block";
    }

    function fecharTela2() {
        document.getElementById("telaInsercao2").style.display = "none";
    }
    
    function exibirTelaInsercao3(id, ano, conteudo, cidade) {
    	
        document.getElementById('id3').value = id;
        document.getElementById('anoInput3').value = ano;
        document.getElementById('conteudoPortfolio3').value = conteudo;
        document.getElementById('cidadeInput3').value = cidade;
        
        document.getElementById("telaInsercao3").style.display = "block";
    }
    
    function fecharTela3() {
        document.getElementById("telaInsercao3").style.display = "none";
    }
    
    function exibirTelaInsercao4(id, ano, conteudo, cidade) {
    	
        document.getElementById('id4').value = id;
        document.getElementById('anoInput4').value = ano;
        document.getElementById('conteudoPortfolio4').value = conteudo;
        document.getElementById('cidadeInput4').value = cidade;
        
        document.getElementById("telaInsercao4").style.display = "block";
    }
    
    function fecharTela4() {
        document.getElementById("telaInsercao4").style.display = "none";
    }
    
    
    function confirmExclusao() {
        return confirm("Tem certeza de que deseja excluir?");
    }
    
    function exibirAlterarFoto(){
        document.getElementById("inserirFotoContainer").style.display = "block";
    }
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
                <%if(EspecialistaDao.buscarEspecialistaPorId(especialistaLogado.getId()).getCaminhoImg() != null){ %>
                        <img src="FotosUser/<%=EspecialistaDao.buscarEspecialistaPorId(especialistaLogado.getId()).getCaminhoImg() %>" alt="" class="fotoperfil">		<!-- FOTO DO USUARIO -->
                <%}else{ %>
                    	<img src="imagens/fotoperfil.jpg" alt="" class="fotoperfil">
                <%} %>
                <ul class="dropdown-menu">
                    <li class="submenu-li"><a href="RedirecionarServlet?action=perfil&id=<%= especialistaLogado.getId()%>">Perfil</a></li>
                    <li class="submenu-li"><a href="RedirecionarServlet?action=configuracoes">Config</a></li>
                    <li class="submenu-li"><a href="LogoutServlet">Sair</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="nav-background"></div>
</nav>

<div class="container-pagina-total" style="display: flex; flex-direction: column; align-items: center;">
    <div class="conteudo-perfil">
        <div>
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
        </div>

        <div class="capa-info" style="display: flex; flex-direction: column; justify-content: end;">

            <div class="informacoes" style="display: flex; justify-content: space-between; padding: 50px 50px;">
                <div style="display: flex; align-items: center; gap: 30px;">
                    <div style="position: relative;">
                    <%if(especialista.getCaminhoImg() != null){ %>
                    	<img class="foto-perfil" src="FotosUser/<%= especialista.getCaminhoImg() %>" alt="" width="150px" height="150px">
                    <%}else{ %>
                        <img class="foto-perfil" src="imagens/fotoperfil.jpg" alt="" width="150px" height="150px">
                    <%} %>
                    </div>
                    <%if(especialista.getId() == especialistaLogado.getId()){ %>
                    <div class="editarfoto">
                        <span onclick="exibirAlterarFoto()" class="faixa-editarfoto">Editar foto</span>
                    </div>
                    <%} %>
                    <div>
                        <h5 id="especialista">Especialista</h5>
                        <h3 id="nome-especialista"><%= especialista.getNome() %></h3>
                        <h5 id="especialidade"><%= especialista.getEspecialidade() %></h5>
                        <%if(especialista.getId() == especialistaLogado.getId()){ %>
                        	<a href="RedirecionarServlet?action=editarPerfil"><button class="botao-mensagem">Editar Perfil</button></a> 
                        <%} %>
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
	        <%if(especialista.getId() == especialistaLogado.getId()){ %>
			<a href="javascript:void(0)" onclick="exibirTelaInsercao()" style="display: flex; align-items: center;">
				 <img src="imagens/adicionar-ficheiro.png" width="20px" alt="">
			 </a>      
			 <%} %>  
        </div>

        <div class="informacao-especialista2">
        <%if(especialista.getExperiencias() != null){ %>
        <!-- FOR PARA EXIBIR FEXPERIENCIAS E PROJETOS DO USUARIO -->
        <%for(int i = especialista.getExperiencias().size()-1; i >= 0; i--){ %>
        
            <div>
                <h4 id="ano"><%= especialista.getExperiencias().get(i).getAno() %></h4>
                <h4 id="creche"><%= especialista.getExperiencias().get(i).getConteudo() %></h4>
                <h4 id="cidade-experiencia"><%= especialista.getExperiencias().get(i).getCidade() %></h4>
                
                <%if(especialista.getId() == especialistaLogado.getId()){ %>
                <div class="lixeira-editar">																<!-- ISSO SÓ IRÁ TER NO perfilLogado -->
                    <a href="ExcluirPortfolioServlet?action=experiencia&id=<%= especialista.getExperiencias().get(i).getId()%>" onclick="return confirmExclusao();"><img height="20px" class="lixeira" src="imagens/delete.png" alt=""></a>
                    <%int id = especialista.getExperiencias().get(i).getId();%>
					<%int ano = especialista.getExperiencias().get(i).getAno();%>
					<%String conteudo = especialista.getExperiencias().get(i).getConteudo();%>
					<%String cidade = especialista.getExperiencias().get(i).getCidade();%>
                    <a href="javascript:void(0)" onclick="exibirTelaInsercao4(<%= id %>, <%= ano %>, '<%= conteudo.replace("'", "\\'") %>', '<%= cidade.replace("'", "\\'") %>')">
					    <img height="20px" class="editar" src="imagens/escrever.png" alt="">
					</a> 
                </div> 
                <%} %>
            </div>
		<%} %>
		<!-- FIM DO FOR DE EXPERIENCIAS E PROJETOS -->
		<%} %>
        </div>

        <hr id="hr2">

		<div style="display: flex;">
	        <h3 id="formacoes">Formações</h3>
	        <%if(especialista.getId() == especialistaLogado.getId()){ %>
			<a href="javascript:void(0)" onclick="exibirTelaInsercao2()" style="display: flex; align-items: center;">
				 <img src="imagens/adicionar-ficheiro.png" width="20px" alt="">
			</a> 
			<%} %>
		</div>


        <div class="informacao-especialista3">
        <%if(especialista.getFormacoes() != null){ %>
         <!-- FOR PARA EXIBIR FORMAÇÕES DO USUARIO -->
         <%for(int i = especialista.getFormacoes().size()-1; i>=0; i--){ %>
        
            <div>
                <h4 id="ano4"><%= especialista.getFormacoes().get(i).getAno() %></h4>
                <h4 id="tipo-formacao"><%= especialista.getFormacoes().get(i).getConteudo() %></h4>
                <h4 id="cidade-formacao"><%= especialista.getFormacoes().get(i).getCidade() %></h4>
                
                <%if(especialista.getId() == especialistaLogado.getId()){ %>
                <div class="lixeira-editar">																<!-- ISSO SÓ IRÁ TER NO perfilLogado -->
                    <a href="ExcluirPortfolioServlet?action=formacao&id=<%= especialista.getFormacoes().get(i).getId()%>" onclick="return confirmExclusao();"><img height="20px" class="lixeira" src="imagens/delete.png" alt=""></a>
					
					<%int id = especialista.getFormacoes().get(i).getId();%>
					<%int ano = especialista.getFormacoes().get(i).getAno();%>
					<%String conteudo = especialista.getFormacoes().get(i).getConteudo();%>
					<%String cidade = especialista.getFormacoes().get(i).getCidade();%>
					<a href="javascript:void(0)" onclick="exibirTelaInsercao3(<%= id %>, <%= ano %>, '<%= conteudo.replace("'", "\\'") %>', '<%= cidade.replace("'", "\\'") %>')">
					    <img height="20px" class="editar" src="imagens/escrever.png" alt="">
					</a>            
				</div> 
                <%} %>
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

<!-- TELA DE CRIAR EXPERIENCIA E PROJETO -->
<div class="tela-insercao" id="telaInsercao" style="display: none; ">
        <h3>Adicionar Nova <span style="color: #246CE0;">Experiência</span></h3>
        
        <form action="CriarExperiencia" method="POST">
        
        <div style="display: flex; flex-direction: column; align-items: center;">
            <div>
                <input type="text" id="conteudoPortfolio" name="conteudoPortfolio" placeholder="Digite o título">
            </div>
            <hr style="margin: 1.5rem 0;">
    
            <div>
                <input type="text" id="anoInput" name="anoInput" placeholder="Digite o ano">
            </div>
            <hr style="margin: 1.5rem 0;">
    
            <div>
                <input type="text" id="cidadeInput" name="cidadeInput" placeholder="Digite o local em que foi feito">
            </div>
            <hr style="margin: 1.5rem 0;">
            <input type="hidden" name="acao" value="CriarExperiencia">
        </div>

        <div>
            <button type="submit" >Salvar</button>
        </div>
        
		</form>
        
        <div>
            <button class="fechar" onclick="fecharTela()">Fechar</button>
        </div>
    </div>
    <!-- FIM DA TELA DE CRIAR EXPERIENCIA E PROJETO -->
    
    <!-- TELA DE CRIAR FORMAÇÃO -->
    <div class="tela-insercao" id="telaInsercao2" style="display: none; ">
        <h3>Adicionar Nova <span style="color: #246CE0;">Formação</span></h3>
        
        <form action="CriarFormacao" method="POST">
        
        <div style="display: flex; flex-direction: column; align-items: center;">
            <div>
                <input type="text" id="conteudoPortfolio" name="conteudoPortfolio" placeholder="Digite o título">
            </div>
            <hr style="margin: 1.5rem 0;">
    
            <div>
                <input type="text" id="anoInput" name="anoInput" placeholder="Digite o ano">
            </div>
            <hr style="margin: 1.5rem 0;">
    
            <div>
                <input type="text" id="cidadeInput" name="cidadeInput" placeholder="Digite a cidade em que foi feita">
            </div>
            <input type="hidden" name="acao" value="CriarFormacao">
            <hr style="margin: 1.5rem 0;">
        </div>

        <div>
            <button type="submit" >Salvar</button>
        </div>
        
		</form>
        
        <div>
            <button class="fechar" onclick="fecharTela2()">Fechar</button>
        </div>
    </div>
    <!-- FIM DA TELA DE CRIAR FORMAÇÃO -->
    
    
    
    
    <!-- TELA DE EDITAR FORMAÇÃO -->
    <div class="tela-insercao" id="telaInsercao3" style="display: none; ">
        <h3>Editar <span style="color: #246CE0;">Formação</span></h3>
        
        <form action="CriarFormacao" method="POST">
        
        <div style="display: flex; flex-direction: column; align-items: center;">
            <div>
                <input type="text" id="conteudoPortfolio3" name="conteudoPortfolio" placeholder="Digite o título">
            </div>
            <hr style="margin: 1.5rem 0;">
    
            <div>
                <input type="text" id="anoInput3" name="anoInput" placeholder="Digite o ano">
            </div>
            <hr style="margin: 1.5rem 0;">
    
            <div>
                <input type="text" id="cidadeInput3" name="cidadeInput" placeholder="Digite a cidade em que foi feita">
            </div>
            <input type="hidden" name="acao" value="EditarFormacao">
            <input type="hidden" id="id3" name="id">
            <hr style="margin: 1.5rem 0;">
        </div>

        <div>
            <button type="submit" >Editar</button>
        </div>
        
		</form>
        
        <div>
            <button class="fechar" onclick="fecharTela3()">Fechar</button>
        </div>
    </div>
    <!-- FIM DA TELA DE EDITAR FORMAÇÃO -->
    
    
        <!-- TELA DE EDITAR EXPERIENCIA -->
    <div class="tela-insercao" id="telaInsercao4" style="display: none; ">
        <h3>Editar <span style="color: #246CE0;">Experiência/Projeto</span></h3>
        
        <form action="CriarExperiencia" method="POST">
        
        <div style="display: flex; flex-direction: column; align-items: center;">
            <div>
                <input type="text" id="conteudoPortfolio4" name="conteudoPortfolio" placeholder="Digite o título">
            </div>
            <hr style="margin: 1.5rem 0;">
    
            <div>
                <input type="text" id="anoInput4" name="anoInput" placeholder="Digite o ano">
            </div>
            <hr style="margin: 1.5rem 0;">
    
            <div>
                <input type="text" id="cidadeInput4" name="cidadeInput" placeholder="Digite a cidade em que foi feita">
            </div>
            <input type="hidden" name="acao" value="EditarExperiencia">
            <input type="hidden" id="id4" name="id">
            <hr style="margin: 1.5rem 0;">
        </div>

        <div>
            <button type="submit" >Editar</button>
        </div>
        
		</form>
        
        <div>
            <button class="fechar" onclick="fecharTela4()">Fechar</button>
        </div>
    </div>
    <!-- FIM DA TELA DE EDITAR EXPERIENCIA -->
    
    
    
    
    <!-- TELA DE INSERIR FOTO NO PERFIL -->
    <div class="inserirFoto-container" id="inserirFotoContainer">
        <form action="InserirFotoPerfilServlet" method="post" enctype="multipart/form-data">
            <input type="file" name="fotoperfil" required> <br>
            <button type="submit" class="enviarFoto">Enviar</button> <br>
            <a href="InserirFotoPerfilServlet?action=removerFoto" class="removerfoto">Remover foto</a>
        </form>
        <button onclick="document.getElementById('inserirFotoContainer').style.display='none';" class="cancelarFoto">Fechar</button>
    </div>

<!-- FIM DA TELA DE INSERIR FOTO NO PERFIL -->

    
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