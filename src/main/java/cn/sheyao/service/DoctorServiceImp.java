package cn.sheyao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sheyao.mapper.DoctorMapper;
import cn.sheyao.pojo.Doctor;


@Service
public class DoctorServiceImp implements DoctorService{

	
	@Autowired
	DoctorMapper doctorMapper;
	
	@Override
	public List<Doctor> findDoctor() {
		// TODO Auto-generated method stub
		return doctorMapper.findDoctor();
	}

}
