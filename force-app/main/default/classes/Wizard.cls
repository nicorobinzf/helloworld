public class Wizard {
  public List<account> acc { get; set; }
  public Wizard(ApexPages.StandardController controller) {
    acc = [SELECT phone FROM Account WHERE name = :new1];
  }

  public String new1 { get; set; }

  public pageReference nextPage() {
    PageReference page1 = new PageReference('/apex/Page2');
    page1.setRedirect(true);
    return page1;
  }
}
