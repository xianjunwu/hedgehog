package pro.dengyi.hedgehog.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 分类实体
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 13:48
 */
@Data
@Entity
@Table(name = "t_category")
public class Category {
    @Id
    @GeneratedValue
    private Long id;
    /**
     * 分类名称
     */
    private String categoryName;
    /**
     * 分类描述
     */
    private String categoryDesc;

}
