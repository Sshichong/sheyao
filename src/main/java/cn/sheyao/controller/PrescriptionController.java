package cn.sheyao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrescriptionController {
	
	@RequestMapping("/toPrescription")
	public String toPrescription() {
		return "prescription";
	}
	
	@RequestMapping("/Prescriptionfeilei")
	public String Prescriptionfenlei() {
		return "prescriptionfenlei";
	}
	
	@RequestMapping("/Prescriptionxiangqing")
	public String Prescriptionxiangqing() {
		return "prescriptionxiangqing";
	}
	
	@RequestMapping("/Prescriptionmore")
	public String Prescriptionmore() {
		return "prescription_more";
	}

}
