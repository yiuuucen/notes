package cn.com.ctbri.ctbigdata.smarteyes.service;

/**
 * Created by elite on 2018/3/20.
 */
public interface SuspectService {

    /**
     * 根据手机号mdn判断
     * @param targetPhone
     * @return
     */
    public boolean isSuspect(String targetPhone);

    /**
     * 根据上海加密后的手机号mdn_encrypt判断
     * @param targetPhoneEnc
     * @return
     */
    public boolean isEncSuspect(String targetPhoneEnc);

    public String getSuspectType(String targetPhone);
}
