package tlkj.dao;

import tlkj.model.Terminal_log;

public interface Terminal_logMapper {
    int insert(Terminal_log record);

    int insertSelective(Terminal_log record);
}