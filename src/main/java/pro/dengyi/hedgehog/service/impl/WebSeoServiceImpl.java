package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pro.dengyi.hedgehog.dao.WebSeoDao;
import pro.dengyi.hedgehog.service.WebSeoService;

@Service
public class WebSeoServiceImpl implements WebSeoService {

  @Autowired
  private WebSeoDao webSeoDao;

}
