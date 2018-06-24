package cn.sheyao.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sheyao.mapper.TimeTaskMapper;
import cn.sheyao.pojo.Doctorcount;
import cn.sheyao.pojo.Illnesscount;
import cn.sheyao.pojo.Medicinecount;

@Service
public class TimeTaskServiceImp implements TimeTaskService {
	
	@Autowired
	TimeTaskMapper timeTaskMapper;

	@Override
	public void updateMedicinecount(Map<Integer, Integer> map) {
		// TODO Auto-generated method stub
		
		Iterator iter = map.entrySet().iterator();
		while(iter.hasNext()) {
			Map.Entry entry = (Map.Entry) iter.next();
			Integer id =(Integer)entry.getKey();
			Integer count =(Integer)entry.getValue();
			
			//先在数据库中查找有无id的记录，有则进行update操作，没有则进行insert操作
			List<Medicinecount> medicinecount=timeTaskMapper.findRecordById(id);
			if(medicinecount.size()==0) {  //没有记录，进行insert操作
				timeTaskMapper.saveRecord(id,count);
			}else {  //有记录，进行update操作
				timeTaskMapper.updateRecord(id,count);
			}
			
		}
		
	}



	@Override
	public void updateDoctorount(Map<Integer, Integer> map) {
		// TODO Auto-generated method stub
		
		Iterator iter = map.entrySet().iterator();
		while(iter.hasNext()) {
			Map.Entry<Integer, Integer> entry = (Map.Entry)iter.next();
			Integer id =entry.getKey();
			Integer count =entry.getValue();
			
			//查找表中有无该id的记录
			List<Doctorcount> doctorcount =timeTaskMapper.findRecordByDoctorId(id);
			if(doctorcount.size()==0) { //没有做插入操作
				timeTaskMapper.saveDoctorRecord(id,count);
			}else {   //有做更新操作
				timeTaskMapper.updateDoctorRecord(id,count);
			}
		}
		
	}



	@Override
	public void updateIllnesscount(Map<Integer, Integer> map) {
		// TODO Auto-generated method stub
		Iterator iter =map.entrySet().iterator();
		while(iter.hasNext()) {
			Map.Entry<Integer, Integer> entry =(Map.Entry)iter.next();
			Integer id =entry.getKey();
			Integer count =entry.getValue();
			
			//查找表中有无id的记录
			List<Illnesscount> illnesscout =timeTaskMapper.findRecordByIllnessId(id);
			if(illnesscout.size()==0) {
				timeTaskMapper.saveIllnessRecord(id,count);
			}else {
				timeTaskMapper.updateIllnessRecord(id,count);
			}
		}
		
	}



	

}
