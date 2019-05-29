package pro.dengyi.hedgehog.model.entity;

import lombok.Data;
import pro.dengyi.hedgehog.base.BaseEntity;

import javax.persistence.*;

@Data
@Entity
@Table(name = "t_site_info")
public class SiteInfo  extends BaseEntity {

    @Id
    @GeneratedValue
    private Long id;
    /**
     * 网站名
     */
    @Column(length = 20)
    private String siteName;
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
    private String logoUrl;

    /**
     * 网页图标
     */
    @Column(length = 150)
    private String faviconUrl;

}
