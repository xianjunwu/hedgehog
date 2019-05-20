package pro.dengyi.hedgehog.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "t_seo")
public class Seo {

    @Id
    @GeneratedValue
    private Long id;
    /**
     * 网站关键词
     */
    private String keywords;
    /**
     * 网站描述
     */
    private String description;
    /**
     * 作者
     */
    @Column(length = 10)
    private String author;
    /**
     * google推送token
     */
    @Column(length = 45)
    private String gtoken;
    /**
     * 百度推送token
     */
    @Column(length = 45)
    private String btoken;

}
