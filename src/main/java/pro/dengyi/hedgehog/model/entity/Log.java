package pro.dengyi.hedgehog.model.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

/**
 * 操作日志实体类
 *
 * @author Bruce
 * @date 2018/9/23 20:12
 */
@Data
@Entity
@Table(name = "t_log")
public class Log extends BaseEntity {

  /**
   * 标题
   */
  private String logTitle;
  /**
   * 内容
   */
  private String logContent;
  /**
   * 产生日志的ip
   */
  private String logIp;

  @Override
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

}
