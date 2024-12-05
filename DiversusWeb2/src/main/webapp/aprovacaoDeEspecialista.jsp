<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Especialista" %>
<%ArrayList<Especialista> lista = (ArrayList<Especialista>) request.getAttribute("especialistas");%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Especialistas Pendentes</title>
    <link rel="stylesheet" href="css/styleaprovacao.css">
</head>
<body>
	<h1 class="titulo">Lista de Especialistas pendentes</h1>
	<table class="tabela">
		<thead>
			<tr> 
				<th>ID</th>
				<th>Nome</th>
				<th>Email</th>
				<th>Especialidade</th>
				<th>Certificado</th>
				<th>Aprovar</th>
				<th>Reprovar</th>
				
			</tr>
		 </thead>
		 <tbody>
		 <%for(int i=0; i<lista.size();i++){ %>
		 	<tr>
		 		<td><%= lista.get(i).getId() %></td>
		 		<td><%= lista.get(i).getNome() %></td>
		 		<td><%= lista.get(i).getEmail() %></td>
		 		<td><%= lista.get(i).getEspecialidade() %></td>
		 		<td> <a href="BaixarArquivoServlet?id=<%= + lista.get(i).getId() %>" class="baixar">Baixar Certificado</a> </td>
		 	 	<td> <a href="aprovarEspecialista?id=<%= + lista.get(i).getId() %>" class="aprovar">APROVAR</a> </td>
		 	 	<td> <a href="reprovarEspecialista?id=<%= + lista.get(i).getId() %>" class="reprovar">REPROVAR</a> </td>
		 	 </tr>
		 <%} %>
		</tbody>
	</table>
	<div class="sair-box"> <a class="sair" href="LogoutServlet">Sair</a> </div>
	
	 <h1 class="titulo">Envio de Newsletter</h1>
	
	<div class="enviar-box"> <a class="enviar" href="CriarEEnviarNewsletter">Criar e enviar</a> </div>
	 
	
</body>
</html>