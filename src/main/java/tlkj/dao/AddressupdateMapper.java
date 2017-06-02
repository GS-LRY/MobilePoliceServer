package tlkj.dao;

import tlkj.model.Addressupdate;

public interface AddressupdateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Addressupdate record);

    int insertSelective(Addressupdate record);

    Addressupdate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Addressupdate record);

    int updateByPrimaryKey(Addressupdate record);
}