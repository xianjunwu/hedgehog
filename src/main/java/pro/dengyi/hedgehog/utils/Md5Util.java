package pro.dengyi.hedgehog.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * md5工具类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 13:27
 */
public class Md5Util {
    private static final Logger LOGGER = LoggerFactory.getLogger(Md5Util.class);

    public static String encodePassword(String originalPassword) {
        try {
            //可以加盐
            byte[] originalPasswordBytes = originalPassword.getBytes(StandardCharsets.UTF_8);
            MessageDigest md5 = MessageDigest.getInstance("md5");
            md5.update(originalPasswordBytes);
            return byteArrayToHex(md5.digest());

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将字节数组转换成字符串方法
     * <br/>
     *
     * @param byteArray 字节数组
     * @return java.lang.String
     * @author 邓艺
     * @date 2019/5/20 13:37
     */
    private static String byteArrayToHex(byte[] byteArray) {
        // 首先初始化一个字符数组，用来存放每个16进制字符
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        // new一个字符数组，这个就是用来组成结果字符串的（解释一下：一个byte是八位二进制，也就是2位十六进制字符（2的8次方等于16的2次方））
        char[] resultCharArray = new char[byteArray.length * 2];
        // 遍历字节数组，通过位运算（位运算效率高），转换成字符放到字符数组中去
        int index = 0;
        for (byte b : byteArray) {
            resultCharArray[index++] = hexDigits[b >>> 4 & 0xf];
            resultCharArray[index++] = hexDigits[b & 0xf];
        }
        // 字符数组组合成字符串返回
        return new String(resultCharArray);
    }

}
