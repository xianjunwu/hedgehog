package pro.dengyi.hedgehog.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pro.dengyi.hedgehog.service.ArticleService;
import pro.dengyi.hedgehog.service.CateGoryService;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 管理页面主页controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-12 14:31
 */
@Controller
@RequestMapping("/admin/index")
public class IndexController {
    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CateGoryService cateGoryService;

    @GetMapping
    public String index(Model model) {
        //文章总数
        Integer articleNumber = articleService.findTheNumberOfArticle();
        model.addAttribute("articleNumber", articleNumber);
        //栏目总数
        int categoryNumber = cateGoryService.findNumberOfCategorys();
        model.addAttribute("categoryNumber", categoryNumber);
        //创建服务器信息信息map，将信息封装成map并返回给前端
        Map<String, String> systemInfo = new HashMap<>(5);
        systemInfo.put("systemType", System.getProperty("os.name"));
        systemInfo.put("javaVersion", System.getProperty("java.version"));
        systemInfo.put("containerTypeAndVersion", "tomcat8");
        systemInfo.put("databaseTypeAndVersion", "mysql5.7");
        systemInfo.put("systemTime", LocalDateTime.now().toString());
        model.addAttribute("systemInfo", systemInfo);
        return "/admin/index";

    }
}
