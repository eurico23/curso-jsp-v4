package servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOUsuarioRepository;
import model.ModelLogin;

/**
 * Servlet implementation class ServLetUsuarioControler
 */
@MultipartConfig
@WebServlet(urlPatterns= {"/ServLetUsuarioControler"})
public class ServLetUsuarioControler extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;
       
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();


	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String acao = request.getParameter("acao");
			if(acao !=null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {
				
				String idUser = request.getParameter("id");
				
				daoUsuarioRepository.deletarUser(idUser);
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultaUsuarioList(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
				
				request.setAttribute("msg", "Excluido com sucesso!");
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

				
			} else 	if(acao !=null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarajax")) {  // delete using ajax
					
					String idUser = request.getParameter("id");
					
					daoUsuarioRepository.deletarUser(idUser);
					
					response.getWriter().write("Fromulario Ajax Excluido com sucesso!");
					
			} else if(acao !=null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax")) {  // delete using ajax
					
					String nomeBusca = request.getParameter("nomeBusca");
					
					List<ModelLogin> dadosJsonUser = daoUsuarioRepository.consultaUsuarioList(nomeBusca, super.getUserLogado(request));
					
					
						ObjectMapper mapper = new ObjectMapper();
						String json = mapper.writeValueAsString(dadosJsonUser);
					
						response.getWriter().write(json);
			}
			
			/*else se acao buscarEditar*/
			else if(acao !=null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {
				
				String id = request.getParameter("id");/*get the parameter requested in this case ID*/
				
				ModelLogin modelLogin = daoUsuarioRepository.consultaUsuarioID(id, super.getUserLogado(request)); /*call method that connects and search database*/
				
				
				
				request.setAttribute("msg", "Usuario em edicao"); /*display message on the screen*/
				request.setAttribute("modolLogin", modelLogin); /*set os atributos qu evao prencher a tela*/
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			}
			else if(acao !=null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUser")) {
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultaUsuarioList(super.getUserLogado(request));
				
				request.setAttribute("msg", "Usuario em edicao"); /*display message on the screen*/
				request.setAttribute("modelLogins", modelLogins); /*set os atributos qu evao prencher a tela*/
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			
			}
			else if(acao !=null && !acao.isEmpty() && acao.equalsIgnoreCase("downloadFoto")) {
				String idUser = request.getParameter("id");
				
				ModelLogin modelLogin = daoUsuarioRepository.consultaUsuarioID(idUser, super.getUserLogado(request));
				
				if(modelLogin.getFotouser() !=null && !modelLogin.getFotouser().isEmpty()) {
					
					response.setHeader("Content-disposition", "attachement;filename=arquivo." + modelLogin.getExtensaofotouser());
					//.split what it does separate the string after the comma into an array [1] its the position one of the array
					response.getOutputStream().write(new Base64().decodeBase64(modelLogin.getFotouser().split("\\,")[1]));
				}
			}
			
			
			else {
				
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}

		}
		catch(Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
		String msg = "Operacao realisada com sucesso!";
		String id = request.getParameter("id"); // (request.getParameter("id") get the id from the html form with output name="id"
		String nome = request.getParameter("nome"); //(request.getParameter("nome") get the nome from the html form with input name="nome"
		String email = request.getParameter("email"); //(request.getParameter("email") get the email from the html form with input name="email"
		String login = request.getParameter("login"); //(request.getParameter("login") get the login from the html form with input name="login"
		String senha = request.getParameter("senha"); //(request.getParameter("senha") get the senha from the html form with output name="senha"
		String perfil = request.getParameter("perfil"); //(request.getParameter("perfil") get the perfil from the html form with output name="perfil"
		String sexo = request.getParameter("sexo"); //(request.getParameter("sexo") get the sexo from the html form with output name="sexo"
		
		ModelLogin modelLogin = new ModelLogin(); // create new object of the class ModelLogin
		
		
		modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null ); // se ID null e id nao empty parse pra long :se nao passa pra null
		modelLogin.setNome(nome); // the setNome of value nome (nome get its value from the request.getParameter("nome");)
		modelLogin.setLogin(login);
		modelLogin.setEmail(email);
		modelLogin.setSenha(senha);
		modelLogin.setPerfil(perfil);
		modelLogin.setSexo(sexo);
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
			Part part = request.getPart("fileFoto"); /*Pega foto da tela*/
			
			if (part.getSize() > 0) {
				byte[] foto = IOUtils.toByteArray(part.getInputStream()); /*Converte imagem para byte*/
				String imagemBase64 = "data:image/" + part.getContentType().split("\\/")[1] + ";base64," +  new Base64().encodeBase64String(foto);
				
				modelLogin.setFotouser(imagemBase64);
				modelLogin.setExtensaofotouser(part.getContentType().split("\\/")[1]);
			}
		}
		
		if (daoUsuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId()==null) {
			msg = "Ja existe usuario com mesmo logn, informe outro login";
		}else {
			if (modelLogin.isNovo()) {
				msg= "Gravado com sucesso";
			} else {
				msg= "Atualizado com sucesso!";
			}
			modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin, super.getUserLogado(request));
		}
		
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("modolLogin", modelLogin);
		request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

		}catch(Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
	}

}
