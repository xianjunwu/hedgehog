package pro.dengyi.hedgehog.service.impl;

import java.util.List;

import pro.dengyi.hedgehog.dao.NoticeDao;
import pro.dengyi.hedgehog.model.entity.Notice;
import pro.dengyi.hedgehog.service.NoticeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *通知service接口实现类
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
}
