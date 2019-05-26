package pro.dengyi.hedgehog.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 搜索controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-25 13:47
 */
@Controller
@RequestMapping("/search")
public class SearchController {

    @GetMapping("/doSearch")
    public String doSearch(String key, @RequestParam(defaultValue = "1") Integer pageNumber, @RequestParam(defaultValue = "10") Integer pageSize) {

        return "front/searchResult";

    }

}
