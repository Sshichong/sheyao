package cn.sheyao.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sheyao.pojo.Doctor1;
import cn.sheyao.pojo.Doctorcount;
import cn.sheyao.pojo.Illness;
import cn.sheyao.pojo.Illnesscount;
import cn.sheyao.pojo.Medicine;
import cn.sheyao.pojo.Medicinecount;
import cn.sheyao.pojo.Prescription;
import cn.sheyao.service.DoctorService;
import cn.sheyao.service.IllnessService;
import cn.sheyao.service.MedicineService;
import cn.sheyao.service.PrescriptionService;
import cn.sheyao.service.StatisticsService;

@Controller
public class StatisticsController {
	
	@Autowired
	StatisticsService statisticsService;
	
	@Autowired
	MedicineService medicineService;
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
	IllnessService illnessService;
	
	@Autowired
	PrescriptionService prescriptionService;
	
	
	@RequestMapping("/toStatistics")
	public String toStatistics(Model model) {
		
		List<Medicinecount> mc = statisticsService.findMedicineTopEight();
		List<Medicine> medicine =new ArrayList();
		List<Prescription> prescriptions =prescriptionService.findPrescription();
		Map<Integer,Integer> map =new HashMap<Integer,Integer>();
		for(int i=0;i<mc.size();i++) {
			int count=0;
			List<Medicine> ms=medicineService.findMedicineById(mc.get(i).getMedicineId());
			Medicine m =ms.get(0);
			for(int q=0;q<prescriptions.size();q++) {
				if(prescriptions.get(q).getPrescription_particulars().contains(m.getMedicine_name())) {
					count++;
				}else if(prescriptions.get(q).getPrescription_particulars().contains(m.getMedicine_anotherName())) {
					count++;
				}
				
			}
			map.put(m.getMedicine_ID(), count);
			medicine.add(m);
		}
		
		List<Doctorcount> dc=statisticsService.findDoctorTopEight();
		List<Doctor1> doctor =new ArrayList();
		for(int j=0;j<dc.size();j++) {
			List<Doctor1> ds =doctorService.findDoctorById(dc.get(j).getDoctorId());
			Doctor1 d =ds.get(0);
			doctor.add(d);
		}
		List<Illnesscount> ic=statisticsService.findIllnessTopEight();
		List<Illness> illness =new ArrayList();
		for(int t=0;t<ic.size();t++) {
			List<Illness> is =illnessService.findByIllnessId(ic.get(t).getIllnessId());
			Illness i=is.get(0);
			illness.add(i);
		}
		
		model.addAttribute("mc",mc);
		model.addAttribute("dc",dc);
		model.addAttribute("ic",ic);
		model.addAttribute("map",map);
		model.addAttribute("medicine",medicine);
		model.addAttribute("doctor",doctor);
		model.addAttribute("illness",illness);
		
		return "statistics1";
	}

}
