package pro.dengyi.hedgehog.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

@Data
@Entity
@Table(name = "t_site_info")
public class SiteInfo extends BaseEntity {

  @Override
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

  /**
   * 网站名
   */
  @Column(length = 20)
  private String siteName;

  /**
   * 网站标语
   */
  @Column(length = 40)
  private String slogen;

  /**
   * 页脚版权信息
   */
  @Column(length = 250)
  private String copyright;

  /**
   * 网站标志
   */
  @Column(length = 150)
  private String logoUrl;

  /**
   * 网页图标
   */
  @Column(length = 150)
  private String faviconUrl;

  /**
   * pv
   */
  private Long pv;
  /**
   * uv
   */
  private Long uv;

}
