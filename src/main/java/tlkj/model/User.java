package tlkj.model;

import java.util.Date;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String phone;

    private String allowpathpattern;

    private Integer isusing;

    private Integer locked;

    private Date registtime;

    private Date lastlogintime;

    private Integer departmentid;

    private Integer createrid;

    private String idcard;

    private String policenum;

    private String email;

    private Integer usertype;

    private String job;

    private String tel;
    
    private Department mDepartment;
    
	public Department getmDepartment() {
		return mDepartment;
	}

	public void setmDepartment(Department mDepartment) {
		this.mDepartment = mDepartment;
	}

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
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAllowpathpattern() {
        return allowpathpattern;
    }

    public void setAllowpathpattern(String allowpathpattern) {
        this.allowpathpattern = allowpathpattern == null ? null : allowpathpattern.trim();
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

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public Integer getCreaterid() {
        return createrid;
    }

    public void setCreaterid(Integer createrid) {
        this.createrid = createrid;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getPolicenum() {
        return policenum;
    }

    public void setPolicenum(String policenum) {
        this.policenum = policenum == null ? null : policenum.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getUsertype() {
        return usertype;
    }

    public void setUsertype(Integer usertype) {
        this.usertype = usertype;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }
}