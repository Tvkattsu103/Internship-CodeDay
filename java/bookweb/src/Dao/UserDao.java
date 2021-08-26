package Dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.User;

import Bean.InvoiceBean;
import Bean.UserBean;


public class UserDao {
	public static String md5(String str){
		String result = "";
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(str.getBytes());
			BigInteger bigInteger = new BigInteger(1,digest.digest());
			result = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static boolean IsExist(String userN, String email) {
		String sql = "SELECT * FROM USERS WHERE UserName= ? OR Email= ?";
		try {
			ConnectSql con = new ConnectSql();
			con.Connect();
			PreparedStatement cmd = con.cn.prepareStatement(sql);
			cmd.setString(1, userN);
			cmd.setString(2, email);
			ResultSet rs = cmd.executeQuery();
			if(rs.next())
				return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static boolean CheckPass(String pass) {
		String sql = "SELECT * FROM USERS WHERE Password = ?";
		try {
			ConnectSql con = new ConnectSql();
			con.Connect();
			PreparedStatement cmd = con.cn.prepareStatement(sql);
			cmd.setString(1, pass);
			ResultSet rs = cmd.executeQuery();
			if(rs.next())
				return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static void InsertUser(String ht, String dc, String sdt, String email, String un, String pass) {
		String sql="INSERT INTO USERS(Name, Address, Phone, Email, UserName, Password, Role) VALUES(?,?,?,?,?,?,?)";
		try {
			ConnectSql con = new ConnectSql();
			con.Connect();
			PreparedStatement cmd = con.cn.prepareStatement(sql);
			cmd.setString(1, ht);
			cmd.setString(2, dc);
			cmd.setString(3, sdt);
			cmd.setString(4, email);
			cmd.setString(5, un);
			cmd.setString(6, pass);
			cmd.setBoolean(7, false);
			cmd.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static void ChangePass(String pass, int userid) {
		String sql="UPDATE USERS SET Password=? WHERE UserID = ?";
		try {
			ConnectSql con = new ConnectSql();
			con.Connect();
			PreparedStatement cmd = con.cn.prepareStatement(sql);
			cmd.setString(1, pass);
			cmd.setInt(2, userid);
			cmd.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static ArrayList<UserBean> GetAllUser() {
		ArrayList<UserBean> allUser= new ArrayList<UserBean>();
		String sql="Proc_GetAllUser";
		ConnectSql con = new ConnectSql();
		con.Connect();
		try {
			PreparedStatement cmd= ConnectSql.cn.prepareStatement(sql);
			ResultSet rs= cmd.executeQuery();
			while (rs.next())
			{
				UserBean temp = new UserBean();
				String name = rs.getString("Name");
				temp.setName(name);
				allUser.add(temp);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return allUser;
	}
	
	public static UserBean GetUserByID(int userid) {
		
		String sql="SELECT * FROM USERS WHERE UserID = ?";
		try {
			ConnectSql con = new ConnectSql();
			con.Connect();
			PreparedStatement cmd = con.cn.prepareStatement(sql);
			cmd.setInt(1, userid);
			ResultSet rs = cmd.executeQuery();
			while(rs.next())
				{
				UserBean temp = new UserBean();
				temp.setName(rs.getString("Name"));
				temp.setAddress(rs.getString("Address"));
				temp.setEmail(rs.getString("Email"));
				temp.setPhone(rs.getString("Phone"));
				return temp;
				}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
