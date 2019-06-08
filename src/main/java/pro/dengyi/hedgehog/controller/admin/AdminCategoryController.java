package pro.dengyi.hedgehog.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.model.dto.DataGridResult;
import pro.dengyi.hedgehog.model.dto.ListResult;
import pro.dengyi.hedgehog.model.entity.Category;
import pro.dengyi.hedgehog.model.bo.DataGridBo;
import pro.dengyi.hedgehog.service.CateGoryService;

/**
 * 文章分类controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-25 16:16
 */
@Controller
@RequestMapping("/admin/category")
public class AdminCategoryController {
	@Autowired
	private CateGoryService cateGoryService;

	@GetMapping("/")
	public String showPage() {
		return "admin/categorylist";

	}

	@GetMapping("/pageQuery")
	@ResponseBody
	public DataGridResult<Category> pageQuery(Integer page, Integer recPerPage, String search, String sortBy, String order) {
		DataGridBo<Category> dataGridBo = cateGoryService.pageQuery(page, recPerPage);
		return new DataGridResult<>("success", "成功", dataGridBo.getData(), dataGridBo.getDataGridPager());
	}

	@PostMapping("/saveOrUpdate")
	@ResponseBody
	public BaseResult saveOrUpdate(@Valid Category category) {
		//校验数量，给10个量
		BaseResult baseResult = new BaseResult();
		int num = cateGoryService.findCategoryNumber();
		if (num > 10) {
			baseResult.setMessage("分类数量已达到最大数量");
			baseResult.setResult("fail");
		} else {
			Category saved = cateGoryService.saveOrUpdate(category);
			baseResult.setMessage("保存成功");
			baseResult.setResult("success");
		}
		return baseResult;
	}

	@GetMapping("/findAllCategory")
	@ResponseBody
	public ListResult<Category> findAllCategory() {
		List<Category> list = cateGoryService.findAllCategory();
		return new ListResult<>("success", "查询成功", list);
	}

	@DeleteMapping("/deleteById/{id}")
	@ResponseBody
	public BaseResult deleteById(@PathVariable Long id) {
		cateGoryService.deleteById(id);
		return new BaseResult();
	}
}
