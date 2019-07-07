package pro.dengyi.hedgehog.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import pro.dengyi.hedgehog.intercepter.DonotReInstallIntecepter;
import pro.dengyi.hedgehog.intercepter.InstallIntecepter;
import pro.dengyi.hedgehog.intercepter.LoginIntercepter;
import pro.dengyi.hedgehog.intercepter.PvIntercepter;

/**
 * springmvc 开发环境配置类，去掉一切校验
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-12 14:16
 */
@Profile("dev")
@Configuration
public class SpringMvcConfigDev implements WebMvcConfigurer {

  @Autowired
  private InstallIntecepter installIntecepter;
  @Autowired
  private PvIntercepter pvIntercepter;
  @Autowired
  private LoginIntercepter loginIntercepter;
  @Autowired
  private DonotReInstallIntecepter donotReInstallIntecepter;

  /**
   * 注册拦截器
   *
   * @return void
   * @author 邓艺
   * @date 2019/5/12 14:18
   */
  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(installIntecepter).addPathPatterns("/**");
    registry.addInterceptor(donotReInstallIntecepter).addPathPatterns("/install/**");
    registry.addInterceptor(pvIntercepter).addPathPatterns("/**")
        .excludePathPatterns("/admin/**", "/static/**", "/category/findAllCategory", "/install/**");
    registry.addInterceptor(loginIntercepter).addPathPatterns("/admin/**")
        .excludePathPatterns("/static/**", "/admin/system/doLogin", "/admin/system/showLoginPage",
            "/admin/system/getVerificationCode", "/admin/system/checkVerificationCode");


  }

  /**
   * 静态资源配置:如css,js等
   *
   * @return void
   * @author 邓艺
   * @date 2019/5/12 14:46
   */
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    // 解决 SWAGGER 404报错
    registry.addResourceHandler("/swagger-ui.html")
        .addResourceLocations("classpath:/META-INF/resources/");
//        registry.addResourceHandler("/**").addResourceLocations("classpath:/templates/").addResourceLocations("classpath:/robots.txt");

  }

}
