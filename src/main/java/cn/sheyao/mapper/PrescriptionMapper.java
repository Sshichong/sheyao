package cn.sheyao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sheyao.pojo.Prescription;

public interface PrescriptionMapper {

	public List<Prescription> findByDoctorId_IllnessId(@Param("doctorid")String doctorid,@Param("illnessid") String illnessid);

	public List<Prescription> findByIllnessId(@Param("illnessId")String illnessId);

	public List<Prescription> findPrescription();

}
