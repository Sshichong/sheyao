package cn.sheyao.tools;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.sheyao.pojo.Medicine;
import cn.sheyao.pojo.Prescription;
import cn.sheyao.service.MedicineService;

public class ChangePrescriptions {
	
	@Autowired
	MedicineService medicineService;
	
	public List<Prescription> changePrescriptions(List<Prescription> prescriptions){
		
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
		return prescriptions;
	}

}
