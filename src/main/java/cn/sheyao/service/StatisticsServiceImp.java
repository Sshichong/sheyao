package cn.sheyao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sheyao.mapper.StatisticsMapper;
import cn.sheyao.pojo.Doctorcount;
import cn.sheyao.pojo.Illnesscount;
import cn.sheyao.pojo.Medicinecount;

@Service
public class StatisticsServiceImp implements StatisticsService {
	
	@Autowired
	StatisticsMapper statisticsMapper;

	@Override
	public List<Medicinecount> findMedicineTopEight() {
		// TODO Auto-generated method stub
		return statisticsMapper.findMedicineTopEight();
	}

	@Override
	public List<Doctorcount> findDoctorTopEight() {
		// TODO Auto-generated method stub
		return statisticsMapper.findDoctorTopEight();
	}

	@Override
	public List<Illnesscount> findIllnessTopEight() {
		// TODO Auto-generated method stub
		return statisticsMapper.findIllnessTopEight();
	}
	

}
