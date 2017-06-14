package tlkj.dao;

import java.util.List;

import tlkj.model.Escaped;

public interface EscapedMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Escaped record);

    int insertSelective(Escaped record);

    Escaped selectByPrimaryKey(Integer id);
    
    Escaped selectByPersonId(String personid);

    int updateByPrimaryKeySelective(Escaped record);

    int updateByPrimaryKey(Escaped record);
    
    List<Escaped> getHundredRecord();
    
    List<Escaped> getAllRecord();
}