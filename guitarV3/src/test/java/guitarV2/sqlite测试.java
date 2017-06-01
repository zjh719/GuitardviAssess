package guitarV2;

import static org.junit.Assert.*;

import java.util.LinkedList;
import java.util.List;

import org.junit.Test;

import Guitar.entity.Guitar;
import Guitar.entity.GuitarSpec;
import Guitar.service.GuitarService;

public class sqlite≤‚ ‘ {

	@Test
	public void test() {
		GuitarService guitarService=new GuitarService();
		List<Guitar> list=new LinkedList<Guitar>() ;
		
		 GuitarSpec spec1 =new GuitarSpec();
		 spec1.setBuilder("");
		 spec1.setTopWood("");
		 spec1.setBackWood("");
		 spec1.setModel("");
		 spec1.setType("");
        list=guitarService.getInventory(spec1);
        System.out .println(list.size());
	}

}
