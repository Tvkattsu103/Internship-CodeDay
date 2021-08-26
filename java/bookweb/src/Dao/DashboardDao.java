package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.DashboardBean;

public class DashboardDao {
	public static DashboardBean getMonthlyRevenue(int year) {
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		String sql = "Proc_Dashboard_Revenue_By_Year ?";
		DashboardBean ds = new DashboardBean();
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, year);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				ds.setJanuary(rs.getInt("January"));
				ds.setFebruary(rs.getInt("February"));
				ds.setMarch(rs.getInt("March"));
				ds.setApril(rs.getInt("April"));
				ds.setMay(rs.getInt("May"));
				ds.setJune(rs.getInt("June"));
				ds.setJuly(rs.getInt("July"));
				ds.setAugust(rs.getInt("August"));
				ds.setSeptember(rs.getInt("September"));
				ds.setOctober(rs.getInt("October"));
				ds.setNovember(rs.getInt("November"));
				ds.setDecember(rs.getInt("December"));
				ds.setYear(year);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ds;

	}
}
