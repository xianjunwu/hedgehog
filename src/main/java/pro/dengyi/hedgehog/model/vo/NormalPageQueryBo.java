package pro.dengyi.hedgehog.model.vo;

import java.util.List;

import lombok.Data;

/**
 *通用分页查询bo
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-02 17:33
 */
@Data
public class NormalPageQueryBo<T> {

	/**
	 * 实际数据集合
	 */
	private List<T> data;

	/**
	 * 总页数
	 */
	private Integer totalPages;

	/**
	 * 数据总条数
	 */
	private Long totalElements;

	private Integer pageNumber;

	private Integer pageSize;

}
