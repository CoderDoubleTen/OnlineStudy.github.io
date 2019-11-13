package com.ssh.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptot implements Interceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String intercept(ActionInvocation intercept) throws Exception {
		ActionContext ac=intercept.getInvocationContext();
		  String student=(String)ac.getSession().get("studentName");
		  String userinfo=(String)ac.getSession().get("userName");
		  if(student!=null&&student.length()>0||userinfo!=null&&userinfo.length()>0) {
			  intercept.invoke();
		  }
		return "login";
	}

}
