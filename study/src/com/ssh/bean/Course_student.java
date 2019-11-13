package com.ssh.bean;


public class Course_student {
	private int id;
	private String courseName;
	private int studentNum;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(int studentNum) {
		this.studentNum = studentNum;
	}

	public Course_student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Course_student(int id, String courseName, int studentNum) {
		super();
		this.id = id;
		this.courseName = courseName;
		this.studentNum = studentNum;
	}

}
