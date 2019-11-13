package com.ssh.service;

import java.util.List;

import com.ssh.bean.CourseSelection;
import com.ssh.bean.UserPassword;
import com.ssh.bean.Userinfo;
import com.ssh.dao.ifc.IUserinfoDao;
import com.ssh.service.ifc.IUserinfoService;

public class UserinfoService implements IUserinfoService{
	private IUserinfoDao userinfoDao;

	public List<Userinfo> queryUserAtLogin(Userinfo userinfo) {//瀛︾敓鐧诲綍鏂规硶
			return userinfoDao.queryUserAtLogin(userinfo);
		
	}
	public List<Userinfo> queryAllUserinfo(){//鏌ヨ鎵�鏈夋暀甯�;
		return userinfoDao.queryAllUserinfo();
	}
	
	public List<Userinfo> queryTeacher(Userinfo userinfo){
		return userinfoDao.queryTeacher(userinfo);
	}
	
	public Userinfo queryUserinfoById(int id) {
		return userinfoDao.queryUserinfoById(id);
	}
	public UserPassword queryPassById(int id) {
		return userinfoDao.queryPassById(id);
	}
	public boolean updateUserinfo(Userinfo userinfo) {
		return userinfoDao.updateUserinfo(userinfo);
		
	}
	
	public int addUserinfo(Userinfo userinfo) {
		return userinfoDao.addUserinfo(userinfo);
	}

	public IUserinfoDao getUserinfoDao() {
		return userinfoDao;
	}

	public void setUserinfoDao(IUserinfoDao userinfoDao) {
		this.userinfoDao = userinfoDao;
	}
	public List<CourseSelection> queryCourseDistinctCid(){
		return userinfoDao.queryCourseDistinctCid();
	}
	public List<CourseSelection> queryStudentNum(int id){
		return userinfoDao.queryStudentNum(id);
	}

	
}
