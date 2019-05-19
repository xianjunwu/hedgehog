package pro.dengyi.hedgehog.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 验证码工具类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-19 16:15
 */
public class VerificationCodeUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(VerificationCodeUtil.class);

    public static String getVerificationCode() {
        return "123456";
    }

}
