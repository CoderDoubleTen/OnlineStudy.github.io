package com.ssh.service.ifc;

import java.util.List;

import com.ssh.bean.CourseSelection;
import com.ssh.bean.UserPassword;
import com.ssh.bean.Userinfo;

public interface IUserinfoService {
	public List<Userinfo> queryUserAtLogin(Userinfo userinfo);//瀛︾敓鐧诲綍鏂规硶
	public List<Userinfo> queryAllUserinfo();//鏌ヨ鎵�鏈夋暀甯�;	
	public List<Userinfo> queryTeacher(Userinfo userinfo);	
	public Userinfo queryUserinfoById(int id);
	public boolean updateUserinfo(Userinfo userinfo);	
	public int addUserinfo(Userinfo userinfo);
	public List<CourseSelection> queryCourseDistinctCid();
	public UserPassword queryPassById(int id) ;
	public List<CourseSelection> queryStudentNum(int id);
}
