package pro.dengyi.hedgehog.controller.admin;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pro.dengyi.hedgehog.model.entity.Notice;
import pro.dengyi.hedgehog.service.ArticleService;
import pro.dengyi.hedgehog.service.CateGoryService;
import pro.dengyi.hedgehog.service.CommontService;
import pro.dengyi.hedgehog.service.LogService;
import pro.dengyi.hedgehog.service.NoticeService;
import pro.dengyi.hedgehog.service.SiteInfoService;
import pro.dengyi.hedgehog.service.SystemConfigService;

/**
 * 管理页面主页controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-12 14:31
 */
@Controller
@RequestMapping("/admin")
public class AdminIndexController {

  @Autowired
  private ArticleService articleService;

  @Autowired
  private CateGoryService cateGoryService;

  @Autowired
  private CommontService commontService;

  @Autowired
  private SiteInfoService siteInfoService;

  @Autowired
  private LogService logService;

  @Autowired
  private NoticeService noticeService;

  @GetMapping
  public String index(Model model, HttpServletRequest request) {
    //文章总数
    Integer articleNumber = articleService.findTheNumberOfArticle();
    model.addAttribute("articleNumber", articleNumber);
    //栏目总数
    int categoryNumber = cateGoryService.findNumberOfCategorys();
    //评论总数
    int commontNumber = commontService.findNumberOfCommonts();
    //安装时间
    int days = siteInfoService.findInstallDays();
    //日志总数
    int logNum = logService.findLogNumber();


    model.addAttribute("categoryNumber", categoryNumber);
    model.addAttribute("commontNumber", commontNumber);
    model.addAttribute("days", days);
    model.addAttribute("logNum", logNum);
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
