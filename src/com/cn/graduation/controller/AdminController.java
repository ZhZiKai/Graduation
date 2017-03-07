package com.cn.graduation.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cn.graduation.common.AjaxObject;
import com.cn.graduation.common.PageParameter;
import com.cn.graduation.file.ExcelReader;
import com.cn.graduation.model.Group;
import com.cn.graduation.model.Student;
import com.cn.graduation.model.SysDate;
import com.cn.graduation.model.Teacher;
import com.cn.graduation.service.AdminService;
import com.cn.graduation.service.TeacherService;

@Controller
@RequestMapping(value = "/yy/admin/*")
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	
	@Autowired
	@Qualifier("teacherService")
	private TeacherService  service_t;
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, Teacher admin, Integer pageNow) {
		admin = (Teacher) request.getSession().getAttribute("admin");
		/*
		PageParameter page = null;
		List list = null;
		int totalCount = (int)service.getTeacherCount();
		if(pageNow != null) {
			page = new PageParameter(pageNow, totalCount);
			list = service.getAllTeacher(page.getStartPos(),page.getPageSize());
		}else{
			page = new PageParameter(1, totalCount);
			list = service.getAllTeacher(page.getStartPos(), page.getPageSize());
		request.setAttribute("list", list);
		request.setAttribute("page",page);
		 * PageParameter page = null; List list = null; int totalCount =
		 * (int)service.getTeacherCount(); if(pageNow != null) { page = new
		 * PageParameter(pageNow, totalCount); list =
		 * service.getAllTeacher(page.getStartPos(),page.getPageSize()); }else{
		 * page = new PageParameter(1, totalCount); list =
		 * service.getAllTeacher(page.getStartPos(), page.getPageSize()); }
		 * request.setAttribute("list", list);
		 * request.setAttribute("page",page);
		 */
		request.setAttribute("name", admin.getName());
		return "admin/admin";
	}
	
	//退出
	@RequestMapping(value="/quit")
	public String quit(HttpServletRequest request) {
		request.getSession().removeAttribute("adimin");
		return "admin/admin_login";
	}

	@RequestMapping(value = "/teacherInfo")
	public String teacherManage(HttpServletRequest request, Integer pageNow) {
		PageParameter page = null;
		List list = null;
		int totalCount = (int) service.getTeacherCount();
		if (pageNow != null) {
			page = new PageParameter(pageNow, totalCount);
			list = service.getAllTeacher(page.getStartPos(), page.getPageSize());
		} else {
			page = new PageParameter(1, totalCount);
			list = service.getAllTeacher(page.getStartPos(), page.getPageSize());
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		return "admin/admin_teacher";
	}

	// 跳转到添加老师页面
	@RequestMapping(value = "/addTeacher")
	public String addTeacher(HttpServletRequest request) {
		return "admin/admin_addTeacher";
	}

	// 通过id获得老师对象
	@RequestMapping(value = "/getTeacher")
	@ResponseBody
	public Teacher getTeacher(HttpServletRequest request, Teacher one) {
		one = service.queryTeacher(one);
		return one;
	}

	// ajax添加老师
	@RequestMapping(value = "/insertTeacher")
	@ResponseBody
	public AjaxObject insertTeacher(HttpServletRequest request, Teacher one) {
		return service.insertTeacher(one);
	}

	// ajax更新老师数据
	@RequestMapping(value = "/modifyTeacher")
	@ResponseBody
	public AjaxObject modifyTeacher(HttpServletRequest request, Teacher one) {
		return service.modifyTeacher(one);
	}

	// ajax删除老师
	@RequestMapping(value = "/deleteTeacher")
	@ResponseBody
	public AjaxObject deleteTeacher(HttpServletRequest request, Teacher one) {
		return service.deleteTeacher(one);
	}

	@RequestMapping(value = "/studentInfo")
	public String studentInfo(HttpServletRequest request, Integer pageNow) {
		PageParameter page = null;
		List list = null;
		int totalCount = (int) service.getStudentCount();
		if (pageNow != null) {
			page = new PageParameter(pageNow, totalCount);
			list = service.getAllStudent(page.getStartPos(), page.getPageSize());
		} else {
			page = new PageParameter(1, totalCount);
			list = service.getAllStudent(page.getStartPos(), page.getPageSize());
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		return "admin/admin_student";
	}

	@RequestMapping(value = "/addStudent")
	public String addStudent(HttpServletRequest request) {
		return "admin/admin_addStudent";
	}

	// ajax更新学生数据
	@RequestMapping(value = "/modifyStudent")
	@ResponseBody
	public AjaxObject modifyStudent(HttpServletRequest request, Student one) {
		return service.modifyStudent(one);
	}

	@RequestMapping(value = "/insertStudent")
	@ResponseBody
	public AjaxObject insertStudent(HttpServletRequest request, Student student) {
		return service.insertStudent(student);
	}

	// 通过id获得学生对象
	@RequestMapping(value = "/getStudent")
	@ResponseBody
	public Student getStudent(HttpServletRequest request, Student one) {
		one = service.queryStudent(one);
		return one;
	}

	// ajax删除学生
	@RequestMapping(value = "/deleteStudent")
	@ResponseBody
	public void deleteStudent(HttpServletRequest request, Student one) {
		service.deleteStudent(one);
	}

	// 跳转到管理时间页面
	@RequestMapping(value = "/timeInfo")
	public String timeInfo(HttpServletRequest request) {
		List list = service.getAllDate(); // 获取所有系统时间
		request.setAttribute("list", list);
		return "admin/admin_time";
	}

	//修改时间
	@RequestMapping(value="/modifyTime")
	@ResponseBody
	public void modifyTime(HttpServletRequest request, SysDate one) {
		service.updateTime(one);
	}
	
	//清楚时间
	@RequestMapping(value="/clearTime")
	@ResponseBody
	public AjaxObject clearTime(HttpServletRequest request, SysDate one) {
		return service.clearTime(one);
	}
	
	// 跳转到设置时间页面
	@RequestMapping(value = "/setTime")
	public String modifyTime(HttpServletRequest request) {
		List list = service.getAllDate();
		request.setAttribute("list", list);
		return "admin/admin_settime";
	}

	@RequestMapping(value = "/insertTime")
	@ResponseBody
	public AjaxObject insertTime(HttpServletRequest request, SysDate one) {
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		String sdid = request.getParameter("sdid");
		one.setBegin_time(begin_time);
		one.setEnd_time(end_time);
		one.setSdid(sdid);
		return service.insertTime(one);
	}

	@RequestMapping(value = "/groupInfo")
	public String groupInfo(HttpServletRequest request) {
		List list = service.getAllGroup();
		request.setAttribute("list", list);
		return "admin/admin_group";
	}
	
	@RequestMapping(value="/deleteGroup")
	@ResponseBody
	public void deleteGroup(HttpServletRequest request, Group one) {
		service.deleteGroup(one);
	}
	
	@RequestMapping(value="/showGroupTeacher")
	public String showGroupTeacher(HttpServletRequest request, Group group) {
		List list = service.showGroupTeacher(group);
		request.setAttribute("list", list);
		return "admin/admin_groupteacher";
	}
	
	@RequestMapping(value="/showGroupStudent")
	public String showGroupStudent(HttpServletRequest request, Group group) {
		List list = service.showGroupStudent(group);
		request.setAttribute("list", list);
		return "admin/admin_groupstudent";
	}
	
	@RequestMapping(value="/removeTeacherGroup")
	@ResponseBody
	public void removeTeacherGroup(HttpServletRequest request, Teacher teacher) {
		service.removeTeacherGroup(teacher);
	}
	
	@RequestMapping(value="/removeStudentGroup")
	@ResponseBody
	public void removeStudentGroup(HttpServletRequest request, Student student) {
		service.removeStudentGroup(student);
	}

	// 跳转到新增分组页面
	@RequestMapping(value = "/insertGroup")
	public String insertGroup(HttpServletRequest request) {
		return "admin/admin_setgroup";
	}

	@RequestMapping(value = "/chooseTeacher")
	public String chooseTeacher(HttpServletRequest request, Integer pageNow) {
		// 保存多选框id
		if (request.getSession().getAttribute("teacherbox") == null) {
			Map map = new HashMap();
			request.getSession().setAttribute("teacherbox", map);
		}

		Map map = (Map) request.getSession().getAttribute("teacherbox");
		String ids = "";
		if (map != null) {
			Iterator it = map.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry entry = (Map.Entry) it.next();
				String value = (String) entry.getValue();
				if (ids.equals("")) {
					ids = value;
				} else {
					ids = ids + "," + value;
				}
			}
		}
		PageParameter page = null;
		List list = null;
		int totalCount = (int) service.getTeacherCountByGroup();
		if (pageNow != null) {
			page = new PageParameter(pageNow, totalCount);
			list = service.getSomeTeacher(page.getStartPos(), page.getPageSize());
		} else {
			page = new PageParameter(1, totalCount);
			list = service.getSomeTeacher(page.getStartPos(), page.getPageSize());
		}
		if(!request.getParameter("name").equals("")) {
			request.setAttribute("name",request.getParameter("name"));
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("ids", ids);
		return "admin/admin_chooseteacher";
	}

	@RequestMapping(value = "/teacherSaveBox")
	@ResponseBody
	public void teacherSaveBox(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String done = request.getParameter("done");
		Map map = (Map) request.getSession().getAttribute("teacherbox");
		if (done.equals("1")) {
			map.put(id, id);
		} else {
			map.remove(id);
		}
		request.getSession().setAttribute("teacherbox", map);
		PrintWriter outs = null;
		try {
			String ids = "";// 要返回页面的字符串
			if (map != null) {
				// 把map遍历成字符串
				Iterator it = map.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry entry = (Map.Entry) it.next();
					String value = (String) entry.getValue();
					// 循环第一遍
					if (ids.equals("")) {
						ids = value;
					} else {
						ids = ids + "," + value;
					}
				}
			}
			outs = response.getWriter();
			outs.print(ids);// 打印返回值
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (null != outs) {
				outs.flush();
				outs.close();
			}
		}
	}

	@RequestMapping(value = "/studentSaveBox")
	@ResponseBody
	public void studentSaveBox(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String done = request.getParameter("done");
		Map map = (Map) request.getSession().getAttribute("studentbox");
		if (done.equals("1")) {
			map.put(id, id);
		} else {
			map.remove(id);
		}
		request.getSession().setAttribute("studentbox", map);
		PrintWriter outs = null;
		try {
			String sids = "";// 要返回页面的字符串
			if (map != null) {
				// 把map遍历成字符串
				Iterator it = map.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry entry = (Map.Entry) it.next();
					String value = (String) entry.getValue();
					// 循环第一遍
					if (sids.equals("")) {
						sids = value;
					} else {
						sids = sids + "," + value;
					}
				}
			}
			outs = response.getWriter();
			outs.print(sids);// 打印返回值
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (null != outs) {
				outs.flush();
				outs.close();
			}
		}
	}

	@RequestMapping(value = "/chooseStudent")
	public String chooseStudent(HttpServletRequest request, Integer pageNow) {
		if (request.getSession().getAttribute("studentbox") == null) {
			Map map = new HashMap();
			request.getSession().setAttribute("studentbox", map);
		}

		Map map = (Map) request.getSession().getAttribute("studentbox");
		String sids = "";
		if (map != null) {
			Iterator it = map.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry entry = (Map.Entry) it.next();
				String value = (String) entry.getValue();
				if (sids.equals("")) {
					sids = value;
				} else {
					sids = sids + "," + value;
				}
			}
		}
		PageParameter page = null;
		List list = null;
		int totalCount = (int) service.getStudentCountByGroup();
		if (pageNow != null) {
			page = new PageParameter(pageNow, totalCount);
			list = service.getSomeStudent(page.getStartPos(), page.getPageSize());
		} else {
			page = new PageParameter(1, totalCount);
			list = service.getSomeStudent(page.getStartPos(), page.getPageSize());
		}
		
		String name = request.getParameter("name");
		if(!name.equals("")) {
			request.setAttribute("name",name);
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("sids", sids);
		return "admin/admin_choosestudent";
	}

	//添加组名
	@RequestMapping(value="/insertGroupName")
	@ResponseBody
	public void insertGroupName(HttpServletRequest request) {
		String name = request.getParameter("groupName");
		service.insertGroupName(name);
	}

	//添加组内教师
	@RequestMapping(value="/insertGroupTeacher")
	@ResponseBody
	public void insertGroupTeache(HttpServletRequest request) {
		String name = request.getParameter("groupName");
		String ids = request.getParameter("ids");
		service.insertGroupTeacher(name,ids);
	}
	
	//添加组内学生
	@RequestMapping(value="/insertGroupStudent")
	@ResponseBody
	public void insertGroupStudent(HttpServletRequest request) {
		String name = request.getParameter("groupName");
		String sids = request.getParameter("sids");
		service.insertGroupStudent(name, sids);
	}
	
	// 清除session
	@RequestMapping(value = "/clearSession")
	@ResponseBody
	public void clearSession(HttpServletRequest request) {
		if (request.getSession().getAttribute("teacherbox") != null) {
			request.getSession().removeAttribute("teacherbox");
		}
		if (request.getSession().getAttribute("studentbox") != null) {
			request.getSession().removeAttribute("studentbox");
		}
	}

	@RequestMapping(value = "/showdistribution")
	public String showdistribution(HttpServletRequest request) {
		List list = service.showdistribution();
		request.setAttribute("list", list);
		return "admin/admin_showdistribution";
	}

	@RequestMapping(value = "/distributeStudent")
	public String distributeStudent(HttpServletRequest request, Integer pageNow) {
		if (request.getSession().getAttribute("studentbox") == null) {
			Map map = new HashMap();
			request.getSession().setAttribute("studentbox", map);
		}

		Map map = (Map) request.getSession().getAttribute("studentbox");
		String sids = "";
		if (map != null) {
			Iterator it = map.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry entry = (Map.Entry) it.next();
				String value = (String) entry.getValue();
				if (sids.equals("")) {
					sids = value;
				} else {
					sids = sids + "," + value;
				}
			}
		}
		PageParameter page = null;
		List list = null;
		int totalCount = (int) service.getStudentCountByTeacher();
		if (pageNow != null) {
			page = new PageParameter(pageNow, totalCount);
			list = service.distributeStudent(page.getStartPos(), page.getPageSize());
		} else {
			page = new PageParameter(1, totalCount);
			list = service.distributeStudent(page.getStartPos(), page.getPageSize());
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("sids", sids);
		request.setAttribute("account", request.getParameter("account"));
		return "admin/admin_distribute";
	}

	@RequestMapping(value = "/confirmStudent")
	@ResponseBody
	public AjaxObject confirmStudent(HttpServletRequest request) {
		String account = request.getParameter("account");
		String sids = request.getParameter("sids");
		return service.confirmStudent(account, sids);
	}

	// 下载学生模板
	@RequestMapping(value = "download_student")
	public void downloadStudent(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String realPath = request.getSession().getServletContext().getRealPath("/excel/student.xls");
		String filename = "student.xls";
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName=" + filename);
		try {
			File file = new File(realPath);
			System.out.println(file.getAbsolutePath());
			InputStream inputStream = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[1024];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			inputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 下载教师模板
		@RequestMapping(value = "download_teacher")
		public void downloadTeacher(HttpServletRequest request, HttpServletResponse response)
				throws UnsupportedEncodingException {
			String realPath = request.getSession().getServletContext().getRealPath("/excel/student.xls");
			String filename = "teacher.xls";
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=" + filename);
			try {
				File file = new File(realPath);
				System.out.println(file.getAbsolutePath());
				InputStream inputStream = new FileInputStream(file);
				OutputStream os = response.getOutputStream();
				byte[] b = new byte[1024];
				int length;
				while ((length = inputStream.read(b)) > 0) {
					os.write(b, 0, length);
				}
				inputStream.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	@RequestMapping(value = "/add_students")
	@ResponseBody
	public void addStudents(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "file", required = false) MultipartFile file)
					throws IllegalStateException, IOException {
		String realPath = request.getSession().getServletContext().getRealPath("/excel/stuReal.xls");
		new ExcelReader(service).reader(file, realPath);
	}
	
	//删除老师下的分配的所有学生
	@RequestMapping(value="/deleteDistribution")
	@ResponseBody
	public void deleteDistribution(HttpServletRequest request, Teacher one) {
		System.out.println(one.getAccount());
		service.deleteDistribution(one);
	}
	
	@RequestMapping(value="/showMyStudent")
	public String showMyStudent(HttpServletRequest request, Teacher one) {
		List list = service.getMyStudent(one);
		request.setAttribute("list", list);
		return "admin/admin_showmystudent";
	}
	
	@RequestMapping(value="/adminInfo")
	public String adminInfo(HttpServletRequest request , Teacher admin){
		return "admin/admin_Info";
	}
	
	@RequestMapping(value="/modifyInfo")
	public String modifyInfo(HttpServletRequest request){
		return "admin/admin_modifyInfo";
	}
	
	@RequestMapping(value="/updateInfo")
	public String updateInfo(HttpServletRequest request , Teacher teacher){
		System.out.println(teacher.toString());
		service_t.updateInfo(teacher);
		teacher = service_t.getTeacherById(teacher.getTid());
		System.out.println(teacher.toString());
		request.getSession().setAttribute("admin", teacher);
		request.setAttribute("name", teacher.getName());
		return "admin/admin";
	}
	
	@RequestMapping(value="/deleteDistributionStudent") 
	@ResponseBody
	public void deleteDistributionStudent(HttpServletRequest request, Student student) {
		service.updateStudentTeacher(student);
	}
	
	//获得时间
	@RequestMapping(value="/getTime")
	@ResponseBody
	public SysDate getTime(HttpServletRequest request, SysDate one) {
		one = service.getTime(one);
		return one;
	}
	
	//删除group表中所有数据
	@RequestMapping(value="/freshGroup")
	public String freshGroup(HttpServletRequest request) {
		service.freshGroup();
		return "admin/admin_group";
	}
}
