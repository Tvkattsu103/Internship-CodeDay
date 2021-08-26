package test;

import dao.studentDao;
import entity.students;

public class test {
	public static void main(String[] args) {
		studentDao dao = new studentDao();
		students s = dao.getStudentById("1");
		System.out.println(s);
	}
}
