package tlkj.dao;

import tlkj.model.Alarm;

public interface AlarmMapper {
    int insert(Alarm record);

    int insertSelective(Alarm record);
}