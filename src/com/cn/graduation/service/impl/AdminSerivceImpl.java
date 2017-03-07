package com.cn.graduation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.graduation.common.AjaxObject;
import com.cn.graduation.dao.AdminDao;
import com.cn.graduation.dao.CommonDao;
import com.cn.graduation.model.Group;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.SysDate;
import com.cn.graduation.model.Teacher;
import com.cn.graduation.service.AdminService;

@Service("adminService")
public class AdminSerivceImpl implements AdminService {

	@Resource 
	private AdminDao dao;
	@Resource
	private CommonDao commondao;
	
	@Override
	public Teacher query(Teacher one) {
		// TODO Auto-generated method stub
		return commondao.queryAdmin(one);
	}

	@Override
	public List<Teacher> getAllTeacher(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getAllQueryPage(startPos, pageSize);
	}

	@Override
	public List<Student> getAllStudent(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getAllStudentPage(startPos, pageSize);
	}

	@Override
	public AjaxObject ajax_insert(Teacher one) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		String account = one.getAccount();
		Teacher teacher = dao.queryAccount(account);
		if(teacher !=null) {
			ajax.setStatusCode("301");
			ajax.setMessage("工号重复，请重新输入");
		}else{
			try{
				dao.insert(one);
				ajax.setStatusCode("200");
				ajax.setMessage("插入成功");
			}catch(Exception e){
				ajax.setMessage(e.getMessage());
			}
		}
		
		return ajax;
	}

	@Override
	public long getTeacherCount() {
		// TODO Auto-generated method stub
		return dao.getTeacherCount();
	}

	@Override
	public long getStudentCount() {
		// TODO Auto-generated method stub
		return dao.getStudentCount();
	}

	@Override
	public AjaxObject insertStudent(Student student) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		Student one = dao.queryStudent(student);
		if(one != null) {
			ajax.setStatusCode("301");
			ajax.setMessage("学号重复，请重新输入");
		}else{
			try{
				dao.insertStudent(student);
				ajax.setStatusCode("200");
				ajax.setMessage("插入成功");
			}catch(Exception e) {
				ajax.setMessage(e.getMessage());
			}
			
		}
		return ajax;
		
	}
	
	@Override
	public AjaxObject insertTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		Teacher one = dao.queryTeacher(teacher);
		if(one != null) {
			ajax.setStatusCode("301");
			ajax.setMessage("工号重复，请重新输入");
		}else{
			try{
				dao.insertTeacher(teacher);
				ajax.setStatusCode("200");
				ajax.setMessage("插入成功");
			}catch(Exception e) {
				ajax.setMessage(e.getMessage());
			}
		}
		return ajax;		
	}

	public void addStudent(Student student){
		Student one = dao.queryStudent(student);
		if(one == null){
			dao.insertStudent(student);
		}
	}
	@Override
	public List getAllDate() {
		// TODO Auto-generated method stub
		return dao.getAllDate();
	}

	@Override
	public AjaxObject insertTime(SysDate one) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		try {
			dao.insertTime(one);
			ajax.setStatusCode("200");
			ajax.setMessage("插入成功");
		}catch(Exception e) {
			ajax.setMessage(e.getMessage());
		}
		return ajax;
	}

	@Override
	public List getAllGroup() {
		// TODO Auto-generated method stub
		List list = dao.queryGroup();
		return list;
	}
	
	//讲字符串数组转化为int类型数组
	public int[] changeInt(String[] str) {
		int[] ids = new int[str.length];
		for(int i = 0; i < ids.length; i++) {
			ids[i] = Integer.parseInt(str[i]);
		}
		return ids;
	}

	@Override
	public List getSomeTeacher(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getSomeTeacherPage(startPos, pageSize);
	}

	@Override
	public List getSomeStudent(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getSomeStudentPage(startPos, pageSize);
	}

	@Override
	public List showdistribution() {
		// TODO Auto-generated method stub
		List list = dao.queryTeacherStudent();
		return list;
	}

	@Override
	public List distributeStudent() {
		// TODO Auto-generated method stub
		List list = dao.distributeStudent();
		
		return list;
	}

	@Override
	public List distributeStudent(int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return dao.distributeStudentPage(startPos, pageSize);
	}

	@Override
	public long getStudentCountByTeacher() {
		// TODO Auto-generated method stub
		return dao.getStudentCountByTeacher();
	}

	@Override
	public long getStudentCountByGroup() {
		// TODO Auto-generated method stub
		return dao.getStudentCountByGroup();
	}

	@Override
	public long getTeacherCountByGroup() {
		// TODO Auto-generated method stub
		return dao.getTeacherCountByGroup();
	}
	@Override
	public AjaxObject confirmStudent(String account, String sids) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		dao.confirmStudent(account,sids);
		ajax.setStatusCode("200");
		return ajax;
	}

	@Override
	public Teacher queryTeacher(Teacher one) {
		// TODO Auto-generated method stub
		return dao.queryTeacher(one);
	}
	
	@Override
	public Student queryStudent(Student one) {
		// TODO Auto-generated method stub
		return dao.queryStudentBySid(one);
	}

	@Override
	public AjaxObject modifyTeacher(Teacher one) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		try {
			dao.updateTeacher(one);	
		}catch(Exception e) {
			ajax.setStatusCode("301");
		}
		return ajax;
	}

	@Override
	public AjaxObject modifyStudent(Student one) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		try {
			dao.updateStudentBySid(one);
		}catch(Exception e) {
			ajax.setStatusCode("301");
		}
		return ajax;
	}
	
	@Override
	public AjaxObject deleteTeacher(Teacher one) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		List student = dao.queryStudentByTid(one);
		if(student.size() > 0) {
			ajax.setStatusCode("301");
			ajax.setMessage("该老师已经分配过学生，不能被删除");
		}else {
			dao.deleteTeacher(one);
			ajax.setStatusCode("200");
			ajax.setMessage("请求成功");
		}
		return ajax;
	}
	
	@Override
	public void deleteStudent(Student one) {		
		dao.deleteStudent(one);			
	}

	@Override
	public void deleteDistribution(Teacher one) {
		// TODO Auto-generated method stub
		dao.deleteDistribution(one);
	}

	@Override
	public List getMyStudent(Teacher one) {
		// TODO Auto-generated method stub
		return dao.showMyStudent(one);
	}

	@Override
	public void updateStudentTeacher(Student student) {
		// TODO Auto-generated method stub
		dao.updateStudentTeacher(student);
	}

	@Override
	public List showGroupTeacher(Group group) {
		// TODO Auto-generated method stub
		return dao.getGroupTeacher(group);
	}

	@Override
	public List showGroupStudent(Group group) {
		// TODO Auto-generated method stub
		return dao.getGroupStudent(group);
	}

	@Override
	public void removeTeacherGroup(Teacher teacher) {
		// TODO Auto-generated method stub
		dao.deleteTeacherGroup(teacher);
	}

	@Override
	public void removeStudentGroup(Student student) {
		// TODO Auto-generated method stub
		dao.deleteStudentGroup(student);
	}

	@Override
	public void insertGroupName(String name) {
		// TODO Auto-generated method stub
		dao.insertGroupName(name);
	}

	@Override
	public void insertGroupTeacher(String name, String ids) {
		// TODO Auto-generated method stub
		dao.updateGroup(name, ids);
	}

	@Override
	public void insertGroupStudent(String name, String sids) {
		// TODO Auto-generated method stub
		dao.updateStudent(name, sids);
	}

	@Override
	public SysDate getTime(SysDate one) {
		// TODO Auto-generated method stub
		return dao.queryTime(one);
	}

	@Override
	public void updateTime(SysDate one) {
		// TODO Auto-generated method stub
		dao.updateTime(one);
	}

	@Override
	public AjaxObject clearTime(SysDate one) {
		// TODO Auto-generated method stub
		AjaxObject ajax = new AjaxObject();
		try {
			dao.deleteTime(one);
			ajax.setStatusCode("200");
		}catch(Exception e ) {
			ajax.setMessage(e.getMessage());
		}
		return ajax;
	}

	@Override
	public void freshGroup() {
		// TODO Auto-generated method stub
		dao.deleteGroup();
	}

	@Override
	public void deleteGroup(Group one) {
		// TODO Auto-generated method stub
		dao.deleteGroupById(one);
	}

}
