package pro.dengyi.hedgehog.controller.admin;

import org.springframework.web.bind.annotation.*;
import pro.dengyi.hedgehog.api.UserControllerApi;

/**
 * 用户controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-04-21 21:21
 */
@RestController
@RequestMapping("/user")
@Deprecated
public class UserController implements UserControllerApi {

//    @Autowired
//    private UserService userService;
//
//    @Override
//    @PostMapping("/addUser")
//    public BaseResult<User> addUser(@RequestBody User user) {
//        return null;
//    }
//
//    @Override
//    @PutMapping("/updateUser")
//    public BaseResult<User> updateUser(@RequestBody User user) {
//        return null;
//    }
//
//    @Override
//    @GetMapping("/findUserById/{userId}")
//    public BaseResult<User> findUserById(@PathVariable Long userId) {
//        return null;
//    }
}
