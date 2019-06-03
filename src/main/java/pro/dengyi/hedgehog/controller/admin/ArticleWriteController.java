package pro.dengyi.hedgehog.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.model.entity.Category;
import pro.dengyi.hedgehog.service.ArticleService;

/**
 * 写文章controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-13 13:52
 */
@Slf4j
@Controller
@RequestMapping("/admin/article/write")
public class ArticleWriteController {

	@Autowired
	private ArticleService articleService;

	@GetMapping("/")
	public String write() {
		return "admin/articlewrite";
	}

	/**
	 * 保存文章
	 * <br/>
	 *
	 * @param article 对象封装实体
	 * @return void
	 * @author 邓艺
	 * @date 2019/5/15 15:04
	 */
	@PostMapping("/saveOrUpdate")
	@ResponseBody
	public Article saveOrUpdate(@RequestBody Article article) {
		return articleService.saveOrUpdate(article);
	}

	@DeleteMapping("/deleteById/{id}")
	@ResponseBody
	public BaseResult deleteById(@PathVariable Long id) {
		articleService.deleteById(id);
		return new BaseResult();
	}

}
