package pro.dengyi.hedgehog.service.impl;

import java.util.List;
import java.util.Optional;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import pro.dengyi.hedgehog.dao.ArticleDao;
import pro.dengyi.hedgehog.dao.CommontDao;
import pro.dengyi.hedgehog.dao.NoticeDao;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.model.entity.Commont;
import pro.dengyi.hedgehog.model.entity.Notice;
import pro.dengyi.hedgehog.model.vo.DataGridBo;
import pro.dengyi.hedgehog.model.vo.DataGridPager;
import pro.dengyi.hedgehog.service.CommontService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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

	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private ArticleDao articleDao;


	@Override
	public int findNumberOfCommonts() {
		List<Commont> all = commontDao.findAll();
		return CollectionUtils.isEmpty(all) ? 0 : all.size();
	}

	@Override
	public List<Commont> findAllCommontsByArticleId(Long articleId) {
		return null;
	}

	@Override
	@Transactional
	public Commont save(Commont commont) {
		Commont save = commontDao.save(commont);
		syncToNotice(save);
		return save;
	}

	@Override
	public DataGridBo<Commont> pageQuery(Integer pageNumber, Integer pageSize, String search, String sortBy, String order) {
		Pageable pageable = PageRequest.of(pageNumber - 1, pageSize);
		Page<Commont> all = commontDao.findAll(pageable);
		List<Commont> content = all.getContent();
		int number = all.getNumber();
		long totalElements = all.getTotalElements();
		return new DataGridBo<>(content, new DataGridPager(number + 1, totalElements, pageSize));
	}

	@Override
	public void deleteById(Long id) {
		commontDao.deleteById(id);

	}

	/**
	 * 同步评论到通知表
	 * @param commont
	 */
	@Async
	public void syncToNotice(Commont commont) {
		Optional<Article> byId = articleDao.findById(commont.getArticle().getId());
		if (byId.isPresent()) {
			Notice notice = new Notice();
			notice.setNoticeName("文章《" + byId.get().getTitle() + "》有新评论");
			notice.setSolved(false);
			notice.setViewed(false);
			noticeDao.save(notice);

		} else {
			log.error("评论时同步通知表，通过文章id未查询到文章");
		}

	}
}
