package cn.sheyao.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sheyao.pojo.Illness;
import cn.sheyao.pojo.Prescription;
import cn.sheyao.service.IllnessService;
import cn.sheyao.service.PrescriptionService;

@Controller
public class PrescriptionController {
	
	@Autowired
	IllnessService illnessService;
	
	@Autowired
	PrescriptionService prescriptionService;
	
	@RequestMapping("/toPrescription")
	public String toPrescription(Model model) {
		//侧边栏
		List<List<Illness>> illness =illnessService.findIllness();
		
		//创建一个hashMap，key为illnessid，value为药方的list
		Map<Integer,List<Prescription>> map =new HashMap<Integer,List<Prescription>>();
		
		//根据illness.size()为科室的数量
		for(int i=0;i<illness.size();i++) {
			for(int j=0;j<illness.get(i).size();j++) {//为每个科室内病症的数量
				String illnessId=String.valueOf(illness.get(i).get(j).getIllness_ID());
				
				//用illnessId在药方中根据Illness_ID字符串进行模糊查询，查询到对应illness的药方，并存入map
				List<Prescription> p =prescriptionService.findByIllnessId(illnessId);
				map.put(Integer.parseInt(illnessId),p);
				
			}
		}
		model.addAttribute("illness",illness);
		model.addAttribute("map",map);
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
