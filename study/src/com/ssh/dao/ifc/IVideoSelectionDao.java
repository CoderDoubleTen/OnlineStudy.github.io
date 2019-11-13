package com.ssh.dao.ifc;

import java.util.List;


import com.ssh.bean.VideoSelection;

public interface IVideoSelectionDao {
	public List<VideoSelection> queryHotVideo(VideoSelection videoSelection);
	public VideoSelection queryVideoSelectionById(int id);
	public int addVideoSelection(VideoSelection videoSelection);
	public List<VideoSelection> queryVideoSelectionBySidViD(int vid,int sid);
	public boolean alertVideoSelection(VideoSelection videoSelection) ;
	 public List<VideoSelection> queryVideoSelectionBySid(int sid);
	 public List<VideoSelection> queryStudentNums(int id);
}
