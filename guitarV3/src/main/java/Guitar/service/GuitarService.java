package Guitar.service;
import java.util.List;

import Guitar.dao.DateAccess;
import Guitar.dao.GuitarDao;
import Guitar.entity.Guitar;
import Guitar.entity.GuitarSpec;
import Guitar.entity.Inventory;

public class GuitarService {
private GuitarDao dao = DateAccess.createGuitarDao();
public GuitarDao getDao() {
	return dao;
}
public void setDao(GuitarDao dao) {
	this.dao = dao;
}
public List<Guitar> search(GuitarSpec spec) {
		// TODO Auto-generated method stub
		return dao.search(spec);
	}

   public List<Guitar> getInventory(GuitarSpec searchSpec) {
	  Inventory inventory =new Inventory();
	  List<Guitar> list=dao.getALLGuitar();
	  for (Guitar guitar : list) {
		inventory.addGuitar(guitar.getSerialNumber(), guitar.getPrice(), guitar.getSpec());
	}
	  List<Guitar> list1=inventory.search(searchSpec);
	return list1;
}
public boolean deleGuitar(String serial) {
	// TODO Auto-generated method stub
	return dao.deleGuitar(serial);
}
public Boolean addGuitar(Guitar guitar) {
	// TODO Auto-generated method stub
	return dao.addGuitar(guitar);
}
}
