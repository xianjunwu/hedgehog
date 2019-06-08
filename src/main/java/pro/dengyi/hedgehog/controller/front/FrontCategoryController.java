package pro.dengyi.hedgehog.controller.front;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pro.dengyi.hedgehog.model.dto.ListResult;
import pro.dengyi.hedgehog.model.entity.Category;
import pro.dengyi.hedgehog.service.CateGoryService;

/**
 * 分类controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 11:50
 */
@RequestMapping("/category")
@RestController
public class FrontCategoryController {

  @Autowired
  private CateGoryService cateGoryService;


  @GetMapping("/findAllCategory")
  public ListResult<Category> findAllCategory() {
    List<Category> allCategory = cateGoryService.findAllCategory();
    return new ListResult<>("success", "查询成功", allCategory);
  }

}
