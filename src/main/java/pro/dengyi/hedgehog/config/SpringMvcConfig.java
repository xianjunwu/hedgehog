package pro.dengyi.hedgehog.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import pro.dengyi.hedgehog.intercepter.InstallIntecepter;

/**
 * springmvc 配置类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-12 14:16
 */
@Configuration
public class SpringMvcConfig implements WebMvcConfigurer {
    @Autowired
    private InstallIntecepter installIntecepter;

    /**
     * 注册拦截器
     *
     * @param registry
     * @return void
     * @author 邓艺
     * @date 2019/5/12 14:18
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //        registry.addInterceptor(installIntecepter).addPathPatterns("/admin/**");

    }

    /**
     * 静态资源配置:如css,js等
     *
     * @param registry
     * @return void
     * @author 邓艺
     * @date 2019/5/12 14:46
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/favicon.ico").addResourceLocations("classpath:/static/images/favicon.ico");
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        // 解决 SWAGGER 404报错
        registry.addResourceHandler("/swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
//        registry.addResourceHandler("/**").addResourceLocations("classpath:/templates/").addResourceLocations("classpath:/robots.txt");

    }

}
