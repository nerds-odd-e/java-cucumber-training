package cucumber.driver;

public interface UiElement {
    void sendKeys(String keys);
    String getText();
    void click();
}
