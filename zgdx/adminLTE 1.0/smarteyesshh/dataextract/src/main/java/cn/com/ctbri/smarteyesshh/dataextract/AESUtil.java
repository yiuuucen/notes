package cn.com.ctbri.smarteyesshh.dataextract;

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
 * @author zeromem
 * @date 2017/11/27
 */
@SuppressWarnings("Duplicates")
public class AESUtil {
    public static final String DENGTA_KEY = "smarteyesshh2018"; // 灯塔侧手机号加解密
    public static final String KEY = "contactqqzeromem"; // kv手机号加解密
    public static final String ZHANGXIUCHENG_KEY = "M985625LMUQC436I"; // 和张修成交接数据时使用

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
        mdnFile2MdnAes("D:\\坚果云\\我的坚果云\\电信研究院\\上海网安\\潜在类型5-明文aes加密-0423.txt");
        System.exit(1);

        String en = "eCnLIzinRp5Qppj1Eqe49g==";
        System.out.println(aesDecrypt(DENGTA_KEY, en));
        System.exit(1);
        String path = args[0];
        deFile(path);
    }


    public static void deFile(String path) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        String fileName = path;
        try (
                FileInputStream fis = new FileInputStream(fileName);
                InputStreamReader isr = new InputStreamReader(fis);
                BufferedReader reader = new BufferedReader(isr);
        ) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] arr = line.split("\t");
                String enPcmd = arr[0].trim();
                String enMdn = arr[1].trim();
                String shaPcmd = aesDecrypt(ZHANGXIUCHENG_KEY, enPcmd);
                String plainMdn = aesDecrypt(ZHANGXIUCHENG_KEY, enMdn);
                System.out.println(plainMdn + "," + shaPcmd);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void mdnFile2MdnAes(String path) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        try (
                FileInputStream fis = new FileInputStream(path);
                InputStreamReader isr = new InputStreamReader(fis);
                BufferedReader reader = new BufferedReader(isr);
        ) {
            String line;
            while ((line = reader.readLine()) != null) {
                String plain = line.trim();
                // System.out.println(plain);
                String encrypt = aesEncrypt(ZHANGXIUCHENG_KEY, line);
                System.out.println(encrypt);
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

    public static void test() throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        String[] input = new String[]{
                "8618017205202",
                "8613381923118",
                "8618916081558",
                "8615316168628",
                "8615316032132",
                "8613301862438",
                "8615317390230",
                "8618117399903",
                "8617321116105",
                "8617721268210",
                "8617721213533"
        };
        for (String s : input) {
            System.out.println(s + " " + aesEncrypt(DENGTA_KEY, s));
        }
    }
}
