package cn.sheyao.controller;

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
		System.out.println(doctor.size());
		
		model.addAttribute("doctor",doctor);
		
		return "doctor";
	}
	

}
