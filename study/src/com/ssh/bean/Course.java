package com.ssh.bean;


import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
/**
 * 课程实体类
 * @author ASUS
 *
 */
@Entity
@Table(name="course")
public class Course {
	@Id
	@GeneratedValue(generator="pkCourse")
	@GenericGenerator(name="pkCourse",strategy="native")
	private int c_id;//课程id
	
	@Column(name="c_name")
	private String courseName;//课程名称
	
	@Column(name="c_introduction")
	private String courseIntroduction;//课程介绍
	
	@Column(name="c_img")
	private String courseImg;//课程图片
	
	@Column(name="c_level")
	private int courseLevel;//课程级别  1基础课程 2高级课程
	@Column(name="c_statu")
	private int courseStatu;//课程状态  0禁用  1可用
	 /*@OneToMany(fetch=FetchType.EAGER)
	   @JoinColumn(name="c_id")
	 private Set<Video> videos;*/
	
	public int getC_id() {
		return c_id;
	}


	public void setC_id(int c_id) {
		this.c_id = c_id;
	}


	public String getCourseName() {
		return courseName;
	}


	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}


	public String getCourseIntroduction() {
		return courseIntroduction;
	}


	public void setCourseIntroduction(String courseIntroduction) {
		this.courseIntroduction = courseIntroduction;
	}


	public String getCourseImg() {
		return courseImg;
	}


	public void setCourseImg(String courseImg) {
		this.courseImg = courseImg;
	}


	public int getCourseLevel() {
		return courseLevel;
	}


	public int getCourseStatu() {
		return courseStatu;
	}


	public void setCourseStatu(int courseStatu) {
		this.courseStatu = courseStatu;
	}


	public void setCourseLevel(int courseLevel) {
		this.courseLevel = courseLevel;
	}




	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

/*
	public Set<Video> getVideos() {
		return videos;
	}


	public void setVideos(Set<Video> videos) {
		this.videos = videos;
	}*/
	
	
	
	
}
