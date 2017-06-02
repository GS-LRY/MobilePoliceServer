package tlkj.model;

import java.util.Date;

public class Relation {
    private Integer id;

    private String dw;

    private String zdryxm;

    private String sfzh;

    private String xm;

    private String gxrsfzh;

    private String gx;

    private String gkmjdh;

    private Date gxsj;

    private Integer gxlx;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDw() {
        return dw;
    }

    public void setDw(String dw) {
        this.dw = dw == null ? null : dw.trim();
    }

    public String getZdryxm() {
        return zdryxm;
    }

    public void setZdryxm(String zdryxm) {
        this.zdryxm = zdryxm == null ? null : zdryxm.trim();
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

    public String getGxrsfzh() {
        return gxrsfzh;
    }

    public void setGxrsfzh(String gxrsfzh) {
        this.gxrsfzh = gxrsfzh == null ? null : gxrsfzh.trim();
    }

    public String getGx() {
        return gx;
    }

    public void setGx(String gx) {
        this.gx = gx == null ? null : gx.trim();
    }

    public String getGkmjdh() {
        return gkmjdh;
    }

    public void setGkmjdh(String gkmjdh) {
        this.gkmjdh = gkmjdh == null ? null : gkmjdh.trim();
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