package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pro.dengyi.hedgehog.dao.WebUserDao;
import pro.dengyi.hedgehog.entity.WebUser;
import pro.dengyi.hedgehog.service.WebUserService;

@Service
public class WebUserServiceImpl implements WebUserService {

  @Autowired
  private WebUserDao webUserDao;

  @Override
  public WebUser queryUser() {
    return webUserDao.findAll().get(0);
  }
}
