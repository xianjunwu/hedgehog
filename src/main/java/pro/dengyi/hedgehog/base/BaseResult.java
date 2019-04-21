package pro.dengyi.hedgehog.base;

import lombok.Data;

import java.io.Serializable;

/**
 * 项目标准数据传输实体类
 *
 * @author Bruce
 * @date 2018/9/23 20:18
 */
@Data
public class BaseResult<T> implements Serializable {

    private static final long serialVersionUID = -5003879251992191601L;

    /**
     * 执行状态
     */
    private Boolean status = true;
    /**
     * 信息
     */
    private String message;
    /**
     * 结果
     */
    private T data;

}
