package pro.dengyi.hedgehog.utils;

import java.util.Objects;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件工具类 <br/> 提供对文件名及文件的各种操作，比如对判断文件是否是图片或者截取文件的后缀名
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-23 23:42
 */
@Slf4j
public class FileUtil {

  /**
   * 获取文件的的扩展名
   *
   * @param multipartFile multipartFile
   * @return java.lang.String
   * @author 邓艺
   * @date 2019/6/24 15:30
   */
  public static String getExtendName(MultipartFile multipartFile) {
    String[] split = multipartFile.getOriginalFilename().split("\\.");
    return split[split.length-1];
  }

  /**
   * 判断文件是否是图片方法
   *
   * @param multipartFile multipartFile
   * @return java.lang.Boolean true代表为图片
   * @author 邓艺
   * @date 2019/6/24 14:04
   */
  public static Boolean isPicture(MultipartFile multipartFile) {
    if (multipartFile != null) {
      String fileExtName = multipartFile.getOriginalFilename().split("\\.")[1];
      if ("jpg".equalsIgnoreCase(fileExtName) || "png".equalsIgnoreCase(fileExtName) || "gif"
          .equalsIgnoreCase(fileExtName)) {
        return true;
      }
    } else {
      log.error("判断multipartFile是否为图片时参数为null");
    }
    return false;
  }


}
