package tlkj.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
    
    int getAllRecordNumber();
    
    List<Escaped> searchEscaped(@Param("sfzh")String sfzh,@Param("xm")String xm);
    
    Escaped getServerLatestEscaped();
    
    List<Escaped> getServerUpdateEscaped(Map<String, Object> map);
}