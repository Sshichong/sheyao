package cn.sheyao.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sheyao.pojo.Doctor1;
import cn.sheyao.pojo.Illness;
import cn.sheyao.pojo.Medicine;
import cn.sheyao.pojo.Prescription;
import cn.sheyao.service.DoctorService;
import cn.sheyao.service.IllnessService;
import cn.sheyao.service.MedicineService;
import cn.sheyao.service.PrescriptionService;
import cn.sheyao.service.TimeTaskService;

@Controller
public class DoctorController {
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
	TimeTaskService timeTaskService;
	
	@Autowired
	IllnessService illnessService;
	
	@Autowired
	PrescriptionService prescriptionService;
	
	@Autowired
	MedicineService medicineService;
	
	public static final Map<Integer,Integer> map =new HashMap<Integer,Integer>();
	
	@RequestMapping(value= {"/toDoctor"})
	public String toDoctor(Model model) {
		
		/*List<Doctor> doctor =doctorService.findDoctor();*/
		List<Doctor1> doctor =doctorService.findDoctor();
		//System.out.println(doctor.size());
		
		//根据每个医生的擅长中的illnessid去illness表中查相应的病症
		Map<Integer,String> map =new HashMap<Integer,String>();
		
		for(int i=0;i<doctor.size();i++) {
			StringBuffer sb =new StringBuffer();
			String []goodAts=doctor.get(i).getDoctor_department().split("_");
			for(int j=0;j<goodAts.length;j++) {
				
				List<Illness> illnesses = illnessService.findByIllnessId(Integer.parseInt(goodAts[j]));
				if(j==goodAts.length-1) {
					sb.append(illnesses.get(0).getIllness_name());
				}else {
				sb.append(illnesses.get(0).getIllness_name()).append(";");
				}
			}
			map.put(doctor.get(i).getDoctor_ID(), String.valueOf(sb));
		}
		
		model.addAttribute("map",map);
		model.addAttribute("doctor",doctor);
		
		return "doctor1";
	}
	
	
	//分组查询,相应分组下的医生
	@RequestMapping("/QueryByStartWith")
	public String QueryByStartWith(String[] StartWith,Model model) {
		//System.out.println(StartWith[0]+StartWith[1]+StartWith[2]+StartWith[3]);
		//System.out.println(StartWith.length);
		
		//左边导航栏查找
		List<Doctor1> doctor =doctorService.findDoctor();
		
		/**
		 * 点击分类分组查找，外循环先按顺序从数据库查找（该字母在中间的也会被找出来）
		 * 内循环先匹配第一个字母是否是startwith，若是add进doctors
		 */
		List<Doctor1> doctors =new ArrayList();
		for(int i=0;i<StartWith.length;i++) {
			List<Doctor1> d =doctorService.findDoctorByStartWith(StartWith[i]);
			System.out.println("外循环："+d.size());
			for(int j=0;j<d.size();j++) {
				if(d.get(j).getDoctor_forSelect().startsWith(StartWith[i])) {
					System.out.println("内循环："+d.get(j));
					Doctor1 dd =d.get(j);
					doctors.add(dd);
				}	
			}
			
			
			
		}
		
		//根据擅长id到illness表中查病症
		
		
		String head =StartWith[0].toUpperCase();
		String tail =StartWith[StartWith.length-1].toUpperCase();
		
		String title =head+"-"+tail;
		
		model.addAttribute("doctor_title",title);
		model.addAttribute("doctor",doctor);
		model.addAttribute("doctor_StartWith",doctors);
		
		return "doctor1";
	}
	
	
	@RequestMapping("/QueryDoctorById")
	public String QueryDoctorById(String id,Model model) {
		
		Integer id1=Integer.parseInt(id);
		System.out.println(id);
		
		//查询次数用键值对的方式存入hashmap
		if(map.isEmpty()) {
			map.put(id1, 1);
		}else {
			Iterator iter =map.entrySet().iterator();
			Integer count = 1;
			while(iter.hasNext()) {  //用Iterator进行遍历，如果有key等于id1的map值，则count++
				Map.Entry<Integer,Integer>  entry =(Map.Entry)iter.next();
				if(entry.getKey().equals(id1)) {
					count = entry.getValue();
					count++;
					break;
				}
			}
			map.put(id1, count);
		}
		
		//从数据库中找全部医生和按id找对应医生
		List<Doctor1> doctor =doctorService.findDoctor();
		List<Doctor1> doctor_one =doctorService.findDoctorById(Integer.parseInt(id));
		
		//擅长
		String goodAts=(String)doctor_one.get(0).getDoctor_department();
		
		String []goodAt=goodAts.split("_");
		System.out.println(goodAt.length);
		
		
		Map<Illness,List<Prescription>> map =new HashMap<Illness,List<Prescription>>();
		for(int i=0;i<goodAt.length;i++) {//根据每个擅长的id到illness中找病症
			int illnessId =Integer.parseInt(goodAt[i]);
			
			//根据医生擅长的病症id在illness表中找对应病症
			List<Illness> illnesses=illnessService.findByIllnessId(illnessId);
			Illness illness =illnesses.get(0);
			System.out.println(illness.getIllness_name());
			
			//在prescription表中根据医生id和病症id找对应的药方，一个病症可对应多个药方
			List<Prescription> prescription1 =prescriptionService.findByDoctorId_IllnessId(id,goodAt[i]);
			System.out.println(prescription1.size());
			List<Prescription> prescription =new ArrayList();
			
			//对模糊查询出来的药方中的illnessId与病症id进行比对，若有则保留，没有就移除
			for(int q=0;q<prescription1.size();q++) {
				String illnessIds =prescription1.get(q).getPrescription_Cure();
				String doctorIds =prescription1.get(q).getDoctor_ID();
				int count=0;
				String []ids=illnessIds.split("_");
				String []dids =doctorIds.split("_");
				for(int q1=0;q1<ids.length;q1++) {
					if(goodAt[i].equals(ids[q1])) {
						for(int qq=0;qq<dids.length;qq++) {
							if(id.equals(dids[qq])) {
								count++;
							}
						}
					}
				}
				if(count==1) {
					prescription.add(prescription1.get(q));
				}
			}
			
			
			
			//把药方中medicineID找出
			for(int j=0;j<prescription.size();j++) {
				StringBuffer sb =new StringBuffer();
				//把药方根据"_"分割为字符串数组
				String []ps =prescription.get(j).getPrescription_particulars().split("_");
				for(int t=0;t<ps.length;t++) { 
					//把药名和分量根据"+"分割为字符串数组
					String []p=ps[t].split("\\+");
					if(p[0].matches("[0-9]+")) { //正则匹配，如果加号前面的为数字，则根据数据到medicine中找对应的药
						List<Medicine> medicines =medicineService.findMedicineById(Integer.parseInt(p[0]));
						Medicine medicine =medicines.get(0);
						sb.append("<a href='/sheyao/QueryById?id=").append(medicine.getMedicine_ID()).append("'>").append(medicine.getMedicine_name()).append("</a>").append("配").append(p[1]);
					}else {
						sb.append(p[0]).append("配").append(p[1]);
					}
					if(t==ps.length-1) {
						sb.append("");
					}else {
						sb.append(",");
					}
					
				}
				prescription.get(j).setPrescription_particulars(String.valueOf(sb));
				
			}
			
			//放入HashMap
			map.put(illness, prescription);
			
		}
		
		Doctor1 d =doctor_one.get(0);
		
		
		model.addAttribute("illnessAndprescription",map);
		model.addAttribute("doctor_one",d);
		model.addAttribute("picdoctor",d.getDoctor_Pic());
		model.addAttribute("doctor",doctor);
		
		
		return "doctor1";
	}
	
	
	//搜索栏关键字搜索
	@RequestMapping("/QueryDoctorkey")
	public String QueryDoctorkey(String key,Model model) {
		
		System.out.println(key);
		List<Doctor1> doctor =doctorService.findDoctor();
		List<Doctor1> doctor_more = doctorService.findDoctorBykey(key);
		
		model.addAttribute("doctor",doctor);
		//只有一条记录
		if(doctor_more.size()==1) {
			Doctor1 doctor_one =doctor_more.get(0);
			int id =doctor_one.getDoctor_ID();
			//model.addAttribute("size","1");
			//model.addAttribute("doctor_one",doctor_more.get(0));
			
			return "redirect:/QueryDoctorById?id="+id;
		}else if(doctor_more.size()>1) {//多条记录
			int size =doctor_more.size();
			
			model.addAttribute("doctor_more",doctor_more);
			model.addAttribute("size",String.valueOf(size));
			model.addAttribute("key",key);
			
			return "doctor_more1";
			
		}else {//0条记录
			model.addAttribute("doctor_more",null);
			model.addAttribute("size","0");
			model.addAttribute("key",key);
			
			return "doctor_more1";
			
		}
		
	}
	
	//定时
	//@Scheduled(cron = "0 30 22 ? * *") 每天十点半执行
	@Scheduled(cron = "*/5 * * * * ?")
	public void DoctorTimeTask() {
		
		timeTaskService.updateDoctorount(map);
		
	}
	
	
	@RequestMapping("doctor1")
	public String doctor1() {
		return "doctor1";
	}

}
