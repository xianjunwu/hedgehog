package pro.dengyi.hedgehog.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "t_web_info")
public class WebInfo implements Serializable {

    private static final long serialVersionUID = -1278343970853674015L;

    @Id
    @GeneratedValue
    private Long id;
    /**
     * 网站名
     */
    @Column(length = 20)
    private String pwebName;
    /**
     * 网站标语
     */
    @Column(length = 40)
    private String pwebSlogen;

    /**
     * 页脚版权信息
     */
    @Column(length = 250)
    private String pwebCopyright;

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
