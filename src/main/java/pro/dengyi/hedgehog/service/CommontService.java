package pro.dengyi.hedgehog.service;

import java.util.List;

import pro.dengyi.hedgehog.model.entity.Commont;
import pro.dengyi.hedgehog.model.vo.DataGridBo;

/**
 *评论service接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 20:09
 */
public interface CommontService {
	/**
	 * 查询所有的评论数量
	 *
	 * @param
	 * @return int
	 * @author 邓艺
	 * @date 2019/5/29 20:11
	 */
	int findNumberOfCommonts();

	List<Commont> findAllCommontsByArticleId(Long articleId);

	Commont save(Commont commont);

	DataGridBo<Commont> pageQuery(Integer pageNumber, Integer pageSize, String search, String sortBy, String order);

	void deleteById(Long id);
}
