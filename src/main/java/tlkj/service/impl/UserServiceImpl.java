package tlkj.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tlkj.dao.DepartmentMapper;
import tlkj.dao.UserMapper;
import tlkj.model.User;
import tlkj.model.UserTable;
import tlkj.service.UserService;
import tlkj.util.MD5Util;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private DepartmentMapper departmentMapper;

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public DepartmentMapper getDepartmentMapper() {
		return departmentMapper;
	}

	public void setDepartmentMapper(DepartmentMapper departmentMapper) {
		this.departmentMapper = departmentMapper;
	}

	@Override
	public String login(String policeNumOrIdCard, String password) {
		//System.out.println("username:" + username + ", password: " + MD5Util.MD5(password));
		User user = null;
		user = userMapper.getUserByPoliceNumOrIdCard(policeNumOrIdCard, policeNumOrIdCard);
		//System.out.println("username:" + user.getUsername());
		if (user == null) {
			return "nouser";
		} else {
			String encodedPwd = MD5Util.convertMD5(password);
//			System.out.println("encodedPwd:" + encodedPwd);
//			System.out.println("password:" + user.getPassword());
			if (encodedPwd.equals(user.getPassword())||encodedPwd == user.getPassword()) {
				user.setLastlogintime(new Date());
				user.setIsusing(1);

				return "success";
			} else {
				return "fail";
			}
		}
	}

	@Override
	public List<UserTable> getAllUser() {
		// TODO Auto-generated method stub
		return userMapper.getAllUser();
	}

	@Override
	public List<UserTable> searchUser(String username, String policeNum, String idCard) {
		// TODO Auto-generated method stub
		return userMapper.searchUser(username, policeNum, idCard);
	}

	@Override
	public User getUserByPoliceNumOrIdCard(String policeNum, String idCard) {
		// TODO Auto-generated method stub
		return userMapper.getUserByPoliceNumOrIdCard(policeNum, idCard);
	}

	@Override
	public User existsPoliceNum(String policeNum) {
		// TODO Auto-generated method stub
		return userMapper.existsPoliceNum(policeNum);
	}

	@Override
	public User existsIdCard(String idCard) {
		// TODO Auto-generated method stub
		return userMapper.existsIdCard(idCard);
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(record);
	}

}
