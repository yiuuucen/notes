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
import java.util.Base64;

/**
 * @author zeromem
 * @date 2017/11/27
 */
public class AESUtil {
    public static final String KEY = "contactqqzeromem";
    private static final String AESTYPE = "AES/ECB/PKCS5Padding";

    public static String aesEncrypt(String keyStr, String plainText) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        SecretKeySpec key = generateKey(keyStr);
        Cipher cipher = Cipher.getInstance(AESTYPE);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encrypt = cipher.doFinal(plainText.getBytes());
        return Base64.getEncoder().encodeToString(encrypt);
    }

    public static String aesDecrypt(String keyStr, String encryptData) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        SecretKeySpec key = generateKey(keyStr);
        Cipher cipher = Cipher.getInstance(AESTYPE);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decrypt = cipher.doFinal(Base64.getDecoder().decode(encryptData));
        return new String(decrypt).trim();
    }

    private static SecretKeySpec generateKey(String key) {
        return new SecretKeySpec(key.getBytes(), "AES");
    }


    public static void main(String[] args) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException, UnsupportedEncodingException, InvalidAlgorithmParameterException {
        String en = "CM7Dk+LF5GbJOXSwW0S82VHBhaOtTemIU80l8pzFeGMRBlZR5PD6FIhMPtvoZ1izFMEvBxilX3wuLAiaVMYjxwSbWE+xptOfp9hBk0s8PvZWoTr0kp/MNqMcWwnonoxwMXfvFL6hhRrQb0o/KBEmY9s/xFtgVMZPFLCWPMGwTA5DatS/UbDbLy+jeF4jMZl1Qt1A4NGSs0xT2cwLJEiClMi+yuvjUa8P/udVPL/UBruQ+sIvNajbwVh7MT/B9RFVHSF9o/XeIWl+d/vIS8ur2xOmUcsPTqnW8PnbGhCr7odc2tNIcXKv5v14UZ4P3N66yfC8KulLc7jgWiD5dDYDk9vGPegze3ZXEWBkVRDLVk1gid/PfKsXtrCjOUn3i2CM6OnK8UoJgMuLTP5RDrzASUEBFLyv0KZKDvrhitl/8opZ4HNFiXBVDLO97thALREenvYnALnHODUWmsBuY6SjuRpgqW/K355ufhXBqmwtPOAGdhnvpZlRZ6FlJoQ2IstqwmLImGI7+d3EN5xCqvaWWf7+QVqq7xiFuglZpJB8XnRP/iVQUsG4fLpqrcUGlQRw7mg7jPe7dt4ShMFEEXQsz7RqoCvNXXT82VN6DDeiYNUTKtaNU81kCGWXqzHgoQ2m";

        System.out.println(aesDecrypt(KEY, en));
    }
}
