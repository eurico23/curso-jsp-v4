package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

	private static String banco = "jdbc:postgresql://localhost:5432/curso-jsp-v3?autoReconnect=true";
	private static String user = "postgres";
	private static String senha = "admin";
	private static Connection connection = null;
	
	public static Connection getConnection1() {
		return connection;
		
	}
	
	static {
		conectar();
	}
	
	public SingleConnectionBanco(){ /*quando tiver uma instacia vai conectar*/
		conectar();
	}
	
	private static void conectar(){
		try {
			if (connection == null){
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(banco, user, senha);
				connection.setAutoCommit(false);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao conectar com a base de dados");
		}
	}
	public static Connection getConnection(){
		return connection;
	}

}
