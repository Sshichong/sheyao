package cn.sheyao.service;

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

}
