package com.ssh.dao.ifc;

import java.util.List;

import com.ssh.bean.Comment;

public interface ICommentDao {
	public List<Comment> queryAllComment();//查询所有comment
	public List<Comment> queryAllCommentByIndex(int index,int v_id);//根据index查询comment
	public Comment queryCommentById(int id);//根据id查询comment
	public int addComment(Comment comment);//添加评论
}
