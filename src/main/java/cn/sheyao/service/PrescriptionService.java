package cn.sheyao.service;

import java.util.List;

import cn.sheyao.pojo.Prescription;

public interface PrescriptionService {

	List<Prescription> findByDoctorId_IllnessId(String doctorid, String illnessid);

	List<Prescription> findByIllnessId(String illnessId);

	List<Prescription> findPrescription();

}
