package pro.dengyi.hedgehog.utils;

import lombok.extern.slf4j.Slf4j;
import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

/**
 *拼音工具类
 *
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-29 12:11
 */
@Slf4j
public class PinYinUtil {
	/**
	 * 获取拼音字符串
	 *
	 * @param chinese 中文
	 * @return java.lang.String
	 * @author 邓艺
	 * @date 2019/5/29 12:14
	 */
	public static String getPinYin(String chinese) {
		StringBuilder pybf = new StringBuilder();
		char[] arr = chinese.toCharArray();
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
		defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		for (char c : arr) {
			if (c > 128) {
				try {
					pybf.append(PinyinHelper.toHanyuPinyinStringArray(c, defaultFormat)[0]);
				} catch (BadHanyuPinyinOutputFormatCombination e) {
					e.printStackTrace();
				}
			} else {
				pybf.append(c);
			}
		}
		return pybf.toString();
	}

}
