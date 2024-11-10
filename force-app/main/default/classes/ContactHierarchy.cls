public class ContactHierarchy {
  public List<Contact> Root = new List<Contact>();
  public ContactHierarchy(ApexPages.StandardController controller) {
  }
  /* Wrapper class to contain the nodes and their children*/
  public class childNodes {
    public Contact gparent { get; set; }
    public List<Contact> parentLst { get; set; }
    public Map<ID, List<Contact>> childMap { get; set; }
    public Map<ID, List<Contact>> allchildMap { get; set; }
    public childNodes(
      Contact gp,
      List<Contact> p,
      Map<ID, List<Contact>> c,
      Map<ID, List<Contact>> gc
    ) {
      parentLst = p;
      gparent = gp;
      childMap = c;
      allchildMap = gc;
    }
  }
  public List<childNodes> hierarchy;
  public List<childNodes> getmainnodes() {
    hierarchy = new List<childNodes>();
    map<Id, list<Contact>> contactMap = new Map<Id, list<Contact>>();
    List<Contact> tempparent = [
      SELECT Id, FirstName, LastName, ReportsToId
      FROM Contact
      ORDER BY CreatedDate
    ];
    for (Contact c : tempparent) {
      if (c.ReportsToId != null) {
        root.add(c);
      }
    }
    for (Contact c : tempparent) {
      if (c.ReportsToId != null) {
        if (!contactMap.containskey(c.ReportsToId)) {
          List<Contact> conlist = new List<Contact>();
          conlist.add(c);
          contactMap.put(c.ReportsToId, conlist);
        }
      }
    }
    integer i = 0;
    Map<id, List<Contact>> contactMap1 = new Map<id, List<Contact>>();
    Set<Contact> Con_list = new Set<Contact>();
    for (id ids : contactMap.keyset())
      Con_list.addall(contactMap.get(ids));
    for (contact con : Con_list) {
      if (contactMap.containskey(con.id)) {
        contactMap1.put(con.id, contactMap.get(con.id));
      }
    }
    Map<ID, List<Contact>> icon_map = new Map<ID, List<Contact>>();
    for (Contact cont : root) {
      List<contact> parnt = contactMap.get(cont.id);
      if (parnt != null) {
        for (contact ccd : parnt) {
          List<Contact> icon = new List<Contact>();
          icon = contactMap1.get(ccd.id);
          if (icon != null && icon.size() > 0)
            icon_map.put(ccd.id, icon);
        }
      }
      hierarchy.add(new childNodes(CONT, parnt, icon_map, contactMap1));
      i++;
    }
    return hierarchy;
  }
}
