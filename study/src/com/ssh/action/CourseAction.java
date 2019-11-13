package com.ssh.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.bean.Course;
import com.ssh.bean.CourseSelection;
import com.ssh.bean.Course_student;
import com.ssh.bean.Userinfo;
import com.ssh.bean.Video;
import com.ssh.service.ifc.ICourseService;
import com.ssh.service.ifc.IUserinfoService;

@SuppressWarnings("serial")
public class CourseAction extends ActionSupport {
	private Course course;
	private List<Course> courses;
	private ICourseService courseService;
	private File courseImg;
	private String courseContentType;
	private String courseImgName;
	private int id;
	private IUserinfoService userinfoService;
	private List<Userinfo> userinfos;
	private int uid;
	private List<Video> videos;
	private List<Course_student> course_students;
	private Course_student course_student;
	private List<CourseSelection> courseSelections;
	private CourseSelection courseSelection;

	public String saveCourse() {// 涓婁紶璇剧▼鍥剧墖
		System.out.println(courseImgName);
		String filePath = null;
		String fileName = null;
		String path=null;
		System.out.println("courseimg"+courseImg);
		System.out.println("courseImgName"+courseImgName);
		if (courseImg != null) {
			filePath = ServletActionContext.getServletContext().getRealPath("courseImg");
		/*	int index= filePath.indexOf(".metadata");
			  path= filePath.substring(0,index-1)+"\\study\\WebContent\\courseImg";
			System.out.println("filePath"+filePath);
			System.out.println("path"+path);*/
			String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			fileName = date + courseImgName.substring(courseImgName.lastIndexOf("."));
			try {
				FileUtils.copyFile(courseImg, new File(filePath, fileName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ActionContext.getContext().put("msg", "上传错误");
				System.out.println("上传错误");
				return INPUT;
			}
		}
		int num=filePath.indexOf("courseImg");
		String c=filePath.substring(num);
		course.setCourseImg(c +"/"+ fileName);
		course.setCourseStatu(1);
		
		int i = courseService.addCourse(course);
		if (i > 0) {
			return SUCCESS;
		} else {
			System.out.println("添加失败");
			return INPUT;
		}
	}
	
	public String alertCourseStatu() {//淇敼璇剧▼鐘舵��
		course=courseService.queryCourseByid(id);
		if(course.getCourseStatu()==0) {
			course.setCourseStatu(1);
		}else {
			course.setCourseStatu(0);
		}
		boolean s=courseService.updateCourse(course);
		if (s) {
			return SUCCESS;
		}else {
			return INPUT;
		}
	}
	public String alertCourseImg() {//淇敼璇剧▼鍥剧墖
		String filePath = null;
		String fileName = null;
		String re=null;
		String path=null;
		System.out.println("courseImg"+courseImg);
		System.out.println("courseImgName"+courseImgName);
		
		course=courseService.queryCourseByid(id);
		if(courseImg!=null){
			System.out.println("进方法了");
			filePath = ServletActionContext.getServletContext().getRealPath("courseImg");
		/*	int index= filePath.indexOf(".metadata");
			  path= filePath.substring(0,index-1)+"\\study\\WebContent\\courseImg";
			System.out.println(filePath);*/
			String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			fileName = date + courseImgName.substring(courseImgName.lastIndexOf("."));
		String url=filePath+course.getCourseImg();
			File file=new File(url);
			try {
				FileUtils.copyFile(courseImg, new File(filePath, fileName));
				FileUtils.deleteQuietly(file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ActionContext.getContext().put("msg", "鍥剧墖涓婁紶澶辫触");
				System.out.println("鍥剧墖涓婁紶澶辫触");
				return INPUT;
			}
			int num=filePath.indexOf("courseImg");
			String c=filePath.substring(num);
			course.setCourseImg(c +"/"+ fileName);
			courseService.updateCourse(course);
			re=SUCCESS;
		}else {
			re=SUCCESS;
		}
		return re;
	}
	
	public String queryCourse() {//妯＄硦鏌ヨ
		courses = courseService.queryAllCourse(course);
		return SUCCESS;
	}
	public String queryCourseByStu() {//妯＄硦鏌ヨ
		courses = courseService.queryAllCourseByStu(course);
		return SUCCESS;
	}
	
	public String alertCourse() {//淇敼璇剧▼淇℃伅
	   
			 boolean r=courseService.updateCourse(course);
	   if(r) {
		   return SUCCESS;		   
	   }else {
	   return INPUT;
	   }
	}
	public String updateCourseStatu() {//淇敼璇剧▼淇℃伅
		course=courseService.queryCourseByid(id);
		if(course.getCourseStatu()==1) {
		course.setCourseStatu(0);
		}else if(course.getCourseStatu()==0) {
			course.setCourseStatu(1);
			
		}
		boolean r=courseService.updateCourse(course);
		if(r) {
			return SUCCESS;		   
		}else {
			return INPUT;
		}
	}

	public String queryAllCourse() {//鏌ヨ鎵�鏈夎绋�
		courses=courseService.queryAllCourse();
		if(courses.size()>0) {
			return SUCCESS;
		}else {
		return INPUT;
		}
	}
	public String queryAllCourseByAdmi() {//鏌ヨ鎵�鏈夎绋�
		courses=courseService.queryAllCourseByAdmi();
		if(courses.size()>0) {
			return SUCCESS;
		}else {
			return INPUT;
		}
	}
	public String queryCourseById() {//鏍规嵁id鏌ヨ绋�
		course=courseService.queryCourseByid(id);
		if(course!=null) {
			ActionContext.getContext().getSession().put("course", course);
			return SUCCESS;
		}else {
			return INPUT;
		}
	}
	
	public String queryUserinfo() {
		userinfos = userinfoService.queryAllUserinfo();
		return SUCCESS;
	}
	public String queryVideoByUid() {
		videos=courseService.queryVideoByUid(uid);
		course_students = new ArrayList<Course_student>();
		for(int i=0;i<videos.size();i++) {
			course_student = new Course_student();
			course=courseService.queryCourseByCid(videos.get(i).getCid());
			courseSelections=courseService.queryCourseSelectionByCid(videos.get(i).getCid());
			course_student.setStudentNum(courseSelections.size());
			course_student.setCourseName(course.getCourseName());
			course_students.add(course_student);
		}
		return "success";
	}
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public ICourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(ICourseService courseService) {
		this.courseService = courseService;
	}

	public File getCourseImg() {
		return courseImg;
	}

	public void setCourseImg(File courseImg) {
		this.courseImg = courseImg;
	}

	public String getCourseContentType() {
		return courseContentType;
	}

	public void setCourseContentType(String courseContentType) {
		this.courseContentType = courseContentType;
	}

	public String getCourseImgName() {
		return courseImgName;
	}

	public void setCourseImgName(String courseImgName) {
		this.courseImgName = courseImgName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public IUserinfoService getUserinfoService() {
		return userinfoService;
	}

	public void setUserinfoService(IUserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}

	public List<Userinfo> getUserinfos() {
		return userinfos;
	}

	public void setUserinfos(List<Userinfo> userinfos) {
		this.userinfos = userinfos;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public List<Video> getVideos() {
		return videos;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public List<Course_student> getCourse_students() {
		return course_students;
	}

	public void setCourse_students(List<Course_student> course_students) {
		this.course_students = course_students;
	}

	public Course_student getCourse_student() {
		return course_student;
	}

	public void setCourse_student(Course_student course_student) {
		this.course_student = course_student;
	}

	public List<CourseSelection> getCourseSelections() {
		return courseSelections;
	}

	public void setCourseSelections(List<CourseSelection> courseSelections) {
		this.courseSelections = courseSelections;
	}

	public CourseSelection getCourseSelection() {
		return courseSelection;
	}

	public void setCourseSelection(CourseSelection courseSelection) {
		this.courseSelection = courseSelection;
	}

}
