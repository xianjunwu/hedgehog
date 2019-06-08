package pro.dengyi.hedgehog.model.dto;

import java.util.List;
import lombok.Data;
import pro.dengyi.hedgehog.base.BaseResult;

@Data
public class ListResult<T> extends BaseResult {

  /**
   * 数据集合
   */
  private List<T> data;


  public ListResult(String result, String message, List<T> data) {
    super.result = result;
    super.message = message;
    this.data = data;
  }
}
