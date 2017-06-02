package tlkj.model;

import java.util.Date;

public class Apk {
    private Integer id;

    private String apkname;

    private String updateurl;

    private Integer isforced;

    private String currentversion;

    private Date uploadtime;

    private String updatecontent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getApkname() {
        return apkname;
    }

    public void setApkname(String apkname) {
        this.apkname = apkname == null ? null : apkname.trim();
    }

    public String getUpdateurl() {
        return updateurl;
    }

    public void setUpdateurl(String updateurl) {
        this.updateurl = updateurl == null ? null : updateurl.trim();
    }

    public Integer getIsforced() {
        return isforced;
    }

    public void setIsforced(Integer isforced) {
        this.isforced = isforced;
    }

    public String getCurrentversion() {
        return currentversion;
    }

    public void setCurrentversion(String currentversion) {
        this.currentversion = currentversion == null ? null : currentversion.trim();
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getUpdatecontent() {
        return updatecontent;
    }

    public void setUpdatecontent(String updatecontent) {
        this.updatecontent = updatecontent == null ? null : updatecontent.trim();
    }
}