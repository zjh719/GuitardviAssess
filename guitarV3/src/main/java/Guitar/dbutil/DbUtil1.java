package Guitar.dbutil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import Guitar.dao.GuitarDao;
import Guitar.mysqlDao.GuitarDaoImpl;

public class DbUtil1 {
	//private static DataSource dataSource=null;
    private static ComboPooledDataSource dataSource=new ComboPooledDataSource();
	static {
		//Properties c3p0=new Properties();
		try{
			
			dataSource.setDriverClass("com.mysql.jdbc.Driver");
			dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/findguitar");
			dataSource.setUser("root");
			dataSource.setPassword("123456");
			dataSource.setInitialPoolSize(50);
			dataSource.setMaxPoolSize(100);
			dataSource.setMaxIdleTime(10000);			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		Connection connection=null;
		try {
			connection=dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	public static boolean executeUpdate(String sql,Object[] args){
		Connection conn=null;
		PreparedStatement pst=null;
		int rowsCount=0;
		try{
			conn=dataSource.getConnection();
			pst=conn.prepareStatement(sql);
			if(args!=null&args.length>0){
				for(int i=0;i<args.length;i++){
					pst.setObject(i+1, args[i]);
				}
			}
			rowsCount=pst.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rowsCount>0?true:false;
	}
	public static ResultSet executeQuery(String sql,Object[] args){
		Connection conn=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		try{
			conn=dataSource.getConnection();
			pst=conn.prepareStatement(sql);
			if(args!=null&args.length>0){
				for(int i=0;i<args.length;i++){
					pst.setObject(i+1, args[i]);
				}
			}
			rs=pst.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
}

