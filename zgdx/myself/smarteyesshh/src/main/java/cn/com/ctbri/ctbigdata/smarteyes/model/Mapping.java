package cn.com.ctbri.ctbigdata.smarteyes.model;

public class Mapping {
    private String mdn;

    private String telecomEncrypt;

    public String getMdn() {
        return mdn;
    }

    public void setMdn(String mdn) {
        this.mdn = mdn == null ? null : mdn.trim();
    }

    public String getTelecomEncrypt() {
        return telecomEncrypt;
    }

    public void setTelecomEncrypt(String telecomEncrypt) {
        this.telecomEncrypt = telecomEncrypt == null ? null : telecomEncrypt.trim();
    }
}