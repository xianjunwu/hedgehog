package pro.dengyi.hedgehog.model.entity;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import pro.dengyi.hedgehog.base.BaseEntity;

/**
 * 文章实体类
 *
 * @author Bruce
 * @date 2018/9/27 22:02
 */
@Data
@Entity
@Table(name = "t_article")
@Indexed
@Analyzer()
public class Article extends BaseEntity {

  /**
   * 文章标题
   */
  @Field
  private String title;
  /**
   * 文章摘要
   */
  @Field
  @Column(columnDefinition = "text")
  private String summary;
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
  private Long views;
  /**
   * 喜欢数
   */
  private Long hearts;
  /**
   * 是否允许评论
   */
  @NotNull(message = "是否允许评论不能为空")
  private Boolean allowComment;
  /**
   * 是否推荐
   */
  @NotNull
  private Boolean isRecommend;
  /**
   * 关系配置
   */

  @ManyToOne
  private Category category;
  /**
   * 评论关系配置
   */

  @OneToMany
  private List<Commont> commonts;

  @Override
  @Field
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

}
