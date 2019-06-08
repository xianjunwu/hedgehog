package pro.dengyi.hedgehog.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.model.bo.DataGridBo;
import pro.dengyi.hedgehog.model.dto.DataGridResult;
import pro.dengyi.hedgehog.model.entity.Commont;
import pro.dengyi.hedgehog.service.CommontService;

/**
 * 评论管理controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-08 11:44
 */
@Controller
@RequestMapping("/admin/comment")
public class AdminCommentController {

  @Autowired
  private CommontService commontService;

  @GetMapping("/list")
  public String commentList() {
    return "admin/commentlist";
  }

  @GetMapping("/pageQuery")
  @ResponseBody
  public DataGridResult<Commont> pageQuery(Integer page, Integer recPerPage, String search,
      String sortBy, String order) {
    DataGridBo<Commont> dataGridBo = commontService
        .pageQuery(page, recPerPage, search, sortBy, order);
    return new DataGridResult<>("success", "成功", dataGridBo.getData(),
        dataGridBo.getDataGridPager());
  }

  @DeleteMapping("/deleteById/{id}")
  @ResponseBody
  public BaseResult deleteById(@PathVariable Long id) {
    commontService.deleteById(id);
    return new BaseResult();

  }

}
