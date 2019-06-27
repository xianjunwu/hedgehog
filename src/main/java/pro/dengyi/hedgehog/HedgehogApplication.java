package pro.dengyi.hedgehog;

import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;
import lombok.extern.slf4j.Slf4j;
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

  public static void main(String[] args) {
    ConfigurableApplicationContext run = SpringApplication.run(HedgehogApplication.class, args);
    String property = run.getEnvironment().getProperty("server.port");
    log.info("项目启动成功，访问地址为：http://localhost:" + property);
  }

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

