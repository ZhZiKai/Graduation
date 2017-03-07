package com.cn.graduation.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cn.graduation.common.AjaxObject;
import com.cn.graduation.model.Options;
import com.cn.graduation.model.Paper;
import com.cn.graduation.model.PaperStudent;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.SysDate;
import com.cn.graduation.model.Teacher;
import com.cn.graduation.service.StudentService;


@Controller
@RequestMapping(value="/yy/student/*")
public class StudentController {

	@Autowired
	@Qualifier("studentService")
	private StudentService service;
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request) {
		return "student/student";
	}
	
	@RequestMapping(value="/choosePaper")
	public String choosePaper(HttpServletRequest request) {
		Student student = (Student)request.getSession().getAttribute("admin");
		List papers = service.queryPaper(student);
		request.setAttribute("pid",student.getPid());
		request.setAttribute("papers", papers);
		return "student/student_choosepaper";
	}
	
	@RequestMapping(value="/chooseThesis")
	@ResponseBody
	public void chooseThesis(HttpServletRequest request, Paper one) {
		String sid = ((Student)request.getSession().getAttribute("admin")).getSid();
		String pid = request.getParameter("pid");
		service.chooseThesis(pid, sid);
	}
	
	
	@RequestMapping(value="/myTeacher")
	public String myTeacher(HttpServletRequest request) {
		System.out.println(123);
		Student student = (Student)request.getSession().getAttribute("admin");
		Teacher teacher = service.queryTeacherByStudent(student);
		request.setAttribute("teacher", teacher);
		return "student/teacher_information";
	}
	
	@RequestMapping(value="/mission")
	public String uploadPaperOnKaiti(HttpServletRequest request) {
		return "student/mission";
	}
	//显示我的论题
	@RequestMapping(value="/my_paper")
	public String showMyPaper(HttpServletRequest request) {
		Student student = (Student)request.getSession().getAttribute("admin");
		Paper paper = service.getMyPaper(student.getSid());
		request.setAttribute("paper", paper);
		return "student/my_paper";
	}
	//显示教师评价
	@RequestMapping(value="/teacherEvaluation")
	public String showEvaluation(HttpServletRequest request) {
		Student student = (Student)request.getSession().getAttribute("admin");
		List<Options> options = service.getEvaluation(student.getSid());
		request.setAttribute("options", options);
		return "student/teacherEvaluation";
	}
	
	//显示论文分数
		@RequestMapping(value="/paper_score")
		public String showPaperScore(HttpServletRequest request) {
			Student student = (Student)request.getSession().getAttribute("admin");
			List<PaperStudent> papers = service.showPaperScore(student.getSid());
			request.setAttribute("paperscore", papers);
			return "student/paper_score";
		}
	
	//下载论题
	@RequestMapping(value="/download_title")
	public void downloadTitle(HttpServletRequest request,HttpServletResponse response) {
		String fileName = request.getParameter("filename");
    	String userAgent = request.getHeader("User-Agent");
    	String filename = null;
    	int len = fileName.split("\\\\").length;
    	if (userAgent.contains("MSIE")||userAgent.contains("Trident")) {
    		try {
				filename = java.net.URLEncoder.encode(fileName.split("\\\\")[len-1], "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				filename = new String(fileName.split("\\\\")[len-1].getBytes("UTF-8"),"ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
        response.setCharacterEncoding("utf-8");  
        response.setContentType("multipart/form-data");  
        response.setHeader("Content-Disposition", "attachment;fileName="+filename);  
        try {  
            File file=new File(fileName);  
            InputStream inputStream=new FileInputStream(file);  
            OutputStream os=response.getOutputStream();  
            byte[] b=new byte[1024];  
            int length;  
            while((length=inputStream.read(b))>0){  
                os.write(b,0,length);  
            }  
            inputStream.close();  
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
	}
	
	//上传论文
	@RequestMapping(value="/upload_paper", method = RequestMethod.POST)
    @ResponseBody public Map<String, Object> uploadFile(HttpServletRequest request, @RequestParam(value="file", required=false) MultipartFile file){
    	Map<String,Object> resMap = new HashMap<String,Object>();
    	if(file == null){
    		resMap.put("result","系统出错！");
    	}else{
    		if(file.isEmpty()){
    			resMap.put("result","没有选择文件");
    		}else{
    			Student user =(Student) request.getSession().getAttribute("admin");
    			String path = user.getSid()+"--"+user.getName();
    			SysDate time = (SysDate)request.getSession().getAttribute("time");
    			String realPath = request.getSession().getServletContext().getRealPath("/file/student/"+path+"/"+time.getName());
    			String originFileName = user.getName()+"-"+file.getOriginalFilename();
    			            try {
    			                //这里使用Apache的FileUtils方法来进行保存
    			                FileUtils.copyInputStreamToFile(file.getInputStream(),new File(realPath, originFileName));
    			                resMap.put("result","success");
    			                String name = request.getParameter("title");
    			                //添加论文信息到数据库
    			                service.addPaper(name,realPath+"\\"+originFileName,user.getSid(),time.getSdid());
    			            } catch (IOException e) {
    			                resMap.put("result", "上传失败！");
    			                e.printStackTrace();
    			            }
    			        }
    		}
    	return resMap;
    }
	
	
    //退出
    @RequestMapping(value="out")
    public String out (HttpServletRequest request){
    	request.getSession().setAttribute("admin",null);
    	return "student/login";
    }
    //更改密码
	@RequestMapping(value="/update_pass")
	@ResponseBody
	public AjaxObject updatePass(HttpServletRequest request,Student one){
		service.updateInfo(one);
		return null;
	}
	//学生个人信息页面
	@RequestMapping(value="/own_information")
	public String ownIformation(HttpServletRequest request){
		return"/student/student_own_information";
	}
	//更新教师信息
	@RequestMapping(value="/update_info")
	public String updateInfo(HttpServletRequest request,Student one){
		service.updateInfo(one);
		one = service.getStudentById(one.getSid());
		request.getSession().setAttribute("admin", one);
		return"/student/student";
	}
}
