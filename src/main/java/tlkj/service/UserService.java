package tlkj.service;

import java.util.List;

import tlkj.model.User;
import tlkj.model.UserTable;

public interface UserService {
	String login(String policeNumOrIdCard, String password);

	User getUserByPoliceNumOrIdCard(String policeNum, String idCard);

	User existsPoliceNum(String policeNum);

	User existsIdCard(String idCard);

	List<UserTable> getAllUser();

	List<UserTable> searchUser(String username, String policeNum, String idCard);

	int insertSelective(User record);

	int updateByPrimaryKeySelective(User record);
}
