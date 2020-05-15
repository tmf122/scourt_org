package org.scourt.iros;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class mysqlTest {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/scourt_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static final String USER = "root"; 
	private static final String PW = "3004"; 

	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);

		try (Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println("success");
			System.out.println(con);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
	}
}
