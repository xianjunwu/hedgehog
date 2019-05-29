package pro.dengyi.hedgehog.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pro.dengyi.hedgehog.service.WebUserService;

@Controller
@RequestMapping("/admin/login")
public class LoginController {
    @Autowired
    private WebUserService webUserService;
    @GetMapping
    public String showLoginPage() {
        return "admin/admin_login";
    }

//    @PostMapping(value = "/doLogin")
//    @ResponseBody
//    public BaseResult<String> doLogin(String userName, String password, HttpSession session) {
//        BaseResult<String> baseResult = new BaseResult<>();
//        User webUser = webUserService.queryUser();
//        return baseResult;
//    }

}
