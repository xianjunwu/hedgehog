package pro.dengyi.hedgehog.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

@Data
@AllArgsConstructor
@Entity
@Table(name = "t_file")
public class File extends BaseEntity {

  @Id
  @GeneratedValue
  private Long id;

  /**
   * 文件名
   */
  private String fileName;

  /**
   * 后缀名
   */
  private String suffix;

  /**
   * 文件实际地址
   */
  private String fileUrl;

  /**
   * 文件类型
   */
  private String fileType;

  /**
   * 文件大小
   */
  private Long fileSize;

}
