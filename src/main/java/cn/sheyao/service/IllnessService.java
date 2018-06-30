package cn.sheyao.service;

import java.util.List;

import cn.sheyao.pojo.Illness;

public interface IllnessService {

	List<Illness> findByIllnessId(int illnessId);

	List<List<Illness>> findIllness();

	List<Illness> findIllnessByType(String type);

	List<Illness> findIllnessByKey(String key);

	List<Illness> findIllnessAll();

}
