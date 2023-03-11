<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Pagina de erro</title>
    <link href="resources/css/estilo.css" rel="stylesheet"/>
</head>
<body>
	<h1>Mensagem de erro, entra em contacto com equipe de supporte do sistema.</h1>
	<%
		out.print(request.getAttribute("msg"));
	%>
</body>
</html>