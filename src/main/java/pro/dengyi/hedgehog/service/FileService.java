package pro.dengyi.hedgehog.service;

import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {

  /**
   * 上传文件到七牛云存储
   *
   * @return void
   * @author 邓艺
   * @date 2019/6/23 23:29
   */
  void uploadFileToQiNiu(MultipartFile multipartFile) throws IOException;
}
