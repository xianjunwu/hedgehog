package pro.dengyi.hedgehog.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *业务异常
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 12:17
 */
public class BusinessException extends RuntimeException {

	public BusinessException(String message) {
		super(message);
	}
}
