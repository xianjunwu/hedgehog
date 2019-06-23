package pro.dengyi.hedgehog.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import lombok.extern.slf4j.Slf4j;

/**
 * 验证码工具类
 *
 * @author 邓艺
 * @version v1.0
 * @date 2019-05-19 16:15
 */
@Slf4j
public class VerificationCodeUtil {

  /**
   * 图片的宽度
   */
  private static final int PIC_WIDTH = 90;
  /**
   * 图片的高度
   */
  private static final int PIC_HEIGHT = 32;
  /**
   * 定义图片上显示验证码的个数
   */
  private static final int CODE_COUNT = 4;
  /**
   * 验证码字体高度
   */
  private static final int FONT_HEIGHT = 18;

  /**
   * 干扰线条数,太多图片看不清
   */
  private static final int INTERFERENCE_LINE_NUMBER = 13;

  /**
   * 字符间隔
   */
  private static final int CHARACTER_INTERVAL = 15;

  /**
   * 字体高度
   */
  private static final int CHARACTER_HEIGHT = 22;

  /**
   * 验证码可以包含字符数组,出去一些容易误解的字符
   */
  private static String[] codeSequence = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
      "L",
      "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f",
      "g", "h", "i", "j", "k",
      "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4",
      "5", "6", "7", "8", "9"};


  public static Map<String, Object> generateCodeAndPic() {
    Map<String, Object> map = new HashMap<>(2);
    // 定义图像buffer
    BufferedImage buffImg = new BufferedImage(PIC_WIDTH, PIC_HEIGHT, BufferedImage.TYPE_INT_RGB);
    StringBuilder stringBuilder = new StringBuilder(CODE_COUNT);
    Graphics graphics = buffImg.getGraphics();
    // 将图像填充为白色
    graphics.setColor(Color.WHITE);
    graphics.fillRect(0, 0, PIC_WIDTH, PIC_HEIGHT);
    // 定义字体
    Font font = new Font("Fixedsys", Font.BOLD, FONT_HEIGHT);
    // 设置字体。
    graphics.setFont(font);
    // 画边框。
    graphics.setColor(Color.BLACK);
    graphics.drawRect(0, 0, PIC_WIDTH - 1, PIC_HEIGHT - 1);
    // 随机产生40条干扰线，使图象中的认证码不易被其它程序探测到。
    graphics.setColor(Color.BLACK);
    // 创建一个随机数生成器类
    Random random = new Random();
    for (int i = 0; i < INTERFERENCE_LINE_NUMBER; i++) {
      int startx = random.nextInt(PIC_WIDTH);
      int starty = random.nextInt(PIC_HEIGHT);
      int endx = random.nextInt(12);
      int endy = random.nextInt(12);
      graphics.drawLine(startx, starty, endx, endy);
    }
    int red = 0, green = 0, blue = 0;
    // 产生验证码
    for (int i = 0; i < CODE_COUNT; i++) {
      String code = codeSequence[random.nextInt(codeSequence.length)];
      // 产生文字颜色
      red = random.nextInt(255);
      green = random.nextInt(255);
      blue = random.nextInt(255);
      graphics.setColor(new Color(red, green, blue));
      graphics.drawString(code, (i + 1) * CHARACTER_INTERVAL, CHARACTER_HEIGHT);
      stringBuilder.append(code);
    }
    //存放验证码
    map.put("codeNumber", stringBuilder.toString());
    //存放生成的验证码BufferedImage对象
    map.put("codePic", buffImg);
    return map;

  }


}
