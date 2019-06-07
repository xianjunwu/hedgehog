package pro.dengyi.hedgehog.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统设置controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-13 11:47
 */
@Controller
@RequestMapping("/admin/sys")
public class SystemConfigController {

    @GetMapping("/")
    public String showPage() {
        return "admin/systemconfig";
    }

}
