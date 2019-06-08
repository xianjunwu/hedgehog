package pro.dengyi.hedgehog.model.dto;

import lombok.Data;
import pro.dengyi.hedgehog.base.BaseResult;

/**
 * 单一实体dto
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 19:04
 */
@Data
public class SingleResult<T> extends BaseResult {

  /**
   * 数据内容
   */
  private T data;

  public SingleResult(String result, String message, T data) {
    super.result = result;
    super.message = message;
    this.data = data;
  }
}
