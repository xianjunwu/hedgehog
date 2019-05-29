package pro.dengyi.hedgehog.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import pro.dengyi.hedgehog.dao.UserDao;
import pro.dengyi.hedgehog.model.entity.User;
import pro.dengyi.hedgehog.service.UserService;
import pro.dengyi.hedgehog.utils.Md5Util;

import java.time.LocalDateTime;
import java.util.List;

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
			LOGGER.error("系统管理员为空");
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
		if (adminUser.equals(user)) {
			return adminUser;
		}
		return null;
	}

	@Override
	public User saveOrUpdate(User user) {
		if (user.getId() == null) {
			user.setCreateTime(LocalDateTime.now());
		} else {
			user.setUpdateTime(LocalDateTime.now());
		}
		return userDao.save(user);
	}
}
