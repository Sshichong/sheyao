package cn.sheyao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sheyao.mapper.DoctorMapper;
import cn.sheyao.pojo.Doctor1;


@Service
public class DoctorServiceImp implements DoctorService{

	
	@Autowired
	DoctorMapper doctorMapper;
	
	@Override
	public List<Doctor1> findDoctor() {
		// TODO Auto-generated method stub
		return doctorMapper.findDoctor();
	}

	@Override
	public List<Doctor1> findDoctorByStartWith(String StartWith) {
		// TODO Auto-generated method stub
		return doctorMapper.findDoctorByStartWith(StartWith);
	}

	@Override
	public List<Doctor1> findDoctorById(int id) {
		// TODO Auto-generated method stub
		return doctorMapper.findDoctorById(id);
	}

	@Override
	public List<Doctor1> findDoctorBykey(String key) {
		// TODO Auto-generated method stub
		return doctorMapper.findDoctorBykey(key);
	}

}
