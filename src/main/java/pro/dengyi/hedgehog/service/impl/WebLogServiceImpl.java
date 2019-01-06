package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pro.dengyi.hedgehog.dao.WebLogDao;
import pro.dengyi.hedgehog.service.WebLogService;

@Service
public class WebLogServiceImpl implements WebLogService {

  @Autowired
  private WebLogDao webLogDao;

}
