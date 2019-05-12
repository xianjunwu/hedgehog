package pro.dengyi.hedgehog.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 管理页面主页controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-12 14:31
 */
@Controller
@RequestMapping("/admin")
public class IndexController {

    @GetMapping("/index")
    public String index() {
        return "/admin/index";

    }
}
