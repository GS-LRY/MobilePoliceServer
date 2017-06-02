package tlkj.dao;

import tlkj.model.Address;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer systemid);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer systemid);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}