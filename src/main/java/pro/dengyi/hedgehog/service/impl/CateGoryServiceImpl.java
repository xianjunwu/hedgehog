package pro.dengyi.hedgehog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import pro.dengyi.hedgehog.dao.CategoryDao;
import pro.dengyi.hedgehog.entity.Category;
import pro.dengyi.hedgehog.entity.DataGridBo;
import pro.dengyi.hedgehog.entity.DataGridPager;
import pro.dengyi.hedgehog.service.CateGoryService;

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
}
