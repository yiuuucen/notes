package cn.com.ctbri.smarteyesshh.dataextract;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

/**
 * @author zeromem
 * @date 2017/11/27
 */
public class EncryptUtil {
    private final static char[] hexArray = "0123456789ABCDEF".toCharArray();

    public static final String ALGO = "AES";
    public static final String KEY = "parallelparallel";
    public static final SecretKeySpec KEY_SPEC = new SecretKeySpec(KEY.getBytes(), ALGO);
    private static Cipher enpher;
    private static Cipher depher;
    static {
        try {
            enpher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            depher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            enpher.init(Cipher.ENCRYPT_MODE, KEY_SPEC);
            depher.init(Cipher.DECRYPT_MODE, KEY_SPEC);
        } catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException e) {
            e.printStackTrace();
        }
    }

    public static String encrypt(String txt) throws BadPaddingException, IllegalBlockSizeException {
        return bytesToHex(enpher.doFinal(txt.getBytes()));
    }

    public static String decrypt(String crypt) throws BadPaddingException, IllegalBlockSizeException {
        return new String(depher.doFinal(hexToBytes(crypt)));
    }

    public static void main(String[] args) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException, UnsupportedEncodingException, InvalidAlgorithmParameterException {
        System.out.println(encrypt("13920076381"));
        System.out.println(encrypt("13920076382"));
        System.out.println(encrypt("13920076383"));
        System.out.println(encrypt("17701304229"));
        System.out.println(encrypt("18611045678"));
    }

    private static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
    }

    private static byte[] hexToBytes(String hex) {
        int len = hex.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                    + Character.digit(hex.charAt(i + 1), 16));
        }
        return data;
    }
}
