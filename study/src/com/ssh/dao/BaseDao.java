package com.ssh.dao;


import java.util.List;

import org.hibernate.HibernateException;

import org.hibernate.Query;
import org.hibernate.Session;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BaseDao extends HibernateDaoSupport {

	Session session;

	// 查询方法
	@SuppressWarnings("unchecked")
	public List<Object> select(String sql) {
		Query query = session.createQuery(sql);
		List<Object> obj = query.list();
		return obj;
	}

	@SuppressWarnings("unchecked")
	public List<Object> queryAllUser(String sql) {
		Query query = session.createQuery(sql);
		List<Object> obj = query.list();
		return obj;
	}

	// 插入方法
	public int save(Object obj) {
		int re = 0;
		session = getSession();
		try {
			re = (Integer) session.save(obj);
		} catch (HibernateException e) {
			System.out.println("出错:" + e.getLocalizedMessage());
			session.getTransaction().rollback();
		}
		return re;

	}

	// 修改方法
	public boolean update(Object obj) {
		// 如果session不是打开的状态，就手动打开session
		if (!session.isOpen()) {
			session = getSession();
		}
		boolean re = true;
		// 定义一个用于返回的变量
		try {
			session.saveOrUpdate(obj);
		} catch (HibernateException e) {
			System.out.println("出错:" + e.getLocalizedMessage());
			re = false;
			session.getTransaction().rollback();
		}
		return re;
	}

	public Object getOne(Object obj, int id) {
		session = getSession();
		Object o = session.get(obj.getClass(), id);
		return o;
	}

	public boolean delete(Object obj) {

		session = getSession();

		boolean re = true;
		try {

			session.delete(obj);

		} catch (HibernateException e) {
			System.out.println("出错:" + e.getLocalizedMessage());
			re = false;
			session.getTransaction().rollback();
		}

		return re;
	}

}
