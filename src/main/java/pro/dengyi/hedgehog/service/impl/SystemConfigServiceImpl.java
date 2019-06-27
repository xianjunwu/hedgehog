package pro.dengyi.hedgehog.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import pro.dengyi.hedgehog.dao.SiteInfoDao;
import pro.dengyi.hedgehog.service.SystemConfigService;

/**
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-10 21:45
 */
@Service
public class SystemConfigServiceImpl implements SystemConfigService {

  @Autowired
  private SiteInfoDao siteInfoDao;

  @Value("${spring.datasource.username}")
  private String userName;
  @Value("${spring.datasource.password}")
  private String password;
  @Value("${spring.datasource.url}")
  private String url;

  @Override
  public byte[] doBackup() {
    Runtime runtime = Runtime.getRuntime();
    StringBuilder stringBuilder = new StringBuilder();
    try {
      //查询数据库的安装路径
      String basedir = siteInfoDao.queryBaseDir();
      Process process = runtime.exec(
          basedir + "bin\\mysqldump -h localhost -u" + userName
              + " -p" + password + " hedgehog");
      //将执行输出值作为输入流
      InputStream inputStream = process.getInputStream();
      InputStreamReader inputStreamReader = new InputStreamReader(inputStream,
          StandardCharsets.UTF_8);
      BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
      String inStr;
      while ((inStr = bufferedReader.readLine()) != null) {
        stringBuilder.append(inStr).append("\r\n");
      }
      String s = stringBuilder.toString();
      return s.getBytes(StandardCharsets.UTF_8);
    } catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }

  @Override
  @Async
  public void restoreSystem(MultipartFile file) throws IOException {
    //查询数据库的安装路径
    Runtime runtime = Runtime.getRuntime();
    String basedir = siteInfoDao.queryBaseDir();
    Process process = runtime.exec(
        basedir + "bin\\mysql -hlocalhost -u" + userName
            + " -p" + password + " --default-character-set=utf8 hedgehog");
    OutputStream outputStream = process.getOutputStream();
    BufferedReader br = new BufferedReader(new InputStreamReader(
        file.getInputStream(), StandardCharsets.UTF_8));
    String str = null;
    StringBuilder sb = new StringBuilder();
    while ((str = br.readLine()) != null) {
      sb.append(str).append("\r\n");
    }
    str = sb.toString();
    OutputStreamWriter writer = new OutputStreamWriter(outputStream,
        StandardCharsets.UTF_8);
    writer.write(str);
    writer.flush();
    outputStream.close();
    br.close();
    writer.close();
  }
}
