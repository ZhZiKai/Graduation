package com.cn.graduation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cn.graduation.model.Options;
import com.cn.graduation.model.Paper;
import com.cn.graduation.model.PaperStudent;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.Teacher;

@Service
public interface StudentService {
	public Student login(Student one);
	public List<Student> query();
	public List queryPaper(Student student);
	public void chooseThesis(String pid, String sid);
	public Teacher queryTeacherByStudent(Student student);
	public void addPaper(String name, String filePath, String sid, String sdid);
	public Paper getMyPaper(String sid);
	public List<Options> getEvaluation(String sid);
	public List<PaperStudent> showPaperScore(String sid);
	public void updateInfo(Student one);
	public Student getStudentById(String sid);
}
