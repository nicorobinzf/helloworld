global class AccountBatch implements Database.Batchable<sObject> {
  private String accountName;

  public AccountBatch(String accountName) {
    this.accountName = accountName;
  }

  global Database.QueryLocator start(Database.BatchableContext BC) {
    return Database.getQueryLocator('SELECT Id FROM Account LIMIT 1');
    // 空のQueryでも可（新規作成のため）
  }

  global void execute(Database.BatchableContext BC, List<sObject> scope) {
    List<Account> accounts = new List<Account>();
    Account newAcc = new Account(Name = accountName);
    accounts.add(newAcc);
    insert accounts;
  }

  global void finish(Database.BatchableContext BC) {
    System.debug('Batch Job Finished');
  }
}
