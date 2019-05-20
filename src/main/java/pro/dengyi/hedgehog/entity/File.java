package pro.dengyi.hedgehog.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "t_file")
public class File {

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
