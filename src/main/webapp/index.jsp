<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Curso jsp</title>
</head>
<body>

	<h2>Bem vindo curso JSP</h2>
	
	
	<form action="ServletLogin" method="post" >
		<input name="login" type="text">
		<input name="senha" type="password">
		<input type="submit" value="Enviar">
	</form>
		<h4>${msg}</h4>
</body>
</html>