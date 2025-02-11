@RestResource(urlMapping='/batchAccountCreation/*')
global with sharing class AccountBatchRestAPI {
  @HttpPost
  global static String createAccountByBatch() {
    try {
      // リクエストボディのJSONを取得
      RestRequest req = RestContext.request;
      String requestBody = req.requestBody.toString();
      Map<String, Object> requestData = (Map<String, Object>) JSON.deserializeUntyped(
        requestBody
      );

      // 必須パラメータチェック
      if (
        !requestData.containsKey('accountName') ||
        String.isBlank((String) requestData.get('accountName'))
      ) {
        return '{"error": "Account Name is required"}';
      }

      String accountName = (String) requestData.get('accountName');

      // Batch Apex 実行
      Database.executeBatch(new AccountBatch(accountName));

      // 成功レスポンス
      return '{"message": "Batch Job Started"}';
    } catch (Exception e) {
      return '{"error": "' + e.getMessage() + '"}';
    }
  }
}
