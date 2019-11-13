package com.ssh.bean;


public class Video_student {
	private int id;
	private String videoName;
	private int studentNum;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public int getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(int studentNum) {
		this.studentNum = studentNum;
	}

	public Video_student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Video_student(int id, String videoName, int studentNum) {
		super();
		this.id = id;
		this.videoName = videoName;
		this.studentNum = studentNum;
	}

}
