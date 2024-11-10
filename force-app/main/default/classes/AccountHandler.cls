public class AccountHandler {
  public static boolean isFromPage = true;
  public void beforeUpdate() {
    system.debug('isFromPage=' + isFromPage);
  }
}
