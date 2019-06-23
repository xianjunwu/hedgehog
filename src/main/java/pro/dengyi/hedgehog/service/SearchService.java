package pro.dengyi.hedgehog.service;

/**
 * 搜索service接口，提供基本的搜索服务
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-23 14:05
 */
public interface SearchService {

  /**
   * 搜索接口
   *
   * @param pageNumber
   * @param pageSize
   * @param key  return void
   * @author 邓艺
   * @date 2019/6/23 21:26
   */
  void search(Integer pageNumber, Integer pageSize, String key);
}
