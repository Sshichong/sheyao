package cn.sheyao.mapper;

import java.util.List;

import cn.sheyao.pojo.Doctorcount;
import cn.sheyao.pojo.Illnesscount;
import cn.sheyao.pojo.Medicinecount;

public interface StatisticsMapper {

	List<Medicinecount> findMedicineTopEight();

	List<Doctorcount> findDoctorTopEight();

	List<Illnesscount> findIllnessTopEight();

}
