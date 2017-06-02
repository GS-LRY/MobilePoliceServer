package tlkj.model;

public class Terminal {
    private String imei;

    private String imsi;

    private Integer userid;

    private Integer departmentid;

    private Byte locked;

    private Byte online;

    private Byte devicetype;

    private String useplace;

    public String getImei() {
        return imei;
    }

    public void setImei(String imei) {
        this.imei = imei == null ? null : imei.trim();
    }

    public String getImsi() {
        return imsi;
    }

    public void setImsi(String imsi) {
        this.imsi = imsi == null ? null : imsi.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public Byte getLocked() {
        return locked;
    }

    public void setLocked(Byte locked) {
        this.locked = locked;
    }

    public Byte getOnline() {
        return online;
    }

    public void setOnline(Byte online) {
        this.online = online;
    }

    public Byte getDevicetype() {
        return devicetype;
    }

    public void setDevicetype(Byte devicetype) {
        this.devicetype = devicetype;
    }

    public String getUseplace() {
        return useplace;
    }

    public void setUseplace(String useplace) {
        this.useplace = useplace == null ? null : useplace.trim();
    }
}