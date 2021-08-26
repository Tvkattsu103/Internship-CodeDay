package com.ajax.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ajax.context.contextDB;
import com.ajax.entity.Phim;

import entity.Product;

public class DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public int getTotalPhim() {
		String query = "select count(*) from Phim";
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
	
	public List<Phim> pagingPhim(int index) {
		List<Phim> list = new ArrayList<>();
		String query = "select * from Phim\r\n"
				+ "order by id\r\n"
				+ "offset ? rows fetch next 6 rows only";
		try {
			conn = new contextDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, index);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Phim(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6)));
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;

	}
	
//	public static List<Phim> getProductByCategoryID(String cid) {
//		List<Phim> list = new ArrayList<>();
//		String query = "select * from product \n" + "where cateID = ?";
//		try {
//			conn = new contextDB().getConnection();
//			ps = conn.prepareStatement(query);
//			ps.setString(1, cid);
//			rs = ps.executeQuery();
//			while (rs.next()) {
//				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
//						rs.getString(6)));
//			}
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//
//		return list;
//
//	}
	
	public static void main(String[] args) {
		DAO dao = new DAO();
		List<Phim> list = dao.pagingPhim(2);
		for(Phim o: list) {
			System.out.println(o);
		}
	}
}
