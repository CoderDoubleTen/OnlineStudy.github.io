package com.ssh.service;

import java.util.List;

import com.ssh.bean.Student;
import com.ssh.bean.StudentPassword;
import com.ssh.dao.ifc.IStudentDao;
import com.ssh.service.ifc.IStudentService;

public class StudentService implements IStudentService {
	private IStudentDao studentDao;

	public List<Student> queryStudentAtLogin(Student student) {
		return studentDao.queryStudentAtLogin(student);
	}

	@Override
	public List<Student> queryAllStudent() {
		return studentDao.queryAllStudent();
	}

	public List<Student> queryStudent(Student student){
		return studentDao.queryStudent(student);
	}
	
	@Override
	public int insert(Student student) {
		return studentDao.insert(student);
	}

	@Override
	public void update(Student student) {
		studentDao.updateStudent(student);

	}

	@Override
	public Student queryStudentById(int id) {

		return studentDao.queryStudentById(id);
	}
	public StudentPassword queryPassById(int id) {//修改密码
		
		return studentDao.queryPassById(id);
	}

	public IStudentDao getStudentDao() {
		return studentDao;
	}

	public void setStudentDao(IStudentDao studentDao) {
		this.studentDao = studentDao;
	}

}
