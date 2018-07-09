package cn.com.ctbri.ctbigdata.smarteyes.utils;

public class WebPageUtil {
	
	/**
	 * 用户姓名解密并隐藏最后一位
	 * @param encryptData 加密后的名字
	 * */
	public static String nameDecryptHide(String encryptData){
		String name = null;
		try {
			name = AESUtil.aesDecrypt(AESUtil.DENGTA_KEY, encryptData);
		} catch (Exception e) {
			e.printStackTrace();
			name = encryptData;
		}
		name = nameHide(name);//隐藏最后一位
		return name;	
	}
	
	/**
	 * 用户姓名隐藏最后一位
	 * @param name 名字
	 * */
	public static String nameHide(String name){
		if(name == null){
			return name;
		}
		return name.substring(0,name.length() - 1) + "*";
	}
	
	/**
	 * 手机号码解密并隐藏中间4位
	 * @param encryptData 加密后的手机号码
	 * */
	public static String phoneDecryptHide(String encryptData){
		String phone = null;
		try {
			phone = AESUtil.aesDecrypt(AESUtil.DENGTA_KEY, encryptData);
		} catch (Exception e) {
			e.printStackTrace();
			phone = encryptData;
		}
		phone = phoneHide(phone);//隐藏中间4位
		return phone;	
	}
	
	/**
	 * 手机号码隐藏中间4位
	 * @param name 名字
	 * */
	public static String phoneHide(String phone){
		if(phone == null || phone.length() <= 8){
			return phone;
		}
		return phone.substring(0,phone.length() - 8) + "****" + phone.substring(phone.length() - 4);
	}

}
