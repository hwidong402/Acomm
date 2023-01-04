package com.jav4.acomm;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
public class Crtest {
   private WebDriver driver;
   private WebElement element;
   private String url;
   public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
   public static String WEB_DRIVER_PATH = "src/main/webapp/resources/chromedriver.exe";
   public Crtest() {
      // WebDriver 경로 설정
      System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
      // WebDriver 옵션 설정
      ChromeOptions options = new ChromeOptions();
      options.addArguments("--disable-popup-blocking");
      driver = new ChromeDriver(options);
      url = "https://www.melon.com/chart/index.htm";
   }
   public void activateBot() {
      try {
         driver.get(url);
         Thread.sleep(2000);
         // 곡 제목 파싱
         element = driver.findElement(By.xpath("/html/body/div/div[3]/div/div/div[3]/form/div/table/tbody/tr[1]/td[6]/div/div/div[1]/span/a"));
         String title = element.getText();
         // 좋아요 수 파싱
         element = driver.findElement(By.xpath("/html/body/div/div[3]/div/div/div[3]/form/div/table/tbody/tr[1]/td[8]/div/button/span[2]"));
         String cntLike = element.getText();
         System.out.println("1위 노래는 [" + title + "]입니다.");
         System.out.println("좋아요 수는 [" + cntLike + "]입니다.");
      } catch (Exception e) {
         e.printStackTrace();
      }
         finally {
            driver.close();
         }
   }
   public static void main(String[] args) {
      Crtest bot1 = new Crtest();
      bot1.activateBot();
   }
}