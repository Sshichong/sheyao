package cn.sheyao.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sheyao.mapper.IllnessMapper;
import cn.sheyao.pojo.Illness;

@Service
public class IllnessServiceImp implements IllnessService {
	
	@Autowired
	IllnessMapper illnessMapper;

	@Override
	public List<Illness> findByIllnessId(int illnessId) {
		// TODO Auto-generated method stub
		return illnessMapper.findByIllnessId(illnessId);
	}

	@Override
	public List<List<Illness>> findIllness() {
		// TODO Auto-generated method stub
		
		//创建所有科室list
		List<Illness> Internal=new ArrayList(); //内科
		List<Illness> Surgery=new ArrayList();//外科
		List<Illness> Gynaecology=new ArrayList(); //妇科
		List<Illness> Pediatrics=new ArrayList(); //儿科
		List<Illness> FiveSenses=new ArrayList();//五官科
		List<Illness> Measles=new ArrayList(); //痧症科
		List<Illness> Snakebite =new ArrayList();//蛇伤科
		List<Illness> Rheumatic = new ArrayList(); //风湿与关节疾病
		List<Illness> Respiration=new ArrayList(); //呼吸科
		List<Illness> Digestive =new ArrayList();//消化科
		List<Illness> Neurology =new ArrayList();//神经科
		List<Illness> Genitourinary =new ArrayList();//泌尿生殖科
		List<Illness> Skin =new ArrayList();//皮肤科
		List<Illness> Infectious =new ArrayList();//传染科
		List<Illness> Other =new ArrayList();//其他
		
		List<List<Illness>> all =new ArrayList();
		
		
		/**
		 * 找到所有病症，根据科室进行分类，科室一样的存入相应list，最后各个科室的list存入all并返回
		 */
		List<Illness> illness =illnessMapper.findIllnessAll();
		for(int i=0;i<illness.size();i++) {
			if(illness.get(i).getIllness_admin().equals("内科")) {
				Internal.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("外科")) {
				Surgery.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("妇科")) {
				Gynaecology.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("儿科")) {
				Pediatrics.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("五官科")) {
				FiveSenses.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("痧症科")) {
				Measles.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("蛇伤科")) {
				Snakebite.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("风湿与关节疾病")) {
				Rheumatic.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("呼吸科")) {
				Respiration.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("消化科")) {
				Digestive.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("神经科")) {
				Neurology.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("泌尿生殖科")) {
				Genitourinary.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("皮肤科")) {
				Skin.add(illness.get(i));
			}else if(illness.get(i).getIllness_admin().equals("传染科")) {
				Infectious.add(illness.get(i));
			}else {
				Other.add(illness.get(i));
			}

		}
		all.add(Internal);
		all.add(Surgery);
		all.add(Gynaecology);
		all.add(Pediatrics);
		all.add(FiveSenses);
		all.add(Measles);
		all.add(Snakebite);
		all.add(Rheumatic);
		all.add(Respiration);
		all.add(Digestive);
		all.add(Neurology);
		all.add(Genitourinary);
		all.add(Skin);
		all.add(Infectious);
		all.add(Other);
		
		return all;
	}

	@Override
	public List<Illness> findIllnessByType(String type) {
		// TODO Auto-generated method stub
		return illnessMapper.findIllnessByType(type);
	}

	@Override
	public List<Illness> findIllnessByKey(String key) {
		// TODO Auto-generated method stub
		return illnessMapper.findIllnessByKey(key);
	}

	@Override
	public List<Illness> findIllnessAll() {
		// TODO Auto-generated method stub
		return illnessMapper.findIllnessAll();
	}

}
