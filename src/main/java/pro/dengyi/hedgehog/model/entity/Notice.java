package pro.dengyi.hedgehog.model.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

/**
 * 通知表
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-07 20:01
 */
@Data
@Entity
@Table(name = "t_notice")
public class Notice extends BaseEntity {

  /**
   * 通知名
   */
  private String noticeName;
  /**
   * 是否被解决
   */
  private Boolean solved;
  /**
   * 是否被浏览过
   */
  private Boolean viewed;

  @Override
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

}
