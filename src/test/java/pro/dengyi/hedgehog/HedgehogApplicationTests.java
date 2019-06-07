package pro.dengyi.hedgehog;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HedgehogApplicationTests {

  @Test
  public void contextLoads() {
    for (int i = 0; i < 100; i++) {
      System.out.println("111");
      say();
    }

  }

  @Async
  public void say(){
    for (int i = 0; i < 100; i++) {
      System.err.println("hello");
    }
  }

   @Test
   public void demo1(){
     LocalDate now = LocalDate.of(2019,6,6);
     Period between = Period.between( now,LocalDate.now());
     System.out.println(between.getDays());
   }
}

