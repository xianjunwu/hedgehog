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
	@NotBlank(message = "用户名不能为空")
	@ApiModelProperty("用户名")
	private String userName;

	/**
	 * 密码
	 */
	@JsonIgnore
	@NotBlank(message = "密码不能为空")
	private String password;

	/**
	 * 邮箱
	 */
	@Email(message = "邮箱格式不正确")
	@ApiModelProperty("邮箱")
	private String userEmail;


}
