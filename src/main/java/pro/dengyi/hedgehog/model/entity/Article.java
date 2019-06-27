package pro.dengyi.hedgehog.model.entity;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import lombok.Data;
import org.apache.solr.client.solrj.beans.Field;
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
public class Article extends BaseEntity {

  @Override
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

  /**
   * 文章标题
   */
  private String title;

  /**
   * 文章摘要
   */
  @Column(columnDefinition = "text")
  @Field
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
  @NotNull
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

}
