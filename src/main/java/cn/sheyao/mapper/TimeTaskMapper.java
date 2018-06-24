package cn.sheyao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sheyao.pojo.Doctorcount;
import cn.sheyao.pojo.Illnesscount;
import cn.sheyao.pojo.Medicinecount;

public interface TimeTaskMapper {

	List<Medicinecount> findRecordById(@Param("id")Integer id);

	void saveRecord(@Param("id")Integer id, @Param("count")Integer count);

	void updateRecord(@Param("id")Integer id, @Param("count")Integer count);

	List<Doctorcount> findRecordByDoctorId(@Param("id")Integer id);

	void saveDoctorRecord(@Param("id")Integer id, @Param("count")Integer count);

	void updateDoctorRecord(@Param("id")Integer id, @Param("count")Integer count);

	List<Illnesscount> findRecordByIllnessId(@Param("id")Integer id);

	void saveIllnessRecord(@Param("id")Integer id, @Param("count")Integer count);

	void updateIllnessRecord(@Param("id")Integer id, @Param("count")Integer count);



}
