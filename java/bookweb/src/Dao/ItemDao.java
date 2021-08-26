package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.BookBean;
import Bean.ItemBean;

public class ItemDao {
	public static ArrayList<ItemBean> getItemBook() {
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		ArrayList<ItemBean> dsloai = new ArrayList<ItemBean>();
		String sql = "SELECT * FROM ITEMBOOK";
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				ItemBean tam = new ItemBean();
				int maloai = rs.getInt("ItemBookID");
				String tenloai = rs.getString("Name");
				tam.setIteambookid(maloai);
				tam.setName(tenloai);
				dsloai.add(tam);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dsloai;
	}
	public static ArrayList<BookBean> getArrayItemBook(int id) {
		ArrayList<BookBean> arr = new ArrayList<BookBean>();
		ConnectSql cn = new ConnectSql();
		cn.Connect();
		String sql="SELECT * FROM BOOKS WHERE ItemBookID = ?";
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, id);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				BookBean temp = new BookBean();
				temp.setBookid(rs.getInt("BookID"));
				temp.setName(rs.getString("Name"));
				temp.setAuthor(rs.getString("Author"));
				temp.setQuantity(rs.getInt("Quantity"));
				temp.setImage(rs.getString("Image"));
				temp.setPrice(rs.getInt("Price"));
				temp.setItembookid(id);
				arr.add(temp);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return arr;
	}
}
