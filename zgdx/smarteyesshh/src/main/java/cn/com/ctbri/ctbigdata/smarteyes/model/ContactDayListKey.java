package cn.com.ctbri.ctbigdata.smarteyes.model;

public class ContactDayListKey {
    private String id;

    private String datelabel;

    private Integer type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getDatelabel() {
        return datelabel;
    }

    public void setDatelabel(String datelabel) {
        this.datelabel = datelabel == null ? null : datelabel.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}