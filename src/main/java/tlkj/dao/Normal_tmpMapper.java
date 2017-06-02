package tlkj.dao;

import tlkj.model.Normal_tmp;

public interface Normal_tmpMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Normal_tmp record);

    int insertSelective(Normal_tmp record);

    Normal_tmp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Normal_tmp record);

    int updateByPrimaryKey(Normal_tmp record);
}