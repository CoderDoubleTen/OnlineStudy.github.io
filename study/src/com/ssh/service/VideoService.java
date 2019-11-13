package com.ssh.service;

import java.util.List;

import com.ssh.bean.Video;
import com.ssh.dao.ifc.IVideoDao;
import com.ssh.service.ifc.IVideoService;

public class VideoService implements IVideoService{
	private IVideoDao videoDao;

	 public int addVideo(Video video) {
		 return videoDao.addVideo(video);
	 }
	 public boolean deleteVideo(Video video) {
		 return videoDao.deleteVideo(video);
	 }
	 
	 public boolean alertVideo(Video video) {
		 return videoDao.alertVideo(video);
	 }
	 public List<Video> queryAllVideoByStu(){
		 return videoDao.queryAllVideoByStu();
	 }
	 public List<Video> queryAllVideoByStu(Video video){
		 return videoDao.queryAllVideoByStu(video);
	 }
	 public List<Video> queryAllVideo(Video video){
		 return videoDao.queryAllVideo(video);
	 }
		public List<Video> queryVideoByCid(int cid){// 鏍规嵁璇剧▼鏌ヨ棰�
			return videoDao.queryVideoByCid(cid);
		}

		public List<Video> queryAllVideo(){
			return videoDao.queryAllVideo();
		}

		public Video queryVideoById(int id) {
			return videoDao.queryVideoById(id);
		}

		public IVideoDao getVideoDao() {
			return videoDao;
		}

		public void setVideoDao(IVideoDao videoDao) {
			this.videoDao = videoDao;
		}
		public List<Video> queryVideosByTid(int tid){
			return videoDao.queryVideosByTid(tid);
		}


	
}
