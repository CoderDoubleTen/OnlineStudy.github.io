package com.ssh.bean;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
/**
 * 评论实体类
 * @author ASUS
 *
 */
@Entity
@Table(name="comment")
public class Comment {
	@Id
	@GeneratedValue(generator="pkcomment")
	@GenericGenerator(name="pkcomment",strategy="native")
	private int comment_id;
	
	@Column(name="comment_index")
	private int comment_index;//评论序号
	
	@Column(name="comment_title")
	private String comment_title;//评论标题
	
	@Column(name="comment_content")
	private String comment_content;//评论内容
	
	@Column(name="comment_time")
	private String comment_time;//评论发布时间
	
	@Column(name="comment_can_show")
	private int comment_can_show;//是否显示该评论
	
	 @ManyToOne  //代表是一对多关联
	 @JoinColumn(name="s_id")  //关联的字段是groupid
	private Student student;
	
	@ManyToOne  //代表是一对多关联 
	@JoinColumn(name = "u_id")
	private Userinfo userinfo;
	
	@ManyToOne  //代表是一对多关联
	@JoinColumn(name = "v_id")
	private Video video;
	
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getComment_index() {
		return comment_index;
	}
	public void setComment_index(int comment_index) {
		this.comment_index = comment_index;
	}
	public String getComment_title() {
		return comment_title;
	}
	public void setComment_title(String comment_title) {
		this.comment_title = comment_title;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	

	
	public String getComment_time() {
		return comment_time;
	}
	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
	public int getComment_can_show() {
		return comment_can_show;
	}
	public void setComment_can_show(int comment_can_show) {
		this.comment_can_show = comment_can_show;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Userinfo getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}

	
}
