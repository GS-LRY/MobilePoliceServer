package tlkj.dao;

import tlkj.model.Terminal;

public interface TerminalMapper {
    int deleteByPrimaryKey(String imei);

    int insert(Terminal record);

    int insertSelective(Terminal record);

    Terminal selectByPrimaryKey(String imei);

    int updateByPrimaryKeySelective(Terminal record);

    int updateByPrimaryKey(Terminal record);
}