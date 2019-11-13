package com.ssh.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.ssh.bean.Course;
import com.ssh.bean.CourseSelection;
import com.ssh.bean.Video;
import com.ssh.dao.ifc.ICourseDao;

public class CourseDao extends BaseDao implements ICourseDao{
	@Override
	public Course queryCourseByid(int id) {//鏍规嵁id鏌ヨ璇剧▼
		// TODO Auto-generated method stub
		Course course = new Course();
		course = (Course) getOne(course, id);
		return course;
	}



	@Override
	@SuppressWarnings("unchecked")
	public List<Course> queryAllCourse() {//鏌ヨ鎵�鏈夎绋�
		session=getSession();
		List<Course> courses = session.createCriteria(Course.class).add(Restrictions.eq("courseStatu", 1)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return courses;
	}
	public List<Course> queryAllCourseByAdmi() {//鏌ヨ鎵�鏈夎绋�
		session=getSession();
		@SuppressWarnings("unchecked")
		List<Course> courses = session.createCriteria(Course.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return courses;
	}

	@Override
	public List<Course> queryAllCourse(Course course) {//鏉′欢鏌ヨ
		session=getSession();
		Criteria criteria=session.createCriteria(Course.class)
		 .add(Restrictions.like("courseName","%"+course.getCourseName()+"%"));
		
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
				 @SuppressWarnings("unchecked")
				List<Course> courses=criteria.list();
				 return courses;
	}
	public List<Course> queryAllCourseByStu(Course course) {//鏉′欢鏌ヨ
		session=getSession();
		Criteria criteria=session.createCriteria(Course.class)
				.add(Restrictions.like("courseName","%"+course.getCourseName()+"%"))
				.add(Restrictions.eq("courseStatu", 1));
		
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		@SuppressWarnings("unchecked")
		List<Course> courses=criteria.list();
		return courses;
	}
	@SuppressWarnings("unchecked")
	public List<Video> queryVideoByUid(int uid) {
		session=getSession();
		List<Video> videos = session.createCriteria(Video.class)
				
				.add(Restrictions.eq("uid",uid)).list();
		return videos;
	}
	public Course queryCourseByCid(int cid) {
		Course course = new Course();
		course = (Course) getOne(course, cid);
		return course;
	}
	@SuppressWarnings("unchecked")
	public List<CourseSelection> queryCourseSelectionByCid(int cid) {
		session=getSession();
		List<CourseSelection> courseSelections = session.createCriteria(CourseSelection.class)
				.add(Restrictions.eq("courseId",cid)).list();
		return courseSelections;
	}
	
	
	
	@Override
	public int addCourse(Course course) {
		// TODO Auto-generated method stub
		session=getSession();
		return save(course);
	}

	@Override
	public boolean deleteCourse(Course course) {
		// TODO Auto-generated method stub
		return delete(course);
	}

	@Override
	public boolean updateCourse(Course course) {
		// TODO Auto-generated method stub
		return update(course);
		
	}

	@Override
	public Course queryUserByNameAndPass(Course course) {
		// TODO Auto-generated method stub
		return null;
	}
}
