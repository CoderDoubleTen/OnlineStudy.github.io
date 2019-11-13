package com.ssh.service;

import java.util.List;

import com.ssh.bean.Course;
import com.ssh.bean.CourseSelection;
import com.ssh.bean.Video;
import com.ssh.dao.ifc.ICourseDao;
import com.ssh.service.ifc.ICourseService;

public class CourseService implements ICourseService{
	private ICourseDao courseDao;
	public Course queryCourseByid(int id) {
		return courseDao.queryCourseByid(id);
		
	}
	public List<Course> queryAllCourseByAdmi(){
		return courseDao.queryAllCourseByAdmi();
	}
	public List<Course> queryAllCourse(){
		return courseDao.queryAllCourse();
		
	}
	public List<Course> queryAllCourseByStu(Course course){
		return courseDao.queryAllCourseByStu(course);
	}
	public List<Course> queryAllCourse(Course course){
		return courseDao.queryAllCourse(course);
		
	}

	public int addCourse(Course course) {
		return courseDao.addCourse(course);
		
	}

	public boolean deleteCourse(Course course)  {
		return courseDao.deleteCourse(course);
	}

	public boolean updateCourse(Course course) {
		return courseDao.updateCourse(course);
		
	}

	public Course queryUserByNameAndPass(Course course) {
		return course;
		
	}

	public ICourseDao getCourseDao() {
		return courseDao;
	}

	public void setCourseDao(ICourseDao courseDao) {
		this.courseDao = courseDao;
	}
	public List<Video> queryVideoByUid(int uid){
		return courseDao.queryVideoByUid(uid);
	}
	public Course queryCourseByCid(int cid) {
		return courseDao.queryCourseByCid(cid);
	}
	public List<CourseSelection> queryCourseSelectionByCid(int cid){
		return courseDao.queryCourseSelectionByCid(cid);
	}
	
}
