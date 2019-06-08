package pro.dengyi.hedgehog.model.bo;

import lombok.Data;

/**
 * 数据表格pagger对象
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-25 15:00
 */
@Data
public class DataGridPager{
    /**
     * 当前数据对应的页码
     */
    private Integer page;
    /**
     * 总的数据数目
     */
    private Long recTotal;
    /**
     * 每页数据数目
     */
    private Integer recPerPage;


    public DataGridPager(Integer page, Long recTotal, Integer recPerPage) {
        this.page = page;
        this.recTotal = recTotal;
        this.recPerPage = recPerPage;
    }
}
