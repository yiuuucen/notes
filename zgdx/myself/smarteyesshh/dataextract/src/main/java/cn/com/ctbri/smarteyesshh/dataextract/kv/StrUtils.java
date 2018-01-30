package cn.com.ctbri.smarteyesshh.dataextract.kv;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StrUtils {
    private static final String HMAC_SHA1_ALGORITHM = "HmacSHA1";

    public static boolean IsNullOrEmpty(String input) {
        return (input == null) || (input.length() == 0);
    }

    public static String ToAllNum(String input) {
        try {
            String result = "";
            for (int i = 0; i < input.length(); i++) {
                char c = input.charAt(i);
                int v = Character.getNumericValue(c);
                // result += String.format("%02d", v);
                if (v > 9) {
                    v = v - 9;
                    result += String.format("%02d", v);
                } else {
                    result += Integer.toString(v);
                }
            }
            return result;
        } catch (Exception ex) {
            return "-1";
        }
    }

    public static String Encode64(String input) {
        if (input == null) {
            return "";
        }
        BASE64Encoder encoder = new BASE64Encoder();
        try {
            return encoder.encode(input.getBytes());
        } catch (Exception ex) {
            return "";
        }
    }

    public static String Decode64(String input) {
        if (input == null) {
            return "";
        }
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            byte[] b = decoder.decodeBuffer(input);
            return new String(b);
        } catch (Exception ex) {
            return "";
        }
    }

    public static String SHA1(String inStr) {
        MessageDigest md = null;
        String outStr = null;
        try {
            md = MessageDigest.getInstance("SHA-1");
            byte[] hash = inStr.getBytes("UnicodeLittle");
            byte[] newHash = new byte[hash.length - 2];
            System.arraycopy(hash, 2, newHash, 0, newHash.length);
            byte[] digest = md.digest(newHash);
            outStr = bytetoString(digest);
        } catch (Exception ex) {
        }
        return outStr;
    }

    public static String bytetoString(byte[] digest) {
        StringBuilder str = new StringBuilder();
        String tempStr = "";

        for (int i = 0; i < digest.length; i++) {
            tempStr = (Integer.toHexString(digest[i] & 0xff));
            if (tempStr.length() == 1) {
                str.append("0").append(tempStr);
            } else {
                str.append(tempStr);
            }
        }
        return str.toString().toLowerCase();
    }

    public static String kvSign(String secretKey, String data) throws NoSuchAlgorithmException, InvalidKeyException {

        secretKey = Md5Utils.encode(secretKey);

        SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes(), HMAC_SHA1_ALGORITHM);
        Mac mac = Mac.getInstance(HMAC_SHA1_ALGORITHM);
        mac.init(signingKey);
        byte[] rawHmac = mac.doFinal(data.getBytes());
        return org.apache.commons.codec.binary.Hex.encodeHexString(rawHmac);
    }
}
