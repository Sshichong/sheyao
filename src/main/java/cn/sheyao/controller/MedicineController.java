package cn.sheyao.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sheyao.pojo.Medicine;
import cn.sheyao.pojo.Medicinecount;
import cn.sheyao.service.MedicineService;
import cn.sheyao.service.TimeTaskService;

@Controller
public class MedicineController {
	
	@Autowired
	MedicineService medicineService;
	
	@Autowired
	TimeTaskService timeTaskService;
	
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
	
	
	//定时
	//@Scheduled(cron = "0 30 22 ? * *")
	@Scheduled(cron = "*/5 * * * * ?")
	public void MedicineTimerTask() {
		
		timeTaskService.updateMedicinecount(map);
		
	}
	
	
}
















