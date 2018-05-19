package cn.sheyao.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.sheyao.pojo.Doctor;

public interface DoctorService {

	public List<Doctor> findDoctor();

}
