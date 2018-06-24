package cn.sheyao.service;

import java.util.List;

import cn.sheyao.pojo.Doctorcount;
import cn.sheyao.pojo.Illnesscount;
import cn.sheyao.pojo.Medicinecount;

public interface StatisticsService {

	List<Medicinecount> findMedicineTopEight();

	List<Doctorcount> findDoctorTopEight();

	List<Illnesscount> findIllnessTopEight();

}
