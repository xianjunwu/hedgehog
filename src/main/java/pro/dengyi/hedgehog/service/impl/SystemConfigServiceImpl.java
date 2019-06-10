package pro.dengyi.hedgehog.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import pro.dengyi.hedgehog.service.SystemConfigService;

/**
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-10 21:45
 */
@Service
public class SystemConfigServiceImpl implements SystemConfigService {

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
      Process process = runtime.exec("C:\\Program Files\\MySQL\\MySQL Server 5.7\\bin\\mysqldump -h localhost -uroot -p123456 hedgehog");
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
}
