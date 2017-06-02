package tlkj.model;

public class Userrole {
    private Integer id;

    private String rolename;

    private String allowpathpattern;

    private Integer rolelevel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public String getAllowpathpattern() {
        return allowpathpattern;
    }

    public void setAllowpathpattern(String allowpathpattern) {
        this.allowpathpattern = allowpathpattern == null ? null : allowpathpattern.trim();
    }

    public Integer getRolelevel() {
        return rolelevel;
    }

    public void setRolelevel(Integer rolelevel) {
        this.rolelevel = rolelevel;
    }
}