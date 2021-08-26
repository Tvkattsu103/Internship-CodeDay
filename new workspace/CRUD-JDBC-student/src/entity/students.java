package entity;

import java.sql.Date;

public class students {
    private int studentId;
    private String hoten;
    private String diachi;
    private Date ngaysinh;
    public students() {
        super();
        // TODO Auto-generated constructor stub
    }
    public students(int studentId, String hoten, String diachi, Date ngaysinh) {
        super();
        this.studentId = studentId;
        this.hoten = hoten;
        this.diachi = diachi;
        this.ngaysinh = ngaysinh;
    }
    public int getStudentId() {
        return studentId;
    }
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
    public String getHoten() {
        return hoten;
    }
    public void setHoten(String hoten) {
        this.hoten = hoten;
    }
    public String getDiachi() {
        return diachi;
    }
    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }
    public Date getNgaysinh() {
        return ngaysinh;
    }
    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }
    @Override
    public String toString() {
        return "students [studentId=" + studentId + ", hoten=" + hoten + ", diachi=" + diachi + ", ngaysinh=" + ngaysinh
                + "]";
    }
    
    
}
