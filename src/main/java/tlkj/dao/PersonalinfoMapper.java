package tlkj.dao;

import tlkj.model.Personalinfo;

public interface PersonalinfoMapper {
    int insert(Personalinfo record);

    int insertSelective(Personalinfo record);
}