package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import java.io.IOException;

// everything that comes from file principal will be caught here
@WebFilter(urlPatterns = {"/principal/*"})/*Interceptas todas as requisiçoes que vierem do projeto ou mapeamento*/
public class FilterAutenticao implements Filter {
       

    public FilterAutenticao() {
    }

    /*Encerra os processo quando o servidor é parado*/
    /*Mataria os processo de conexão com banco*/
	public void destroy() {
	}

	/*Intercepta as requisicoes e a as respostas no sistema*/
	/*Tudo que fizer no sistema vai fazer por aqui*/
	/*Validação de autenticao*/
	/*Dar commit e rolback de transaçoes do banco*/
	/*Validar e fazer redirecionamento de paginas*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		
		
		chain.doFilter(request, response);
	}


	/*Inicia os processo ou recursos quando o servidor sobre o projeto*/
	// inicar a conexão com o banco
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
