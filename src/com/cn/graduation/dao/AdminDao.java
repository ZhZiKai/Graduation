package com.cn.graduation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cn.graduation.model.Group;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.SysDate;
import com.cn.graduation.model.Teacher;

public interface AdminDao {

	public Teacher queryPage(Teacher one);
	
	public List<Teacher> getAllQueryPage(@Param("startPos")int startPos, @Param("pageSize")int pageSize);

	public List<Student> getAllStudentPage(@Param("startPos")int startPos, @Param("pageSize")int pageSize);

	public void insert(Teacher one);

	public Teacher queryAccount(@Param("account") String account);

	public long getStudentCount();
	
	public long getTeacherCount();

	public int insertStudent(Student student);
	
	public void insertTeacher(Teacher teacher);

	public Student queryStudent(Student student);
	
	public Student queryStudentBySid(Student student);

	public List getAllDate();

	public int insertTime(SysDate one);

	public List queryGroup();

	public void updateGroup(@Param("name")String name, @Param("ids")String ids);

	public void insertGroupName(@Param("name") String name);

	public void updateStudent(@Param("name") String name, @Param("sids") String sids);
	
	public void updateStudentBySid(Student one);

	public List getSomeTeacherPage(@Param("startPos") int startPos, @Param("pageSize") int pageSize);

	public List getSomeStudentPage(@Param("startPos") int startPos, @Param("pageSize") int pageSize);

	public List queryTeacherByGid(@Param("gid") String gid);

	public List queryStudentByGid(@Param("gid") String gid);

	public List queryTeacherStudent();

	public List distributeStudent();

	public String getCountStudent(@Param("tid") String tid);

	public List distributeStudentPage(@Param("startPos") int startPos, @Param("pageSize")int pageSize);

	public long getStudentCountByTeacher();

	public long getStudentCountByGroup();

	public long getTeacherCountByGroup();

	public void confirmStudent(@Param("account") String account, @Param("sids") String sids);

	public Teacher queryTeacher(Teacher one);

	public void updateTeacher(Teacher one);

	public List queryStudentByTid(Teacher one);

	public void deleteTeacher(Teacher one);
	
	public void deleteStudent(Student one);
	
	public void deleteDistribution(Teacher one);
	
	public List showMyStudent(Teacher one);

	public void updateStudentTeacher(Student student);

	public List getGroupTeacher(Group group);

	public List getGroupStudent(Group group);

	public void deleteTeacherGroup(Teacher teacher);

	public void deleteStudentGroup(Student student);

	public SysDate queryTime(SysDate one);

	public void updateTime(SysDate one);

	public void deleteTime(SysDate one);

	public void deleteGroup();

	public void deleteGroupById(Group one);


}
