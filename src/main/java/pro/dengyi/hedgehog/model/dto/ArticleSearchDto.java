package pro.dengyi.hedgehog.model.dto;

import java.time.LocalDateTime;
import lombok.Data;
import lombok.ToString;
import org.apache.solr.client.solrj.beans.Field;
import org.springframework.data.solr.core.mapping.SolrDocument;

/**
 * 文章搜索dto数据传输实体
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-06-08 21:57
 */
@Data
@ToString
@SolrDocument(collection = "hedgehog")
public class ArticleSearchDto {

  @Field
  private Long id;

  /**
   * 文章标题
   */
  @Field("text_ik")

  private String title;

  /**
   * 文章摘要
   */
  @Field
  private String summary;

  /**
   * 文章访问量
   */
  @Field
  private Long views;

  /**
   * 喜欢数
   */
  @Field
  private Long hearts;

  @Field
  private LocalDateTime createTime;
}
