package pro.dengyi.hedgehog.service.impl;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import pro.dengyi.hedgehog.dao.CommontDao;
import pro.dengyi.hedgehog.model.entity.Commont;
import pro.dengyi.hedgehog.service.CommontService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 20:11
 */
@Service
@Slf4j
public class CommontServiceImpl implements CommontService {
	@Autowired
	private CommontDao commontDao;

	@Override
	public int findNumberOfCommonts() {
		List<Commont> all = commontDao.findAll();
		return CollectionUtils.isEmpty(all) ? 0 : all.size();
	}

	@Override
	public List<Commont> findAllCommontsByArticleId(Long articleId) {
		return null;
	}
}
