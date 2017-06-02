package tlkj.dao;

import tlkj.model.Company;

public interface CompanyMapper {
    int deleteByPrimaryKey(String code);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(String code);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);
}