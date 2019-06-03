package pro.dengyi.hedgehog.controller.front;

import pro.dengyi.hedgehog.model.entity.Seo;
import pro.dengyi.hedgehog.model.entity.SiteInfo;
import pro.dengyi.hedgehog.service.SeoService;
import pro.dengyi.hedgehog.service.SiteInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@Autowired
	private SeoService seoService;

	@Autowired
	private SiteInfoService siteInfoService;


	@RequestMapping
	public String index(Model model) {

		Seo seo = seoService.findSeo();
		SiteInfo siteInfo = siteInfoService.findSiteInfo();
		//将网站的seo和基本信息返回
		model.addAttribute("seo", seo);
		model.addAttribute("siteInfo", siteInfo);
		return "front/index";
	}

}
