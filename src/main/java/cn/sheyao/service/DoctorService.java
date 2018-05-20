package cn.sheyao.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.sheyao.pojo.Doctor;

public interface DoctorService {

	public List<Doctor> findDoctor();

	public List<Doctor> findDoctorByStartWith(String StartWith);

	public List<Doctor> findDoctorById(int id);

	public List<Doctor> findDoctorBykey(String key);

}
