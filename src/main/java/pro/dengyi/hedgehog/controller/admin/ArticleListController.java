package pro.dengyi.hedgehog.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pro.dengyi.hedgehog.model.dto.DataGridResult;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.model.vo.DataGridBo;
import pro.dengyi.hedgehog.service.ArticleService;

/**
 * 文章列表controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-13 12:41
 */
@Controller
@RequestMapping("/admin/article/list")
public class ArticleListController {
	@Autowired
	private ArticleService articleService;

	@GetMapping("/")
	public String list() {
		//@PathVariable Integer pageNumber, @PathVariable Integer pageSize, Model model
		return "admin/articlelist";
	}

	@GetMapping("/pageQuery")
	@ResponseBody
	public DataGridResult<Article> pageQuery(Integer page, Integer recPerPage, String search, String sortBy, String order) {
		DataGridBo<Article> dataGridBo = articleService.pageQuery(page, recPerPage, search, sortBy, order);
		return new DataGridResult<>("success", "成功", dataGridBo.getData(), dataGridBo.getDataGridPager());
	}

}
