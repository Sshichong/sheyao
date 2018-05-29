package cn.sheyao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.sheyao.pojo.Illness;

public interface IllnessMapper {

	List<Illness> findByIllnessId(@Param("illnessId")int illnessId);

}
