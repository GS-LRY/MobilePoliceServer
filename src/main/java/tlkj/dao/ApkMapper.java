package tlkj.dao;

import tlkj.model.Apk;

public interface ApkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Apk record);

    int insertSelective(Apk record);

    Apk selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Apk record);

    int updateByPrimaryKeyWithBLOBs(Apk record);

    int updateByPrimaryKey(Apk record);
}