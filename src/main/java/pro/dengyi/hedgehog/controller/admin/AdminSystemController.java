package pro.dengyi.hedgehog.controller.admin;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.dengyi.hedgehog.model.dto.SingleResult;
import pro.dengyi.hedgehog.model.entity.SiteInfo;
import pro.dengyi.hedgehog.model.entity.User;
import pro.dengyi.hedgehog.service.SiteInfoService;
import pro.dengyi.hedgehog.service.UserService;
import pro.dengyi.hedgehog.utils.VerificationCodeUtil;

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
public class AdminSystemController {

  @Autowired
  private UserService userService;
  @Autowired
  private SiteInfoService siteInfoService;

  /**
   * 退出系统 <br/>
   *
   * @return java.lang.String
   * @author 邓艺
   * @date 2019/5/16 1:31
   */
  @GetMapping("/logout")
  public String logout(HttpSession session) {
    try {
      session.removeAttribute("loginUser");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/admin/login";
  }

  /**
   * 登录系统 <br/>
   *
   * @return java.lang.String
   * @author 邓艺
   * @date 2019/5/16 1:31
   */
  @PostMapping("/doLogin")
  public String doLogin(HttpSession session, User user) {

    User userLogin = userService.doLogin(user);
    if (userLogin != null) {
      session.setAttribute("loginUser", userLogin);
      return "redirect:/admin";
    }
    return "redirect:/admin/system/showLoginPage";
  }

  /**
   * 显示登录页面方法 <br/>
   *
   * @return java.lang.String
   * @author 邓艺
   * @date 2019/5/16 1:31
   */
  @GetMapping("/showLoginPage")
  public String showLoginPage() {
    return "/admin/login";
  }

  /**
   * 获取验证码方法 <br/>
   *
   * @return map
   * @author 邓艺
   * @date 2019/5/19 13:44
   */
  @GetMapping("/getVerificationCode")
  public void getVerificationCode(HttpSession session, HttpServletResponse response)
      throws IOException {
    Map<String, Object> stringObjectMap = VerificationCodeUtil.generateCodeAndPic();
    session.setAttribute("verificationCode", stringObjectMap.get("codeNumber"));
    BufferedImage bufferedImage = (BufferedImage) stringObjectMap.get("codePic");
    response.setContentType("image/png");
    OutputStream os = response.getOutputStream();
    ImageIO.write(bufferedImage, "png", os);
  }

  /**
   * 验证验证码正确定性方法 <br/>
   *
   * @param code 验证码
   * @return map
   * @author 邓艺
   * @date 2019/5/19 16:14
   */
  @PostMapping("/checkVerificationCode")
  @ResponseBody
  public Map<String, Boolean> checkVerificationCode(String code, HttpSession session) {
    String verificationCode = (String) session.getAttribute("verificationCode");
    boolean status = false;
    Map<String, Boolean> map = new HashMap<>(1);
    if (StringUtils.isNotBlank(verificationCode)) {
      status = verificationCode.equalsIgnoreCase(code);
    }
    map.put("valid", status);
    return map;
  }

  @GetMapping("/gotoFrontIco")
  @ResponseBody
  public SingleResult<SiteInfo> gotoFrontIco() {
    SiteInfo siteInfo = siteInfoService.gotoFrontIco();
    return new SingleResult<>("success", "操作成功", siteInfo);
  }

}
