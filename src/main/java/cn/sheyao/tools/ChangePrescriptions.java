package cn.sheyao.tools;

import java.util.List;

import javax.annotation.PostConstruct;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.sheyao.pojo.Doctor1;
import cn.sheyao.pojo.Medicine;
import cn.sheyao.pojo.Prescription;
import cn.sheyao.service.DoctorService;
import cn.sheyao.service.MedicineService;

@Component 
public class ChangePrescriptions {
	
	@Autowired
	private static MedicineService medicineService;
	
	@Autowired
	private static DoctorService doctorService;
	
	 public static ChangePrescriptions changePrescriptions;
	 
//	@PostConstruct
    public void init() {    
		changePrescriptions = this;
    }
	
	public  static List<Prescription> changePrescriptions(List<Prescription> prescriptions){
		
		System.out.println(prescriptions.toString());
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
					List<Medicine> medicines=changePrescriptions.medicineService.findMedicineById(Integer.parseInt(p[0]));
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
				List<Doctor1> doctors = changePrescriptions.doctorService.findDoctorById(Integer.parseInt(ds[b]));
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
					
		System.out.println(prescriptions.toString());
		return prescriptions;
	}

}
