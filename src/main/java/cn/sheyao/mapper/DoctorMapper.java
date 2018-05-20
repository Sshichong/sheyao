package cn.sheyao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sheyao.pojo.Doctor;

public interface DoctorMapper {

	public List<Doctor> findDoctor();

	public List<Doctor> findDoctorByStartWith(@Param("startWith")String startWith);

	public List<Doctor> findDoctorById(@Param("id")int id);

	public List<Doctor> findDoctorBykey(@Param("key")String key);

}
