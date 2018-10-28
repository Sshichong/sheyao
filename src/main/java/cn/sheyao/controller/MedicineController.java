package cn.sheyao.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.weaver.World.TypeMap;
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
public class MedicineController {
	
	@Autowired
	MedicineService medicineService;
	
	@Autowired
	TimeTaskService timeTaskService;
	
	@Autowired
	PrescriptionService prescriptionService;
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
	IllnessService illnessService;
	
	public static final Map<Integer,Integer> map =new HashMap<Integer,Integer>();
	
	
	@RequestMapping(value= {"toMedicine"})
	public String toSheyao(Model model) {

		//数据库查找畲药
		List<Medicine> medicine=medicineService.findMedicine();
		//通过desc降序找前三条记录
		List<Medicine> medicine_Date =medicineService.findMedicineByDate();
		//System.out.println(medicine.get(1).toString());
		model.addAttribute("medicine_date",medicine_Date);
		model.addAttribute("medicine",medicine);
		return "sheyao1";
	}
	
	@RequestMapping("QueryByType")
	public String QueryByType(String type,Model model) {
		int type1=Integer.parseInt(type);
		//System.out.println(type1);
		//通过类别找记录
		List<Medicine> medicine_Type =medicineService.findMedicineByType(type1);
//		if(medicine_Type!=null) {
//		System.out.println(medicine_Type.get(0).getMedicine_plantAdult());
//		String picName =medicine_Type.get(0).getMedicine_plantAdult();
//		picName = picName.substring(medicine_Type.get(0).getMedicine_plantAdult().lastIndexOf("\\")+1);
//		System.out.println(picName);
//		}
		if(medicine_Type==null) {
			Medicine m =new Medicine();
			m.setMedicine_anotherName("null");
			m.setMedicine_name("null");
			m.setMedicine_property("null");
			m.setMedicine_introduce("null");
			m.setMedicine_CollectionProcessing("null");
			m.setMedicine_planCategory(0);
			medicine_Type.add(m);
		}
	//	System.out.println(medicine_Type.get(0).toString());
		
		//找全部记录
		List<Medicine> medicine=medicineService.findMedicine();
		model.addAttribute("medicine",medicine);
		model.addAttribute("medicine_type",medicine_Type);
		model.addAttribute("planCategory",type);
		
		return "sheyao1";
	}
	
	
	
	@RequestMapping("/QueryById")
	public String QueryById(String id,Model model) {
		int id1 =Integer.parseInt(id);
		System.out.println(id1);
		
		//把此条被查询记录的次数放入hashmap
		if(map.isEmpty()) { //第一次启动服务器时，map为空，查询时put进map
			map.put(id1, 1);
		}else {  //第二次操作时，先判断是否在map集合内，则id1是否等于某个key值，没有则put，有则修改count值
			Integer count=1;  //设count的初始值为1
			for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
				if(entry.getKey().equals(id1)) {  //看是否有键值与id1相等的value值，若有则count自加再跳出循环
					 count =(Integer)entry.getValue();
					count++;
					break;
				}
				
			}
			//得到的count值put进map覆盖掉之前的，若在map中没有找到相对应的map，则新put进map
			//此句放在遍历语句中会报错
			map.put(id1, count);
		}
		
		
		List<Medicine> medicine =medicineService.findMedicine();
		List<Medicine> medicine_one =medicineService.findMedicineById(id1);

		
		//查询药方
		String strIllnessId = medicine_one.get(0).getMedicine_disease();
		Map<Illness,List<Prescription>> IllnessMap =new HashMap<Illness,List<Prescription>>();
		String []illnessIds =strIllnessId.split("_");
		List<Illness> illnesses =new ArrayList<Illness>();
		for(int i=0;i<illnessIds.length;i++) {
			List<Illness> ii =illnessService.findByIllnessId(Integer.parseInt(illnessIds[i]));
			illnesses.add(ii.get(0));
			
		}
		for(int j=0;j<illnesses.size();j++) {
		//在prescription表中进行模糊查询
		List<Prescription> prescriptions1=prescriptionService.findByIllnessId(String.valueOf(illnesses.get(j).getIllness_ID()));
		
		List<Prescription> prescriptions =new ArrayList<Prescription>();
		
		
		//对模糊查询出来的药方中的illnessId与病症id进行比对，若有则保留，没有就移除
		for(int q=0;q<prescriptions1.size();q++) {
			String illnessIds1 =prescriptions1.get(q).getPrescription_Cure();
			int count=0;
			String []ids=illnessIds1.split("_");
			for(int q1=0;q1<ids.length;q1++) {
				if(String.valueOf(illnesses.get(j).getIllness_ID()).equals(ids[q1])) {
					count++;
				}
			}
			if(count==1) {
				prescriptions.add(prescriptions1.get(q));
			}
		}
		
		
		//若查出来无药方
		if(prescriptions.isEmpty()) {
			IllnessMap.put(illnesses.get(j), null);
		}
//		ChangePrescriptions cp =new ChangePrescriptions();
//		 prescriptions =cp.changePrescriptions(prescriptions);
		
		//查询到药方进行遍历
		for(int j1=0;j1<prescriptions.size();j1++) {
			StringBuffer sb =new StringBuffer();
			//以“_”进行分割
			String []ps =prescriptions.get(j1).getPrescription_particulars().split("_");
			//对每个部分进行遍历
			for(int t=0;t<ps.length;t++) {
				//按照“+”进行分割
				String []p=ps[t].split("\\+");
				if(p[0].matches("[0-9]+")) {
					List<Medicine> medicines=medicineService.findMedicineById(Integer.parseInt(p[0]));
					Medicine medicine1 =medicines.get(0);
					sb.append("<a href='/sheyao/QueryById?id=")
					.append(medicine1.getMedicine_ID()).append("'>")
					.append(medicine1.getMedicine_name()).append("</a>")
					.append("配").append(p[1]);
				}else {
					sb.append(p[0]).append("配").append(p[1]);
				}
				if(t==ps.length-1) {
					sb.append("");
				}else {
					sb.append("，");
				}
			}
			
			//对doctorid字段进行替换
			if(!(prescriptions.get(j1).getDoctor_ID()==null||prescriptions.get(j1).getDoctor_ID().equals(""))) {
			StringBuffer sbb =new StringBuffer();
			//"_"分割doctorid
			
			String []ds =prescriptions.get(j1).getDoctor_ID().split("_");
			
			for(int b=0;b<ds.length;b++) {
				List<Doctor1> doctors = doctorService.findDoctorById(Integer.parseInt(ds[b]));
				if(b==ds.length-1) {
					sbb.append("<a href='/sheyao/QueryDoctorById?id=").append(doctors.get(0).getDoctor_ID())
					.append("'>").append(doctors.get(0).getDoctor_name()).append("</a>");
				}else {
					sbb.append("<a href='/sheyao/QueryDoctorById?id=").append(doctors.get(0).getDoctor_ID())
					.append("'>").append(doctors.get(0).getDoctor_name()).append("</a>").append(",");
				}
			}
			prescriptions.get(j1).setDoctor_ID(sbb.toString());
			}
			prescriptions.get(j1).setPrescription_particulars(sb.toString());
			
		}
		IllnessMap.put(illnesses.get(j), prescriptions);
		
		}

		
		
		
		System.out.println(medicine_one.get(0).toString());
		model.addAttribute("medicine",medicine);
		model.addAttribute("medicine_one",medicine_one.get(0));
		
		model.addAttribute("picSeed",medicine_one.get(0).getMedicine_plantSeed());
		model.addAttribute("picJuvenile",medicine_one.get(0).getMedicine_plantJuvenile());
		model.addAttribute("picAdult",medicine_one.get(0).getMedicine_plantAdult());
		model.addAttribute("picWilting",medicine_one.get(0).getMedicine_plantWilting());
		model.addAttribute("picImg",medicine_one.get(0).getMedicine_plantImg());
		
		model.addAttribute("IllnessMap",IllnessMap);
		return "sheyao1";
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
			Medicine medicine_one =medicine_more.get(0);
			int id =medicine_one.getMedicine_ID();
			//model.addAttribute("medicine_one",medicine_more.get(0));
			//model.addAttribute("size","1");
			return "redirect:/QueryById?id="+id;
		}else if(medicine_more.size()>1) {
			int size =medicine_more.size();
			model.addAttribute("medicine_more",medicine_more);
			model.addAttribute("size",String.valueOf(size));
			model.addAttribute("key",key);
			
			return "sheyao_more1";
			
		}else {
			model.addAttribute("medicine_more",null);
			model.addAttribute("size","0");
			model.addAttribute("key",key);
			
			return "sheyao_more1";
		}
		
		
		
	}
	
	
	//定时
	//@Scheduled(cron = "0 30 22 ? * *") 每天十点半执行
	@Scheduled(cron = "*/5 * * * * ?")
	public void MedicineTimerTask() {
		
		timeTaskService.updateMedicinecount(map);
		
	}
	
	

	
}
















