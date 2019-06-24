package pro.dengyi.hedgehog;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.time.LocalDate;
import java.time.Period;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import javax.imageio.ImageIO;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.solr.core.SolrTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.test.context.junit4.SpringRunner;
import pro.dengyi.hedgehog.dao.ArticleSearchDao;
import pro.dengyi.hedgehog.model.dto.ArticleSearchDto;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.service.ArticleSearchService;
import sun.misc.BASE64Encoder;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HedgehogApplicationTests {

  @Value("${spring.datasource.username}")
  private String userName;
  @Value("${spring.datasource.password}")
  private String password;
  @Value("${spring.datasource.url}")
  private String url;

  @Autowired
  private SolrTemplate solrTemplate;

  @Autowired
  private ArticleSearchService articleSearchService;

  @Autowired
  private ArticleSearchDao articleSearchDao;


  @Test
  public void contextLoads() {
    for (int i = 0; i < 100; i++) {
      System.out.println("111");
      say();
    }

  }

  @Async
  public void say() {
    for (int i = 0; i < 100; i++) {
      System.err.println("hello");
    }
  }

  @Test
  public void demo1() {
    LocalDate now = LocalDate.of(2019, 6, 6);
    Period between = Period.between(now, LocalDate.now());
    System.out.println(between.getDays());
  }

  @Test
  public void demo2() {
    Article article = new Article();
    article.setId(33L);
    article.setTitle("测试的文章");
    article.setSummary("测试文章的摘要");
    UpdateResponse hedgehog = solrTemplate.saveBean("hedgehog", article);
    solrTemplate.commit("hedgehog");
    System.err.println(hedgehog);

  }

  @Test
  public void demo3() {
    //spring data jpa 使用
    ArticleSearchDto articleSearchDto = new ArticleSearchDto();
    articleSearchDto.setId(22L);
    articleSearchDto.setTitle("我是一个中国人");
    articleSearchDto.setSummary("这是文章的摘要");
    articleSearchDto.setViews(1000L);
    articleSearchDto.setHearts(200L);
    Boolean aBoolean = articleSearchService.saveOrUpdate(articleSearchDto);
    System.out.println(aBoolean);
  }

  @Test
  public void demo4() {
    Iterable<ArticleSearchDto> all = articleSearchDao.findAll();
    for (ArticleSearchDto articleSearchDto : all) {
      System.err.println(articleSearchDto);
    }

  }

  @Test
  public void demo5() {
    Article article = new Article();
    article.setId(33L);
    article.setTitle("测试的文章");
    article.setSummary("测试文章的摘要");
    ArticleSearchDto articleSearchDto = new ArticleSearchDto();
    BeanUtils.copyProperties(article, articleSearchDto);
    System.out.println(articleSearchDto);
  }

  @Test
  public void demo6() throws IOException {
    Map<String, Object> stringObjectMap = null;
    FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\aa\\a.jpg"));
    BufferedImage codePic = (BufferedImage) stringObjectMap.get("codePic");
    ImageIO.write(codePic, "jpg", fileOutputStream);
//    fileOutputStream.write(stringObjectMap.get("codePic"));
    System.out.println(stringObjectMap);
  }

  @Test
  public void demo7() throws IOException {
    Runtime runtime = Runtime.getRuntime();
    Map m = System.getenv();
    String s2 = (String) m.get("Path");//获取本计算机环境变量中PATH的内容
    String s1 = s2.substring(0, s2.indexOf("MySQL"));//截取索引从‘0’到”MySQL“字符串
    String s3 = s2
        .substring(s1.lastIndexOf(":") - 1, s2.length());//获取S1字符串中最后一个”：“的索引，然后截取从":"-1 索引处到最后的字符串
    String mySqlPath = s3
        .substring(0, s3.indexOf("bin") + 3);//截取字符串S3 从索引”0“ 到”bin“的字符串。获取完整的mysql安装路径

    Process process = Runtime.getRuntime()
        .exec(" C:\\Program Files\\MySQL\\MySQL Server 5.7\\bin\\mysqldump -h" + "localhost" +
            " -p" + 3306 + " -u" + userName + " -p" + password + " --set-charset=UTF8 "
            + "hedgehog");
    InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), "utf8");
    FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\aa\\d.sql"));
    fileOutputStream.write(inputStreamReader.read());
    fileOutputStream.flush();
    System.out.println(11);
  }

  @Test
  public void demo8() throws IOException {
    Runtime rt = Runtime.getRuntime();

    // 调用 调用mysql的安装目录的命令
    Process child = rt
        .exec(
            "C:\\Program Files\\MySQL\\MySQL Server 5.7\\bin\\mysqldump -h localhost -uroot -p123456 hedgehog");
    // 设置导出编码为utf-8。这里必须是utf-8
    // 把进程执行中的控制台输出信息写入.sql文件，即生成了备份文件。注：如果不对控制台信息进行读出，则会导致进程堵塞无法运行
    InputStream in = child.getInputStream();// 控制台的输出信息作为输入流

    InputStreamReader xx = new InputStreamReader(in, "utf-8");
    // 设置输出流编码为utf-8。这里必须是utf-8，否则从流中读入的是乱码

    String inStr;
    StringBuffer sb = new StringBuffer("");
    String outStr;
    // 组合控制台输出信息字符串
    BufferedReader br = new BufferedReader(xx);
    while ((inStr = br.readLine()) != null) {
      sb.append(inStr + "\r\n");
    }
    outStr = sb.toString();

    // 要用来做导入用的sql目标文件：
    FileOutputStream fout = new FileOutputStream("D:\\aa\\d.sql");
    OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");
    writer.write(outStr);
    writer.flush();
    in.close();
    xx.close();
    br.close();
    writer.close();
    fout.close();

    System.out.println("");
  }




}

