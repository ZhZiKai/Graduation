package com.cn.graduation.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cn.graduation.dao.TeacherDao;
import com.cn.graduation.model.Options;
import com.cn.graduation.model.Paper;
import com.cn.graduation.model.PaperStudent;
import com.cn.graduation.model.SpScore;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.SysDate;
import com.cn.graduation.model.Teacher;
import com.cn.graduation.model.TpScore;
import com.cn.graduation.service.TeacherService;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {

	@Resource
	private TeacherDao dao;
	@Override
	public void addPaper(String name, String path,String tid) {
		dao.addPaper(name,path,tid);
	}
	@Override
	public List<Paper> getMyPaper(String tid) {
		// TODO Auto-generated method stub
		return dao.getMyPaper(tid);
	}
	@Override
	@Transactional
	public void deletePaper(Paper paper) {
		// TODO Auto-generated method stub
		int row = dao.deletePaper(paper.getPid());
		if(row > 0){
			String filepath = paper.getFilepath();
			File file = new File(filepath);
			 if (file.exists() && file.isFile()) {  
				   if (file.delete()) {  
				    System.out.println("删除单个文件成功！");  
				   } else {  
				    System.out.println("删除单个文件失败！");  
				   }  
			} else {  
				   System.out.println("删除单个文件失败 不存在！");  
				  }  
		}
	}
	@Override
	public void updateInfo(Teacher one) {
		// TODO Auto-generated method stub
		dao.updateInfo(one);
	}
	@Override
	public Teacher getTeacherById(String tid) {
		// TODO Auto-generated method stub
		return dao.getTeacherById(tid);
	}
	@Override
	public List<Paper> getGroupPaper(Teacher user) {
		// TODO Auto-generated method stub
		return dao.getGroupPaper(user);
	}
	@Override
	public List<Student> getMyStudent(String tid) {
		// TODO Auto-generated method stub
		return dao.getMyStudent(tid);
	}
	@Override
	@Transactional
	//评价老师论题
	public int commentPaper(TpScore one) {
		int row = dao.commentPaper(one);
		float avg = dao.queryPaperScore(one);
		if(avg< 6.0){
			row = dao.updateTpaper("2",one.getPid());
		}else{
			row = dao.updateTpaper("3",one.getPid());
		}
		return row;
	}
	@Override
	public List<PaperStudent> getPaperBySid(String sid) {
		return dao.getPaperBySid(sid);
	}
	@Override
	public List<Student> getMyStudent2(String tid, String sdid) {
		return dao.getMyStudent2(tid,sdid);
	}
	@Override
	public int options(Options one) {
		return dao.addOptions(one);
	}
	@Override
	public List<Student> getGroupStudent(String gid, String sdid,String tid) {
		// TODO Auto-generated method stub
		return dao.getGroupStudent(gid,sdid,tid);
	}
	@Override
	@Transactional
	public int score(SpScore one) {
		int row = dao.commitScore(one);
		if(row > 0){
			row = dao.saveAvg(one.getPsid());//将每个老师的评分算出平均分然后保存到t_paperstudent表中
		}
		return row;
	}

}
