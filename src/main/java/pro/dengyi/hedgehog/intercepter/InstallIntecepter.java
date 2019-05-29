package pro.dengyi.hedgehog.intercepter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import pro.dengyi.hedgehog.model.entity.User;
import pro.dengyi.hedgehog.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 安装拦截器，用于判断网站是否安装
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-04-21 21:24
 */
@Component
public class InstallIntecepter implements HandlerInterceptor {
    @Autowired
    private UserService userService;

    /**
     * 在访问之前判断网站是否安装，如果没有安装则转发到安装地址
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = userService.findAdminUser();
        if (user != null) {
            return true;
        } else {
            response.sendRedirect("/install/index");
            return false;
        }

    }
}
