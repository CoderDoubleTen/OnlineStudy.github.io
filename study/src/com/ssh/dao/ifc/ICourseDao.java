package com.ssh.dao.ifc;

import java.util.List;



import com.ssh.bean.Course;
import com.ssh.bean.CourseSelection;
import com.ssh.bean.Video;


public interface ICourseDao {
	public Course queryCourseByid(int id);

	public List<Course> queryAllCourse();
	public List<Course> queryAllCourseByStu(Course course);
	public List<Course> queryAllCourse(Course course);

	public List<Course> queryAllCourseByAdmi();
	public int addCourse(Course course);

	public boolean deleteCourse(Course course);

	public boolean updateCourse(Course course);

	public Course queryUserByNameAndPass(Course course);
	public List<Video> queryVideoByUid(int uid);
	public Course queryCourseByCid(int cid);
	public List<CourseSelection> queryCourseSelectionByCid(int cid);
}
