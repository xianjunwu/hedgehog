package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pro.dengyi.hedgehog.dao.FileDao;
import pro.dengyi.hedgehog.service.FileService;

@Service
public class FileServiceImpl implements FileService {
  @Autowired
  private FileDao fileDao;

}
