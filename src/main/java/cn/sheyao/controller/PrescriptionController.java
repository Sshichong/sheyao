package cn.sheyao.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sheyao.pojo.Illness;
import cn.sheyao.pojo.Medicine;
import cn.sheyao.pojo.Prescription;
import cn.sheyao.service.IllnessService;
import cn.sheyao.service.MedicineService;
import cn.sheyao.service.PrescriptionService;
import cn.sheyao.service.TimeTaskService;
import cn.sheyao.tools.ChangePrescriptions;

@Controller
public class PrescriptionController {
	
	@Autowired
	IllnessService illnessService;
	
	@Autowired
	MedicineService medicineService;
	
	@Autowired
	PrescriptionService prescriptionService;
	
	@Autowired
	TimeTaskService timeTaskService;
	
	public static final Map<Integer,Integer> map =new HashMap<Integer,Integer>();
	
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
				
				//根据查出来的药方对"畲药id+份数_畲药id+份数",进行分割
				for(int t=0;t<p.size();t++) {
					StringBuffer sb =new StringBuffer();
					String []a=p.get(t).getPrescription_particulars().split("_"); //对字符串以“_”进行分割成字符串数组
					for(int tt=0;tt<a.length;tt++) {  //对字符串数组进行遍历
						String []aa=a[tt].split("\\+"); //对字符串数组的元素按照“+”进行分割
						if(aa[0].matches("[0-9]+")) {//若aa[0]为数字，则去medicine表中查相应畲药
							List<Medicine> medicines = medicineService.findMedicineById(Integer.parseInt(aa[0])); //找到表中对应的药物
							Medicine medicine =medicines.get(0);
//							sb.append(medicine.getMedicine_name()).append("配").append(aa[1]);
							//对“畲药+份数_畲药id+份数”的表达进行美化为“畲药名配份数，畲药名配份数”
							sb.append("<a href='/sheyao/QueryById?id=").append(medicine.getMedicine_ID()).append("'>").append(medicine.getMedicine_name()).append("</a>").append("配").append(aa[1]);
						}else {
							sb.append(aa[0]).append("配").append(aa[1]);
						}
						if(tt==a.length-1) {
							sb.append("");
						}else {
							sb.append("，");
						}
						
					}
					p.get(t).setPrescription_particulars(sb.toString());//对原有的药方进行覆盖
					
				}
				map.put(Integer.parseInt(illnessId),p);//按照key为病症id，value为药方list存进map
				
			}
		}
		model.addAttribute("illness",illness);
		model.addAttribute("map",map);
		return "prescription1";
	}
	
	@RequestMapping("/IllnessType")
	public String PrescriptionType(String type,Model model) { //根据科室找病症，分组查询
		
		//侧边栏
		List<List<Illness>> illness =illnessService.findIllness();
				
		//创建一个hashMap，key为illness，value为药方的list
		Map<Illness,List<Prescription>> TypeMap =new HashMap<Illness,List<Prescription>>();
				
		List<Illness> illnesses=illnessService.findIllnessByType(type);
		
		//根据每个illnessId去prescription表中查药方
		for(int i=0;i<illnesses.size();i++) {
			String illnessId =String.valueOf(illnesses.get(i).getIllness_ID());
			
			//在prescription表中进行模糊查询
			List<Prescription> prescriptions=prescriptionService.findByIllnessId(illnessId);
			
			//若查出来无药方
			if(prescriptions.isEmpty()) {
				TypeMap.put(illnesses.get(i), null);
			}
			
			//查询到药方进行遍历
			for(int j=0;j<prescriptions.size();j++) {
				StringBuffer sb =new StringBuffer();
				//以“_”进行分割
				String []ps =prescriptions.get(j).getPrescription_particulars().split("_");
				//对每个部分进行遍历
				for(int t=0;t<ps.length;t++) {
					//按照“+”进行分割
					String []p=ps[t].split("\\+");
					if(p[0].matches("[0-9]+")) {
						List<Medicine> medicines=medicineService.findMedicineById(Integer.parseInt(p[0]));
						Medicine medicine =medicines.get(0);
						sb.append("<a href='/sheyao/QueryById?id=").append(medicine.getMedicine_ID()).append("'>").append(medicine.getMedicine_name()).append("</a>").append("配").append(p[1]);
					}else {
						sb.append(p[0]).append("配").append(p[1]);
					}
					if(t==ps.length-1) {
						sb.append("");
					}else {
						sb.append("，");
					}
				}
				prescriptions.get(j).setPrescription_particulars(sb.toString());
				
			}
			TypeMap.put(illnesses.get(i), prescriptions);
			
		}
		
		model.addAttribute("type",type);
		model.addAttribute("typeMap",TypeMap);
		model.addAttribute("illness",illness);
		return "prescription1";
	}
	
	@RequestMapping("/QueryPrescription")
	public String QueryPrescription(String illnessId,Model model){
		//侧边栏
		List<List<Illness>> illness =illnessService.findIllness();
		
		//根据illnessId查询相应病症
		List<Illness> illnesses =illnessService.findByIllnessId(Integer.parseInt(illnessId));
		Illness i =illnesses.get(0);
		
		//在prescription表中进行模糊查询
		List<Prescription> prescriptions=prescriptionService.findByIllnessId(illnessId);
		
		/*ChangePrescriptions cp =new ChangePrescriptions();
		prescriptions = cp.changePrescriptions(prescriptions);*/
		//查询到药方进行遍历
		for(int j=0;j<prescriptions.size();j++) {
			StringBuffer sb =new StringBuffer();
			//以“_”进行分割
			String []ps =prescriptions.get(j).getPrescription_particulars().split("_");
			//对每个部分进行遍历
			for(int t=0;t<ps.length;t++) {
				//按照“+”进行分割
				String []p=ps[t].split("\\+");
				if(p[0].matches("[0-9]+")) {
					List<Medicine> medicines=medicineService.findMedicineById(Integer.parseInt(p[0]));
					Medicine medicine =medicines.get(0);
					sb.append("<a href='/sheyao/QueryById?id=").append(medicine.getMedicine_ID()).append("'>").append(medicine.getMedicine_name()).append("</a>").append("配").append(p[1]);
				}else {
					sb.append(p[0]).append("配").append(p[1]);
				}
				if(t==ps.length-1) {
					sb.append("");
				}else {
					sb.append("，");
				}
			}
			prescriptions.get(j).setPrescription_particulars(sb.toString());
			
		}
		
		
		//记录病症的查询次数
		//把此条被查询记录的次数放入hashmap
				if(map.isEmpty()) { //第一次启动服务器时，map为空，查询时put进map
					map.put(Integer.parseInt(illnessId), 1);
				}else {  //第二次操作时，先判断是否在map集合内，则id1是否等于某个key值，没有则put，有则修改count值
					Integer count=1;  //设count的初始值为1
					for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
						if(entry.getKey().equals(Integer.parseInt(illnessId))) {  //看是否有键值与id1相等的value值，若有则count自加再跳出循环
							 count =(Integer)entry.getValue();
							count++;
							break;
						}
						
					}
					//得到的count值put进map覆盖掉之前的，若在map中没有找到相对应的map，则新put进map
					//此句放在遍历语句中会报错
					map.put(Integer.parseInt(illnessId), count);
				}
	
		model.addAttribute("illness_one", i);
		model.addAttribute("illness_p",prescriptions);
		model.addAttribute("illness",illness);
		return "prescription1";
	}
	
	@RequestMapping("/Prescription_more")
	public String Prescription_more(String key,Model model) {
		//侧边栏
		List<List<Illness>> illness =illnessService.findIllness();
		
		//根据关键字查病症
		List<Illness> illnesses =illnessService.findIllnessByKey(key);
		
		int size=0;
		model.addAttribute("illness",illness);
		//判断
		if(illnesses.size()==1) {//只查到一条记录
			return "rediect:/QueryPrescription?illnessId="+illnesses.get(0).getIllness_ID();
		}else if(illnesses.isEmpty()) {//为空
			model.addAttribute("size","0");
			return "prescription_more";
		}else {//查到多条记录
			size = illnesses.size();
			model.addAttribute("key",key);
			model.addAttribute("size",String.valueOf(size));
			model.addAttribute("illness_more",illnesses);
			return "prescription_more";
		}
	}
	
	//定时
		//@Scheduled(cron = "0 30 22 ? * *")
		@Scheduled(cron = "*/5 * * * * ?")
		public void MedicineTimerTask() {
			
			timeTaskService.updateIllnesscount(map);
			
		}
		
		@RequestMapping("/p")
		public String p() {
			return "prescription1";
		}

}
