package pro.dengyi.hedgehog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;
import javax.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import pro.dengyi.hedgehog.servlet.VerifyServlet;

@Slf4j
@SpringBootApplication
public class HedgehogApplication {

//  @Value("${spring.datasource.driver-class-name}")
//  private String driverClassName;
//  @Value("${spring.datasource.url}")
//  private String url;
//  @Value("${spring.datasource.username}")
//  private String username;
//  @Value("${spring.datasource.password}")
//  private String password;


  public static void main(String[] args) {
    ConfigurableApplicationContext run = SpringApplication.run(HedgehogApplication.class, args);
    String property = run.getEnvironment().getProperty("server.port");
    log.info("项目启动成功，访问地址为：http://localhost:" + property);
  }

  /**
   * 项目启动后创建数据库，jpa不会创建数据库，为了优化这一点
   */
//  @PostConstruct
//  public void createDataBase() {
//    Connection connection = null;
//    Statement statement = null;
//    try {
//      Class.forName(driverClassName);
//      String[] hedgehogs = url.split("hedgehog");
//      String databaseMysqlUrl = hedgehogs[0] + "mysql" + hedgehogs[1];
//      connection = DriverManager.getConnection(databaseMysqlUrl, username, password);
//      connection.setAutoCommit(false);
//      //默认自动提交事务
//      statement = connection.createStatement();
//      String createDataBaseSql = "CREATE DATABASE hedgehog DEFAULT CHARSET utf8 COLLATE utf8_general_ci;";
//      statement.execute(createDataBaseSql);
//      connection.commit();
//      statement.close();
//      connection.close();
//    } catch (ClassNotFoundException e) {
//      log.error("创建数据库时驱动类未找到");
//      e.printStackTrace();
//    } catch (SQLException e) {
//      log.error("创建数据库SQL异常");
//      e.printStackTrace();
//
//    }
//
//  }

  /**
   * 注入验证码servlet
   */
  @Bean
  public ServletRegistrationBean indexServletRegistration() {
    ServletRegistrationBean registration = new ServletRegistrationBean(new VerifyServlet());
    registration.addUrlMappings("/getVerifyCode");
    return registration;
  }

  @EnableAsync
  @Configuration
  class TaskPoolConfig {
    @Bean("taskExecutor")
    public Executor taskExecutor() {
      ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
      executor.setCorePoolSize(5);
      executor.setMaxPoolSize(20);
      executor.setQueueCapacity(200);
      executor.setKeepAliveSeconds(60);
      executor.setThreadNamePrefix("taskExecutor-");
      executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
      executor.setWaitForTasksToCompleteOnShutdown(true);
      executor.setAwaitTerminationSeconds(60);
      return executor;
    }
  }

}

