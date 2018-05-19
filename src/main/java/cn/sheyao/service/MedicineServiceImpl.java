package cn.sheyao.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sheyao.mapper.MedicineMapper;
import cn.sheyao.pojo.Department;
import cn.sheyao.pojo.Medicine;

@Service
public class MedicineServiceImpl implements MedicineService{
	
	@Autowired
	MedicineMapper medicineMapper;

	@Override
	public List<Medicine> findMedicine() {
		// TODO Auto-generated method stub
		return medicineMapper.findMedicine();
	}

	@Override
	public List<Medicine> findMedicineByDate() {
		// TODO Auto-generated method stub
		return medicineMapper.findMedicineByDate();
	}

	@Override
	public List<Medicine> findMedicineByType(int type1) {
		// TODO Auto-generated method stub
		return medicineMapper.findMedicineByType(type1);
	}

	@Override
	public List<Medicine> findMedicineById(int id1) {
		// TODO Auto-generated method stub
		
		return medicineMapper.findMedicineById(id1);
	}

	@Override
	public List<Medicine> findMedicineByKey(String key) {
		// TODO Auto-generated method stub
		return medicineMapper.findMedicineByKey(key);
	}


	


	
}
