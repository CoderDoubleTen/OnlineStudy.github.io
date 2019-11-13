package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


/**
 * 学生密码实体类
 * @author ASUS
 *
 */
@Entity
@Table(name="students_password")
public class StudentPassword {
	@Id
	@GeneratedValue(generator="pkStudentPassword")
	@GenericGenerator(name="pkStudentPassword",strategy="native")
	private int sp_id;
	@Column(name="sp_password")
	private String password;//学生密码
	
	

	public int getSp_id() {
		return sp_id;
	}
	public void setSp_id(int sp_id) {
		this.sp_id = sp_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public StudentPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
