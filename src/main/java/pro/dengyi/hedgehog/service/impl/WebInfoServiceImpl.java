package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pro.dengyi.hedgehog.dao.WebInfoDao;
import pro.dengyi.hedgehog.service.WebInfoService;

@Service
public class WebInfoServiceImpl implements WebInfoService {

    @Autowired
    private WebInfoDao webInfoDao;

}
