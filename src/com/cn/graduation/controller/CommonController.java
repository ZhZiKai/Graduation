package com.cn.graduation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.graduation.common.AjaxObject;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.SysDate;
import com.cn.graduation.model.Teacher;
import com.cn.graduation.service.CommonService;

@Controller
@RequestMapping(value="/comm/*")
public class CommonController {
	@Autowired
	@Qualifier("commonService")
	private CommonService service;
	
	@RequestMapping(value="/student")
	public String student(){
		return "student/login";
	}
	@RequestMapping(value="/teacher")
	public String teacher(){
		return "teacher/teacher_login";
	}
	@RequestMapping(value="/login_teacher")
	@ResponseBody
	public AjaxObject loginTeacher(HttpServletRequest request, Teacher admin) {
		AjaxObject ajax = new AjaxObject();
		admin = service.loginTeacher(admin);
		if(admin != null) {
			request.getSession().setAttribute("admin", admin);
			SysDate sys = service.getSysDate();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date now = df.parse(df.format(new Date()));
				Date ss  = df.parse(sys.getEnd_time());
				if(now.getTime()==ss.getTime()){
					request.getSession().setAttribute("endtime", "1");
				}else{
					request.getSession().setAttribute("endtime", "0");
				}
				request.getSession().setAttribute("time", sys);
				ajax.setStatusCode("200");
				ajax.setMessage("登录成功");
			} catch (ParseException e) {
				ajax.setStatusCode("500");
				ajax.setMessage(e.getMessage());
				e.printStackTrace();
			}
			
		}else{
			ajax.setStatusCode("500");
			ajax.setMessage("登录错误，用户名或密码错误");
		}
		return ajax;
	}
	
	@RequestMapping(value="/login_student")
	@ResponseBody
	public AjaxObject loginStudent(HttpServletRequest request, Student one) {
		AjaxObject ajax = new AjaxObject();
		one = service.loginStudent(one);
		if(one != null) {
			SysDate sys = service.getSysDate();
			if(sys !=null){
				if(sys.getName().equals("上传论题")){
					ajax.setStatusCode("500");
					ajax.setMessage("当前时间不能登录！");
				}else{
					request.getSession().setAttribute("admin", one);
					request.getSession().setAttribute("time", sys);
					ajax.setStatusCode("200");
					ajax.setMessage("登录成功");
				}
			}else{
				ajax.setStatusCode("500");
				ajax.setMessage("系统未开放");
			}
			
		}else{
			ajax.setStatusCode("301");
			ajax.setMessage("用户名或密码错误");
		}
		return ajax;
	}
}
