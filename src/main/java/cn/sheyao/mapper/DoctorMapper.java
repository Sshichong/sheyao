package cn.sheyao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sheyao.pojo.Doctor1;

public interface DoctorMapper {

	public List<Doctor1> findDoctor();

	public List<Doctor1> findDoctorByStartWith(@Param("startWith")String startWith);

	public List<Doctor1> findDoctorById(@Param("id")int id);

	public List<Doctor1> findDoctorBykey(@Param("key")String key);

}
