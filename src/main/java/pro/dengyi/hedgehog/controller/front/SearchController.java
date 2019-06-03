package pro.dengyi.hedgehog.controller.front;

import org.apache.commons.lang3.StringUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 搜索controller
 *使用solr
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-25 13:47
 */
@Controller
@RequestMapping("/search")
public class SearchController {

	@GetMapping
	public String doSearch(String key, @RequestParam(defaultValue = "1") Integer pageNumber, @RequestParam(defaultValue = "7") Integer pageSize) {
		//当搜索条件为空时，不搜索
		if (StringUtils.isNotBlank(key)) {
			return "front/searchResult";
		} else {
			//搜索
		}

		return "front/searchResult";

	}

}
