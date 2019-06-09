package pro.dengyi.hedgehog;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;

import java.util.Map;
import javax.imageio.ImageIO;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.junit.Test;
import org.junit.runner.RunWith;
import pro.dengyi.hedgehog.dao.ArticleSearchDao;
import pro.dengyi.hedgehog.model.dto.ArticleSearchDto;
import pro.dengyi.hedgehog.model.entity.Article;
import pro.dengyi.hedgehog.service.ArticleSearchService;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.solr.core.SolrTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HedgehogApplicationTests {

	@Autowired
	private SolrTemplate solrTemplate;

	@Autowired
	private ArticleSearchService articleSearchService;

	@Autowired
	private ArticleSearchDao articleSearchDao;


	@Test
	public void contextLoads() {
		for (int i = 0; i < 100; i++) {
			System.out.println("111");
			say();
		}

	}

	@Async
	public void say() {
		for (int i = 0; i < 100; i++) {
			System.err.println("hello");
		}
	}

	@Test
	public void demo1() {
		LocalDate now = LocalDate.of(2019, 6, 6);
		Period between = Period.between(now, LocalDate.now());
		System.out.println(between.getDays());
	}

	@Test
	public void demo2() {
		Article article = new Article();
		article.setId(33L);
		article.setTitle("测试的文章");
		article.setSummary("测试文章的摘要");
		UpdateResponse hedgehog = solrTemplate.saveBean("hedgehog", article);
		solrTemplate.commit("hedgehog");
		System.err.println(hedgehog);

	}

	@Test
	public void demo3() {
		//spring data jpa 使用
		ArticleSearchDto articleSearchDto = new ArticleSearchDto();
		articleSearchDto.setId(22L);
		articleSearchDto.setTitle("我是一个中国人");
		articleSearchDto.setSummary("这是文章的摘要");
		articleSearchDto.setViews(1000L);
		articleSearchDto.setHearts(200L);
		Boolean aBoolean = articleSearchService.saveOrUpdate(articleSearchDto);
		System.out.println(aBoolean);
	}

	@Test
	public void demo4() {
		Iterable<ArticleSearchDto> all = articleSearchDao.findAll();
		for (ArticleSearchDto articleSearchDto : all) {
			System.err.println(articleSearchDto);
		}

	}

	@Test
	public void demo5() {
		Article article = new Article();
		article.setId(33L);
		article.setTitle("测试的文章");
		article.setSummary("测试文章的摘要");
		ArticleSearchDto articleSearchDto = new ArticleSearchDto();
		BeanUtils.copyProperties(article, articleSearchDto);
		System.out.println(articleSearchDto);
	}
	 @Test
	 public void demo6() throws IOException {
		 Map<String, Object> stringObjectMap = null;
		 FileOutputStream fileOutputStream = new FileOutputStream(new File("D:\\aa\\a.jpg"));
		 BufferedImage codePic = (BufferedImage) stringObjectMap.get("codePic");
		 ImageIO.write(codePic, "jpg", fileOutputStream);
//    fileOutputStream.write(stringObjectMap.get("codePic"));
		 System.out.println(stringObjectMap);
	 }

}

