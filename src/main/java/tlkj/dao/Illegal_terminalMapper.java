package tlkj.dao;

import tlkj.model.Illegal_terminal;

public interface Illegal_terminalMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Illegal_terminal record);

    int insertSelective(Illegal_terminal record);

    Illegal_terminal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Illegal_terminal record);

    int updateByPrimaryKey(Illegal_terminal record);
}