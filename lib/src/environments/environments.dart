class Environments {
  static const String baseURL = String.fromEnvironment(
    'my-json-server',
    defaultValue:
        'https://my-json-server.typicode.com/Adrianogba/desafio-flutter/',
  );

  static const String purchases = String.fromEnvironment(
    'purchases',
    defaultValue: 'purchases/',
  );

  static const String clientInfo = String.fromEnvironment(
    'client-info',
    defaultValue: 'client_info/',
  );
}
