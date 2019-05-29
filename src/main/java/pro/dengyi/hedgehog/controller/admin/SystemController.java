package pro.dengyi.hedgehog.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pro.dengyi.hedgehog.model.entity.User;
import pro.dengyi.hedgehog.service.UserService;
import pro.dengyi.hedgehog.utils.VerificationCodeUtil;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 系统controller
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-16 01:30
 */
@Slf4j
@Controller
@RequestMapping("/admin/system")
public class SystemController {
    @Autowired
    private UserService userService;

    /**
     * 退出系统
     * <br/>
     *
     * @param
     * @return java.lang.String
     * @author 邓艺
     * @date 2019/5/16 1:31
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        try {
            session.removeAttribute("loginUser");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/system/showLoginPage";
    }

    /**
     * 登录系统
     * <br/>
     *
     * @param
     * @return java.lang.String
     * @author 邓艺
     * @date 2019/5/16 1:31
     */
    @PostMapping("/doLogin")
    public String doLogin(HttpSession session, User user) {
        try {
            User userLogin = userService.doLogin(user);
            session.setAttribute("loginUser", userLogin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/admin/index";
    }

    /**
     * 显示登录页面方法
     * <br/>
     *
     * @param
     * @return java.lang.String
     * @author 邓艺
     * @date 2019/5/16 1:31
     */
    @GetMapping("/showLoginPage")
    public String showLoginPage() {
        return "/admin/login";
    }

    /**
     * 获取验证码方法
     * <br/>
     *
     * @param
     * @return map
     * @author 邓艺
     * @date 2019/5/19 13:44
     */
    @GetMapping("/getVerificationCode")
    @ResponseBody
    public Map<String, String> getVerificationCode(HttpSession session) {
        Map<String, String> map = new HashMap<>(1);
        String verificationCode = VerificationCodeUtil.getVerificationCode();
        map.put("verificationCode", verificationCode);
        session.setAttribute("verificationCode", verificationCode);
        return map;
    }

    /**
     * 验证验证码正确定性方法
     * <br/>
     *
     * @param code 验证码
     * @param session
     * @return map
     * @author 邓艺
     * @date 2019/5/19 16:14
     */
    @PostMapping("/checkVerificationCode")
    @ResponseBody
    public Map<String, Boolean> checkVerificationCode(String code, HttpSession session) {
        String verificationCode = (String) session.getAttribute("verificationCode");
        verificationCode = "123456";
        boolean status = false;
        Map<String, Boolean> map = new HashMap<>(1);
        if (StringUtils.isNotBlank(verificationCode)) {
            status = verificationCode.equalsIgnoreCase(code);
        }
        map.put("valid", status);
        return map;
    }

}
