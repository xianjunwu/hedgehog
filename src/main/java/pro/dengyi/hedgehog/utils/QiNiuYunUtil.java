package pro.dengyi.hedgehog.utils;

import com.qiniu.util.Auth;
import okhttp3.Request;
import org.springframework.util.Base64Utils;

/**
 * 七牛云存储工具类，封装了项目中所使用到的基本的操作
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-24 14:01
 */
public class QiNiuYunUtil {


  /**
   * 获取访问token 用于bucket的创建
   *
   * @param auth 权限
   * @param bucketName bucket名
   * @param region 区域
   * @return java.lang.String
   * @author 邓艺
   * @date 2019/6/24 14:15
   */
  public static String accessToken(Auth auth, String bucketName, String region) {
    String path =
        "/mkbucketv2/" + Base64Utils.encodeToString(bucketName.getBytes()) + "/region/" + region
            + "\n";
    return auth.sign(path);
  }

  /**
   * 获取文件上传token
   *
   * @param auth 权限
   * @param bucketName bucket名
   * @return java.lang.String
   * @author 邓艺
   * @date 2019/6/24 14:33
   */
  public static String uploadToken(Auth auth, String bucketName) {
    return auth.uploadToken(bucketName);

  }

  public static Request bucketCreateRequest(String bucketName, String region, String accessToken) {
    String url = "http://rs.qiniu.com/mkbucketv2/" + Base64Utils
        .encodeToString(bucketName.getBytes()) + "/region/" + region;
    return new Request.Builder().url(url)
        .addHeader("Content-Type", "application/x-www-form-urlencoded")
        .addHeader("Authorization", "QBox " + accessToken).build();
  }


}
