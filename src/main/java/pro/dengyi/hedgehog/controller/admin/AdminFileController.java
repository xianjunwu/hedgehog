package pro.dengyi.hedgehog.controller.admin;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import pro.dengyi.hedgehog.base.BaseResult;

/**
 * 文件上传controller 本项目使用七牛，自己搭建fs比较麻烦
 *
 * @author 邓艺
 * @date 2019/5/29 11:03
 */
@RestController
@RequestMapping("/admin/file")
public class AdminFileController {

  @RequestMapping("/uploadFile")
  public BaseResult uploadFile(MultipartFile[] files) {

    return null;
  }
}
