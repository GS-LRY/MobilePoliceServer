package tlkj.dao;

import tlkj.model.Hc_sdbkry;

public interface Hc_sdbkryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Hc_sdbkry record);

    int insertSelective(Hc_sdbkry record);

    Hc_sdbkry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Hc_sdbkry record);

    int updateByPrimaryKey(Hc_sdbkry record);
}