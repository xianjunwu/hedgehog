package pro.dengyi.hedgehog.base;

import java.time.LocalDateTime;

import lombok.Data;

/**
 *基础实体类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:35
 */
@Data
public class BaseEntity {

	/**
	 * 创建时间
	 */
	public LocalDateTime createTime;

	/**
	 * 更新时间
	 */
	public LocalDateTime updateTime;

}
