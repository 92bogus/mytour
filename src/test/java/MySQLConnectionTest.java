//import java.sql.Connection;
//import java.sql.DriverManager;
//
//import org.junit.Test;
//
//public class MySQLConnectionTest {
//	private static final String DRIVER = "com.mysql.jdbc.Driver";
//	private static final String URL = "jdbc:mysql://mysqldbinstance.cscw4ppmgyof.ap-northeast-2.rds.amazonaws.com:3306/mytour?useSSL=false";
//
//	private static final String USER = "sino";
//	private static final String PW = "aws#sino";
//
//	@Test
//	public void testConnection() throws Exception {
//		Class.forName(DRIVER);
//
//		try(Connection con = DriverManager.getConnection(URL, USER, PW)) {
//			System.out.println(con);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
//}
