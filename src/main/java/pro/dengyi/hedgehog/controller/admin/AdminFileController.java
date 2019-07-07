package pro.dengyi.hedgehog.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import pro.dengyi.hedgehog.base.BaseResult;
import pro.dengyi.hedgehog.service.FileService;
import pro.dengyi.hedgehog.service.SystemConfigService;

/**
 * 文件上传controller 本项目使用七牛，自己搭建fs比较麻烦
 *
 * @author 邓艺
 * @date 2019/5/29 11:03
 */
@RestController
@RequestMapping("/admin/file")
public class AdminFileController {

  @Autowired
  private FileService fileService;
  @Autowired
  private SystemConfigService systemConfigService;

  @RequestMapping("/uploadFile")
  @ResponseBody
  public Map<String, Object> uploadFile(HttpServletRequest request) {
    //超级文件上传
    MultipartRequest multipartRequest = (MultipartRequest) request;
    Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
    Set<String> fileNames = fileMap.keySet();
    HashMap<String, Object> objectObjectHashMap = new HashMap<>();
    for (String fileName : fileNames) {
      MultipartFile multipartFile = fileMap.get(fileName);
      try {
        String fileUrl = fileService.uploadFileToQiNiu(multipartFile);
        objectObjectHashMap.put("error", 0);
        objectObjectHashMap.put("url", fileUrl);
        return objectObjectHashMap;
      } catch (IOException e) {
        e.printStackTrace();
      }
    }

    return null;
  }

  @PostMapping("/uploadRestorePackage")
  @ResponseBody
  public BaseResult uploadRestorePackage(MultipartFile file) {
    try {
      systemConfigService.restoreSystem(file.getInputStream());
      //恢复成功重定向到管理首页
    } catch (IOException e) {
      e.printStackTrace();
    }
    System.err.println(file.getSize());
    return new BaseResult();
  }

  @PostMapping("/uploadLogo")
  public void uploadLogo(HttpServletRequest request) {
    MultipartRequest multipartRequest = (MultipartRequest) request;
    Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
    Set<String> fileNames = fileMap.keySet();
    for (String fileName : fileNames) {
      MultipartFile multipartFile = fileMap.get(fileName);
      fileService.uploadImageToProject(multipartFile, "logo");
    }
  }

  @PostMapping("/uploadFavicon")
  public void uploadFavicon(HttpServletRequest request) {
    MultipartRequest multipartRequest = (MultipartRequest) request;
    Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
    Set<String> fileNames = fileMap.keySet();
    for (String fileName : fileNames) {
      MultipartFile multipartFile = fileMap.get(fileName);
      fileService.uploadImageToProject(multipartFile, "ico");
    }
  }
}
