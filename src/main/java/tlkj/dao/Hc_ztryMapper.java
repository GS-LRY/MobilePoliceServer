package tlkj.dao;

import tlkj.model.Hc_ztry;

public interface Hc_ztryMapper {
    int deleteByPrimaryKey(String systemid);

    int insert(Hc_ztry record);

    int insertSelective(Hc_ztry record);

    Hc_ztry selectByPrimaryKey(String systemid);

    int updateByPrimaryKeySelective(Hc_ztry record);

    int updateByPrimaryKey(Hc_ztry record);
}