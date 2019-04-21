package pro.dengyi.hedgehog.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 操作日志实体类
 *
 * @author Bruce
 * @date 2018/9/23 20:12
 */
@Data
@Entity
@Table(name = "t_web_log")
public class WebLog implements Serializable {

    private static final long serialVersionUID = -2571815432301283171L;

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

    /**
     * 产生的时间
     */
    private LocalDateTime logDateTime;

    public WebLog() {
    }

    public WebLog(String logTitle, String logContent, String logIp, LocalDateTime logDateTime) {
        this.logTitle = logTitle;
        this.logContent = logContent;
        this.logIp = logIp;
        this.logDateTime = logDateTime;
    }
}
