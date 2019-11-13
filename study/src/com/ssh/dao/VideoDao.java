package com.ssh.dao;

import java.util.List;

import org.hibernate.Criteria;

import org.hibernate.criterion.Restrictions;

import com.ssh.bean.Course;
import com.ssh.bean.Video;

import com.ssh.dao.ifc.IVideoDao;

public class VideoDao extends BaseDao implements IVideoDao{
  public int addVideo(Video video) {//娣诲姞瑙嗛
	  session=getSession();
	  return save(video);
  }
  public boolean alertVideo(Video video) {//娣诲姞瑙嗛
	  session=getSession();
	  return update(video);
  }
  public List<Video> queryVideoByCid(int cid){//鏍规嵁璇剧▼鏌ヨ棰�
		session=getSession();
		Criteria criteria=session.createCriteria(Video.class);
		criteria.add(Restrictions.eq("cid", cid));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		@SuppressWarnings("unchecked")
		List<Video> videos=criteria.list();
			return videos;
	}
  
  public List<Video> queryAllVideo(Video video) {//鏉′欢鏌ヨ
		session=getSession();
		Criteria criteria=session.createCriteria(Video.class)
				 .add(Restrictions.like("videoName","%"+video.getVideoName()+"%"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
				 @SuppressWarnings("unchecked")
				List<Video> videos=criteria.list();
				 return videos;
	}
  public List<Video> queryAllVideoByStu(Video video) {//鏉′欢鏌ヨ
	  session=getSession();
	  Criteria criteria=session.createCriteria(Video.class)
			  .add(Restrictions.like("videoName","%"+video.getVideoName()+"%"))
			  .add(Restrictions.eq("videoStatu", 1));
	  criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
	  @SuppressWarnings("unchecked")
	  List<Video> videos=criteria.list();
	  return videos;
  }
  
  public List<Video> queryAllVideo() {//鏌ヨ鎵�鏈�
		session = getSession();
		@SuppressWarnings("unchecked")
		List<Video> videos = session.createCriteria(Video.class).list();
		return videos;
	}
  public List<Video> queryAllVideoByStu() {//鏌ヨ鎵�鏈�
	  session = getSession();
	  @SuppressWarnings("unchecked")
	  List<Video> videos = session.createCriteria(Video.class).add(Restrictions.eq("videoStatu", 1)).list();
	  return videos;
  }
	public Video queryVideoById(int id) {//鏍规嵁id鏌ヨ瑙嗛
		Video video = new Video();
		video = (Video) getOne(video, id);
		return video;
	}
	@SuppressWarnings("unchecked")
	public List<Video> queryVideosByTid(int uid){
		session=getSession();
		List<Video> videos=session.createCriteria(Video.class)
			
				.add(Restrictions.eq("uid", uid)).list();
		return videos;
	}
	public boolean deleteVideo(Video video) {
		// TODO Auto-generated Video stub
		return delete(video);
	}}
