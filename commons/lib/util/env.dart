class EnvApp {
  static const appName = String.fromEnvironment('DEFINE_APP_NAME');
  static const suffixName = String.fromEnvironment('DEFINE_SUFFIX_NAME',defaultValue: 'prod');
  static const baseApi = String.fromEnvironment('DEFINE_BASE_API',defaultValue: "https://api-meu-nogocio.herokuapp.com/"  );
  static const baseServer = String.fromEnvironment('DEFINE_SERVER');
}