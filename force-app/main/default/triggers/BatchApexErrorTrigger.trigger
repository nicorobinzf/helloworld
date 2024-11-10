trigger BatchApexErrorTrigger on BatchApexErrorEvent(after insert) {
  List<BatchLeadConvertErrors__c> blces = new List<BatchLeadConvertErrors__c>();
  BatchLeadConvertErrors__c blce;
  for (BatchApexErrorEvent baee : Trigger.new) {
    blce = new BatchLeadConvertErrors__c();
    blce.AsyncApexJobId__c = baee.AsyncApexJobId;
    blce.Records__c = baee.JobScope;
    blce.StackTrace__c = baee.StackTrace;
    blces.add(blce);
  }
  insert blces;

}
