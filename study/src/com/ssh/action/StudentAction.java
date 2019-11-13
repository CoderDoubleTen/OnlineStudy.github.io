package com.ssh.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.bean.Course;
import com.ssh.bean.CourseSelection;
import com.ssh.bean.Student;
import com.ssh.bean.StudentPassword;
import com.ssh.bean.Video;
import com.ssh.bean.VideoSelection;
import com.ssh.service.ifc.ICourseSelectionService;
import com.ssh.service.ifc.ICourseService;
import com.ssh.service.ifc.IStudentService;
import com.ssh.service.ifc.IVideoSelectionService;
import com.ssh.service.ifc.IVideoService;

@SuppressWarnings("serial")
public class StudentAction extends ActionSupport {
	private Student student;
	private Video video;
	private Course course;
	private StudentPassword studentPassword;
	private CourseSelection courseSelection;
	private VideoSelection videoSelection;

	private List<Video> videos;
	private List<Student> students;
	private List<Course> courses;
	private List<CourseSelection> courseSelections;
    private List<VideoSelection> videoSelections;
	
	private ICourseService courseService;
	private IStudentService studentService;
	private IVideoService videoService;
	private ICourseSelectionService courseSelectionService;
	private IVideoSelectionService videoSelectionService;
	
	private int id;
	private File myFile;
	private String myFileName;

	public String studentLogin() {// 学生登录方法
		String re = "";
		students = studentService.queryStudentAtLogin(student);
		if (students.size() > 0) {
			ActionContext.getContext().getSession().put("student", students.get(0));
			ActionContext.getContext().getSession().put("studentName", students.get(0).getStudentName());
			ActionContext.getContext().getSession().put("studentID", students.get(0).getS_id());
			re = SUCCESS;
		} else {
			re = INPUT;
		}
		return re;
	}

	public String studentEdit() {// 学生退出操作
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}

	// 查询
	public String queryAllStudent() { // 查询所有学生
		students = studentService.queryAllStudent();
		return SUCCESS;
	}

	// 添加
	public String insertStudent() { // 插入学生
		System.out.println(myFileName);
		String filePath = null;
		String fileName = null;
		String path = null;
		System.out.println("courseimg" + myFile);
		System.out.println("courseImgName" + myFileName);
		if (myFile != null) {
			filePath = ServletActionContext.getServletContext().getRealPath("studentImg");
			/*int index = filePath.indexOf(".metadata");
			path = filePath.substring(0, index - 1) + "\\study\\WebContent\\studentImg";
			System.out.println("filePath" + filePath);
			System.out.println("path" + path);*/
			String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			fileName = date + myFileName.substring(myFileName.lastIndexOf("."));
			try {
				FileUtils.copyFile(myFile, new File(filePath, fileName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ActionContext.getContext().put("msg", "图片上传失败");
				System.out.println("图片上传失败");
				return INPUT;
			}
		}
		int num = filePath.indexOf("studentImg");
		String c = filePath.substring(num);
		student.setStudentImg(c + "/" + fileName);
		studentPassword = new StudentPassword();
		studentPassword.setPassword("123456");
		student.setStudentPassword(studentPassword);
		student.setStudentStatu(1);
		int re = studentService.insert(student);
		System.out.println(re);
		return SUCCESS;
	}

	public String alertStudentImg() {//修改学生图片
		String filePath = null;
		String fileName = null;
		String re=null;
		String path=null;
		System.out.println("studentImg"+myFile);
		System.out.println("studentImgName"+myFileName);
		System.out.println("没进方法s");
	int id=	(int)ActionContext.getContext().getSession().get("studentID");
	System.out.println("id"+id);
		student=studentService.queryStudentById(id);
	
		
		
		if(myFile!=null){
			System.out.println("进方法");
			filePath = ServletActionContext.getServletContext().getRealPath("studentImg");
			System.out.println("filePath"+filePath);
	
			String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			fileName = date + myFileName.substring(myFileName.lastIndexOf("."));
		
			int b=filePath.lastIndexOf("\\");
			String url=filePath.substring(0,b+1)+student.getStudentImg();
		
			File file=new File(url);
			try {
				FileUtils.copyFile(myFile, new File(filePath, fileName));
				FileUtils.deleteQuietly(file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ActionContext.getContext().put("msg", "图片上传失败");
				System.out.println("图片上传失败");
				return INPUT;
			}
			int num=filePath.indexOf("studentImg");
			String c=filePath.substring(num);
			student.setStudentImg(c +"/"+ fileName);
			studentService.update(student);
			re=SUCCESS;
		}else {
			re=SUCCESS;
		}
		return re;
	}
	
	public String queryVideo() {//模糊查询视频
		String name=video.getVideoName();
		System.out.println("videoName"+name);
		if(name == null ||"".equals(name)) {		
			querySingleVideo();
		}else {
			videos = videoService.queryAllVideo(video);
		}
		
		return SUCCESS;
	}
	public String queryCourse() {//模糊查询课程
		String name=course.getCourseName();
		if(name == null ||"".equals(name)) {		
			querySingleCourse();
		}else {
			
			courses = courseService.queryAllCourse(course);
		}
		
		return SUCCESS;
	}
	
	
	
	
	public String querySingleCourse() {// 查询自己的课程
		int sid = (int) ActionContext.getContext().getSession().get("studentID");
		System.out.println(sid);
		courseSelections = courseSelectionService.queryCourseSelectionBySid(sid);
		System.out.println(courseSelections.size());
		courses = new ArrayList<Course>();
		for (int i = 0; i < courseSelections.size(); i++) {
			course = courseService.queryCourseByid(courseSelections.get(i).getCourseId());
			courses.add(course);
		}
		return SUCCESS;
	}
	public String querySingleVideo() {// 查询自己的视频
		int sid = (int) ActionContext.getContext().getSession().get("studentID");
		System.out.println(sid);
		videoSelections = videoSelectionService.queryVideoSelectionBySid(sid);
		System.out.println(courseSelections.size());
		videos = new ArrayList<Video>();
		for (int i = 0; i < videoSelections.size(); i++) {
			video = videoService.queryVideoById(videoSelections.get(i).getVideoId());
			videos.add(video);
		}
		return SUCCESS;
	}
	public String choiceCourse() {
		CourseSelection courseSelection = new CourseSelection();
		int sid = (int) ActionContext.getContext().getSession().get("studentID");
		courseSelection.setCourseId(id);
		courseSelection.setStudentId(sid);
		int r = courseSelectionService.addCourseSelection(courseSelection);
		if (r != 0) {
			ActionContext.getContext().put("message", "添加成功");
			return SUCCESS;
		} else {
			ActionContext.getContext().put("message", "添加失败");
			return INPUT;
		}
	}
	// 更改
	public String updateStudent() { // 更新学生
		studentService.update(student);
		return SUCCESS;
	}
	public String queryStudentByAdmi() { // 更新学生
	students=studentService.queryStudent(student);
		return SUCCESS;
	}

	public String queryStudent(){//根据学生id模糊查询学生
		int id=(int) ActionContext.getContext().getSession().get("studentID");
		student = studentService.queryStudentById(id);
		ActionContext.getContext().getSession().put("password", student.getStudentPassword().getPassword());
		return SUCCESS;
	}
	public String queryStudentById(){//根据学生id查询学生
		student = studentService.queryStudentById(id);
		ActionContext.getContext().getSession().put("studentID",student.getS_id());
		return SUCCESS;
	}

	// 更新学生状态

	public String updateStudentSu() {
		student = studentService.queryStudentById(id);
		if (student != null) {
			if (student.getStudentStatu() == 1) {
				student.setStudentStatu(2);
			} else if (student.getStudentStatu() == 2) {
				student.setStudentStatu(1);
			}
			studentService.update(student);
		}
		return SUCCESS;
	}

	public String updateStudentPass() { // 重置学生密码
		student = studentService.queryStudentById(id);
		if (student != null) {
			studentPassword = studentService.queryPassById(student.getS_id());
			studentPassword.setPassword("123456");
			student.setStudentPassword(studentPassword);
		}
		studentService.update(student);
		return SUCCESS;
	}

	public String queryVideosByCid() {// 根据课程id 查视频
		videos = videoService.queryVideoByCid(id);
		course = courseService.queryCourseByid(id);
		int sid=(int) ActionContext.getContext().getSession().get("studentID");
		courseSelections=courseSelectionService.queryCourseSelectionByCidSiD(course.getC_id(), sid);
	 System.out.println("courseSelections的size"+courseSelections.size());
	 ActionContext.getContext().getSession().put("courseSelectionsSize", courseSelections.size());
		ActionContext.getContext().getSession().put("course", course);
		System.out.println("videos" + videos.size());
		
			ActionContext.getContext().getSession().put("videoSize", videos.size());
			return SUCCESS;
		
	}

	public String queryStuIndex() {// 查询主页的推荐课程和热门视频
		courseSelections = courseSelectionService.querySuggestCourseSelection();
		System.out.println(courseSelections.size());
		
		for (int i = 0; i < courseSelections.size(); i++) {
			System.out.println(courseSelections.get(i).getCourseId());
			course = courseService.queryCourseByid(courseSelections.get(i).getCourseId());
			ActionContext.getContext().getSession().put("course", course);
		}
	
		List<CourseSelection> courseSelections2=new ArrayList<CourseSelection>();
		courseSelections2 = courseSelectionService.queryHotCourseSelection();
		System.out.println("coutseSelection2"+courseSelections2.size());
		courses = new ArrayList<Course>();
		
		for (int k = 0; k < courseSelections2.size(); k++) {
			
			Course course2=new Course();
			course2 = courseService.queryCourseByid(courseSelections2.get(k).getCourseId());
			courses.add(course2);
		}
		System.out.println("course2"+courses.size());
		videoSelections=videoSelectionService.queryHotVideo(videoSelection);
		videos=new ArrayList<Video>();
		for(int j=0;j<videoSelections.size();j++) {
			video=videoService.queryVideoById(videoSelections.get(j).getVideoId());
			videos.add(video);
		}
		
		return SUCCESS;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public IStudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(IStudentService studentService) {
		this.studentService = studentService;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public StudentPassword getStudentPassword() {
		return studentPassword;
	}

	public void setStudentPassword(StudentPassword studentPassword) {
		this.studentPassword = studentPassword;
	}

	public ICourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(ICourseService courseService) {
		this.courseService = courseService;
	}

	public CourseSelection getCourseSelection() {
		return courseSelection;
	}

	public void setCourseSelection(CourseSelection courseSelection) {
		this.courseSelection = courseSelection;
	}

	public List<CourseSelection> getCourseSelections() {
		return courseSelections;
	}

	public void setCourseSelections(List<CourseSelection> courseSelections) {
		this.courseSelections = courseSelections;
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

	public ICourseSelectionService getCourseSelectionService() {
		return courseSelectionService;
	}

	public void setCourseSelectionService(ICourseSelectionService courseSelectionService) {
		this.courseSelectionService = courseSelectionService;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public List<Video> getVideos() {
		return videos;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public IVideoService getVideoService() {
		return videoService;
	}

	public void setVideoService(IVideoService videoService) {
		this.videoService = videoService;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileName() {
		return myFileName;
	}

	public void setMyFileName(String myFileName) {
		this.myFileName = myFileName;
	}

	public VideoSelection getVideoSelection() {
		return videoSelection;
	}

	public void setVideoSelection(VideoSelection videoSelection) {
		this.videoSelection = videoSelection;
	}

	public List<VideoSelection> getVideoSelections() {
		return videoSelections;
	}

	public void setVideoSelections(List<VideoSelection> videoSelections) {
		this.videoSelections = videoSelections;
	}

	public IVideoSelectionService getVideoSelectionService() {
		return videoSelectionService;
	}

	public void setVideoSelectionService(IVideoSelectionService videoSelectionService) {
		this.videoSelectionService = videoSelectionService;
	}


}
