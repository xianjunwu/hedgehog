package pro.dengyi.hedgehog.model.entity;

import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

import javax.persistence.*;

import java.io.Serializable;

/**
 * 文章实体类
 *
 * @author Bruce
 * @date 2018/9/27 22:02
 */
@Data
@Entity
@Table(name = "t_article")
public class Article extends BaseEntity implements Serializable {

	private static final long serialVersionUID = -6019684584665869629L;

	/**
	 * 文章编号
	 */
	@Id
	@GeneratedValue
	private Long id;

	/**
	 * 文章标题
	 */
	private String title;

	/**
	 * 文章摘要
	 */
	@Column(columnDefinition = "text")
	private String summary;


	@ManyToOne
	private Category category;

	/**
	 * 文章内容
	 */
	@Column(columnDefinition = "text")
	private String content;

	/**
	 * true 发布 false 不发布
	 */
	private Boolean articleStatus;

	/**
	 * 文章访问量
	 */
	private Long views = 0L;

	/**
	 * 喜欢数
	 */
	private Long hearts = 0L;

	/**
	 * 是否允许评论
	 */
	private Boolean allowComment = true;
}
