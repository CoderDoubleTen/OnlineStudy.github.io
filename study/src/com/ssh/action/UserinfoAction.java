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
import com.ssh.bean.UserPassword;
import com.ssh.bean.Userinfo;
import com.ssh.bean.Video;
import com.ssh.service.ifc.ICourseService;
import com.ssh.service.ifc.IUserinfoService;
import com.ssh.service.ifc.IVideoService;

@SuppressWarnings("serial")
public class UserinfoAction extends ActionSupport {
	private Userinfo userinfo;
	private UserPassword userPassword;
	private Video video;
	private Course course;
	private List<Userinfo> userinfos;
	private List<Course> courses;
	private List<Video> videos;
	private IUserinfoService userinfoService;
	private IVideoService videoService;
	private ICourseService courseService;
	private List<CourseSelection> courseSelections;
	private CourseSelection courseSelection;
	private List<Course_student> course_students;
	private Course_student course_student;

	private File myFile;
	private String fileName;
	private int id;
	private float shijian;

	public String userLogin() {// 鐢ㄦ埛鐧诲綍鏂规硶
		String re = "";
		userinfos = userinfoService.queryUserAtLogin(userinfo);
		if (userinfos.size() > 0) {
			ActionContext.getContext().getSession().put("userinfo", userinfos.get(0));
			ActionContext.getContext().getSession().put("userName", userinfos.get(0).getUserName());
			ActionContext.getContext().getSession().put("userinfoId", userinfos.get(0).getU_id());
			System.out.println("绾у埆:" + userinfos.get(0).getUserLevel());
			switch (userinfos.get(0).getUserLevel()) {
			case 0:
				re = "guanliyuan";
				break;
			case 1:
				if(userinfos.get(0).getUserStatu()==1) {
				re = "yonghu";
				break;
				}else {
					re=INPUT;
				}
			default:
				System.out.println("娌℃湁韬唤");
			}
		} else {
			re = INPUT;
		}
		return re;
	}

	public String updateUserPass() { // 重置密码
		userinfo = userinfoService.queryUserinfoById(id);
		if (userinfo != null) {
			userPassword=userinfoService.queryPassById(userinfo.getUserPassword().getUp_id());
			userPassword.setPassword("123456");
			userinfo.setUserPassword(userPassword);
		}
		userinfoService.updateUserinfo(userinfo);
		return SUCCESS;
	}
	
	public String userEdit() {// 鐢ㄦ埛鎴栫鐞嗗憳閫�鍑烘搷浣�
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}
	public String userIndex() {// 鐢ㄦ埛鎴栫鐞嗗憳閫�鍑烘搷浣�
	
		return SUCCESS;
	}
	
	public String queryAllVideoByTid() {// 鐢ㄦ埛鎴栫鐞嗗憳閫�鍑烘搷浣�
		int tid=(int) ActionContext.getContext().getSession().get("userinfoId");
		videos=videoService.queryVideosByTid(tid);
		return SUCCESS;
	}

	private String getExtention() {
		System.out.println("333"+fileName);
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	// 鏁欏笀澧炲姞
	@Override
	public String execute() {
	
		String path=null;
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		fileName = date + getExtention();
		String filePath = ServletActionContext.getServletContext().getRealPath("userImages");
		
		/*int index= filePath.indexOf(".metadata");
		  path= filePath.substring(0,index-1)+"\\study\\WebContent\\userImages";*/
		try {
			FileUtils.copyFile(myFile, new File(filePath, fileName));
			UserPassword up = new UserPassword();
			up.setPassword("123456");
			int num=filePath.indexOf("userImages");
			String c=filePath.substring(num);
			userinfo.setUserImg(c +"\\"+fileName);
			userinfo.setUserStatu(1);
			userinfo.setUserLevel(1);
			userinfo.setUserPassword(up);
			@SuppressWarnings("unused")
			int st = userinfoService.addUserinfo(userinfo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return SUCCESS;
	}


	// 鏁欏笀鍒犻櫎
	public String deleteUserinfo() {
		userinfo = userinfoService.queryUserinfoById(id);
		if (userinfo != null) {
			if(userinfo.getUserStatu()==1) {
			userinfo.setUserStatu(2);
			}else if(userinfo.getUserStatu()==2) {
				userinfo.setUserStatu(1);
			}
			
			userinfoService.updateUserinfo(userinfo);
		
		}
		return "success";
	}

	// 鏁欏笀鏌ヨ
	public String queryAllUserinfo() {
		userinfos = userinfoService.queryAllUserinfo();
		if(userinfos.size()>0) {
		return SUCCESS;
		}else {
			return INPUT;
		}
	}
	public String queryUserinfo() {
		userinfos = userinfoService.queryTeacher(userinfo);
		if(userinfos.size()>0) {
			return SUCCESS;
		}else {
			return INPUT;
		}
	}

	public String querySingleTeacher() {//鏁欏笀妯＄硦鏌ヨ
		int uid=(int) ActionContext.getContext().getSession().get("userinfoId");
		userinfo = userinfoService.queryUserinfoById(uid);
ActionContext.getContext().getSession().put("password",userinfo.getUserPassword().getPassword());
		return "success";
	}

	// 鏁欏笀淇敼
	public String updateImage() {//淇敼澶村儚
	int uid=(int) ActionContext.getContext().getSession().get("userinfoId");
		userinfo = userinfoService.queryUserinfoById(uid);
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		fileName = date + getExtention();
		String imageFile = ServletActionContext.getServletContext().getRealPath("userImages");
		System.out.println(imageFile);
/*		System.out.println(ServletActionContext.getServletContext().getRealPath("/")+userinfo.getUserImg());*/
		/*String url=ServletActionContext.getServletContext().getRealPath("/")+userinfo.getUserImg();*/
	/*	int b=imageFile.lastIndexOf("\\");*/
		String url=imageFile+userinfo.getUserImg();
		File file=new File(url);
		try {
			FileUtils.copyFile(myFile, new File(imageFile, fileName));
			FileUtils.deleteQuietly(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int num=imageFile.indexOf("userImages");
		String c=imageFile.substring(num);
		userinfo.setUserImg(c +"\\"+fileName);
		userinfoService.updateUserinfo(userinfo);
		return "success";
	}

	
	public String initUploadVideo() {//涓婁紶瑙嗛鍓嶇殑鏌ヨ璇剧▼
		System.out.println("123");
		courses=courseService.queryAllCourse();
		System.out.println(courses.size());
		if(courses.size()>0) {
		return SUCCESS;
		}else {
			return INPUT;
		}
	}
	
	public String insertVideo() {//涓婁紶瑙嗛
		String path=null;
		String filePath=null;
		float byt=0;//瑙嗛鍒濆B
		float mb=0;
		float size = 0;//瑙嗛澶у皬MB
		int time=0;//瑙嗛鏃堕暱
		System.out.println("byt"+byt);
		System.out.println("size"+myFile.length());
		if (myFile != null) {
			filePath = ServletActionContext.getServletContext().getRealPath("uploadCourseVideo");
			/*int index= filePath.indexOf(".metadata");
			path= filePath.substring(0,index-1)+"\\study\\WebContent\\uploadCourseVideo";
			System.out.println("filePath"+filePath);
			System.out.println("path"+path);*/
			String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			System.out.println("index"+fileName.lastIndexOf("."));
			fileName = date + fileName.substring(fileName.lastIndexOf("."));
			
			byt=myFile.length();
			mb=byt/1024/1024;
			System.out.println("bytttt"+byt);
			System.out.println("mbbb"+mb);
			size=(float)(Math.round(mb*100))/100;
			System.out.println("#3333"+size);
			
			/*int fen=(int) (shijian/60);
			int miao=(int) (shijian%60);*/
			time=(int) shijian;
			
			try {
				FileUtils.copyFile(myFile, new File(filePath, fileName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ActionContext.getContext().put("msg", "瑙嗛涓婁紶澶辫触");
				System.out.println("瑙嗛涓婁紶澶辫触");
				return INPUT;
			}
			int num=filePath.indexOf("uploadCourseVideo");
			String c=filePath.substring(num);
			
			
			video.setVideoSize(size);
			video.setVideoLength(time);
		
			video.setVideoUrl(c +"/"+ fileName);
	
			System.out.println("vname"+video.getVideoName());
			System.out.println("vlength"+time);
			System.out.println("vsize"+size);
			System.out.println("vstatu"+video.getVideoStatu());
			System.out.println("vurl"+video.getVideoUrl());
		
		
			
			int i = videoService.addVideo(video);
			if (i > 0) {
				return SUCCESS;
			} else {
				System.out.println("璇剧▼娣诲姞澶辫触");
				return INPUT;
			}
		}else {
		System.out.println("鏂囦欢涓虹┖");
			return INPUT;
		
	}
	}
	//管理员统计
	public String queryCourseSelection() {
		courseSelections = userinfoService.queryCourseDistinctCid();
		course_students = new ArrayList<Course_student>();
		for (int i = 0; i < courseSelections.size(); i++) {
			course_student = new Course_student();
			System.out.println("课程的id"+courseSelections.get(i).getCourseId());
			course = courseService.queryCourseByid(courseSelections.get(i).getCourseId());
			System.out.println("coursename"+course.getCourseName());
			course_student.setCourseName(course.getCourseName());
			List<CourseSelection> courseSelections2 = userinfoService.queryStudentNum(courseSelections.get(i).getCourseId());
			course_student.setStudentNum(courseSelections2.size());
			course_students.add(course_student);
		}
		return "success";
	}
	public String updateUserinfo() {//淇敼淇℃伅
		userinfoService.updateUserinfo(userinfo);
		return "success";
	}

	public String queryUserinfoUpdate() {//鏍规嵁id鏌ユ暀甯�
		userinfo = userinfoService.queryUserinfoById(id);
		ActionContext.getContext().getSession().put("userinfoId", userinfo.getU_id());
		return "success";
	}

	public Userinfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public List<Userinfo> getUserinfos() {
		return userinfos;
	}

	public void setUserinfos(List<Userinfo> userinfos) {
		this.userinfos = userinfos;
	}

	public IUserinfoService getUserinfoService() {
		return userinfoService;
	}

	public void setUserinfoService(IUserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public float getShijian() {
		return shijian;
	}

	public void setShijian(float shijian) {
		this.shijian = shijian;
	}

	public IVideoService getVideoService() {
		return videoService;
	}

	public void setVideoService(IVideoService videoService) {
		this.videoService = videoService;
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

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
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

	public List<Video> getVideos() {
		return videos;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public UserPassword getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(UserPassword userPassword) {
		this.userPassword = userPassword;
	}

}
