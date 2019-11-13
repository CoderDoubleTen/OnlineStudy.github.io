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
import com.ssh.bean.CourseVideo;
import com.ssh.bean.TeacherVideo;
import com.ssh.bean.Userinfo;
import com.ssh.bean.Video;
import com.ssh.bean.VideoSelection;
import com.ssh.bean.Video_student;
import com.ssh.service.ifc.ICourseService;
import com.ssh.service.ifc.IUserinfoService;
import com.ssh.service.ifc.IVideoSelectionService;
import com.ssh.service.ifc.IVideoService;

@SuppressWarnings("serial")
public class VideoAction extends ActionSupport {
	private Video video;
	private List<Video> videos;
	private List<Course> courses;
	private List<VideoSelection> videoSelections;
	private IVideoService videoService;
	private ICourseService courseService;
	private IVideoSelectionService videoSelectionService;
	private float shijian;
	private String fileName;
	private File myFile;
	private String videoTime;//鍓嶅彴鑾峰彇鐨�
	private int isEnd;
	private int cid;
	private Video_student video_student;
	private Course course;
	private VideoSelection videoSelection;
	private List<Video_student> video_students;
    private int id;
    private Userinfo userinfo;
	private List<Userinfo> userinfos;
	private IUserinfoService userinfoService;
	private TeacherVideo teacherVideo;
	private List<TeacherVideo> teacherVideos;
	private CourseVideo courseVideo;
	private List<CourseVideo> courseVideos;
	
	public String queryAllVideo() {//鏌ヨ鎵�鏈夎棰�
		videos = videoService.queryAllVideo();
		courses=new ArrayList<Course>();
		for (int i = 0; i < videos.size(); i++) {
			course=new Course();
			course = courseService.queryCourseByid(videos.get(i).getCid());
			courses.add(course);
		}
		System.out.println(course.getCourseImg());
		System.out.println(courses.get(0).getCourseImg());
		return SUCCESS;
	}
	
	public String queryVideo() {//妯＄硦鏌ヨ
		videos = videoService.queryAllVideo(video);
		System.out.println("videos鐨勬潯鏁�");
		return SUCCESS;
	}
	public String queryAllVideoByStu() {//鏌ヨ鎵�鏈夎棰�
		videos = videoService.queryAllVideoByStu();
		System.out.println("dddd"+videos.size());
		courses=new ArrayList<Course>();
		for (int i = 0; i < videos.size(); i++) {
			course=new Course();
			course = courseService.queryCourseByid(videos.get(i).getCid());
			courses.add(course);
		}
		System.out.println("size"+courses.size());
		return SUCCESS;
	}
	
	public String queryVideoByStu() {//妯＄硦鏌ヨ
		videos = videoService.queryAllVideoByStu(video);
		System.out.println("videos鐨勬潯鏁�");
		return SUCCESS;
	}
	
  public String queryVideoDetail() {//鏍规嵁id鏌ヨ瑙嗛璇︽儏椤�
  video= videoService.queryVideoById(id);
	course=courseService.queryCourseByid(video.getCid());
	userinfo=userinfoService.queryUserinfoById(video.getUid());
	ActionContext.getContext().getSession().put("course", course);
	ActionContext.getContext().getSession().put("userinfo", userinfo);
  ActionContext.getContext().getSession().put("video",video);
  ActionContext.getContext().getSession().put("vid",id);
	  return SUCCESS;
  }
   
  public String addvideoSelection() {//杩涘叆瑙嗛鐣岄潰鎻掑叆涓�鏉¤褰�
	int sid=  (int) ActionContext.getContext().getSession().get("studentID");
	int vid=(int) ActionContext.getContext().getSession().get("vid");
	videoSelections=videoSelectionService.queryVideoSelectionBySidViD(vid, sid);
	if(videoSelections.size()==0) {
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//璁剧疆鏃ユ湡鏍煎紡
	String time=df.format(new Date());
	VideoSelection videoSelection=new VideoSelection();
	videoSelection.setStudentId(sid);
	videoSelection.setVideoId(vid);
	videoSelection.setVideo_watch_startTime(time);
	videoSelection.setVideo_watcheTime(0);
	videoSelection.setIsWatchEnd(0);
	  int i=videoSelectionService.addVideoSelection(videoSelection);
	  if(i>0) {
		  System.out.println("鎻掑叆瑙嗛璁板綍鎴愬姛");
		  ActionContext.getContext().getSession().put("videoSelection", videoSelections.get(0));
		  return SUCCESS;
	  }else {
		  System.out.println("鎻掑叆瑙嗛璁板綍澶辫触");
		  return INPUT;
	  }
	}else {
		
		ActionContext.getContext().getSession().put("videoSelection", videoSelections.get(0));
		return SUCCESS;
	}
	
  }
	public String updateVideoSelectionTime() {//ajax涓婁紶瑙嗛瑙傜湅鏃堕暱
		int sid=  (int) ActionContext.getContext().getSession().get("studentID");
		int vid=(int) ActionContext.getContext().getSession().get("vid");
		
		videoSelections=videoSelectionService.queryVideoSelectionBySidViD(vid, sid);
		videoSelection=videoSelections.get(0);
		int startTime=videoSelection.getVideo_watcheTime();
		video=videoService.queryVideoById(vid);
	  int vTime=Integer.parseInt(videoTime);
	  if(videoSelection.getIsWatchEnd()!=1) {
			videoSelection.setVideo_watcheTime(vTime+startTime);
	  }
			if(vTime+startTime>video.getVideoLength()){
			videoSelection.setIsWatchEnd(1);
		}
		videoSelectionService.alertVideoSelection(videoSelection);
		
		
		videoSelections=videoSelectionService.queryVideoSelectionBySidViD(vid, sid);
		isEnd=videoSelections.get(0).getIsWatchEnd();
		return "ajax";
	}
	 public String queryVideoByCid(){
			videos=videoService.queryVideoByCid(cid);
			video_students = new ArrayList<Video_student>();
			for(int i=0;i<videos.size();i++) {
				video_student=new Video_student();
				videoSelections = videoSelectionService.queryStudentNums(videos.get(i).getV_id());
				video_student.setStudentNum(videoSelections.size());
				video_student.setVideoName(videos.get(i).getVideoName());
				video_students.add(video_student);
			}
			return "success";
		}
	 public String queryTeacherCourseVideos() {
			userinfos=userinfoService.queryAllUserinfo();
			courses=courseService.queryAllCourse();
			teacherVideos = new ArrayList<TeacherVideo>();
			for(int i=0;i<userinfos.size();i++) {
				teacherVideo = new TeacherVideo();
				videos = videoService.queryVideosByTid(userinfos.get(i).getU_id());
				teacherVideo.setTeacherVideos(videos.size());
				teacherVideo.setTeacherName(userinfos.get(i).getUserName());
				teacherVideos.add(teacherVideo);
			}
			courseVideos = new ArrayList<CourseVideo>();
			for(int j=0;j<courses.size();j++) {
				courseVideo = new CourseVideo();
				videos = videoService.queryVideoByCid(courses.get(j).getC_id());
				courseVideo.setCourseName(courses.get(j).getCourseName());
				courseVideo.setCourseVideos(videos.size());
				courseVideos.add(courseVideo);
			}
			
			return "success";
		}
	 
	 public String alertVideoStatu() {
		video= videoService.queryVideoById(id);
		if(video.getVideoStatu()==0||video.getVideoStatu()==2) {
			video.setVideoStatu(1);
		}else if(video.getVideoStatu()==1) {
			video.setVideoStatu(2);
		}
		videoService.alertVideo(video);
		 return SUCCESS;
	 }
	 public String deleteVideo() {
		 video= videoService.queryVideoById(id);
			String filePath = ServletActionContext.getServletContext().getRealPath("uploadCourseVideo");
		
			int b=filePath.lastIndexOf("\\");
			String url=filePath.substring(0,b+1)+video.getVideoUrl();
			File file=new File(url);
	
			FileUtils.deleteQuietly(file);
			

		 videoService.deleteVideo(video);
		 return SUCCESS;
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

	public float getShijian() {
		return shijian;
	}

	public void setShijian(float shijian) {
		this.shijian = shijian;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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



	public String getVideoTime() {
		return videoTime;
	}

	public void setVideoTime(String videoTime) {
		this.videoTime = videoTime;
	}

	public int getIsEnd() {
		return isEnd;
	}

	public void setIsEnd(int isEnd) {
		this.isEnd = isEnd;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Video_student getVideo_student() {
		return video_student;
	}

	public void setVideo_student(Video_student video_student) {
		this.video_student = video_student;
	}

	public List<Video_student> getVideo_students() {
		return video_students;
	}

	public void setVideo_students(List<Video_student> video_students) {
		this.video_students = video_students;
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

	public TeacherVideo getTeacherVideo() {
		return teacherVideo;
	}

	public void setTeacherVideo(TeacherVideo teacherVideo) {
		this.teacherVideo = teacherVideo;
	}

	public List<TeacherVideo> getTeacherVideos() {
		return teacherVideos;
	}

	public void setTeacherVideos(List<TeacherVideo> teacherVideos) {
		this.teacherVideos = teacherVideos;
	}

	public CourseVideo getCourseVideo() {
		return courseVideo;
	}

	public void setCourseVideo(CourseVideo courseVideo) {
		this.courseVideo = courseVideo;
	}

	public List<CourseVideo> getCourseVideos() {
		return courseVideos;
	}

	public void setCourseVideos(List<CourseVideo> courseVideos) {
		this.courseVideos = courseVideos;
	}

}
