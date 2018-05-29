package cn.sheyao.service;

import java.util.List;

import cn.sheyao.pojo.Doctor1;

public interface DoctorService {

	public List<Doctor1> findDoctor();

	public List<Doctor1> findDoctorByStartWith(String StartWith);

	public List<Doctor1> findDoctorById(int id);

	public List<Doctor1> findDoctorBykey(String key);

}
