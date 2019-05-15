package pro.dengyi.hedgehog.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 系统controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-16 01:30
 */
@Slf4j
@Controller
@RequestMapping("/admin/system")
public class SystemController {
    /**
     * 退出系统devdev----------------
     * <br/>
     *
     * @param
     * @return java.lang.String
     * @author 邓艺
     * @date 2019/5/16 1:31
     */
    @GetMapping("/logout")
    private String logout(HttpSession session) {
        try {
            session.removeAttribute("loginUser");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/login";
    }

}
