package cn.sheyao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sheyao.mapper.PrescriptionMapper;
import cn.sheyao.pojo.Doctor1;
import cn.sheyao.pojo.Medicine;
import cn.sheyao.pojo.Prescription;

@Service
public class PrescriptionServiceImp implements PrescriptionService{
	
	@Autowired
	PrescriptionMapper prescriptionMapper;
	
	@Autowired
	MedicineService medicineService;
	
	@Autowired
	DoctorService doctorService;

	@Override
	public List<Prescription> findByDoctorId_IllnessId(String doctorid, String illnessid) {
		// TODO Auto-generated method stub
		return prescriptionMapper.findByDoctorId_IllnessId(doctorid,illnessid);
	}

	@Override
	public List<Prescription> findByIllnessId(String illnessId) {
		// TODO Auto-generated method stub
		return prescriptionMapper.findByIllnessId(illnessId);
	}

	@Override
	public List<Prescription> findPrescription() {
		// TODO Auto-generated method stub
		
		List<Prescription> prescription= prescriptionMapper.findPrescription();
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
		return prescription;
	}

}
