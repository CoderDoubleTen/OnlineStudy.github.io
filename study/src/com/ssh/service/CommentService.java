package com.ssh.service;

import java.util.List;

import com.ssh.bean.Comment;
import com.ssh.dao.ifc.ICommentDao;
import com.ssh.service.ifc.ICommentService;

public class CommentService implements ICommentService{
	private ICommentDao  commentDao;
	public List<Comment> queryAllComment(){
		return commentDao.queryAllComment();
	}
	public List<Comment> queryAllCommentByIndex(int index,int v_id){
		return commentDao.queryAllCommentByIndex(index,v_id);
	}
	public int addComment(Comment comment) {
		return commentDao.addComment(comment);
	}
	public Comment queryCommentById(int id) {
		return commentDao.queryCommentById(id);
	}
	public ICommentDao getCommentDao() {
		return commentDao;
	}
	public void setCommentDao(ICommentDao commentDao) {
		this.commentDao = commentDao;
	}
	

}
