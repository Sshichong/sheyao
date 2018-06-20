package cn.sheyao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sheyao.mapper.PrescriptionMapper;
import cn.sheyao.pojo.Prescription;

@Service
public class PrescriptionServiceImp implements PrescriptionService{
	
	@Autowired
	PrescriptionMapper prescriptionMapper;

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

}
