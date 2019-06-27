package pro.dengyi.hedgehog.model.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

@Data
@Entity
@Table(name = "t_file")
public class File extends BaseEntity {

  @Override
  public Long getId() {
    return super.getId();
  }

  @Override
  public void setId(Long id) {
    super.setId(id);
  }

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

  public File(Long id, String fileName, String suffix, String fileUrl, String fileType,
      Long fileSize) {
    super.id = id;
    this.fileName = fileName;
    this.suffix = suffix;
    this.fileUrl = fileUrl;
    this.fileType = fileType;
    this.fileSize = fileSize;
  }
}
