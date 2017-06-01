package Guitar.mysqlDao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import Guitar.dao.GuitarDao;
import Guitar.dbutil.DbUtil;
import Guitar.dbutil.DbUtil1;
import Guitar.entity.Guitar;
import Guitar.entity.GuitarSpec;
import Guitar.entity.Inventory;

public class GuitarDaoImpl implements GuitarDao{
	
	@Override
	public List<Guitar> search(GuitarSpec spec) {
        DbUtil1 dbUtil=new DbUtil1();
        Inventory inventory=new Inventory();
        ResultSet rs=dbUtil.executeQuery("select * from guitar",new Object[]{});
        try {
            while(rs.next()){
                String serialNumber=rs.getString(7);
                Double price=rs.getDouble(8);
                GuitarSpec spec1=new GuitarSpec();	
                spec1.setBuilder(rs.getString(2));
                spec1.setModel(rs.getString(3));
                spec1.setType( rs.getString(4));
                spec1.setBackWood( rs.getString(5));
                spec1.setTopWood( rs.getString(6));
                inventory.addGuitar(serialNumber, price, spec1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        @SuppressWarnings({ "rawtypes", "unchecked" })
		List<Guitar> list=new LinkedList();
        list=inventory.search(spec);
        return list;
    }

	@Override
	public List<Guitar> getALLGuitar() {
		// TODO Auto-generated method stub
		 DbUtil1 dbUtil=new DbUtil1();
			List<Guitar> guitarList =new ArrayList<Guitar>();
			Guitar guitar=null;
	        @SuppressWarnings("static-access")
			ResultSet rs=dbUtil.executeQuery("select * from guitar",new Object[]{});
	        try {
	            while(rs.next()){
	            	guitar=new Guitar();
	                String serialNumber=rs.getString(1);
	                Double price=rs.getDouble(2);
	                guitar.setPrice(price);
	                guitar.setSerialNumber(serialNumber);
	                GuitarSpec spec1=new GuitarSpec();	
	                spec1.setBuilder(rs.getString(3));
	                spec1.setModel(rs.getString(4));
	                spec1.setType( rs.getString(5));
	                spec1.setBackWood( rs.getString(6));
	                spec1.setTopWood( rs.getString(7));
	                guitar.setSpec(spec1);
	                guitarList.add(guitar);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return guitarList;
	}

	@Override
	public boolean deleGuitar(String serial) {
		// TODO Auto-generated method stub
		return DbUtil1.executeUpdate("delete from guitar where serialNumber=?", new Object[]{serial});
	}
	@Override
	public Boolean addGuitar(Guitar guitar) {
		// TODO Auto-generated method stub
		return DbUtil1.executeUpdate("insert into guitar(serialNumber,price,builder,model,type,backWood,topWood) values(?,?,?,?,?,?,?)",  new Object[]{guitar.getSerialNumber(),guitar.getPrice(),guitar.getSpec().getBuilder(),guitar.getSpec().getModel(),guitar.getSpec().getType(),guitar.getSpec().getBackWood(),guitar.getSpec().getTopWood()});
	}
}