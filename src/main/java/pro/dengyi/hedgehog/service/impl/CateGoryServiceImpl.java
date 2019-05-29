package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import pro.dengyi.hedgehog.dao.CategoryDao;
import pro.dengyi.hedgehog.model.entity.Category;
import pro.dengyi.hedgehog.model.vo.DataGridBo;
import pro.dengyi.hedgehog.model.vo.DataGridPager;
import pro.dengyi.hedgehog.service.CateGoryService;
import pro.dengyi.hedgehog.utils.PinYinUtil;

import java.util.List;

/**
 * 分类service实现类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-20 13:56
 */
@Service
public class CateGoryServiceImpl implements CateGoryService {
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public int findNumberOfCategorys() {
		List<Category> all = categoryDao.findAll();
		if (!CollectionUtils.isEmpty(all)) {
			return all.size();
		}
		return 0;
	}

	@Override
	public DataGridBo<Category> pageQuery(Integer page, Integer recPerPage) {
		Pageable pageable = PageRequest.of(page - 1, recPerPage);
		Page<Category> articles = categoryDao.findAll(pageable);
		List<Category> content = articles.getContent();
		long totalElements = articles.getTotalElements();
		int number = articles.getNumber();
		return new DataGridBo<>(content, new DataGridPager(number + 1, totalElements, recPerPage));
	}

	@Override
	@Transactional
	public Category saveOrUpdate(Category category) {
		if (category.getId() == null) {
			String pinYin = PinYinUtil.getPinYin(category.getCategoryName());
			category.setPath(pinYin);
		}
		return categoryDao.save(category);
	}

	@Override
	public int findCategoryNumber() {
		return categoryDao.findAll().size();
	}

	@Override
	public List<Category> findAllCategory() {
		return categoryDao.findAll();
	}
}
