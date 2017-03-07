package com.cn.graduation.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.multipart.MultipartFile;

import com.cn.graduation.model.Student;
import com.cn.graduation.service.AdminService;


public class ExcelReader {

	private  AdminService  service;
	
	public ExcelReader(AdminService service){
		this.service = service;
	}
	
	public  void reader(MultipartFile mfile, String realPath) throws IllegalStateException, IOException {
		File file = new File(realPath);
		mfile.transferTo(file);
		if (file.isFile()) {
			String[] fileInfo = file.getName().split("\\.");
			if (fileInfo[1].equals("xls")) {
				InputStream is = new FileInputStream(file);
				@SuppressWarnings("resource")
				HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
				Student student = null;
				// 循环工作表Sheet
				for (int numSheet = 0; numSheet < hssfWorkbook
						.getNumberOfSheets(); numSheet++) {
					HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
					if (hssfSheet == null) {
						continue;
					}
					// 循环行Row
					for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
						HSSFRow hssfRow = hssfSheet.getRow(rowNum);
						if (hssfRow != null) {
							student = new Student();
							HSSFCell account = hssfRow.getCell(0);
							HSSFCell name = hssfRow.getCell(1);
							HSSFCell className = hssfRow.getCell(2);
							HSSFCell dept = hssfRow.getCell(3);
							Integer a = (int) Double.parseDouble(getValue(account));
							student.setPassword(a.toString());
							student.setAccount(a.toString());
							student.setName(getValue(name));
							student.setClassname(getValue(className));
							student.setDept(getValue(dept));
							System.out.println(service);
							service.addStudent(student);
						}
					}
				}
			}
		}
	}
	@SuppressWarnings("static-access")
	private  String getValue(HSSFCell hssfCell) {
		if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
			// 返回布尔类型的值
			return String.valueOf(hssfCell.getBooleanCellValue());
		} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
			// 返回数值类型的值
			return String.valueOf(hssfCell.getNumericCellValue());
		} else {
			// 返回字符串类型的值
			return String.valueOf(hssfCell.getStringCellValue());
		}
	}
}
