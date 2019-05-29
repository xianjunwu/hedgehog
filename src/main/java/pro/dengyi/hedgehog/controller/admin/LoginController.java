package pro.dengyi.hedgehog.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/login")
public class LoginController {
    @GetMapping
    public String showLoginPage() {
        return "admin/login";
    }

//    @PostMapping(value = "/doLogin")
//    @ResponseBody
//    public BaseResult<String> doLogin(String userName, String password, HttpSession session) {
//        BaseResult<String> baseResult = new BaseResult<>();
//        User webUser = webUserService.queryUser();
//        return baseResult;
//    }

}
