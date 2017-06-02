package tlkj.model;

import java.util.Date;

public class Addressupdate {
    private Integer id;

    private Integer systemid;

    private String hdfsddqh;

    private String hdfsdzxz;

    private String hdfscs;

    private String hdfscsdm;

    private String hdfsddssgajg;

    private String hdfsddssgajgdm;

    private Date gxsj;

    private Integer gxlx;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public Date getGxsj() {
        return gxsj;
    }

    public void setGxsj(Date gxsj) {
        this.gxsj = gxsj;
    }

    public Integer getGxlx() {
        return gxlx;
    }

    public void setGxlx(Integer gxlx) {
        this.gxlx = gxlx;
    }
}