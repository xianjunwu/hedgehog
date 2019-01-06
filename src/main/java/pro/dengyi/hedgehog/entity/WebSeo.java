package pro.dengyi.hedgehog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "web_seo")
public class WebSeo {

  @Id
  @GeneratedValue
  private Long id;
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


}
