package com.ssh.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * 视频记录实体类
 * 
 * @author ASUS
 *
 */

@Entity
@Table(name = "course_selection")
public class CourseSelection {
	@Id
	@GeneratedValue(generator = "pkCourseSelection")
	@GenericGenerator(name = "pkCourseSelection", strategy = "native")
	private int cs_id;// 选视频主键
	@Column(name = "c_id")
	private int courseId;// 视频观看时长（记录单位秒，每360秒记录一次）
	@Column(name = "s_id")
	private int studentId;// 观看视频的开始时间
	@Column(name = "cs_begin_time")
	private Timestamp cs_begin_time;
	public int getCs_id() {
		return cs_id;
	}
	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public Timestamp getCs_begin_time() {
		return cs_begin_time;
	}
	public void setCs_begin_time(Timestamp cs_begin_time) {
		this.cs_begin_time = cs_begin_time;
	}
	public CourseSelection(int cs_id, int courseId, int studentId, Timestamp cs_begin_time) {
		super();
		this.cs_id = cs_id;
		this.courseId = courseId;
		this.studentId = studentId;
		this.cs_begin_time = cs_begin_time;
	}
	public CourseSelection() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
