package pro.dengyi.hedgehog.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import pro.dengyi.hedgehog.entity.User;
import pro.dengyi.hedgehog.service.UserService;

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

    @Override
    public User findAdminUser() {
        return null;
    }
}
