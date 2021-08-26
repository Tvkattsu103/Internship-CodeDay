package Bean;

import java.sql.Date;
import java.util.ArrayList;

public class InvoiceBean {
	int invoiceid;
	int userid;
	Date orderDate;
	boolean bought;
	String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private ArrayList<DetailBean> ListDetail;
	
	public int getInvoiceid() {
		return invoiceid;
	}
	public void setInvoiceid(int invoiceid) {
		this.invoiceid = invoiceid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public boolean isBought() {
		return bought;
	}
	public void setBought(boolean bought) {
		this.bought = bought;
	}
	public ArrayList<DetailBean> getListDetail() {
		return ListDetail;
	}
	public void setListDetail(ArrayList<DetailBean> listDetail) {
		ListDetail = listDetail;
	}
	
	
	
}
