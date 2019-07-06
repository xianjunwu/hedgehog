package pro.dengyi.hedgehog.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

@Data
@Entity
@Table(name = "t_seo")
public class Seo extends BaseEntity {

  /**
   * 网站关键词
   */
  private String keywords;
  /**
   * 网站描述
   */
  private String description;
  /**
   * 作者
   */
  @Column(length = 10)
  private String author;
  /**
   * google推送token
   */
  @Column(length = 45)
  private String gtoken;
  /**
   * 百度推送token
   */
  @Column(length = 45)
  private String btoken;

  @Override
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

}
