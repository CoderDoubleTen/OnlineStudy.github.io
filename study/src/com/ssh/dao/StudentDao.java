package com.ssh.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.ssh.bean.Student;
import com.ssh.bean.StudentPassword;
import com.ssh.bean.Userinfo;
import com.ssh.dao.ifc.IStudentDao;

public class StudentDao extends BaseDao implements IStudentDao {
	public List<Student> queryStudentAtLogin(Student student) {// 学生登录方法
		session = getSession();
		@SuppressWarnings("unchecked")
		List<Student> students = session.createCriteria(Student.class)
				.add(Restrictions.eq("studentAccount", student.getStudentAccount()))
				.createCriteria("studentPassword", "sp")
				.add(Restrictions.eq("sp.password", student.getStudentPassword().getPassword())).list();
		return students;

	}

	// 查询学生
	@SuppressWarnings("unchecked")
	public List<Student> queryAllStudent() {
		session = getSession();
		List<Student> students = session.createCriteria(Student.class).list();
		return students;
	}

	// 添加学生
	public int insert(Student student) {
		int id = save(student);
		return id;
	}

	// 修改学生信息
	public void updateStudent(Student student) {
		// session=getSession();
		update(student);

	}
	public List<Student> queryStudent(Student student) {
		session=getSession();
		Criteria criteria=session.createCriteria(Student.class)
				 .add(Restrictions.like("studentName","%"+student.getStudentName()+"%"))
				.add(Restrictions.eq("studentStatu", 1));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
				 @SuppressWarnings("unchecked")
				List<Student> students=criteria.list();
				 return students;
	}
	

	// id查询
	public Student queryStudentById(int id) {
		Student student = new Student();
		student = (Student) getOne(student, id);
		return student;
	}
	public StudentPassword queryPassById(int id) {//修改密码
		StudentPassword studentPass=new StudentPassword();
		studentPass = (StudentPassword) getOne(studentPass, id);
		return studentPass;
	}
	//修改密码
	public void updateStudentPass(StudentPassword studentPassword) {
		// session=getSession();
		update(studentPassword);

	}

}
