package tlkj.model;

import java.util.Date;

public class Passenger {
    private Integer id;

    private String addresscode;

    private String addressgps;

    private String addressname;

    private Date committime;

    private String destaddress;

    private String personid;

    private String personname;

    private Date traveltime;

    private Integer userid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddresscode() {
        return addresscode;
    }

    public void setAddresscode(String addresscode) {
        this.addresscode = addresscode == null ? null : addresscode.trim();
    }

    public String getAddressgps() {
        return addressgps;
    }

    public void setAddressgps(String addressgps) {
        this.addressgps = addressgps == null ? null : addressgps.trim();
    }

    public String getAddressname() {
        return addressname;
    }

    public void setAddressname(String addressname) {
        this.addressname = addressname == null ? null : addressname.trim();
    }

    public Date getCommittime() {
        return committime;
    }

    public void setCommittime(Date committime) {
        this.committime = committime;
    }

    public String getDestaddress() {
        return destaddress;
    }

    public void setDestaddress(String destaddress) {
        this.destaddress = destaddress == null ? null : destaddress.trim();
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

    public Date getTraveltime() {
        return traveltime;
    }

    public void setTraveltime(Date traveltime) {
        this.traveltime = traveltime;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}