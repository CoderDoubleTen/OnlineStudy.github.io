package com.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.ssh.bean.CourseSelection;
import com.ssh.bean.VideoSelection;
import com.ssh.dao.ifc.ICourseSelectionDao;

public class CourseSelectionDao extends BaseDao implements ICourseSelectionDao {
	public List<CourseSelection> queryCourseAndStudent() {//查看全部课程和学生的信息
		session=getSession();
		@SuppressWarnings("unchecked")
		List<CourseSelection> courseSelections = session.createCriteria(CourseSelection.class).list();
		return courseSelections;
	}
	public List<CourseSelection> queryCourseSelectionByCid(int cid) {//查看课程的选修情况
		session=getSession();
		@SuppressWarnings("unchecked")
		List<CourseSelection> courseSelections = session.createCriteria(CourseSelection.class)
				.add(Restrictions.eq("courseId",cid)).list();
		return courseSelections;
	}

	public List<CourseSelection> queryCourseSelectionBySid(int sid) {//根据学生查看选课
		session=getSession();
		@SuppressWarnings("unchecked")
		List<CourseSelection> courseSelections = session.createCriteria(CourseSelection.class)
				.add(Restrictions.eq("studentId",sid)).list();
		return courseSelections;
	}
	public List<CourseSelection> querySuggestCourseSelection(){//查看选课人数排名第一课程
		session=getSession();
		Query query = session.createSQLQuery("select * from course_selection group by c_id  order by count(s_id) desc limit 1").addEntity(CourseSelection.class);
		@SuppressWarnings("unchecked")
		List<CourseSelection> courseSelections =query.list();
		return courseSelections;
	}
	public List<CourseSelection> queryHotCourseSelection(){//查看选课人数排名第2,3,4课程
		session=getSession();
		Query query = session.createSQLQuery("select * from course_selection group by c_id  order by count(s_id) desc limit 1,4").addEntity(CourseSelection.class);
		@SuppressWarnings("unchecked")
		List<CourseSelection> courseSelections =query.list();
		return courseSelections;
	}
	public int addCourseSelection(CourseSelection courseSelection) {//学生选课
		session=getSession();
		int id=save(courseSelection);
		return id;

	}
	public List<CourseSelection> queryCourseSelectionByCidSiD(int cid,int sid) {//根据cid,sid查询courseSelection
		 session = getSession();
			Query query = session.createSQLQuery("select * from course_selection where c_id = "+cid+" and s_id ="+sid).addEntity(CourseSelection.class);
			@SuppressWarnings("unchecked")
			List<CourseSelection> courseSelections =query.list();
			return courseSelections;
	}
	
}
