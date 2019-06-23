package pro.dengyi.hedgehog.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import pro.dengyi.hedgehog.model.entity.User;

/**
 * 登录拦截器，用于访问控制台是否登录
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-04-21 21:24
 */
@Component
public class LoginIntercepter implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    User loginUser = (User) request.getSession().getAttribute("loginUser");
    if (loginUser != null) {
      return true;
    }
    //否则拦截并跳转到登录
    response.sendRedirect("/admin/login");
    return false;
  }
}
