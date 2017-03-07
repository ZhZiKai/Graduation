package com.cn.graduation.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.graduation.dao.CommonDao;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.SysDate;
import com.cn.graduation.model.Teacher;
import com.cn.graduation.service.CommonService;
@Service("commonService")
public class CommonServiceImpl implements CommonService {

	@Resource
	private CommonDao dao;
	@Override
	public Teacher loginTeacher(Teacher one) {
		return dao.loginTeacher(one);
	}
	@Override
	public Student loginStudent(Student one) {
		// TODO Auto-generated method stub
		return dao.loginStudent(one);
	}
	@Override
	public SysDate getSysDate() {
		// TODO Auto-generated method stub
		return dao.getNowDate();
	}

}
