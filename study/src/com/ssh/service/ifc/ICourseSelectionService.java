package com.ssh.service.ifc;

import java.util.List;

import com.ssh.bean.CourseSelection;

public interface ICourseSelectionService {
	public List<CourseSelection> queryCourseAndStudent();
	public List<CourseSelection> queryCourseSelectionByCidSiD(int cid,int sid);
	public List<CourseSelection> queryCourseSelectionByCid(int cid);
	public int addCourseSelection(CourseSelection courseSelection);
	public List<CourseSelection> queryCourseSelectionBySid(int sid);
	public List<CourseSelection> querySuggestCourseSelection();
	public List<CourseSelection> queryHotCourseSelection();
}
