package cn.sheyao.service;

import java.util.List;

import cn.sheyao.pojo.Illness;

public interface IllnessService {

	List<Illness> findByIllnessId(int illnessId);

}