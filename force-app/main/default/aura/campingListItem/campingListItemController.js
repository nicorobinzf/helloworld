({
  packItem: function (component, event, helper) {
    component.set("v.item.Packed__c", "true");
    var btn = event.getSource();
    btn.set("v.disabled", "true");
  }
});
