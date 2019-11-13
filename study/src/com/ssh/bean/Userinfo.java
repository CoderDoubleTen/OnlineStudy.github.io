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

/**
 * 用户实体类
 * @author ASUS
 *
 */
@Entity
@Table(name="userinfo")
public class Userinfo {
	@Id
	@GeneratedValue(generator="pkUserinfo")
	@GenericGenerator(name="pkUserinfo",strategy="native")
	private int u_id;//用户id
	
	@Column(name="u_account")
	private String userAccount;//用户账号
	
	@Column(name="u_name")
	private String userName;//用户姓名
	
	@Column(name="u_sex")
	private int userSex;//用户性别
	
	@Column(name="u_tel")
	private String userTel;//用户电话
	
	@Column(name="u_introduction")
	private String userIntroduction;//用户介绍
	@Column(name="u_statu")
	private int userStatu;//用户状态（1可用 2禁用）
	@Column(name="u_img")
	private String userImg;//用户头像
	@Column(name="u_level")
	private int userLevel;//0管理员 1普通用户
	@OneToOne(targetEntity=UserPassword.class,fetch=FetchType.EAGER)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE })
	@JoinColumn(name = "up_id")
	private UserPassword userPassword;//外键密码id

	 /*@OneToMany(fetch=FetchType.EAGER)
	   @JoinColumn(name="u_id")
	 private Set<Video> videos;*/

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserSex() {
		return userSex;
	}

	public void setUserSex(int userSex) {
		this.userSex = userSex;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserIntroduction() {
		return userIntroduction;
	}

	public void setUserIntroduction(String userIntroduction) {
		this.userIntroduction = userIntroduction;
	}

	public int getUserStatu() {
		return userStatu;
	}

	public void setUserStatu(int userStatu) {
		this.userStatu = userStatu;
	}

	public String getUserImg() {
		return userImg;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public UserPassword getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(UserPassword userPassword) {
		this.userPassword = userPassword;
	}

	public Userinfo() {
		super();
		// TODO Auto-generated constructor stub
	}

/*	public Set<Video> getVideos() {
		return videos;
	}

	public void setVideos(Set<Video> videos) {
		this.videos = videos;
	}*/
	
	
	
	
}
