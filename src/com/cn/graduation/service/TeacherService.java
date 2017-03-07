package com.cn.graduation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cn.graduation.model.Options;
import com.cn.graduation.model.Paper;
import com.cn.graduation.model.PaperStudent;
import com.cn.graduation.model.SpScore;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.Teacher;
import com.cn.graduation.model.TpScore;

@Service
public interface TeacherService {

	public void addPaper(String name, String path, String tid);

	public List<Paper> getMyPaper(String tid);

	public void deletePaper(Paper paper);

	public void updateInfo(Teacher one);
	
	public Teacher getTeacherById(String tid);

	public List<Paper> getGroupPaper(Teacher user);

	public List<Student> getMyStudent(String tid);

	public int commentPaper(TpScore one);

	public List<PaperStudent> getPaperBySid(String sid);

	public List<Student> getMyStudent2(String tid, String sdid);

	public int options(Options one);

	public List<Student> getGroupStudent(String gid, String sdid, String tid);

	public int score(SpScore one);
}
