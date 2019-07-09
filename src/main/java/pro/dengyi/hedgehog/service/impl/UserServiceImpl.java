package pro.dengyi.hedgehog.service.impl;

import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import pro.dengyi.hedgehog.dao.UserDao;
import pro.dengyi.hedgehog.model.entity.User;
import pro.dengyi.hedgehog.service.UserService;
import pro.dengyi.hedgehog.utils.Md5Util;

/**
 * 用户service接口实现类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-04-21 21:27
 */
@Service
public class UserServiceImpl implements UserService {

  private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

  @Autowired
  private UserDao userDao;

  @Override
  public User findAdminUser() {
    List<User> userList = userDao.findAll();
    if (CollectionUtils.isEmpty(userList)) {
      LOGGER.error("系统管理员为空,必须安装系统");
      return null;
    } else {
      return userList.get(0);
    }

  }

  @Override
  public User doLogin(User user) {
    String encodePassword = Md5Util.encodePassword(user.getPassword());
    user.setPassword(encodePassword);
    User adminUser = findAdminUser();
    if (adminUser.getPassword().equalsIgnoreCase(user.getPassword())&&adminUser.getPhoneNumber().equalsIgnoreCase(user.getPhoneNumber())) {
      return adminUser;
    }
    return null;
  }

  @Override
  @Transactional
  public User saveOrUpdate(User user) {
    if (user.getId() == null) {
      //密码加密
      String encodePassword = Md5Util.encodePassword(user.getPassword());
      user.setPassword(encodePassword);
      user.setCreateTime(new Date());
    } else {
      user.setUpdateTime(new Date());
    }
    return userDao.save(user);
  }
}
