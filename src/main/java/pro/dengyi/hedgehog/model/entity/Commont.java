package pro.dengyi.hedgehog.model.entity;

import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 评论实体
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 14:04
 */
@Data
@Entity
@Table(name = "t_commont")
public class Commont extends BaseEntity {
	@Id
	@GeneratedValue
	private Long id;

	/**
	 * 评论者头像
	 */
	private String userPic;

	/**
	 * 评论者用户名
	 */
	private String userName;

	/**
	 * 评论内容
	 */
	private String content;


	@ManyToOne
	private Article article;

}
