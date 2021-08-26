package Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.DetailBean;
import Bean.InvoiceBean;

public class InvoiceDao {
	public static ArrayList<DetailBean> getDetail(int userid, int invoiceid){
		ArrayList<DetailBean> ListDetail = new ArrayList<DetailBean>();
		String sql = "DS_ChiTietHD ?,?";
		ConnectSql cn = new ConnectSql();
		cn.Connect();
		try {
			PreparedStatement cmd=ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, userid);
			cmd.setInt(2, invoiceid);
			ResultSet rs = cmd.executeQuery();
			while (rs.next())
			{
				DetailBean temp = new DetailBean();
				int detailid = rs.getInt("Detailid");
				int bookid = rs.getInt("BookID");
				int quantity = rs.getInt("Quantity");
				String image =rs.getString("Image");
				String name =rs.getString("Name");
				temp.setImage(image);
				temp.setDetailid(detailid);
				temp.setInvoiceid(invoiceid);
				temp.setBookid(bookid);
				temp.setQuantity(quantity);
				temp.setName(name);
				ListDetail.add(temp);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ListDetail;
	}
	public static ArrayList<InvoiceBean> getHoaDon(int userid)
	{
		ArrayList<InvoiceBean> dsHoadon= new ArrayList<InvoiceBean>();
		String sql= "DS_GetHD ?";
		ConnectSql cn = new ConnectSql();
		cn.Connect();
		try {
			PreparedStatement cmd= ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, userid);
			ResultSet rs= cmd.executeQuery();
			while (rs.next())
			{
				InvoiceBean temp = new InvoiceBean();
				int invoiceid=rs.getInt("Invoiceid");
				Date orderDate = rs.getDate("OrderDate");
				temp.setInvoiceid(invoiceid);
				temp.setUserid(userid);
				temp.setOrderDate(orderDate);
				temp.setBought(rs.getBoolean("Bought"));
				temp.setListDetail(InvoiceDao.getDetail(userid, invoiceid));
				dsHoadon.add(temp);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dsHoadon;
	}
	public static ArrayList<DetailBean> getDetailByID(int userid){
		ArrayList<DetailBean> ListDetail = new ArrayList<DetailBean>();
		String sql = "SELECT * FROM View_Detail_ByID WHERE UserID = ?";
		ConnectSql cn = new ConnectSql();
		cn.Connect();
		try {
			PreparedStatement cmd=ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, userid);
			ResultSet rs = cmd.executeQuery();
			while (rs.next())
			{
				DetailBean temp = new DetailBean();
				temp.setDetailid(rs.getInt("DetailID"));
				temp.setInvoiceid(rs.getInt("InvoiceID"));
				temp.setName(rs.getString("Name"));
				temp.setImage(rs.getString("Image"));
				temp.setPrice(rs.getInt("Price"));
				temp.setQuantity(rs.getInt("Quantity"));
				ListDetail.add(temp);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ListDetail;
	}
	public static ArrayList<InvoiceBean> getHoaDonChuaMua()
	{
		ArrayList<InvoiceBean> dsHoadon= new ArrayList<InvoiceBean>();
		String sql= "Proc_Cart ?";
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		try {
			PreparedStatement cmd= ConnectSql.cn.prepareStatement(sql);
			cmd.setBoolean(1, false);
			ResultSet rs= cmd.executeQuery();
			while (rs.next())
			{
				InvoiceBean temp = new InvoiceBean();
				int invoiceid=rs.getInt("Invoiceid");
				Date orderDate = rs.getDate("OrderDate");
				int userid = rs.getInt("UserID");
				temp.setInvoiceid(invoiceid);
				temp.setUserid(userid);
				temp.setOrderDate(orderDate);
				temp.setBought(rs.getBoolean("Bought"));
				temp.setListDetail(InvoiceDao.getDetail(userid, invoiceid));
				dsHoadon.add(temp);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dsHoadon;
	}
	public static ArrayList<InvoiceBean> getTatCaHoaDon ()
	{
		ArrayList<InvoiceBean> dsHoadon= new ArrayList<InvoiceBean>();
		String sql= "Proc_AllHD";
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		try {
			PreparedStatement cmd= ConnectSql.cn.prepareStatement(sql);
			ResultSet rs= cmd.executeQuery();
			while (rs.next())
			{
				InvoiceBean temp = new InvoiceBean();
				int userid = rs.getInt("UserID");
				int invoiceid = rs.getInt("InvoiceID");
				Date orderDate = rs.getDate("OrderDate");
				String name = rs.getString("Name");
				temp.setName(name);
				temp.setInvoiceid(invoiceid);
				temp.setUserid(userid);
				temp.setOrderDate(orderDate);
				temp.setBought(rs.getBoolean("Bought"));
				temp.setListDetail(InvoiceDao.getDetail(userid, invoiceid));
				dsHoadon.add(temp);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dsHoadon;
	}
	public static ArrayList<InvoiceBean> getInvoice(){
		ArrayList<InvoiceBean> ListDetail = new ArrayList<InvoiceBean>();
		String sql = "SELECT * FROM View_Invoice";
		ConnectSql cn = new ConnectSql();
		cn.Connect();
		try {
			PreparedStatement cmd=ConnectSql.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next())
			{
				InvoiceBean temp = new InvoiceBean();
				temp.setInvoiceid(rs.getInt("InvoiceID"));
				temp.setBought(rs.getBoolean("Bought"));
				temp.setName(rs.getString("Name"));
				temp.setOrderDate(rs.getDate("OrderDate"));
				ListDetail.add(temp);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ListDetail;
	}
	public static ArrayList<DetailBean> getDetail(){
		ArrayList<DetailBean> ListDetail = new ArrayList<DetailBean>();
		String sql = "SELECT * FROM View_Detail";
		ConnectSql cn = new ConnectSql();
		cn.Connect();
		try {
			PreparedStatement cmd=ConnectSql.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next())
			{
				DetailBean temp = new DetailBean();
				temp.setDetailid(rs.getInt("DetailID"));
				temp.setInvoiceid(rs.getInt("InvoiceID"));
				temp.setName(rs.getString("Name"));
				temp.setImage(rs.getString("Image"));
				temp.setPrice(rs.getInt("Price"));
				temp.setQuantity(rs.getInt("Quantity"));
				ListDetail.add(temp);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ListDetail;
	}
}
