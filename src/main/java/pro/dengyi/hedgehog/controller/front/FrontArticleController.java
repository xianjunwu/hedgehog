package pro.dengyi.hedgehog.controller.front;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *前端文章列表controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 11:19
 */
@Controller
@RequestMapping("/article")
@Slf4j
public class FrontArticleController {
	@Autowired
	private ArticleService articleService;

	@RequestMapping("list/{categoryName}")
	public String list(@RequestParam(defaultValue = "1") Integer pageNumber, @RequestParam(defaultValue = "10") Integer pageSize, @PathVariable String categoryName, Model model) {
		List<Article> list = articleService.conditionPageQuery(categoryName, pageNumber, pageSize);
		model.addAttribute("articles", list);
		return "front/articlelist";
	}

	@RequestMapping("/detail")
	public String detail(Long id, Model model) {
		Article article = articleService.findOne(id);
		if (article == null) {
			//异常
			log.error("通过id查询不到文章");
		}
		model.addAttribute("article", article);
		return "front/detail";
	}

}
