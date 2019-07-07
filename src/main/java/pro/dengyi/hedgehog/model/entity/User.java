package pro.dengyi.hedgehog.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;
import pro.dengyi.hedgehog.base.BaseEntity;

/**
 * 用户实体
 *
 * @author Bruce
 * @date 2018/9/23 20:09
 */
@Data
@Entity
@Table(name = "t_user")
public class User extends BaseEntity {

  /**
   * 用户名
   */
  @NotBlank(message = "手机号不能为空")
  private String phoneNumber;

  @NotBlank(message = "昵称不能为空")
  private String nickName;
  /**
   * 密码
   */
  @NotBlank(message = "密码不能为空")
  @JsonIgnore
  private String password;
  /**
   * 邮箱
   */
  @Email(message = "邮箱格式不正确")
  private String userEmail;


}
