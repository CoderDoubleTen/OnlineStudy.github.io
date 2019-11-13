package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * 用户密码实体类
 * @author ASUS
 *
 */
@Entity
@Table(name="users_password")
public class UserPassword {
	@Id
	@GeneratedValue(generator="pkUserPassword")
	@GenericGenerator(name="pkUserPassword",strategy="native")
	private int up_id;
	
	@Column(name="up_password")
	private String password;

	
	
	public int getUp_id() {
		return up_id;
	}
	public void setUp_id(int up_id) {
		this.up_id = up_id;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public UserPassword() {
		super();
		// TODO Auto-generated constructor stub
	}



	
	
}
