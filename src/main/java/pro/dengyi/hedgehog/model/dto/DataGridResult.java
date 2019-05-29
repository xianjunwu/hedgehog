package pro.dengyi.hedgehog.model.dto;

import lombok.Data;
import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.model.vo.DataGridPager;

import java.util.List;

/**
 * 数据表格返回实体
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-25 14:50
 */
@Data
public class DataGridResult<T> extends BaseResult {
    /**
     * 数据集合
     */
    private List<T> data;

    private DataGridPager pager;

    public DataGridResult(String result, String message, List<T> data, DataGridPager dataGridPager) {
        super.result = result;
        super.message = message;
        this.data = data;
        this.pager = dataGridPager;
    }
}
