package com.cn.graduation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.graduation.model.Options;
import com.cn.graduation.model.Paper;
import com.cn.graduation.model.PaperStudent;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.Teacher;

public interface StudentDao {
	public Student login(Student one);
	public List<Student> query();
	public List queryPaper(Student student);
	public void chooseThesis(@Param("pid") String pid, @Param("sid") String sid);
	public Teacher queryTeacherByStudent(Student student);
	public void addPaper(@Param("title")String name, @Param("filepath")String filePath, @Param("sid")String sid,@Param("sdid")String sdid);
	public String getTitleBySid(@Param("sid")String sid);
	public PaperStudent queryPaperStudent(@Param("sid")String sid, @Param("sdid")String sdid);
	public void updatePaper(@Param("title")String name, @Param("filepath")String filePath, @Param("psid")String psid);
	public Paper getMyPaper(@Param("sid")String sid);
	public List<Options> getEvaluation(@Param("sid")String sid);
	public List<PaperStudent> getPaperScore(@Param("sid")String sid);
	public void updateInfo(Student one);
	public Student getStudentById(@Param("sid")String sid);
}
