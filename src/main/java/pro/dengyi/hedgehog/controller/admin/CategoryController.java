package pro.dengyi.hedgehog.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.base.DataGridResult;
import pro.dengyi.hedgehog.entity.Article;
import pro.dengyi.hedgehog.entity.Category;
import pro.dengyi.hedgehog.entity.DataGridBo;
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
public class CategoryController {
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
    public BaseResult saveOrUpdate(Category category) {
        Category saved = cateGoryService.saveOrUpdate(category);
        return null;

    }
}
