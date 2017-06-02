package tlkj.model;

import java.util.Date;

public class Hc_sdbkry {
    private Integer id;

    private Integer createdepartmentid;

    private Date createtime;

    private String createrpolicenum;

    private String personaddress;

    private String personid;

    private String personname;

    private String policecontact;

    private String policephone;

    private String reason;

    private String reserved;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCreatedepartmentid() {
        return createdepartmentid;
    }

    public void setCreatedepartmentid(Integer createdepartmentid) {
        this.createdepartmentid = createdepartmentid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getCreaterpolicenum() {
        return createrpolicenum;
    }

    public void setCreaterpolicenum(String createrpolicenum) {
        this.createrpolicenum = createrpolicenum == null ? null : createrpolicenum.trim();
    }

    public String getPersonaddress() {
        return personaddress;
    }

    public void setPersonaddress(String personaddress) {
        this.personaddress = personaddress == null ? null : personaddress.trim();
    }

    public String getPersonid() {
        return personid;
    }

    public void setPersonid(String personid) {
        this.personid = personid == null ? null : personid.trim();
    }

    public String getPersonname() {
        return personname;
    }

    public void setPersonname(String personname) {
        this.personname = personname == null ? null : personname.trim();
    }

    public String getPolicecontact() {
        return policecontact;
    }

    public void setPolicecontact(String policecontact) {
        this.policecontact = policecontact == null ? null : policecontact.trim();
    }

    public String getPolicephone() {
        return policephone;
    }

    public void setPolicephone(String policephone) {
        this.policephone = policephone == null ? null : policephone.trim();
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getReserved() {
        return reserved;
    }

    public void setReserved(String reserved) {
        this.reserved = reserved == null ? null : reserved.trim();
    }
}