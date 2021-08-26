package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBcontext;
import entity.students;

public class studentDao {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null; 
    public static List<students> getAllStudents(){
        List<students> list = new ArrayList<>();
            String query = "select * from students";
            try {
                conn = new DBcontext().getConnection();
                ps =  conn.prepareStatement(query);
                rs = ps.executeQuery();
                while(rs.next()) {
                    list.add(new students(rs.getInt(1),
                                        rs.getString(2),
                                        rs.getString(3),
                                        rs.getDate(4)));
                }
            } catch (Exception e) {

            }
            return list;
    }
    public void deleteStudent(String id)
    {
    	String query = "delete from students where Id = ?";
    	try {
    		 conn = new DBcontext().getConnection();
             ps =  conn.prepareStatement(query);
             ps.setString(1, id);
             ps.executeUpdate();
    	} catch (Exception e) {
			// TODO: handle exception
		}
    }
    public void insertStudent(String hoten, String diachi, String ngaysinh)
    {
    	String query = "insert into students values(?,?,?)";
    	try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, hoten);
			ps.setString(2, diachi);
			ps.setString(3, ngaysinh);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
    }
    public students getStudentById(String id) {
    	String query = "select * from students where Id = ?";
    	try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new students(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
    	return null;
    }
    public void updateStudent(String id, String hoten, String diachi, String ngaysinh)
    {
    	String query = "update students set hoten = ?, diachi = ?, ngaysinh = ? where Id = ?";
    	try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, hoten);
			ps.setString(2, diachi);
			ps.setString(3, ngaysinh);
			ps.setString(4, id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
    }
}

