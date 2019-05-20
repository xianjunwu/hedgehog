package pro.dengyi.hedgehog.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端index controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 14:18
 */
@Controller
@RequestMapping("/front")
public class FrontIndexController {

    @RequestMapping("/index")
    public String index() {
        return "front/index";
    }

}
