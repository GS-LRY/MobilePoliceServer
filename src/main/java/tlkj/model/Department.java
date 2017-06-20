package tlkj.model;


public class Department {
    private Integer id;

    private String name;

    private String allowpathpattern;

    private Integer level;

    private Integer parentid;

    private Integer createrid;
   
	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAllowpathpattern() {
        return allowpathpattern;
    }

    public void setAllowpathpattern(String allowpathpattern) {
        this.allowpathpattern = allowpathpattern == null ? null : allowpathpattern.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Integer getCreaterid() {
        return createrid;
    }

    public void setCreaterid(Integer createrid) {
        this.createrid = createrid;
    }
}