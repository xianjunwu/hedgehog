package pro.dengyi.hedgehog.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import pro.dengyi.hedgehog.model.entity.User;
import pro.dengyi.hedgehog.service.UserService;

/**
 * 防止重复安装拦截器
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-07-07 23:35
 */
@Component
public class DonotReInstallIntecepter implements HandlerInterceptor {

  @Autowired
  private UserService userService;


  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    User adminUser = userService.findAdminUser();
    if (adminUser != null) {
      response.sendRedirect("/admin");
      return true;
    } else {
      response.sendRedirect("/install/index");
      return true;
    }

  }
}
