package cn.sheyao.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
public class PrescriptionController {
	
	@Autowired
	IllnessService illnessService;
	
	@Autowired
	MedicineService medicineService;
	
	@Autowired
	PrescriptionService prescriptionService;
	
	@Autowired
	TimeTaskService timeTaskService;
	
	@Autowired
	DoctorService doctorService;
	
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
				List<Prescription> p1 =prescriptionService.findByIllnessId(illnessId);
				
				List<Prescription> p =new ArrayList<Prescription>();
				
				//对模糊查询出来的药方中的illnessId与病症id进行比对，若有则保留，没有就移除
				for(int q=0;q<p1.size();q++) {
					String illnessIds =p1.get(q).getPrescription_Cure();
					int count=0;
					String []ids=illnessIds.split("_");
					for(int q1=0;q1<ids.length;q1++) {
						if(illnessId.equals(ids[q1])) {
							count++;
						}
					}
					if(count==1) {
						p.add(p1.get(q));
					}
				}
				
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
					
					//对doctorid字段进行替换
					if(!(p.get(t).getDoctor_ID()==null||p.get(t).getDoctor_ID().equals(""))) {
					StringBuffer sbb =new StringBuffer();
					//"_"分割doctorid
					
					String []ds =p.get(t).getDoctor_ID().split("_");
					
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
					p.get(t).setDoctor_ID(sbb.toString());
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
			List<Prescription> prescriptions1=prescriptionService.findByIllnessId(illnessId);
			
			List<Prescription> prescriptions =new ArrayList<Prescription>();
			
			//对模糊查询出来的药方中的illnessId与病症id进行比对，若有则保留，没有就移除
			for(int q=0;q<prescriptions1.size();q++) {
				String illnessIds =prescriptions1.get(q).getPrescription_Cure();
				int count=0;
				String []ids=illnessIds.split("_");
				for(int q1=0;q1<ids.length;q1++) {
					if(illnessId.equals(ids[q1])) {
						count++;
					}
				}
				if(count==1) {
					prescriptions.add(prescriptions1.get(q));
				}
			}
			
			
			//若查出来无药方
			if(prescriptions.isEmpty()) {
				TypeMap.put(illnesses.get(i), null);
			}
//			ChangePrescriptions cp =new ChangePrescriptions();
//			 prescriptions =cp.changePrescriptions(prescriptions);
			
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
				
				//对doctorid字段进行替换
				if(!(prescriptions.get(j).getDoctor_ID()==null||prescriptions.get(j).getDoctor_ID().equals(""))) {
				StringBuffer sbb =new StringBuffer();
				//"_"分割doctorid
				
				String []ds =prescriptions.get(j).getDoctor_ID().split("_");
				
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
				prescriptions.get(j).setDoctor_ID(sbb.toString());
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
		List<Prescription> prescriptions1=prescriptionService.findByIllnessId(illnessId);
		
		List<Prescription> prescriptions =new ArrayList<Prescription>();
		
		//对模糊查询出来的药方中的illnessId与病症id进行比对，若有则保留，没有就移除
		for(int q=0;q<prescriptions1.size();q++) {
			String illnessIds =prescriptions1.get(q).getPrescription_Cure();
			int count=0;
			String []ids=illnessIds.split("_");
			for(int q1=0;q1<ids.length;q1++) {
				if(illnessId.equals(ids[q1])) {
					count++;
				}
			}
			if(count==1) {
				prescriptions.add(prescriptions1.get(q));
			}
		}
		
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
			
			//对doctorid字段进行替换
			if(!(prescriptions.get(j).getDoctor_ID()==null||prescriptions.get(j).getDoctor_ID().equals(""))) {
			StringBuffer sbb =new StringBuffer();
			//"_"分割doctorid
			
			String []ds =prescriptions.get(j).getDoctor_ID().split("_");
			
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
			prescriptions.get(j).setDoctor_ID(sbb.toString());
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
		
		//查出所有药方
		List<Prescription> prescription =prescriptionService.findPrescription();
		
		//查出所有病症
		List<Illness> illnesses =illnessService.findIllnessAll();
		System.out.println(prescription.toString());
		
		model.addAttribute("key",key);
		model.addAttribute("illness",illness);
		
		
		//每个病症与它的药方配对，并存入map
		Map<Illness,List<Prescription>> map=new HashMap();
		
		
		for(int i=0;i<illnesses.size();i++) {
			List<Prescription> p=new ArrayList();
			for(int b=0;b<prescription.size();b++) {
				int cc=0;
				String []preids =prescription.get(b).getPrescription_Cure().split("_");
				for(int d=0;d<preids.length;d++) {
					if(String.valueOf(illnesses.get(i).getIllness_ID()).equals(preids[d])) {
						cc++;
					}
				}
				if(cc==1) {
					p.add(prescription.get(b));
				}
			}
			map.put(illnesses.get(i), p);
		}
		
		int size =0;
		//判断查询是多条件查询还是单条件查询
		if(key.contains("，")||key.contains(",")) { //病症+药物+献方医生
			System.out.println(1111);
			String []keys=null;
			if(key.contains("，")) {
				keys = key.split("，");
			}else {
				keys = key.split(",");
			}
			
			//把不是对应病症的key和vaule移除
			Iterator iter = map.entrySet().iterator();
			while(iter.hasNext()) {
				Map.Entry<Illness, List<Prescription>> entry =(Map.Entry)iter.next();
				Illness i =entry.getKey();
				if(!i.getIllness_name().contains(keys[0])) {//若key不为keys[0]的直接移除
					iter.remove();
					continue;
				}
				List<Prescription> pp = entry.getValue();
				Iterator iter1 =pp.iterator();
				while(iter1.hasNext()) {//对pp进行遍历
					Prescription pp1=(Prescription)iter1.next();
					//每条药方的药物和医生中不包含keys[1],keys[2]的，把这条药方移除
					if(!(pp1.getPrescription_particulars().contains(keys[1])&&pp1.getDoctor_ID().contains(keys[2]))) {
						iter1.remove();
					}
				}
				if(pp.isEmpty()) { //如果pp为空，把对应的key的这条map移除
					iter.remove();
				}
			}
			
			
			String strKey =keys[0]+","+keys[1]+","+keys[2];
			size = map.size();
			model.addAttribute("map",map);
			model.addAttribute("illness_more",illnesses);
			model.addAttribute("size",String.valueOf(size));
			model.addAttribute("key",strKey);
			return "prescription_more1";
		
			
			
			
		}else {
			System.out.println(2222);
				Iterator iter = map.entrySet().iterator();
				while (iter.hasNext()) {
					Map.Entry<Illness, List<Prescription>> entry = (Map.Entry) iter.next();
					Illness i = entry.getKey();
					List<Prescription> pp = entry.getValue();

					if (i.getIllness_name().contains(key)) { //若药名相同，则继续while
						continue;
					} else {
						int flag = 0;
						for (int c = 0; c < pp.size(); c++) { //对药方进行遍历，其中一条有key则break，没有就flag++
							if ((pp.get(c).getPrescription_particulars().contains(key))
									|| (pp.get(c).getDoctor_ID().contains(key))
									/*||(pp.get(c).getPrescription_source().equals(key))*/
											) {
								break;
							} else {
								flag++;
							}
						}
						if (flag == pp.size()) {//如果flag==pp.size，说明List药方中没有key，就把iter移除
							iter.remove();
						}
					}

				} 
			
			
			
			size =map.size();
			//System.out.println(size);
			
			model.addAttribute("map",map);
			if(size==1) {
				model.addAttribute("illness_more",illnesses);
				model.addAttribute("size","1");
				Iterator it =map.entrySet().iterator();
				while(it.hasNext()) {
					Map.Entry<Illness, List<Prescription>> entry =(Map.Entry)it.next();
					int illid=entry.getKey().getIllness_ID();
					return "redirect:/QueryPrescription?illnessId="+illid;
				}
				
			}else if(size==0) {
				model.addAttribute("illness_more",illnesses);
				model.addAttribute("size","0");
				return "prescription_more1";
			}else {
				model.addAttribute("illness_more",illnesses);
				model.addAttribute("size",String.valueOf(size));
				return "prescription_more1";
			}
			
			
		}

	    model.addAttribute("illness_more",illnesses);
		
		return null;
	/*	//根据关键字查病症
		List<Illness> illnesses =illnessService.findIllnessByKey(key);
		
		int size=0;
		model.addAttribute("illness",illness);
		//判断
		if(illnesses.size()==1) {//只查到一条记录
			return "redirect:/QueryPrescription?illnessId="+illnesses.get(0).getIllness_ID();
		}else if(illnesses.isEmpty()) {//为空
			model.addAttribute("size","0");
			model.addAttribute("key",key);
			return "prescription_more1";
		}else {//查到多条记录
			Map<Illness,List<Prescription>> map=new HashMap();
			for(int i=0;i<illnesses.size();i++) {
				String id =String.valueOf(illnesses.get(i).getIllness_ID());
				List<Prescription> prescription1 =prescriptionService.findByIllnessId(id);
				
				List<Prescription> prescription =new ArrayList();
				
				//对模糊查询出来的药方中的illnessId与病症id进行比对，若有则保留，没有就移除
				for(int q=0;q<prescription1.size();q++) {
					String illnessIds =prescription1.get(q).getPrescription_Cure();
					int count=0;
					String []ids=illnessIds.split("_");
					for(int q1=0;q1<ids.length;q1++) {
						if(id.equals(ids[q1])) {
							count++;
						}
					}
					if(count==1) {
						prescription.add(prescription1.get(q));
					}
				}
				
				//查询到药方进行遍历
				for(int j=0;j<prescription.size();j++) {
					StringBuffer sb =new StringBuffer();
					//以“_”进行分割
					String []ps =prescription.get(j).getPrescription_particulars().split("_");
					//对每个部分进行遍历
					for(int t=0;t<ps.length;t++) {
						//按照“+”进行分割
						String []p=ps[t].split("\\+");
						if(p[0].matches("[0-9]+")) {
							List<Medicine> medicines=medicineService.findMedicineById(Integer.parseInt(p[0]));
							Medicine medicine =medicines.get(0);
							sb.append("<a href='/sheyao/QueryById?id=").append(medicine.getMedicine_ID()).append("'>")
							.append(medicine.getMedicine_name()).append("</a>").append("配").append(p[1]);
						}else {
							sb.append(p[0]).append("配").append(p[1]);
						}
						if(t==ps.length-1) {
							sb.append("");
						}else {
							sb.append("，");
						}
					}
					if(!(prescription.get(j).getDoctor_ID()==null||prescription.get(j).getDoctor_ID().equals(""))) {
					StringBuffer sbb =new StringBuffer();
					//"_"分割doctorid
					String []ds =prescription.get(j).getDoctor_ID().split("_");
					
					for(int a=0;a<ds.length;a++) {
						List<Doctor1> doctors = doctorService.findDoctorById(Integer.parseInt(ds[a]));
						if(a==ds.length-1) {
							sbb.append("<a href='/sheyao/QueryDoctorById?id=").append(doctors.get(0).getDoctor_ID())
							.append("'>").append(doctors.get(0).getDoctor_name()).append("</a>");
						}else {
							sbb.append("<a href='/sheyao/QueryDoctorById?id=").append(doctors.get(0).getDoctor_ID())
							.append("'>").append(doctors.get(0).getDoctor_name()).append("</a>").append(",");
						}
					}
					prescription.get(j).setDoctor_ID(sbb.toString());
					}
					prescription.get(j).setPrescription_particulars(sb.toString());
					
				}
				
				map.put(illnesses.get(i), prescription);
			}*/
			
			
			
		
		
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
