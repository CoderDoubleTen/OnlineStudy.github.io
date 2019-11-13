package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;

/***
 * 视频实体类
 * @author ASUS
 *
 */
@Entity
@Table(name="video")
public class Video {
	@Id
	@GeneratedValue(generator="pkVideo")
	@GenericGenerator(name="pkVideo",strategy="native")
	private int v_id;
	@Column(name="v_name")
	private String videoName;//视频名称
	@Column(name="v_length")
	private int videoLength;//时长
	@Column(name="v_size")
	private Float videoSize;//大小
	@Column(name="v_statu")
	private int videoStatu;//状态
	@Column(name="v_url")
	private String videoUrl;//视频路径
	/*@ManyToOne(targetEntity = Userinfo.class, fetch = FetchType.EAGER)   //代表是一对多关联
	@Cascade(value = { CascadeType.SAVE_UPDATE })*/
	@Column(name = "u_id")
	private int uid;
	/*@ManyToOne(targetEntity = Course.class, fetch = FetchType.EAGER)  //代表是一对多关联
	@Cascade(value = { CascadeType.SAVE_UPDATE})*/
	@Column(name = "c_id")
	private int cid;

	public int getV_id() {
		return v_id;
	}

	public void setV_id(int v_id) {
		this.v_id = v_id;
	}

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}


	public int getVideoLength() {
		return videoLength;
	}

	public void setVideoLength(int videoLength) {
		this.videoLength = videoLength;
	}

	public Float getVideoSize() {
		return videoSize;
	}

	public void setVideoSize(Float videoSize) {
		this.videoSize = videoSize;
	}

	public int getVideoStatu() {
		return videoStatu;
	}

	public void setVideoStatu(int videoStatu) {
		this.videoStatu = videoStatu;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	
	


	

}
