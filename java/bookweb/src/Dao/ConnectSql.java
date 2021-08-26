package Dao;

import java.sql.Connection; 
import java.sql.DriverManager; 

// This class can be used to initialize the database connection 
public class ConnectSql { 
	public static Connection cn;
	public void Connect() {
		try {
			// nap database
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			// ket noi voi csld
			cn = DriverManager.getConnection(
					"jdbc:sqlserver://AITD201403181:1433; databaseName=BookStore; integratedSecurity=true");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
} 
