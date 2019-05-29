package pro.dengyi.hedgehog.base;

import lombok.Data;

import java.io.Serializable;

/**
 * 基础响应类
 *
 * @author Bruce
 * @date 2018/9/23 20:18
 */
@Data
public class BaseResult implements Serializable {

    private static final long serialVersionUID = -5003879251992191601L;

    /**
     * 执行状态
     *
     * 为什么使用string类型返回执行状态？因为为了兼容zui的datagrid
     */
    public String result;
    /**
     * 信息
     */
    public String message;


}
