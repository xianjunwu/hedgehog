package pro.dengyi.hedgehog.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import pro.dengyi.hedgehog.base.BaseEntity;

/**
 * 分类实体
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 13:48
 */
@Data
@Entity
@Table(name = "t_category")
public class Category extends BaseEntity {

  @Override
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

  /**
   * 分类名称
   */
  @Length(max = 5)
  private String categoryName;

  /**
   * 分类描述
   */
  private String categoryDesc;

  /**
   * 分类路径
   */
  private String path;

}
