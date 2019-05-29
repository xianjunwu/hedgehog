package pro.dengyi.hedgehog.model.entity;

import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

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
     * id
     */
    @Id
    @GeneratedValue
    private Long id;

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


    public Log(String logTitle, String logContent, String logIp) {
        this.logTitle = logTitle;
        this.logContent = logContent;
        this.logIp = logIp;
    }
}
