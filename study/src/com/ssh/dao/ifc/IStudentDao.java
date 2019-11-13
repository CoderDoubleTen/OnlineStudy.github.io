package com.ssh.dao.ifc;

import java.util.List;
import com.ssh.bean.Student;
import com.ssh.bean.StudentPassword;

public interface IStudentDao {
	public List<Student> queryStudentAtLogin(Student student);// 学生登录方法;

	public List<Student> queryAllStudent();// 查询学生

	public int insert(Student student); // 添加学生
	public List<Student> queryStudent(Student student);
	public void updateStudent(Student student);// 修改

	public Student queryStudentById(int id);// id查询

	public StudentPassword queryPassById(int id);// 密码
	public void updateStudentPass(StudentPassword studentPassword);

}
