package pro.dengyi.hedgehog.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文章实体类
 *
 * @author Bruce
 * @date 2018/9/27 22:02
 */
@Data
@Entity
@Table(name = "t_article")
public class Article implements Serializable {

    private static final long serialVersionUID = -6019684584665869629L;

    /**
     * 文章编号
     */
    @Id
    @GeneratedValue
    private Long id;

    /**
     * 文章标题
     */
    private String title;
    /**
     * 文章摘要
     */
    @Column(columnDefinition = "text")
    private String summary;

    @OneToOne
    private Category category;
    /**
     * 文章内容
     */
    @Column(columnDefinition = "text")
    private String content;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 最后一次更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime lastUpdateTime;

    /**
     * 0 已发布 1 草稿 2 回收站
     */
    private Integer articleStatus = 0;

    /**
     * 文章访问量
     */
    private Long views = 0L;

    /**
     * 喜欢数
     */
    private Long hearts = 0L;

    /**
     * 是否允许评论
     */
    private Boolean allowComment = true;
}
