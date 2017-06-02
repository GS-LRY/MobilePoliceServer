package tlkj.dao;

import tlkj.model.Record_olds;

public interface Record_oldsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Record_olds record);

    int insertSelective(Record_olds record);

    Record_olds selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Record_olds record);

    int updateByPrimaryKey(Record_olds record);
}