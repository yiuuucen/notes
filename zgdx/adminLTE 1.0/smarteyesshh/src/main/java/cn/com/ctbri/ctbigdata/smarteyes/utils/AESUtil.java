package cn.com.ctbri.ctbigdata.smarteyes.utils;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 * @author luis
 * @date 2018/03/20
 */
public class AESUtil {
    public static final String DENGTA_KEY = "smarteyesshh2018"; // 灯塔侧手机号加解密
    public static final String KEY = "contactqqzeromem"; // kv手机号加解密
    private static final String AESTYPE = "AES/ECB/PKCS5Padding";

    public static String aesEncrypt(String keyStr, String plainText) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException, UnsupportedEncodingException {
        SecretKeySpec key = generateKey(keyStr);
        Cipher cipher = Cipher.getInstance(AESTYPE);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encrypt = cipher.doFinal(plainText.getBytes("UTF-8"));
        return Base64.getEncoder().encodeToString(encrypt);
    }

    public static String aesDecrypt(String keyStr, String encryptData) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException, UnsupportedEncodingException {
        SecretKeySpec key = generateKey(keyStr);
        Cipher cipher = Cipher.getInstance(AESTYPE);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decrypt = cipher.doFinal(Base64.getDecoder().decode(encryptData));
        return new String(decrypt,"UTF-8").trim();
    }

    private static SecretKeySpec generateKey(String key) {
        return new SecretKeySpec(key.getBytes(), "AES");
    }


    public static void main(String[] args) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException, UnsupportedEncodingException, InvalidAlgorithmParameterException {
        test();
    }


    public static void deFile() throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        String fileName = "D:\\坚果云\\我的坚果云\\电信研究院\\上海网安\\pcmd_mdn.encrypt.list";
        try (
                FileInputStream fis = new FileInputStream(fileName);
                InputStreamReader isr = new InputStreamReader(fis);
                BufferedReader reader = new BufferedReader(isr);

        ) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] arr = line.split("\t");
                String enPcmd = arr[0];
                String enMdn = arr[1];
                String shaPcmd = aesDecrypt(KEY, enPcmd);
                String plainMdn = aesDecrypt(KEY, enMdn);
                System.out.println(shaPcmd);
                System.out.println(plainMdn);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void enFile() throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        String fileName = "D:\\电信研究院\\上海网安\\mdn.list.encrypt";
        try (
                FileInputStream fis = new FileInputStream(fileName);
                InputStreamReader isr = new InputStreamReader(fis);
                BufferedReader reader = new BufferedReader(isr);

        ) {
            String line;
            while ((line = reader.readLine()) != null) {
                String plain = aesDecrypt(KEY, line);
                System.out.println(plain);
//                String encrypt = aesEncrypt(KEY, line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void test() throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, UnsupportedEncodingException {
        String a = "8613285625555";
        String pa = aesEncrypt(DENGTA_KEY, a);
        System.out.println(pa);
        System.out.println(aesDecrypt(DENGTA_KEY,pa));
    }
}
