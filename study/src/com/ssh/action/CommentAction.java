package com.ssh.action;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.bean.Comment;
import com.ssh.bean.CommentForPage;
import com.ssh.bean.CommentForPage2;

import com.ssh.service.ifc.ICommentService;

@SuppressWarnings("serial")
public class CommentAction extends ActionSupport {
	private Comment comment;
	private CommentForPage commentForPage;
	private CommentForPage2 commentForPage2;
	private List<CommentForPage> commentForPages;
	private List<CommentForPage2> commentForPages2;
	private List<Comment> comments;
	private ICommentService commentService;

	public String queryCommentByVideo() {
		int vid=(int) ActionContext.getContext().getSession().get("vid");
		String tm="";
		int ind=0;
		comments = commentService.queryAllCommentByIndex(0,vid);//查询一级标题
		System.out.println("comments"+comments.size());
		commentForPages = new ArrayList<CommentForPage>();
		for (int i = 0; i < comments.size(); i++) {
			commentForPage = new CommentForPage();
			
			/*tm=comments.get(i).getComment_time();
			ind=tm.lastIndexOf(".");
			comments.get(i).setComment_time(tm.substring(0,ind));*/
			
			commentForPage.setComment1(comments.get(i));
		/*	List<Comment> comments2=new ArrayList<Comment>();
			 comments2 = commentService.queryAllCommentByIndex(comments.get(i).getComment_id(),vid);//二级评论列表
			 
			System.out.println(comments2.size());
			  commentForPages2=new ArrayList<CommentForPage2>();
			  for(int j=0;j<comments2.size();j++) {
				  commentForPage2=new CommentForPage2();
				  tm=comments2.get(j).getComment_time();
					ind=tm.lastIndexOf(".");
					comments2.get(j).setComment_time(tm.substring(0,ind));
				  commentForPage2.setComment2(comments2.get(j));
				  List<Comment> comments3=new ArrayList<Comment>();
				  comments3= commentService.queryAllCommentByIndex(comments2.get(j).getComment_id(),vid);
				  for(int f=0;f<comments3.size();f++) {			  
					  tm=comments3.get(f).getComment_time();
						ind=tm.lastIndexOf(".");
						comments3.get(f).setComment_time(tm.substring(0,ind));		  
					  commentForPage2.setComments3(comments3);
				  }
				  commentForPages2.add(commentForPage2);
			  commentForPage.setCommentForPages2(commentForPages2);
			  }*/
				
			commentForPages.add(commentForPage);
		}

		return SUCCESS;
	}

	public String addComment() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());
		System.out.println(time);// new Date()为获取当前系统时间
	comment.setComment_time(time);
		int i=commentService.addComment(comment);
		if(i>0) {
		return SUCCESS;
		}else {
			return INPUT;
		}
	}
	
	
	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public ICommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

	public CommentForPage getCommentForPage() {
		return commentForPage;
	}

	public void setCommentForPage(CommentForPage commentForPage) {
		this.commentForPage = commentForPage;
	}

	public List<CommentForPage> getCommentForPages() {
		return commentForPages;
	}

	public void setCommentForPages(List<CommentForPage> commentForPages) {
		this.commentForPages = commentForPages;
	}

	public List<CommentForPage2> getCommentForPages2() {
		return commentForPages2;
	}

	public void setCommentForPages2(List<CommentForPage2> commentForPages2) {
		this.commentForPages2 = commentForPages2;
	}

	public CommentForPage2 getCommentForPage2() {
		return commentForPage2;
	}

	public void setCommentForPage2(CommentForPage2 commentForPage2) {
		this.commentForPage2 = commentForPage2;
	}


	

}
