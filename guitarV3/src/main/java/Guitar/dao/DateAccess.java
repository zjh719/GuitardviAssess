package Guitar.dao;

import Guitar.mysqlDao.GuitarDaoImpl;

@SuppressWarnings("unused")
public class DateAccess {
       private static String db="mysql";
       public static GuitarDao createGuitarDao() {
		GuitarDao result=null;
		switch (db) {
		case "sqlite":
			result=new Guitar.sqliteDao.GuitarDaoImpl();
			break;
		   case "mysql":
		result=new Guitar.mysqlDao.GuitarDaoImpl();
			break;
		}
		return result;
	}
}
