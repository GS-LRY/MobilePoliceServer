package tlkj.model;

public class Address {
    private Integer systemid;

    private String hdfsddqh;

    private String hdfsdzxz;

    private String hdfscs;

    private String hdfscsdm;

    private String hdfsddssgajg;

    private String hdfsddssgajgdm;

    public Integer getSystemid() {
        return systemid;
    }

    public void setSystemid(Integer systemid) {
        this.systemid = systemid;
    }

    public String getHdfsddqh() {
        return hdfsddqh;
    }

    public void setHdfsddqh(String hdfsddqh) {
        this.hdfsddqh = hdfsddqh == null ? null : hdfsddqh.trim();
    }

    public String getHdfsdzxz() {
        return hdfsdzxz;
    }

    public void setHdfsdzxz(String hdfsdzxz) {
        this.hdfsdzxz = hdfsdzxz == null ? null : hdfsdzxz.trim();
    }

    public String getHdfscs() {
        return hdfscs;
    }

    public void setHdfscs(String hdfscs) {
        this.hdfscs = hdfscs == null ? null : hdfscs.trim();
    }

    public String getHdfscsdm() {
        return hdfscsdm;
    }

    public void setHdfscsdm(String hdfscsdm) {
        this.hdfscsdm = hdfscsdm == null ? null : hdfscsdm.trim();
    }

    public String getHdfsddssgajg() {
        return hdfsddssgajg;
    }

    public void setHdfsddssgajg(String hdfsddssgajg) {
        this.hdfsddssgajg = hdfsddssgajg == null ? null : hdfsddssgajg.trim();
    }

    public String getHdfsddssgajgdm() {
        return hdfsddssgajgdm;
    }

    public void setHdfsddssgajgdm(String hdfsddssgajgdm) {
        this.hdfsddssgajgdm = hdfsddssgajgdm == null ? null : hdfsddssgajgdm.trim();
    }
}