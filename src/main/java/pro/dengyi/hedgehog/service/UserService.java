package pro.dengyi.hedgehog.service;

import pro.dengyi.hedgehog.entity.User;

/**
 * 用户service接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-04-21 21:27
 */
public interface UserService {

    User findAdminUser();

}
