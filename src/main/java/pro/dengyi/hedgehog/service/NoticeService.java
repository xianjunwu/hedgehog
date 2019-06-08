package pro.dengyi.hedgehog.service;

import java.util.List;

import pro.dengyi.hedgehog.model.entity.Notice;
import pro.dengyi.hedgehog.model.bo.DataGridBo;

/**
 *通知service接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-07 21:16
 */
public interface NoticeService {
	/**
	 * 查询所有需要去处理的通知集合
	 *
	 * @param
	 * @return java.util.List<pro.dengyi.hedgehog.model.entity.Notice>
	 * @author 邓艺
	 * @date 2019/6/7 21:19
	 */
	List<Notice> findAllNoticeNeedToDo();

	DataGridBo<Notice> pageQuery(Integer pageNumber, Integer pageSize, String search, String sortBy, String order);

	void deleteById(Long id);
}
