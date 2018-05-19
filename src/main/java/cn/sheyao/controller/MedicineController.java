package cn.sheyao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sheyao.pojo.Department;
import cn.sheyao.pojo.Medicine;
import cn.sheyao.service.MedicineService;

@Controller
public class MedicineController {
	
	@Autowired
	MedicineService medicineService;
	
	
	@RequestMapping("toMedicine")
	public String toSheyao(Model model) {

		//数据库查找畲药
		List<Medicine> medicine=medicineService.findMedicine();
		//通过desc降序找前三条记录
		List<Medicine> medicine_Date =medicineService.findMedicineByDate();
		//System.out.println(medicine.get(1).toString());
		model.addAttribute("medicine_date",medicine_Date);
		model.addAttribute("medicine",medicine);
		return "sheyao";
	}
	
	@RequestMapping("QueryByType")
	public String QueryByType(String type,Model model) {
		int type1=Integer.parseInt(type);
		//System.out.println(type1);
		//通过类别找记录
		List<Medicine> medicine_Type =medicineService.findMedicineByType(type1);
		//找全部记录
		List<Medicine> medicine=medicineService.findMedicine();
		model.addAttribute("medicine",medicine);
		model.addAttribute("medicine_type",medicine_Type);
		return "sheyao";
	}
	
	
	
	@RequestMapping("/QueryById")
	public String QueryById(String id,Model model) {
		int id1 =Integer.parseInt(id);
		System.out.println(id1);
		
		List<Medicine> medicine =medicineService.findMedicine();
		List<Medicine> medicine_one =medicineService.findMedicineById(id1);
		

		System.out.println(medicine_one.get(0).toString());
		model.addAttribute("medicine",medicine);
		model.addAttribute("medicine_one",medicine_one.get(0));
		return "sheyao";
	}
	
	
	@RequestMapping("/Querykey")
	public String Querykey(String key,Model model) {
		
		System.out.println(key);
		List<Medicine> medicine =medicineService.findMedicine();
		List<Medicine> medicine_more =medicineService.findMedicineByKey(key);
		System.out.println(medicine_more);
		System.out.println(medicine_more.size());
		model.addAttribute("medicine",medicine);
		if(medicine_more.size()==1) {
			model.addAttribute("medicine_one",medicine_more.get(0));
			model.addAttribute("size","1");
			return "sheyao";
		}else if(medicine_more.size()>1) {
			int size =medicine_more.size();
			model.addAttribute("medicine_more",medicine_more);
			model.addAttribute("size",String.valueOf(size));
			model.addAttribute("key",key);
			
			return "sheyao_more";
			
		}else {
			model.addAttribute("medicine_more",null);
			model.addAttribute("size","0");
			model.addAttribute("key",key);
			
			return "sheyao_more";
		}
		
		
		
	}
	
	
}
















