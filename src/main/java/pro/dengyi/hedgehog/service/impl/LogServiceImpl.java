package pro.dengyi.hedgehog.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import pro.dengyi.hedgehog.dao.LogDao;
import pro.dengyi.hedgehog.model.entity.Log;
import pro.dengyi.hedgehog.service.LogService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-07 21:10
 */
@Service
public class LogServiceImpl implements LogService {
	@Autowired
	private LogDao logDao;

	@Override
	public int findLogNumber() {
		List<Log> all = logDao.findAll();
		return CollectionUtils.isEmpty(all) ? 0 : all.size();
	}
}
