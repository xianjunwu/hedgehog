package pro.dengyi.hedgehog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pro.dengyi.hedgehog.dao.NoticeDao;
import pro.dengyi.hedgehog.model.bo.DataGridBo;
import pro.dengyi.hedgehog.model.bo.DataGridPager;
import pro.dengyi.hedgehog.model.entity.Notice;
import pro.dengyi.hedgehog.service.NoticeService;

/**
 * 通知service接口实现类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-07 21:17
 */
@Service
public class NoticeServiceImpl implements NoticeService {

  @Autowired
  private NoticeDao noticeDao;

  @Override
  public List<Notice> findAllNoticeNeedToDo() {
    List<Notice> all = noticeDao.findAll();
    return all;
  }

  @Override
  public DataGridBo<Notice> pageQuery(Integer pageNumber, Integer pageSize, String search,
      String sortBy, String order) {
    Pageable pageable = PageRequest.of(pageNumber - 1, pageSize);
    Page<Notice> all = noticeDao.findAll(pageable);
    List<Notice> content = all.getContent();
    long totalElements = all.getTotalElements();
    int number = all.getNumber();
    return new DataGridBo<>(content, new DataGridPager(number + 1, totalElements, pageSize));
  }

  @Override
  @Transactional
  public void deleteById(Long id) {
    noticeDao.deleteById(id);
  }
}
