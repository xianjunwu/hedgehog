package pro.dengyi.hedgehog.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import pro.dengyi.hedgehog.service.SiteInfoService;

/**
 * pv统计intercepter拦截器
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-07-07 02:14
 */
@Component
public class PvIntercepter implements HandlerInterceptor {
  @Autowired
  private SiteInfoService siteInfoService;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    siteInfoService.addPv();
    return true;
  }
}
