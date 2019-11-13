package com.ssh.service;

import java.util.List;


import com.ssh.bean.VideoSelection;

import com.ssh.dao.ifc.IVideoSelectionDao;
import com.ssh.service.ifc.IVideoSelectionService;

public class VideoSelectionService  implements IVideoSelectionService {
	private IVideoSelectionDao videoSelectionDao;
	public List<VideoSelection> queryHotVideo(VideoSelection videoSelection){
		return videoSelectionDao.queryHotVideo(videoSelection);
	}
	public int addVideoSelection(VideoSelection videoSelection) {
		return videoSelectionDao.addVideoSelection(videoSelection);
	}
	public VideoSelection queryVideoSelectionById(int id) {
		return videoSelectionDao.queryVideoSelectionById(id);
	}
	public List<VideoSelection> queryVideoSelectionBySidViD(int vid,int sid){
		return videoSelectionDao.queryVideoSelectionBySidViD(vid, sid);
	}
	public boolean alertVideoSelection(VideoSelection videoSelection) {
		return videoSelectionDao.alertVideoSelection(videoSelection);
	}
	 public List<VideoSelection> queryVideoSelectionBySid(int sid){
		 return videoSelectionDao.queryVideoSelectionBySid(sid);
	 }
	
	public IVideoSelectionDao getVideoSelectionDao() {
		return videoSelectionDao;
	}
	public void setVideoSelectionDao(IVideoSelectionDao videoSelectionDao) {
		this.videoSelectionDao = videoSelectionDao;
	}
	public List<VideoSelection> queryStudentNums(int id){
		return videoSelectionDao.queryStudentNums(id);
	}
	
}
