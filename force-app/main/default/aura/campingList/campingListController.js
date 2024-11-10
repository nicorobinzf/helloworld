({
  clickCreateItem: function (component, event, helper) {
    var validCamping = component.find("Campingform").reduce(function (
      validSoFar,
      inputCmp
    ) {
      // Displays error messages for invalid fields
      inputCmp.showHelpMessageIfInvalid();
      return validSoFar && inputCmp.get("v.validity").valid;
    }, true);
    // If we pass error checking, do some real work
    if (validCamping) {
      // Create the new Camping
      var theCampings = component.get("v.items");
      var newCamping = component.get("v.newItem");
      theCampings.push(newCamping);
      component.set("v.items", theCampings);
      component.set("v.newItem", {
        sobjectType: "Camping_Item__c",
        Name: "",
        Quantity__c: 0,
        Price__c: 0,
        Packed__c: false
      });
      console.log("Create Camping: " + JSON.stringify(newCamping));

      helper.createItem(component, newCamping);
    }
  },
  doInit: function (component, event, helper) {
    // Create the action
    var action = component.get("c.getItems");
    // Add callback behavior for when response is received
    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.items", response.getReturnValue());
      } else {
        console.log("Failed with state: " + state);
      }
    });
    // Send action off to be executed
    $A.enqueueAction(action);
  }
});
