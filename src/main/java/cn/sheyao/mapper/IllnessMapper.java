package cn.sheyao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sheyao.pojo.Illness;

public interface IllnessMapper {

	List<Illness> findByIllnessId(@Param("illnessId")int illnessId);

	List<Illness> findIllnessAll();

	List<Illness> findIllnessByType(@Param("type")String type);

	List<Illness> findIllnessByKey(@Param("key")String key);

}
