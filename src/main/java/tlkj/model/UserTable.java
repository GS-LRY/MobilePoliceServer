package tlkj.model;

import java.util.Date;

public class UserTable {
	private Integer id;// id

	private String username;// 警员姓名

	private String phone;// 联系方式

	private Integer isusing;// 是否启用

	private Integer locked;// 是否锁定

	private Date registtime;// 注册时间

	private Date lastlogintime;// 最后登录时间

	private String departmentname;// 所属部门

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

	private String idcard;// 身份证号

	private String policenum;// 警员编号

	private String email;// 电子邮件

	private String job;// 职务

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getIsusing() {
		return isusing;
	}

	public void setIsusing(Integer isusing) {
		this.isusing = isusing;
	}

	public Integer getLocked() {
		return locked;
	}

	public void setLocked(Integer locked) {
		this.locked = locked;
	}

	public Date getRegisttime() {
		return registtime;
	}

	public void setRegisttime(Date registtime) {
		this.registtime = registtime;
	}

	public Date getLastlogintime() {
		return lastlogintime;
	}

	public void setLastlogintime(Date lastlogintime) {
		this.lastlogintime = lastlogintime;
	}


	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPolicenum() {
		return policenum;
	}

	public void setPolicenum(String policenum) {
		this.policenum = policenum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

}
