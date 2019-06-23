package pro.dengyi.hedgehog.service.impl;

import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import pro.dengyi.hedgehog.dao.FileDao;
import pro.dengyi.hedgehog.service.FileService;
import pro.dengyi.hedgehog.utils.FileUtil;

@Service
public class FileServiceImpl implements FileService {

  @Autowired
  private FileDao fileDao;

  @Value("${com.qiniu.accessKey}")
  private String accessKey;
  @Value("${com.qiniu.secretKey}")
  private String secretKey;

  @Override
  public void uploadFileToQiNiu(MultipartFile multipartFile) throws IOException {
    String extendName = FileUtil.getExtendName(multipartFile);
    //构造七牛参数
    Configuration cfg = new Configuration(Zone.zone0());
    UploadManager uploadManager = new UploadManager(cfg);
    Auth auth = Auth.create(accessKey, secretKey);
    String bucketName = null;
    if ("jpg".equals(extendName)) {
      bucketName = "hedgehog";
      String uploadToken = auth.uploadToken(bucketName);
      //上传图片
      Response put = uploadManager
          .put(multipartFile.getBytes(), multipartFile.getOriginalFilename(), uploadToken);
      System.out.println(put);

    } else {
      //上传文件
      bucketName = "file";
      String uploadToken = auth.uploadToken(bucketName);

    }
  }
}
