package com.ssh.bean;



import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
/**
 * 视频记录实体类
 * @author ASUS
 *
 */

@Entity
@Table(name = "video_selection")
public class VideoSelection {
	@Id
	@GeneratedValue(generator="pkVideoSelection")
	@GenericGenerator(name="pkVideoSelection",strategy="native")
	private int vs_id;// 选视频主键
	@Column(name="v_watch_time")
	private int video_watcheTime;// 视频观看时长（记录单位秒，每360秒记录一次）
	@Column(name="v_watch_begin_time")
	private String video_watch_startTime;// 观看视频的开始时间


	@Column(name = "v_id")
	private int videoId;// 关联视频id

	@Column(name = "s_id")
	private int studentId;// 关联学生id
	@Column(name="is_watch_end")
	private int isWatchEnd;// 是否看完 0未看完 1已看完



	public int getVs_id() {
		return vs_id;
	}

	public void setVs_id(int vs_id) {
		this.vs_id = vs_id;
	}

	public int getVideo_watcheTime() {
		return video_watcheTime;
	}

	public void setVideo_watcheTime(int video_watcheTime) {
		this.video_watcheTime = video_watcheTime;
	}


	

	public String getVideo_watch_startTime() {
		return video_watch_startTime;
	}

	public void setVideo_watch_startTime(String video_watch_startTime) {
		this.video_watch_startTime = video_watch_startTime;
	}

	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getIsWatchEnd() {
		return isWatchEnd;
	}

	public void setIsWatchEnd(int isWatchEnd) {
		this.isWatchEnd = isWatchEnd;
	}


	public VideoSelection() {
		super();
		// TODO Auto-generated constructor stub
	}

}
