package com.ssh.service;

import java.util.List;

import com.ssh.bean.CourseSelection;
import com.ssh.dao.ifc.ICourseSelectionDao;
import com.ssh.service.ifc.ICourseSelectionService;

public class CourseSelectionService implements ICourseSelectionService {
	private ICourseSelectionDao courseSelectionDao;
	public List<CourseSelection> queryCourseAndStudent(){
		return  courseSelectionDao.queryCourseAndStudent();
	}
	public List<CourseSelection> queryCourseSelectionByCid(int cid){
		return  courseSelectionDao.queryCourseSelectionByCid(cid);
	}

	public List<CourseSelection> queryCourseSelectionByCidSiD(int cid,int sid){
		return courseSelectionDao.queryCourseSelectionByCidSiD(cid, sid);
	}
	
	public int addCourseSelection(CourseSelection courseSelection) {
		return courseSelectionDao.addCourseSelection(courseSelection);
	}
	
	public List<CourseSelection> queryCourseSelectionBySid(int sid){
		return  courseSelectionDao.queryCourseSelectionBySid(sid);
	}
	
	public List<CourseSelection> querySuggestCourseSelection(){
		return courseSelectionDao.querySuggestCourseSelection();
	}
	public List<CourseSelection> queryHotCourseSelection(){
		return courseSelectionDao.queryHotCourseSelection();
	}
	
	public ICourseSelectionDao getCourseSelectionDao() {
		return courseSelectionDao;
	}

	public void setCourseSelectionDao(ICourseSelectionDao courseSelectionDao) {
		this.courseSelectionDao = courseSelectionDao;
	}

	

}
