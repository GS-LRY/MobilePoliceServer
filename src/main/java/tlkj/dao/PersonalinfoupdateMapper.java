package tlkj.dao;

import tlkj.model.Personalinfoupdate;

public interface PersonalinfoupdateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Personalinfoupdate record);

    int insertSelective(Personalinfoupdate record);

    Personalinfoupdate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Personalinfoupdate record);

    int updateByPrimaryKey(Personalinfoupdate record);
}