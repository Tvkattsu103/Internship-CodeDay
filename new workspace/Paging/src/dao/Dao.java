package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.contextDB;
import entity.Account;

public class Dao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public int getTotalAccount() {
		String query = "select count(*) from Account";
		try {
			conn = new contextDB().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	public List<Account> pagingAccount(int index) {
		List<Account> list = new ArrayList<>();
		String query = "select * from Account\r\n"
				+ "order by uid\r\n"
				+ "offset ? rows fetch next 3 rows only";
		try {
			conn = new contextDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, (index-1)*3);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Account(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getInt(5)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public static void main(String[] args) {
		Dao dao = new Dao();
		List<Account> list = dao.pagingAccount(1);
		for(Account o: list) {
			System.out.println(o);
		}
	}
}
