package com.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.ssh.bean.Student;
import com.ssh.bean.VideoSelection;
import com.ssh.dao.ifc.IVideoSelectionDao;

public class VideoSelectionDao extends BaseDao implements IVideoSelectionDao {
	public List<VideoSelection> queryHotVideo(VideoSelection videoSelection){//鏌ョ湅鍓嶅叚鐨勭儹闂ㄨ棰�
		session=getSession();
		Query query = session.createSQLQuery("select * from video_selection group by v_id  order by count(s_id) desc limit 3").addEntity(VideoSelection.class);
		@SuppressWarnings("unchecked")
		List<VideoSelection> videoSelections =query.list();
		return videoSelections;
	}
	
	public VideoSelection queryVideoSelectionById(int id){
		VideoSelection videoSelection = new VideoSelection();
		videoSelection = (VideoSelection) getOne(videoSelection, id);
		return videoSelection;
	}
	
	 public List<VideoSelection> queryVideoSelectionBySidViD(int vid,int sid) {//鏍规嵁sid,vid鏌ヨVideoSelection
		 session = getSession();
			Query query = session.createSQLQuery("select * from video_selection where v_id = "+vid+" and s_id ="+sid).addEntity(VideoSelection.class);
			@SuppressWarnings("unchecked")
			List<VideoSelection> videoSelections =query.list();
			return videoSelections;
	}
	 public List<VideoSelection> queryVideoSelectionBySid(int sid) {//鏍规嵁sid,vid鏌ヨVideoSelection
		 session = getSession();
		 @SuppressWarnings("unchecked")
		List<VideoSelection> videoSelections = session.createCriteria(VideoSelection.class)
					.add(Restrictions.eq("studentId", sid)).list();
			return videoSelections;
	 }
	
	 public int addVideoSelection(VideoSelection videoSelection) {//鎻掑叆瑙嗛瑙傜湅璁板綍
		 session=getSession();
			return save(videoSelection);
		 
	 }
	 
	public boolean alertVideoSelection(VideoSelection videoSelection) {//淇敼瑙嗛VideoSelection绉�
		session=getSession();
		return update(videoSelection);
	}
	@SuppressWarnings("unchecked")
	public List<VideoSelection> queryStudentNums(int id) {
		session=getSession();
		List<VideoSelection> videoSelections =session.createCriteria(VideoSelection.class)
				.add(Restrictions.eq("videoId",id)).list();
		return videoSelections;
	}
	
}
