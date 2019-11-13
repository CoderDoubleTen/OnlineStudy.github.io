package com.ssh.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.ssh.bean.Comment;
import com.ssh.dao.BaseDao;
import com.ssh.dao.ifc.ICommentDao;

public class CommentDao extends BaseDao implements ICommentDao{
	public List<Comment> queryAllComment() {//查询所有评论
		session=getSession();
		@SuppressWarnings("unchecked")
		List<Comment> comments = session.createCriteria(Comment.class).list();
		return comments;
	}
	public List<Comment> queryAllCommentByIndex(int index,int v_id){//根据index进行查询
		session=getSession();
		Criteria criteria=session.createCriteria(Comment.class);
		criteria.add(Restrictions.eq("comment_index", index));
		criteria.addOrder(Order.desc("comment_time"));
		criteria.createCriteria("video", "vid").add(Restrictions.eq("vid.v_id",v_id));
	
		@SuppressWarnings("unchecked")
		List<Comment> comments =criteria.list();
		return comments;
	}
	public Comment queryCommentById(int id) {//根据id查询
		Comment comment = new Comment();
		comment = (Comment) getOne(comment, id);
		return comment;
	}	
	
	public int addComment(Comment comment) {
		session=getSession();
		return save(comment);
				
	}
}
