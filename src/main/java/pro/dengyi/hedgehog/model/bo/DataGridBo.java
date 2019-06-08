package pro.dengyi.hedgehog.model.bo;

import java.util.List;
import lombok.Data;

/**
 * datagrid数据业务数据传输实体
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-25 15:28
 */
@Data
public class DataGridBo<T> {

  /**
   * 数据内容
   */
  private List<T> data;

  /**
   * datagrid的pager内容封装对象
   */
  private DataGridPager dataGridPager;

  public DataGridBo(List<T> data, DataGridPager dataGridPager) {
    this.data = data;
    this.dataGridPager = dataGridPager;
  }
}
