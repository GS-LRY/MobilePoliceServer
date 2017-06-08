package tlkj.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tlkj.dao.DepartmentMapper;
import tlkj.dao.UserMapper;
import tlkj.model.User;
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
	public String login(String username, String password) {
		System.out.println("username:" + username + ", password: " + MD5Util.MD5(password));
		User user = null;
		user = userMapper.getUserByName(username);
		//System.out.println("username:" + user.getUsername());
		if (user == null) {
			return "nouser";
		} else {
			String encodedPwd = MD5Util.MD5(password);
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

}
