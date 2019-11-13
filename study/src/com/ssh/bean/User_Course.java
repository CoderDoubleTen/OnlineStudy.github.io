package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="user_course")
public class User_Course {
	@Id
	@GeneratedValue(generator = "pkUser_Course")
	@GenericGenerator(name = "pkUser_Course", strategy = "native")
  private int id;
	@Column(name = "course_id")
  private int course_id;
	@Column(name = "user_id")
  private int user_id;
  
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getCourse_id() {
	return course_id;
}
public void setCourse_id(int course_id) {
	this.course_id = course_id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public User_Course() {
	super();
	// TODO Auto-generated constructor stub
}
  
}
