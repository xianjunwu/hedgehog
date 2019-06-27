package pro.dengyi.hedgehog.service;

import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-10 21:45
 */
public interface SystemConfigService {

  byte[] doBackup();

  /**
   * 还原系统
   *
   * @param file 上传的备份文件
   * @return void
   * @author 邓艺
   * @date 2019/6/27 13:04
   */
  void restoreSystem(MultipartFile file) throws IOException;
}
