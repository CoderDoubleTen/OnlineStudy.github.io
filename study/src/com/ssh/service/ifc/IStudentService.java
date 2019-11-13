package com.ssh.service.ifc;

import java.util.List;

import com.ssh.bean.Student;
import com.ssh.bean.StudentPassword;

public interface IStudentService {
	public List<Student> queryStudentAtLogin(Student student);// 登录

	public List<Student> queryAllStudent();// 查询

	public int insert(Student student);// 插入
	public List<Student> queryStudent(Student student);

	public void update(Student student);// 更新

	public Student queryStudentById(int id);// 根据id查询

	public StudentPassword queryPassById(int id);// 修改密码
}
