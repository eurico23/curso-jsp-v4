<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="navbarmainmenu.jsp"></jsp:include>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<div class="row">
											<div class="col-md-12">
												<div class="card">

													<div class="card-header">
														<h2 id="msg">${msg}</h2>
														<h5>Cadastro de usuario</h5>
														<!--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
													</div>

													<div class="card-block">
														<!-- send the form to %>/ServLetUsuarioControler  -->
														<form class="form-material" enctype="multipart/form-data"
															action="<%=request.getContextPath()%>/ServLetUsuarioControler"
															method="post" id=formUser>
															<input type="hidden" name="acao" id="acao" value="">

															<div class="form-group form-default form-static-label">
																<input name="id" id="id" readonly="readonly" type="text"
																	class="form-control" value="${modolLogin.id}">
																<span class="form-bar"></span> <label
																	class="float-label">ID</label>
															</div>

															<div class="form-group form-default">
																<input type="text" name="nome" id="nome"
																	class="form-control" required
																	value="${modolLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome</label>
															</div>

															<div class="form-group form-default">
																<c:if
																	test="${modolLogin.fotouser != '' && modolLogin.fotouser != null}">
																	<a
																		href="<%= request.getContextPath()%>/ServLetUsuarioControler?acao=downloadFoto&id=${modolLogin.id}">
																		<img alt="Imagem User" id="fotoembase64"
																		src="${modolLogin.fotouser}" width="70px">
																	</a>
																</c:if>

																<c:if
																	test="${modolLogin.fotouser == '' || modolLogin.fotouser == null}">
																	<img alt="Imagem User" id="fotoembase64"
																		src="/curso-jsp-v3/resources/assets/images/faq_man.png"
																		width="70px">
																</c:if>
																<input type="file" id="fileFoto" name="fileFoto"
																	accept="image/*"
																	onchange="visualisarImg('fotoembase64', 'fileFoto')">
															</div>


															<div class="form-group form-default">
																<input type="email" name="email" id="email"
																	class="form-control" required
																	value="${modolLogin.email}"> <span
																	class="form-bar"></span> <label class="float-label">Email</label>
															</div>



															<div class="form-group form-default">
																<input onblur="pesquisaCep();" name="cep" id="cep"
																	type="text" class="form-control" required
																	value="${modolLogin.cep}"> <span
																	class="form-bar"></span> <label class="float-label">Cep</label>
															</div>


															<div class="form-group form-default">
																<input name="logradouro" id="logradouro" type="text"
																	class="form-control" required
																	value="${modolLogin.logradouro}"> <span
																	class="form-bar"></span> <label class="float-label">Logradouro</label>
															</div>


															<div class="form-group form-default">
																<input name="bairro" id="bairro" type="text"
																	class="form-control" required
																	value="${modolLogin.bairro}"> <span
																	class="form-bar"></span> <label class="float-label">Bairro</label>
															</div>

															<div class="form-group form-default">
																<input name="localidade" id="localidade" type="text"
																	class="form-control" required
																	value="${modolLogin.localidade}"> <span
																	class="form-bar"></span> <label class="float-label">Localidade</label>
															</div>

															<div class="form-group form-default">
																<input name="uf" id="uf" type="text"
																	class="form-control" required value="${modolLogin.uf}">
																<span class="form-bar"></span> <label
																	class="float-label">Estado</label>
															</div>

															<div class="form-group form-default">
																<input name="numero" id="numero" type="text"
																	class="form-control" required
																	value="${modolLogin.numero}"> <span
																	class="form-bar"></span> <label class="float-label">Numero</label>
															</div>


															<div class="form-group form-default">
																<input name="login" id="login" type="text"
																	class="form-control" required
																	value="${modolLogin.login}"> <span
																	class="form-bar"></span> <label class="float-label">Login</label>
															</div>

															<div class="form-group form-default form-static-label">
																<select class="form-control"
																	aria-label="Default select example" name="perfil">
																	<option disabled="disabled">[Selecione o
																		Perfil]</option>

																	<option value="ADMIN"
																		<%ModelLogin modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Admin</option>

																	<option value="SECRETARIA"
																		<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");

}%>>Secretária</option>

																	<option value="AUXILIAR"
																		<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Auxiliar</option>

																</select> <span class="form-bar"></span> <label
																	class="float-label">Perfil</label>

															</div>

															<div class="form-group form-default">
																<input name="senha" id="senha" type="password"
																	class="form-control" required
																	value="${modolLogin.senha}"> <span
																	class="form-bar"></span> <label class="float-label">Senha</label>
															</div>

															<div class="form-group form-default">
																<label class="radio-inline"> <input type="radio"
																	name="sexo" value="MASCULINO" checked="checked"
																	<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
	out.print(" ");
	out.print("checked=\"checked\"");
	out.print(" ");
}%> />
																	Masculino
																</label> <label class="radio-inline"> <input
																	type="radio" name="sexo" value="FEMININO"
																	<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
	out.print(" ");
	out.print("checked=\"checked\"");
	out.print(" ");
}%> />
																	Feminino
																</label>
															</div>

															<div class="form-group row d-flex justify-content-center">
																<button type="button"
																	class="btn btn-primary waves-effect waves-light"
																	onclick="limparForm()">Novo</button>
																<button type="submit"
																	class="btn btn-success waves-effect waves-light ml-2">Salvar</button>
																<button type="button"
																	class="btn btn-danger waves-effect waves-light ml-2"
																	onclick="criarDeleteComAjax()">Excluir</button>
																<button type="button" class="btn btn-primary ml-2"
																	data-toggle="modal" data-target="#exampleModalUsuario">Pesquisar</button>

															</div>
														</form>
													</div>
												</div>
												<div style="height: 300px; overflow: scroll">
													<table class="table" id="tabelaResultadosview">
														<thead>
															<tr>
																<th scope="col">ID</th>
																<th scope="col">Login</th>
																<th scope="col">Nome</th>
																<th scope="col">E-mail</th>
																<th scope="col">Ver</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${modelLogins }" var="ml">
																<tr>
																	<td><c:out value="${ml.id}"></c:out></td>
																	<td><c:out value="${ml.login}"></c:out></td>
																	<td><c:out value="${ml.nome}"></c:out></td>
																	<td><c:out value="${ml.email}"></c:out></td>
																	<td><a class="btn btn-success"
																		href="<%= request.getContextPath() %>/ServLetUsuarioControler?acao=buscarEditar&id=${ml.id}">Editar</a></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<nav aria-label="Page navigation example">
													<ul class="pagination">
														<%
														int totalPagina = (int) request.getAttribute("totalPagina");
														for (int p = 0; p < totalPagina; p++) {
															String url = request.getContextPath() + "/ServLetUsuarioControler?acao=paginar&pagina=" + (p * 5);
															out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+ url +"\">"+(p + 1)+"</a></li>");
														}
														%>
														
													</ul>
												</nav>

											</div>
										</div>
									</div>
								</div>
								<!-- Page-body end -->
							</div>
							<div id="styleSelector"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Required Jquery -->
	<jsp:include page="javascriptfile.jsp"></jsp:include>

	<div class="modal fade" id="exampleModalUsuario" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisar
						Usuario</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input id="nomeBusca" type="text" class="form-control"
							placeholder="Pesquisar Usuario" aria-label="Pesquisar Usuario"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-success" type="button"
								onclick="buscarUsuario();">Buscar</button>
						</div>
					</div>
					<div style="height: 300px; overflow: scroll">
						<table class="table" id="tabelaResultados">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Nome</th>
									<th scope="col">Ver</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
				<span style="margin-left: 15px" id="totalResultados"></span>
				<div class="modal-footer">

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">fechar</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		/*Pesquisa CEP*/
		function pesquisaCep() {
			var cep = $("#cep").val();
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {
						if (!("erro" in dados)) {
							//Atualiza os campos com os valores da consulta.
							$("#cep").val(dados.cep);
							$("#logradouro").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#localidade").val(dados.localidade);
							$("#uf").val(dados.uf);
						} //end if.
						else {
							//CEP pesquisado não foi encontrado.
							limpa_formulário_cep();
							alert("CEP não encontrado.");
						}

					});
		}

		/*Preview image */
		function visualisarImg(fotoembase64, filefoto) {
			var preview = document.getElementById(fotoembase64); // campo img html
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();

			reader.onloadend = function() {
				preview.src = reader.result; // carrega foto na tela  
			};

			if (fileUser) {
				reader.readAsDataURL(fileUser); // preview da imagem
			} else {
				preview.src = '';
			}
		}

		/*FUNCTION BUSCAR LISTA DE USUARIO INSIDE POP UP*/
		function buscarUsuario() {

			var nomeBusca = document.getElementById('nomeBusca').value;

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') {
				var urlAction = document.getElementById('formUser').action;
				$
						.ajax(
								{

									method : "get",
									url : urlAction,
									data : "nomeBusca=" + nomeBusca
											+ '&acao=buscarUserAjax',
									success : function(response) {

										var json = JSON.parse(response);

										$('#tabelaResultados >tbody > tr')
												.remove();

										for (var p = 0; p < json.length; p++) {
											$('#tabelaResultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '</td> <td>'
																	+ json[p].nome
																	+ '</td><td><button onclick="verEditar('
																	+ json[p].id
																	+ ')" type="button" class="btn btn-info">More</button> </td> </tr>');
										}

										document
												.getElementById('totalResultados').textContent = 'Resultados: '
												+ json.length;
									}

								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao Buscar ususario por nome: '
											+ xhr.responseText);
								});

			}
		}

		function verEditar(id) {
			var urlAction = document.getElementById('formUser').action;

			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;
		}

		function criarDeleteComAjax() {
			if (confirm('Deseja realmente exluir os dados?')) {

				var urlAction = document.getElementById('formUser').action;
				var idUser = document.getElementById('id').value;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "id=" + idUser + '&acao=deletarajax',
					success : function(response) {

						limparForm()
						document.getElementById('msg').textContent = response;
					}

				}).fail(
						function(xhr, status, errorThrown) {
							alert('Erro ao deletar ususario por id: '
									+ xhr.responseText);
						});
			}

		}

		function criarDelete() {
			if (confirm('Deseja realmente exluir os dados?')) {

				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("formUser").submit();
			}
		}

		function limparForm() {
			var elementos = document.getElementById("formUser").elements; /*Retorna elemento html dentro do form*/

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}
	</script>
</body>

</html>
