package pro.dengyi.hedgehog;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import pro.dengyi.hedgehog.servlet.VerifyServlet;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Slf4j
@SpringBootApplication
@EnableSwagger2
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

}

