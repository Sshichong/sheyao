package cn.sheyao.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sheyao.pojo.Doctor;
import cn.sheyao.service.DoctorService;

@Controller
public class DoctorController {
	
	@Autowired
	DoctorService doctorService;
	
	@RequestMapping("/toDoctor")
	public String toDoctor(Model model) {
		
		List<Doctor> doctor =doctorService.findDoctor();
		//System.out.println(doctor.size());
		
		model.addAttribute("doctor",doctor);
		
		return "doctor";
	}
	
	
	//分组查询,相应分组下的医生
	@RequestMapping("/QueryByStartWith")
	public String QueryByStartWith(String[] StartWith,Model model) {
		//System.out.println(StartWith[0]+StartWith[1]+StartWith[2]+StartWith[3]);
		//System.out.println(StartWith.length);
		
		//左边导航栏查找
		List<Doctor> doctor =doctorService.findDoctor();
		
		//点击分类分组查找，外循环先按顺序从数据库查找，内循环先匹配第一个字母是否是startwith，若是add进doctors
		List<Doctor> doctors =new ArrayList();
		for(int i=0;i<StartWith.length;i++) {
			List<Doctor> d =doctorService.findDoctorByStartWith(StartWith[i]);
			System.out.println("外循环："+d.size());
			for(int j=0;j<d.size();j++) {
				if(d.get(j).getDoctor_forSelect().startsWith(StartWith[i])) {
					System.out.println("内循环："+d.get(j));
					Doctor dd =d.get(j);
					doctors.add(dd);
				}	
			}
		}
		
		String head =StartWith[0].toUpperCase();
		String tail =StartWith[StartWith.length-1].toUpperCase();
		
		String title =head+"-"+tail;
		
		model.addAttribute("doctor_title",title);
		model.addAttribute("doctor",doctor);
		model.addAttribute("doctor_StartWith",doctors);
		
		return "doctor";
	}
	
	
	@RequestMapping("/QueryDoctorById")
	public String QueryDoctorById(String id,Model model) {
		
		System.out.println(id);
		
		List<Doctor> doctor =doctorService.findDoctor();
		List<Doctor> doctor_one =doctorService.findDoctorById(Integer.parseInt(id));
		
		Doctor d =doctor_one.get(0);
		
		model.addAttribute("doctor_one",d);
		model.addAttribute("doctor",doctor);
		
		
		return "doctor";
	}
	
	
	//搜索栏关键字搜索
	@RequestMapping("/QueryDoctorkey")
	public String QueryDoctorkey(String key,Model model) {
		
		System.out.println(key);
		List<Doctor> doctor =doctorService.findDoctor();
		List<Doctor> doctor_more = doctorService.findDoctorBykey(key);
		
		model.addAttribute("doctor",doctor);
		if(doctor_more.size()==1) {
			Doctor doctor_one =doctor_more.get(0);
			model.addAttribute("size","1");
			model.addAttribute("doctor_one",doctor_more.get(0));
			
			return "doctor";
		}else if(doctor_more.size()>1) {
			int size =doctor_more.size();
			
			model.addAttribute("doctor_more",doctor_more);
			model.addAttribute("size",String.valueOf(size));
			model.addAttribute("key",key);
			
			return "doctor_more";
			
		}else {
			model.addAttribute("doctor_more",null);
			model.addAttribute("size","0");
			model.addAttribute("key",key);
			
			return "doctor_more";
			
		}
		
	}

}
