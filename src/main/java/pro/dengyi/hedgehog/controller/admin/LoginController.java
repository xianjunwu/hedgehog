package pro.dengyi.hedgehog.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.entity.User;
import pro.dengyi.hedgehog.service.WebUserService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/login")
public class LoginController {
    @Autowired
    private WebUserService webUserService;
//1111111111111111111111111111111
    @GetMapping
    public String showLoginPage() {
        return "admin/admin_login";
    }

    @PostMapping(value = "/doLogin")
    @ResponseBody
    public BaseResult<String> doLogin(String userName, String password, HttpSession session) {
        BaseResult<String> baseResult = new BaseResult<>();
        User webUser = webUserService.queryUser();
        return baseResult;
    }

}
