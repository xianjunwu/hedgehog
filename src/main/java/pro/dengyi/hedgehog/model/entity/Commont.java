package pro.dengyi.hedgehog.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

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
   * 评论用户email
   */
  private String userEmail;

  /**
   * 评论内容
   */
  private String content;

  /**
   * 是否允许显示，用户提交以后，默认不允许显示，需管理员同意以后才能显示
   */
  private Boolean allowDisplay = false;


  @ManyToOne
  private Article article;

}
