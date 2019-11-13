package com.ssh.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.ssh.bean.CourseSelection;
import com.ssh.bean.Student;
import com.ssh.bean.StudentPassword;
import com.ssh.bean.UserPassword;
import com.ssh.bean.Userinfo;
import com.ssh.dao.ifc.IUserinfoDao;

public class UserinfoDao extends BaseDao implements IUserinfoDao{
	public List<Userinfo> queryUserAtLogin(Userinfo userinfo) {//鏁欏笀鐧诲綍鏂规硶
		session=getSession();
		@SuppressWarnings("unchecked")
		List<Userinfo> userinfos = session.createCriteria(Userinfo.class).add(Restrictions.eq("userAccount",userinfo.getUserAccount()))
		.add(Restrictions.eq("userLevel", userinfo.getUserLevel()))
				.createCriteria("userPassword", "up").add(Restrictions.eq("up.password",userinfo.getUserPassword().getPassword()))
				.list();
			return userinfos;
		
	}
	public List<Userinfo> queryAllUserinfo() {//鏌ヨ鎵�鏈夋暀甯�
		session=getSession();
		@SuppressWarnings("unchecked")
		List<Userinfo> userinfo =session.createCriteria(Userinfo.class).add(Restrictions.eq("userLevel",1)).list();
		return userinfo;
	}
	
	
	
	public List<Userinfo> queryTeacher(Userinfo userinfo) {
		session=getSession();
		Criteria criteria=session.createCriteria(Userinfo.class)
				 .add(Restrictions.like("userName","%"+userinfo.getUserName()+"%"))
				.add(Restrictions.eq("userLevel", 1));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
				 @SuppressWarnings("unchecked")
				List<Userinfo> userinfos=criteria.list();
				 return userinfos;
	}
	
	public Userinfo queryUserinfoById(int id) {
		Userinfo userinfo = new Userinfo();
		userinfo = (Userinfo) getOne(userinfo, id);
		return userinfo;
	}	
	public boolean updateUserinfo(Userinfo userinfo) {
		
		return update(userinfo);
	}
	
	public UserPassword queryPassById(int id) {//修改密码
		UserPassword userPassword=new UserPassword();
		userPassword = (UserPassword) getOne(userPassword, id);
		return userPassword;
	}
	
	public int addUserinfo(Userinfo userinfo) {
		session=getSession();
		int id=save(userinfo);
		return id;

	}
	public List<CourseSelection> queryCourseDistinctCid() {
		session=getSession();
		Query query = session.createSQLQuery("select * from course_selection group by c_id").addEntity(CourseSelection.class);
		@SuppressWarnings("unchecked")
		List<CourseSelection> courseSelections =query.list();
		return courseSelections;
	}
	@SuppressWarnings("unchecked")
	public List<CourseSelection> queryStudentNum(int id) {
		session=getSession();
		List<CourseSelection> courseSelections =session.createCriteria(CourseSelection.class).add(Restrictions.eq("courseId",id)).list();
		return courseSelections;
	}

}
