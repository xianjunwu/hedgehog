package pro.dengyi.hedgehog.base;

import java.time.LocalDateTime;
import javax.persistence.MappedSuperclass;
import lombok.Data;

/**
 * 基础实体类
 *
 * 一定要记住：MappedSuperclass必须加上，否则在生产表的时候不能生成父类中的字段
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 18:35
 */
@Data
@MappedSuperclass
public class BaseEntity {

  /**
   * 创建时间
   */
  public LocalDateTime createTime;

  /**
   * 更新时间
   */
  public LocalDateTime updateTime;

}
