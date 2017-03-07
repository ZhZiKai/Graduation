package com.cn.graduation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.graduation.dao.StudentDao;
import com.cn.graduation.model.Options;
import com.cn.graduation.model.Paper;
import com.cn.graduation.model.PaperStudent;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.Teacher;
import com.cn.graduation.service.StudentService;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Resource
	private StudentDao dao;
	
	@Override
	public Student login(Student one) {
		return dao.login(one);
	}
	
	@Override
	public List<Student> query() {
		return dao.query();
	}
	
	@Override
	public List queryPaper(Student student) {
		// TODO Auto-generated method stub
		return dao.queryPaper(student);
	}

	@Override
	public void chooseThesis(String pid, String sid) {
		// TODO Auto-generated method stub
		dao.chooseThesis(pid, sid);
	}

	@Override
	public Teacher queryTeacherByStudent(Student student) {
		// TODO Auto-generated method stub
		return dao.queryTeacherByStudent(student);
	}

	@Override
	public void addPaper(String name, String filePath, String sid,String sdid) {
		PaperStudent ps = dao.queryPaperStudent(sid,sdid);
		if(ps == null){
			dao.addPaper(name, filePath, sid, sdid);
		}else{
			dao.updatePaper(name,filePath,ps.getPsid());
		}
	}

	@Override
	public Paper getMyPaper(String sid) {
		return dao.getMyPaper(sid);
	}

	@Override
	public List<Options> getEvaluation(String sid) {
		// TODO Auto-generated method stub
		return dao.getEvaluation(sid);
	}

	@Override
	public List<PaperStudent> showPaperScore(String sid) {
		// TODO Auto-generated method stub
		return dao.getPaperScore(sid);
	}

	@Override
	public void updateInfo(Student one) {
		dao.updateInfo(one);
		
	}

	@Override
	public Student getStudentById(String sid) {
		// TODO Auto-generated method stub
		return dao.getStudentById(sid);
	}


}
