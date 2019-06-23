package pro.dengyi.hedgehog.utils;

import java.util.Objects;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件工具类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-23 23:42
 */
public class FileUtil {

  public static String getExtendName(MultipartFile multipartFile) {

    return Objects.requireNonNull(multipartFile.getOriginalFilename()).split("\\.")[1];
  }


}
