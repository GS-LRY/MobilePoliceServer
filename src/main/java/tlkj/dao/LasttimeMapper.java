package tlkj.dao;

import tlkj.model.Lasttime;

public interface LasttimeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Lasttime record);

    int insertSelective(Lasttime record);

    Lasttime selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Lasttime record);

    int updateByPrimaryKey(Lasttime record);
}