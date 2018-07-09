package cn.com.ctbri.ctbigdata.smarteyes.constants;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import cn.com.ctbri.ctbigdata.smarteyes.utils.AESUtil;
 
public class ConvertPwdPropertyConfigurer extends PropertyPlaceholderConfigurer{  
	 private String[] encryptPropNames = {"jdbc.url","jdbc.username", "jdbc.password"};  
     
	    @Override  
	    protected String convertProperty(String propertyName, String propertyValue)  
	    {  
	    	try{
	    		//如果在加密属性名单中发现该属性  
		        if (isEncryptProp(propertyName))  
		        {  
		            String decryptValue = AESUtil.aesDecrypt(AESUtil.DENGTA_KEY, propertyValue);  
		            return decryptValue;  
		        }else {  
		            return propertyValue;  
		        } 
	    	}catch(Exception e){
	    		e.printStackTrace();
	    		return propertyValue;
	    	}
	          
	    }  
	      
	    private boolean isEncryptProp(String propertyName)  
	    {  
	        for (String encryptName : encryptPropNames)  
	        {  
	            if (encryptName.equals(propertyName))  
	            {  
	                return true;  
	            }  
	        }  
	        return false;  
	    }  
} 
