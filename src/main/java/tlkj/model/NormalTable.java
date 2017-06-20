package tlkj.model;

import java.util.List;

/**
 * 核查记录显示表
 * @author by Mr. Luruyi
 * 2017-6-20
 */
public class NormalTable {
	private String personid;// 被核录人员身份证号

	private String personname;// 被核录人员姓名

	private String addressname;// 核录地点

	private String committime;// 核录时间

	private String username;// 核录警员
	
	private String name;// 核录单位
	private List<User> userList;

	private List<Department> departmentList;

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

	public String getPersonid() {
		return personid;
	}

	public void setPersonid(String personid) {
		this.personid = personid;
	}

	public String getPersonname() {
		return personname;
	}

	public void setPersonname(String personname) {
		this.personname = personname;
	}

	public String getAddressname() {
		return addressname;
	}

	public void setAddressname(String addressname) {
		this.addressname = addressname;
	}

	public String getCommittime() {
		return committime;
	}

	public void setCommittime(String committime) {
		this.committime = committime;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
