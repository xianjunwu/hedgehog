package pro.dengyi.hedgehog.controller.install;

import lombok.extern.slf4j.Slf4j;
import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.model.entity.Seo;
import pro.dengyi.hedgehog.model.entity.SiteInfo;
import pro.dengyi.hedgehog.model.entity.User;
import pro.dengyi.hedgehog.service.SeoService;
import pro.dengyi.hedgehog.service.SiteInfoService;
import pro.dengyi.hedgehog.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *安装controller
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


	@GetMapping
	public String showIndex() {
		return "install/index";
	}

	@PostMapping("/saveUser")
	public BaseResult saveUser(User user) {
		User userSaved = userService.saveOrUpdate(user);
		return null;
	}

	@PostMapping("/saveSiteInfo")
	public BaseResult saveWebInfo(SiteInfo siteInfo) {
		SiteInfo info = siteInfoService.saveOrUpdate(siteInfo);
		return null;
	}

	@PostMapping("/saveSeo")
	public BaseResult saveUser(Seo seo) {
		Seo seoSaved=seoService.saveOrUpdate(seo);
		return null;
	}

}
