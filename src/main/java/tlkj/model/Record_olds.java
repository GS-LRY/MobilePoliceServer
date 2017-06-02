package tlkj.model;

import java.util.Date;

public class Record_olds {
    private Integer id;

    private String policeid;

    private String policename;

    private String policephoneno;

    private Integer policedepartment;

    private String checkcount;

    private Date committime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPoliceid() {
        return policeid;
    }

    public void setPoliceid(String policeid) {
        this.policeid = policeid == null ? null : policeid.trim();
    }

    public String getPolicename() {
        return policename;
    }

    public void setPolicename(String policename) {
        this.policename = policename == null ? null : policename.trim();
    }

    public String getPolicephoneno() {
        return policephoneno;
    }

    public void setPolicephoneno(String policephoneno) {
        this.policephoneno = policephoneno == null ? null : policephoneno.trim();
    }

    public Integer getPolicedepartment() {
        return policedepartment;
    }

    public void setPolicedepartment(Integer policedepartment) {
        this.policedepartment = policedepartment;
    }

    public String getCheckcount() {
        return checkcount;
    }

    public void setCheckcount(String checkcount) {
        this.checkcount = checkcount == null ? null : checkcount.trim();
    }

    public Date getCommittime() {
        return committime;
    }

    public void setCommittime(Date committime) {
        this.committime = committime;
    }
}