package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.BookBean;

public class BookDao {
	public static ArrayList<BookBean> GetBook(){
		ConnectSql cs = new ConnectSql();
		cs.Connect();
		String sql="SELECT * FROM BOOKS";
		ArrayList<BookBean> ds = new ArrayList<BookBean>();
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				BookBean temp = new BookBean();
				temp.setBookid(rs.getInt("BookID"));
				temp.setName(rs.getString("Name"));
				temp.setAuthor(rs.getString("Author"));
				temp.setPrice(rs.getInt("Price"));
				temp.setQuantity(rs.getInt("Quantity"));
				temp.setDateAdded(rs.getDate("DateAdded"));
				temp.setImage(rs.getString("Image"));
				temp.setDescription(rs.getString("Description"));
				ds.add(temp);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return ds;
	}
	public static ArrayList<BookBean> getSachTheoTen(String ten) {
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		String sql = "SELECT * FROM BOOKS WHERE Name LIKE ?";
		ArrayList<BookBean> ds = new ArrayList<BookBean>();
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			cmd.setString(1, "%" + ten + "%");
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				BookBean temp = new BookBean();
				temp.setBookid(rs.getInt("BookID"));
				temp.setName(rs.getString("Name"));
				temp.setAuthor(rs.getString("Author"));
				temp.setPrice(rs.getInt("Price"));
				temp.setQuantity(rs.getInt("Quantity"));
				temp.setImage(rs.getString("Image"));
				temp.setDescription(rs.getString("Description"));
				ds.add(temp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ds;

	}
	public static BookBean getSachTheoMa(int id) {
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		String sql = "SELECT * FROM BOOKS WHERE Bookid = ?";
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, id);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				BookBean temp = new BookBean();
				temp.setBookid(rs.getInt("BookID"));
				temp.setName(rs.getString("Name"));
				temp.setAuthor(rs.getString("Author"));
				temp.setPrice(rs.getInt("Price"));
				temp.setDateAdded(rs.getDate("DateAdded"));
				temp.setQuantity(rs.getInt("Quantity"));
				temp.setImage(rs.getString("Image"));
				temp.setDescription(rs.getString("Description"));
				return temp;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public static boolean CheckId(int ma) {
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		String sql = "SELECT * FROM BOOKS WHERE BookID=?";
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, ma);
			ResultSet rs = cmd.executeQuery();
			if (rs.next())
				return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}
	public static int Add(int maloai, String tensach, String tacgia, int soluong, int gia, String anh,
			 String mota) {
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		String sql = "INSERT INTO BOOKS (ItemBookID, Name, Author, Quantity, DateAdded , Image, Price, Description) VALUES ( ? , ? , ? , ?, ?, ?, ?, ? )";
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			java.sql.Date orderDate = new java.sql.Date((new java.util.Date()).getTime());
			cmd.setInt(1, maloai);
			cmd.setString(2, tensach);
			cmd.setString(3, tacgia);
			cmd.setInt(4, soluong);
			cmd.setDate(5, orderDate);
			cmd.setString(6, anh);
			cmd.setInt(7, gia);
			cmd.setString(8, mota);
			return cmd.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

	public static int Update(int masach, int maloai, String tensach, String tacgia, int soluong, String anh, int gia,
			 String mota) {
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		String sql = "UPDATE BOOKS SET ItemBookID = ?, Name = ?, Author=?, Quantity=?, DateAdded=?, Price=?, Image = ?, Description=? WHERE BookID = ?";
		if (anh.equals("imagesach/")) {
			sql = "UPDATE BOOKS SET ItemBookID = ?, Name = ?, Author=?, Quantity=?, DateAdded=?, Price=?, Description=? WHERE BookID = ?";
			try {
				PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
				java.sql.Date orderDate = new java.sql.Date((new java.util.Date()).getTime());
				cmd.setInt(1, maloai);
				cmd.setString(2, tensach);
				cmd.setString(3, tacgia);
				cmd.setInt(4, soluong);
				cmd.setDate(5, orderDate);
				cmd.setInt(6, gia);
				cmd.setString(7, mota);
				cmd.setInt(8, masach);
				return cmd.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
				java.sql.Date orderDate = new java.sql.Date((new java.util.Date()).getTime());
				cmd.setInt(1, maloai);
				cmd.setString(2, tensach);
				cmd.setString(3, tacgia);
				cmd.setInt(4, soluong);
				cmd.setDate(5, orderDate);
				cmd.setString(7, anh);
				cmd.setInt(6, gia);
				cmd.setString(8, mota);
				cmd.setInt(9, masach);
				return cmd.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}

	public static int Delete(int masach) {
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		String sql = "DELETE FROM BOOKS WHERE BookID = ?";
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, masach);
			return cmd.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}
}
