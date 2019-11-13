package com.ssh.dao.ifc;

import java.util.List;


import com.ssh.bean.Video;

public interface IVideoDao {
	 public int addVideo(Video video);
	 public boolean alertVideo(Video video) ;
	public List<Video> queryVideoByCid(int cid);// 鏍规嵁璇剧▼鏌ヨ棰�
	 public List<Video> queryAllVideo(Video video);
	public List<Video> queryAllVideo();
	public List<Video> queryAllVideoByStu();
	 public List<Video> queryAllVideoByStu(Video video);
	public Video queryVideoById(int id);
	public boolean deleteVideo(Video video);
	public List<Video> queryVideosByTid(int tid);
}
