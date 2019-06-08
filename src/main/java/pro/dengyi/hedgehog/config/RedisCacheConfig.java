package pro.dengyi.hedgehog.config;

import java.util.concurrent.Callable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * 整合redis作为缓存
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-08 22:39
 */
@Component
public class RedisCacheConfig implements Cache {

  @Autowired
  private RedisTemplate<Object, Object> redisTemplate;

  @Override
  public String getName() {
    return null;
  }

  @Override
  public Object getNativeCache() {
    return null;
  }

  @Override
  public ValueWrapper get(Object o) {
    return null;
  }

  @Override
  public <T> T get(Object o, Class<T> aClass) {
    return null;
  }

  @Override
  public <T> T get(Object o, Callable<T> callable) {
    return null;
  }

  @Override
  public void put(Object o, Object o1) {

  }

  @Override
  public ValueWrapper putIfAbsent(Object o, Object o1) {
    return null;
  }

  @Override
  public void evict(Object o) {

  }

  @Override
  public void clear() {

  }
}
