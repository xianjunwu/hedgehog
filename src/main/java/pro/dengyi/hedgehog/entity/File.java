package pro.dengyi.hedgehog.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "file")
public class File implements Serializable {

  private static final long serialVersionUID = -7537148724807595508L;
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
