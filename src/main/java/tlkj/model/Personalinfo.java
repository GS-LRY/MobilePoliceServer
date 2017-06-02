package tlkj.model;

import java.util.Date;

public class Personalinfo {
    private String systemid;

    private String sfzh;

    private String xm;

    private String xb;

    private Date csrq;

    private String jyaq;

    private String qxsqr;

    private String qxlxdh;

    private String zrdw;

    private String sfsb;

    public String getSystemid() {
        return systemid;
    }

    public void setSystemid(String systemid) {
        this.systemid = systemid == null ? null : systemid.trim();
    }

    public String getSfzh() {
        return sfzh;
    }

    public void setSfzh(String sfzh) {
        this.sfzh = sfzh == null ? null : sfzh.trim();
    }

    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm == null ? null : xm.trim();
    }

    public String getXb() {
        return xb;
    }

    public void setXb(String xb) {
        this.xb = xb == null ? null : xb.trim();
    }

    public Date getCsrq() {
        return csrq;
    }

    public void setCsrq(Date csrq) {
        this.csrq = csrq;
    }

    public String getJyaq() {
        return jyaq;
    }

    public void setJyaq(String jyaq) {
        this.jyaq = jyaq == null ? null : jyaq.trim();
    }

    public String getQxsqr() {
        return qxsqr;
    }

    public void setQxsqr(String qxsqr) {
        this.qxsqr = qxsqr == null ? null : qxsqr.trim();
    }

    public String getQxlxdh() {
        return qxlxdh;
    }

    public void setQxlxdh(String qxlxdh) {
        this.qxlxdh = qxlxdh == null ? null : qxlxdh.trim();
    }

    public String getZrdw() {
        return zrdw;
    }

    public void setZrdw(String zrdw) {
        this.zrdw = zrdw == null ? null : zrdw.trim();
    }

    public String getSfsb() {
        return sfsb;
    }

    public void setSfsb(String sfsb) {
        this.sfsb = sfsb == null ? null : sfsb.trim();
    }
}