package pro.dengyi.hedgehog.config;

import org.apache.solr.client.solrj.SolrClient;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.solr.core.SolrTemplate;

/**
 *搜索引擎配置
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-08 21:37
 */
@Configuration
public class SolrConfig {

	@Bean
	public SolrTemplate solrTemplate(SolrClient solrClient) {
		return new SolrTemplate(solrClient);
	}

}
