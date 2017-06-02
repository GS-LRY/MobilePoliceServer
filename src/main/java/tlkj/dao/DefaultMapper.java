package tlkj.dao;

import tlkj.model.Default;

public interface DefaultMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Default record);

    int insertSelective(Default record);

    Default selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Default record);

    int updateByPrimaryKey(Default record);
}