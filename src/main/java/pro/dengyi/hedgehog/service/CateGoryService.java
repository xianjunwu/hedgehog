package pro.dengyi.hedgehog.service;

import pro.dengyi.hedgehog.entity.Category;
import pro.dengyi.hedgehog.entity.DataGridBo;

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
}
