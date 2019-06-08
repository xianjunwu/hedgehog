package pro.dengyi.hedgehog.controller.front;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.model.dto.ListResult;
import pro.dengyi.hedgehog.model.entity.Commont;
import pro.dengyi.hedgehog.service.CommontService;

/**
 * 评论controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-03 21:13
 */
@RestController
@RequestMapping("/commont")
public class FrontCommontController {

  @Autowired
  private CommontService commontService;

  @RequestMapping("/findAllCommontsByArticleId/{articleId}")
  public ListResult<Commont> findAllCommontsByArticleId(@PathVariable Long articleId) {
    List<Commont> list = commontService.findAllCommontsByArticleId(articleId);
    return null;
  }

  @PostMapping("/save")
  @ResponseBody
  public BaseResult save(@RequestBody Commont commont) {
    Commont saved = commontService.save(commont);
    return new BaseResult();
  }

}
