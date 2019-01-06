package pro.dengyi.hedgehog.intercepter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import pro.dengyi.hedgehog.entity.WebUser;

@Component
public class LoginIntercepter implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    WebUser loginUser = (WebUser) request.getSession().getAttribute("loginUser");
    if (loginUser != null) {
      return true;
    }
    //否则拦截并跳转到登录
    response.sendRedirect("/admin/login");
    return false;
  }
}
