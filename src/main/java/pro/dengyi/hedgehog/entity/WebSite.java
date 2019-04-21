package pro.dengyi.hedgehog.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "t_web_site")
public class WebSite implements Serializable {

    private static final long serialVersionUID = -1278343970853674015L;

    @Id
    @GeneratedValue
    private Long id;
    /**
     * 网站名
     */
    @Column(length = 20)
    private String name;
    /**
     * 网站标语
     */
    @Column(length = 40)
    private String slogen;

    /**
     * 页脚版权信息
     */
    @Column(length = 250)
    private String copyright;

    /**
     * 网站标志
     */
    @Column(length = 150)
    private String pwebLogoUrl;

    /**
     * 网页图标
     */
    @Column(length = 150)
    private String pwebFaviconUrl;

}
