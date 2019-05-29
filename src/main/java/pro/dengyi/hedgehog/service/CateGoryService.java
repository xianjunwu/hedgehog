package pro.dengyi.hedgehog.service;

import java.util.List;

import pro.dengyi.hedgehog.model.entity.Category;
import pro.dengyi.hedgehog.model.vo.DataGridBo;

/**
 * 类别service接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 13:55
 */
public interface CateGoryService {
	/**
	 * 查询所有分类的数目和
	 * <br/>
	 *
	 * @param
	 * @return int
	 * @author 邓艺
	 * @date 2019/5/20 13:58
	 */
	int findNumberOfCategorys();

	DataGridBo<Category> pageQuery(Integer page, Integer recPerPage);

	Category saveOrUpdate(Category category);

	int findCategoryNumber();

	/**
	 * 查询所有的分类集合
	 *
	 * @param
	 * @return java.util.List<pro.dengyi.hedgehog.model.entity.Category>
	 * @author 邓艺
	 * @date 2019/5/28 21:39
	 */
	List<Category> findAllCategory();

}
