package pro.dengyi.hedgehog.service;

import pro.dengyi.hedgehog.model.entity.User;

/**
 * 用户service接口
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-04-21 21:27
 */
public interface UserService {

	User findAdminUser();

	/**
	 * 用户登录方法
	 * <br/>
	 *
	 * @param user user实体
	 * @return pro.dengyi.hedgehog.model.entity.User
	 * @author 邓艺
	 * @date 2019/5/20 13:27
	 */
	User doLogin(User user);

	/**
	 * 新增或者修改用户
	 *
	 * 新增用户的时候讲用户密码进行简单的md5加密
	 *
	 * @param user     用户信息实体
	 * @return pro.dengyi.hedgehog.model.entity.User
	 * @author 邓艺
	 * @date 2019/5/29 18:28
	 */
	User saveOrUpdate(User user);
}
