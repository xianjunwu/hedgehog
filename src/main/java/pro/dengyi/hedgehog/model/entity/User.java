package pro.dengyi.hedgehog.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import pro.dengyi.hedgehog.base.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import java.io.Serializable;

/**
 * 用户实体
 *
 * @author Bruce
 * @date 2018/9/23 20:09
 */
@Data
@Entity
@Table(name = "t_user")
@EqualsAndHashCode
public class User extends BaseEntity implements Serializable {

	private static final long serialVersionUID = -5144055068797033748L;

	/**
	 * 用户id
	 */
	@Id
	@GeneratedValue
	@ApiModelProperty("id")
	private Long id;

	/**
	 * 用户名
	 */
	@NotBlank(message = "手机号不能为空")
	@ApiModelProperty("用户名")
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
	@ApiModelProperty("邮箱")
	private String userEmail;

}
