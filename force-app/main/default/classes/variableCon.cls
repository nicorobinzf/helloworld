/*** Controller ***/
public class variableCon {
  Contact contact;

  public Contact getContact() {
    if (contact == null) {
      contact = [
        SELECT LastName
        FROM Contact
        WHERE id = :ApexPages.currentPage().getParameters().get('id')
      ];
    }
    return contact;
  }
}
