package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import entity.Account;

public class AccountDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs =null;
	
	public List<Account> getListAccount() {
		try {
			String query = "select * from login";
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			List<Account> list = new ArrayList<>();
			while(rs.next()) {
				Account a = new Account(rs.getString(1), rs.getString(2));
				list.add(a);
			}
			for (Account a : list) {
				System.out.println("name: "+a.getUsername()+" pass: "+a.getPassword());
			}
			
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
 	
}
