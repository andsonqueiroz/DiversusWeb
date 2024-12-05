<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Especialista"%>
<%@ page import="model.EspecialistaDao" %>
    
<%Especialista esp = (Especialista) session.getAttribute("usuarioLogado"); %>
<%Especialista especialista = EspecialistaDao.buscarEspecialistaPorId(esp.getId()); %>

    
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Perfil</title>
    <link rel="stylesheet" href="css/StyleAlterarDadosEspecialista.css">
</head>
<body>
    <div class="pagina-total">
        <div class="editar-perfil">

            <h1 id="editar-perfil"> <center>Configurações</center></h1><br>
            
            <form action="AlterarDadosServlet" method="post" id="formEditarPerfil">
            <h2><center>Informações Pessoais</center></h2>

            <div class="nome">
                <label for="nome">Nome:</label><br>
                <input type="text" id="nome" name="nome" value="<%= especialista.getNome() %>" required><br>    
            </div>
            
            <div class="especialidade">
                <label for="especialidade">Especialidade:</label><br>
                <input type="text" id="especialidade" name="especialidade" value="<%= especialista.getEspecialidade() %>" required><br>    
            </div>

            <div class="email">
                <label for="email">E-mail:</label><br>
                <input type="email" id="email" name="email" value="<%= especialista.getEmail() %>" required><br>    
            </div>
            
            <div class="telefone">
                <label for="telefone">Telefone:</label><br>
                <%if(especialista.getTelefone() != null){ %>
                	<input type="text" id="telefone" name="telefone" value="<%= especialista.getTelefone() %>"><br>    
                <%}else{ %>
                	<input type="text" id="telefone" name="telefone" required><br>    
				<%} %>
            </div>
            
            <div class="cidade">
                <label for="cidade">Cidade:</label><br>
                <%if(especialista.getCidade() != null){ %>
                	<input type="text" id="cidade" name="cidade" value="<%= especialista.getCidade() %>">
                <%}else{ %>
            		<input type="text" id="cidade" name="cidade">
            	<%} %>
            </div>
                        
            <button class="btn-salvar" type="submit" onclick="validar()"><b>SALVAR INFORMAÇÕES</b></button>

        </form>

        </div>
        

    </div>

    <script>
        function validar(){
            let nome = formEditarPerfil.nome.value;
            let especialidade = formEditarPerfil.especialidade.value;
            let email = formEditarPerfil.email.value;
            let telefone = formEditarPerfil.telefone.value;
            if (nome === ""){
                alert('Preecha o campo nome');
                formEditarPerfil.nome.focus();
                return false;
            } else if (especialidade === ""){
                alert('Preecha o campo especialidade');
                formEditarPerfil.especialidade.focus();;
                return false;
            } else if (email === ""){
                alert('Preecha o campo e-mail');
                formEditarPerfil.email.focus();
                return false;
            } else if (telefone === ""){
                alert('Preecha o campo telefone');
                formEditarPerfil.telefone.focus();
                return false;
            }else{
                document.forms["formEditarPerfil"].submit();
            }
        }  
    </script>

    

</body>
</html>

    