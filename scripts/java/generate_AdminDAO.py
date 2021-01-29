
def load_file():
    


    obj_outpt_file= open("AdminDAO.java", "w")

    str_out = "package dao;\n" + \
"\n" + \
"import java.sql.Connection;\n" + \
"import java.sql.DriverManager;\n" + \
"import java.sql.SQLException;\n" + \
"import java.util.logging.Level;\n" + \
"import java.util.logging.Logger;\n" + \
"\n" + \
"import DAOS.Conexion;\n" + \
"\n" + \
"public class AdminDAO {\n" + \
"	\n" + \
"	private static String url = \"storehelperdb.db\";\n" + \
"	private static Connection conexion = null;\n" + \
"	\n" + \
"	/***\n" + \
"	 * Genenerate the conexion to db\n" + \
"	 * @return\n" + \
"	 */\n" + \
"	public static Connection getConnection() {\n" + \
"		\n" + \
"		try {\n" + \
"//			loas driver\n" + \
"			Class.forName(\"org.sqlite.JDBC\");\n" + \
"			conexion=DriverManager.getConnection(\"jdbc:sqlite:\"+url);\n" + \
"			\n" + \
"			if (conexion!=null)\n" + \
"				System.out.println(\"conexion correcta\");\n" + \
"			\n" + \
"		} catch (SQLException e) {\n" + \
"\n" + \
"			System.out.println(\"error sql : \"+e);\n" + \
"\n" + \
"		} catch (ClassNotFoundException ex) {\n" + \
"			System.out.println(\"error de clase : \"+ex);\n" + \
"			Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);\n" + \
"		}\n" + \
"		\n" + \
"		return conexion;\n" + \
"	}\n" + \
"	\n" + \
"	/***\n" + \
"	 * Close the conexion eith dbs\n" + \
"	 */\n" + \
"	public static void closeConnection() {\n" + \
"		if (conexion != null) {\n" + \
"			try {\n" + \
"				conexion.close();\n" + \
"			} catch (Exception e) {\n" + \
"				System.out.println(\"error to close connection \" );\n" + \
"				e.printStackTrace();\n" + \
"			}\n" + \
"		}\n" + \
"			\n" + \
"	}\n" + \
"}\n" + \
"\n" + \
"\n"
    
    obj_outpt_file.write(str_out)
    obj_outpt_file.close()

def main():
    load_file()

if __name__ == '__main__':
    main()
