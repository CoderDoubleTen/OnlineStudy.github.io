package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
/**
 * 菜单实体类
 * @author ASUS
 *
 */
@Entity
@Table(name="menu")
public class Menu {
	@Id
	@GeneratedValue(generator="pkMenu")
	@GenericGenerator(name="pkMenu",strategy="native")
	private int m_id;
	
	@Column(name="m_name")
	private String m_name;//菜单名称
	
	@Column(name="m_url")
	private String m_url;//菜单地址
	
	@Column(name="m_auth")
	private int m_auth;//菜单权限
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_url() {
		return m_url;
	}
	public void setM_url(String m_url) {
		this.m_url = m_url;
	}
	public int getM_auth() {
		return m_auth;
	}
	public void setM_auth(int m_auth) {
		this.m_auth = m_auth;
	}
	
	
}
