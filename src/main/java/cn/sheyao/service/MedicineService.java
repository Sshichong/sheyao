package cn.sheyao.service;

import java.util.List;

import cn.sheyao.pojo.Medicine;

public interface MedicineService {

	public List<Medicine> findMedicine();

	public List<Medicine> findMedicineByDate();

	public List<Medicine> findMedicineByType(int type1);

	public List<Medicine> findMedicineById(int id1);

	public List<Medicine> findMedicineByKey(String key);





	

}
