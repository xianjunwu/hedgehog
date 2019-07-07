package pro.dengyi.hedgehog.service.impl;

import com.qiniu.common.Zone;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pro.dengyi.hedgehog.dao.FileDao;
import pro.dengyi.hedgehog.model.entity.MyFile;
import pro.dengyi.hedgehog.service.FileService;
import pro.dengyi.hedgehog.utils.FileUtil;
import pro.dengyi.hedgehog.utils.QiNiuYunUtil;

@Service
@Slf4j
public class FileServiceImpl implements FileService {

  @Autowired
  private FileDao fileDao;

  private final static String IMG_PATH_PREFIX = "src/main/resources/static";

  @Value("${com.qiniu.accessKey}")
  private String accessKey;
  @Value("${com.qiniu.secretKey}")
  private String secretKey;
  @Value("${com.qiniu.region}")
  private String region;
  @Value("${com.qiniu.outLink}")
  private String outLink;


  @Override
  @Transactional
  public String uploadFileToQiNiu(MultipartFile multipartFile) throws IOException {
    //创建okhttp客户端
    OkHttpClient okHttpClient = new OkHttpClient();

    //构造七牛参数
    Configuration cfg = null;
    switch (region) {
      case "z0":
        cfg = new Configuration(Zone.zone0());
        break;
      case "z1":
        cfg = new Configuration(Zone.zone1());
        break;
      case "z2":
        cfg = new Configuration(Zone.zone2());
        break;
      case "na0":
        cfg = new Configuration(Zone.zoneNa0());
        break;
      case "as0":
        cfg = new Configuration(Zone.zoneAs0());
        break;
      default:
        log.error("构造七牛云Configuration时异常");
    }
    if (cfg != null) {
      UploadManager uploadManager = new UploadManager(cfg);
      Auth auth = Auth.create(accessKey, secretKey);
      String bucketName = null;
      if (FileUtil.isPicture(multipartFile)) {
        //直接创建bucket，因为如果存在的话会返回614表示bucket已存在
        bucketName = "picture";
      } else {
        //上传文件
        bucketName = "file";
      }
      //直接创建bucket，因为如果存在的话会返回614表示bucket已存在
      String accessToken = QiNiuYunUtil.accessToken(auth, bucketName, region);
      Request request = QiNiuYunUtil.bucketCreateRequest(bucketName, region, accessToken);
      Response response = okHttpClient.newCall(request).execute();
      //bucket创建成功后再上传真实文件,614为已经存在
      if (response.code() == 200 || response.code() == 614) {
        String uploadToken = QiNiuYunUtil.uploadToken(auth, bucketName);
        com.qiniu.http.Response uploadResponse = uploadManager
            .put(multipartFile.getBytes(), multipartFile.getOriginalFilename(), uploadToken);
        int statusCode = uploadResponse.statusCode;
        if (statusCode == 200) {
          String fileUrl = outLink + multipartFile.getOriginalFilename();
          fileDao.save(new MyFile(null, multipartFile.getOriginalFilename(),
              FileUtil.getExtendName(multipartFile), fileUrl, bucketName, multipartFile.getSize()));
          return fileUrl;
        }
      }
    }

    return null;
  }

  @Override
  public void uploadImageToProject(MultipartFile multipartFile, String type) {
    String absolutePath = getAbsolutePath();

    try {
      switch (type) {
        case "logo":

          absolutePath=absolutePath+"/logo."+FileUtil.getExtendName(multipartFile);
          break;
        case "ico":
          absolutePath=absolutePath+"/favicon.ico";
          break;
      }
      File file = new File(absolutePath);
      FileOutputStream fileOutputStream=new FileOutputStream(file);
      fileOutputStream.write(multipartFile.getBytes());
    } catch (IOException e) {
      e.printStackTrace();
    }


  }

  private String getAbsolutePath() {
    File file = new java.io.File(IMG_PATH_PREFIX);
    return file.getAbsolutePath();
  }
}
