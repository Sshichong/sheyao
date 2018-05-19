package cn.sheyao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sheyao.pojo.Department;
import cn.sheyao.pojo.Medicine;

public interface MedicineMapper {

	public List<Medicine> findMedicine();

	public List<Medicine> findMedicineByDate();

	public List<Medicine> findMedicineByType(@Param("type1")int type1);

	public List<Medicine> findMedicineById(@Param("id")int id1);

	public List<Medicine> findMedicineByKey(@Param("key")String key);



	

}
