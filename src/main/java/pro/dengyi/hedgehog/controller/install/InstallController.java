package pro.dengyi.hedgehog.controller.install;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.dengyi.hedgehog.model.dto.SingleResult;
import pro.dengyi.hedgehog.model.entity.Seo;
import pro.dengyi.hedgehog.model.entity.SiteInfo;
import pro.dengyi.hedgehog.model.entity.User;
import pro.dengyi.hedgehog.service.SeoService;
import pro.dengyi.hedgehog.service.SiteInfoService;
import pro.dengyi.hedgehog.service.UserService;

/**
 * 安装controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 17:06
 */
@Slf4j
@RequestMapping("/install")
@Controller
public class InstallController {

  @Autowired
  private UserService userService;

  @Autowired
  private SiteInfoService siteInfoService;

  @Autowired
  private SeoService seoService;


  /**
   * 显示页面方法，用于显示页面
   *
   * @return java.lang.String
   * @author 邓艺
   * @date 2019/5/29 19:46
   */
  @GetMapping
  public String showIndex() {
    return "install/index";
  }

  /**
   * 新增用户方法
   *
   * @param user 用户实体
   * @return pro.dengyi.hedgehog.model.dto.SingleResult<pro.dengyi.hedgehog.model.entity.User>
   * @author 邓艺
   * @date 2019/5/29 19:10
   */
  @PostMapping("/saveUser")
  @ResponseBody
  public SingleResult<User> saveUser(@Validated User user, BindingResult bindingResult) {
    if (bindingResult.hasErrors()) {
      //字段检验没有通过

    } else {

    }
    User userSaved = userService.saveOrUpdate(user);
    return new SingleResult<>("success", "新增成功", userSaved);
  }

  /**
   * 新增网站基本信息方法
   *
   * @param siteInfo 网站基本信息实体
   * @return pro.dengyi.hedgehog.model.dto.SingleResult<pro.dengyi.hedgehog.model.entity.SiteInfo>
   * @author 邓艺
   * @date 2019/5/29 19:11
   */
  @PostMapping("/saveSiteInfo")
  @ResponseBody
  public SingleResult<SiteInfo> saveWebInfo(SiteInfo siteInfo) {
    SiteInfo info = siteInfoService.saveOrUpdate(siteInfo);
    return new SingleResult<>("success", "新增成功", info);
  }

  /**
   * 新增网站seo方法
   *
   * @param seo seo实体
   * @return pro.dengyi.hedgehog.model.dto.SingleResult<pro.dengyi.hedgehog.model.entity.Seo>
   * @author 邓艺
   * @date 2019/5/29 19:11
   */
  @PostMapping("/saveSeo")
  @ResponseBody
  public SingleResult<Seo> saveUser(Seo seo) {
    Seo seoSaved = seoService.saveOrUpdate(seo);
    return new SingleResult<>("success", "新增成功", seoSaved);
  }

}
