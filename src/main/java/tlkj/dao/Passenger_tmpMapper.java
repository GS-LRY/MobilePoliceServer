package tlkj.dao;

import tlkj.model.Passenger_tmp;

public interface Passenger_tmpMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Passenger_tmp record);

    int insertSelective(Passenger_tmp record);

    Passenger_tmp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Passenger_tmp record);

    int updateByPrimaryKey(Passenger_tmp record);
}