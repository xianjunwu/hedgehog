package pro.dengyi.hedgehog.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 文章列表controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-13 12:41
 */
@Controller
@RequestMapping("/article/list")
public class ArticleListController {

    @GetMapping("/")
    public String list() {
        //@PathVariable Integer pageNumber, @PathVariable Integer pageSize, Model model
        return "admin/articlelist";
    }

}
