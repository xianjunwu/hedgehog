package pro.dengyi.hedgehog.controller.admin;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pro.dengyi.hedgehog.service.SystemConfigService;

/**
 * 系统设置controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-13 11:47
 */
@Controller
@RequestMapping("/admin/systemConfig")
public class SystemConfigController {

  @Autowired
  private SystemConfigService systemConfigService;

  @GetMapping("/basis")
  public String showPage() {
    return "admin/systemconfig";
  }

  @GetMapping("/backup")
  public String showBackupPage() {
    return "admin/siteBackup";
  }

  @GetMapping("/doBackup")
  public void doBackup(HttpServletResponse response) throws IOException {
    byte[] bytes = systemConfigService.doBackup();
    response.setHeader("Content-Disposition", "attachment;filename=" + "backup.sql");
    response.getOutputStream().write(bytes);
  }

  @GetMapping("/restore")
  public String showRestorePage() {
    return "admin/restorepage";
  }

}
