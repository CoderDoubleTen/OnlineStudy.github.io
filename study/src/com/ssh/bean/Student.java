package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "student")
public class Student {
	@Id
	@GeneratedValue(generator = "pkStudent")
	@GenericGenerator(name = "pkStudent", strategy = "native")
	private int s_id;
	@Column(name = "s_name")
	private String studentName;//学生姓名
	@Column(name = "s_account")
	private String studentAccount;//学生账号
	@Column(name = "s_sex")
	private int studentSex;//学生性别
	@Column(name = "s_tel")
	private String studentTel;//学生电话
	@Column(name = "s_img")
	private String studentImg;//学生电话
	@Column(name = "s_statu")
	private int studentStatu;//学生状态 1可用 2禁用
	@OneToOne(targetEntity = StudentPassword.class, fetch = FetchType.EAGER)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE })
	@JoinColumn(name = "sp_id")
	private StudentPassword studentPassword;
	

	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentAccount() {
		return studentAccount;
	}
	public void setStudentAccount(String studentAccount) {
		this.studentAccount = studentAccount;
	}
	public int getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(int studentSex) {
		this.studentSex = studentSex;
	}
	public String getStudentTel() {
		return studentTel;
	}
	public void setStudentTel(String studentTel) {
		this.studentTel = studentTel;
	}
	
	public String getStudentImg() {
		return studentImg;
	}
	public void setStudentImg(String studentImg) {
		this.studentImg = studentImg;
	}
	public int getStudentStatu() {
		return studentStatu;
	}
	public void setStudentStatu(int studentStatu) {
		this.studentStatu = studentStatu;
	}


	public StudentPassword getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(StudentPassword studentPassword) {
		this.studentPassword = studentPassword;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
