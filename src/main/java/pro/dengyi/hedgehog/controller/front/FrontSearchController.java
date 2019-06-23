package pro.dengyi.hedgehog.controller.front;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pro.dengyi.hedgehog.service.SearchService;

/**
 * 搜索controller 使用solr
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-25 13:47
 */
@Controller
@RequestMapping("/search")
public class FrontSearchController {

  @Autowired
  private SearchService searchService;


  @GetMapping
  public String doSearch(String key, @RequestParam(defaultValue = "1") Integer pageNumber,
      @RequestParam(defaultValue = "10") Integer pageSize) {

    if (StringUtils.isNotBlank(key)) {
      //当搜索条件为空时，搜索推荐的内容
      searchService.search(pageNumber, pageSize, key);
    } else {
      //搜索

    }
    return "front/searchResult";
  }

}
