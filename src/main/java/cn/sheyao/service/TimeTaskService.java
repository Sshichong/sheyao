package cn.sheyao.service;

import java.util.List;
import java.util.Map;

import cn.sheyao.pojo.Medicinecount;

public interface TimeTaskService {

	void updateMedicinecount(Map<Integer, Integer> map);

	void updateDoctorount(Map<Integer, Integer> map);

	void updateIllnesscount(Map<Integer, Integer> map);

}
