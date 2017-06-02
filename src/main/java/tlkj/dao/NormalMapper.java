package tlkj.dao;

import java.util.List;

import tlkj.model.Normal;

public interface NormalMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Normal record);

    int insertSelective(Normal record);

    Normal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Normal record);

    int updateByPrimaryKey(Normal record);
    
    List<Normal> getAll();
    List<Normal> getAllNormal();
}