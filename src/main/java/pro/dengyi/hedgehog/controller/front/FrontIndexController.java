package pro.dengyi.hedgehog.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台首页 controller
 *
 * 前台首页上显示的所有信息均通过这个controller传递
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 14:18
 */
@Controller
@RequestMapping("/")
public class FrontIndexController {

	@RequestMapping
	public String index() {
		return "front/index";
	}

}
