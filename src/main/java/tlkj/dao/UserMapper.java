package tlkj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import tlkj.model.User;
import tlkj.model.UserTable;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User getUserByPoliceNumOrIdCard(@Param("policeNum") String policeNum,@Param("idCard") String idCard);
    
    User existsPoliceNum(String policeNum);
    
    User existsIdCard(String idCard);
    
    List<UserTable> getAllUser();
    
    List<UserTable> searchUser(@Param("username") String username,@Param("policeNum") String policeNum,@Param("idCard") String idCard);
}