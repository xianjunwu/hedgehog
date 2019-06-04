package pro.dengyi.hedgehog.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.model.dto.DataGridResult;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.model.vo.DataGridBo;
import pro.dengyi.hedgehog.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *文章controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-04 20:57
 */
@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {
	@Autowired
	private ArticleService articleService;

	@GetMapping("/list")
	public String list() {
		//@PathVariable Integer pageNumber, @PathVariable Integer pageSize, Model model
		return "admin/articlelist";
	}
	@GetMapping("/write")
	public String write() {
		return "admin/articlewrite";
	}

	@GetMapping("/pageQuery")
	@ResponseBody
	public DataGridResult<Article> pageQuery(Integer page, Integer recPerPage, String search, String sortBy, String order) {
		DataGridBo<Article> dataGridBo = articleService.pageQuery(page, recPerPage, search, sortBy, order);
		return new DataGridResult<>("success", "成功", dataGridBo.getData(), dataGridBo.getDataGridPager());
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
