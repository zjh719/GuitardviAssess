package Guitar.action;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Guitar.entity.Guitar;
import Guitar.entity.GuitarSpec;
import Guitar.entity.Inventory;
import Guitar.service.GuitarService;



@SuppressWarnings("serial")
public class GuitarAction extends ActionSupport {
	  
	private String  builder, model, type, backWood, topWood;
	private String serialNumber;
	  private double price;
	public String getBuilder() {
		return builder;
	}
	public void setBuilder(String builder) {
		this.builder = builder;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBackWood() {
		return backWood;
	}
	public void setBackWood(String backWood) {
		this.backWood = backWood;
	}
	public String getTopWood() {
		return topWood;
	}
	public void setTopWood(String topWood) {
		this.topWood = topWood;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	//查询
	@SuppressWarnings({ "rawtypes", "unchecked" })
	GuitarService guitarService=new  GuitarService();
	List<Guitar> list=new LinkedList<Guitar>();
	public String find() throws Exception{
		 GuitarSpec spec =new GuitarSpec();
		 spec.setBuilder(builder);
		 spec.setTopWood(topWood);
		 spec.setBackWood(backWood);
		 spec.setModel(model);
		 spec.setType(type);
		 list=guitarService.search(spec);
		 ActionContext.getContext().getSession().put("list1", list);
		 return SUCCESS;
      }
    //查出所有
	@SuppressWarnings("unchecked")
	public String getAll() throws Exception{
		 GuitarSpec spec1 =new GuitarSpec();
		 spec1.setBuilder("");
		 spec1.setTopWood("");
		 spec1.setBackWood("");
		 spec1.setModel("");
		 spec1.setType("");
        list=guitarService.getInventory(spec1);
		ActionContext.getContext().getSession().put("listAll", list);
		return SUCCESS;	
	}
	//删除吉他
	public String deleGuitar() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
	    String serial=request.getParameter("serialNumber");
		guitarService.deleGuitar(serial);
		return SUCCESS;
	 }
	//添加吉他
	public String addGuitar()throws Exception{
		GuitarSpec spec =new GuitarSpec();
		spec.setBackWood(backWood);
		spec.setBuilder(builder);
		spec.setModel(model);
		spec.setType(type);
		spec.setTopWood(topWood);
		Guitar guitar = new Guitar();
		guitar.setPrice(price);
		guitar.setSerialNumber(serialNumber);
		guitar.setSpec(spec);
		guitarService.addGuitar(guitar);
		return backWood;
		
	}
	}
