class Environment {
  static String getEnvFileName() {
    const env = String.fromEnvironment('FLAVOR', defaultValue: 'dev');

    switch (env) {
      case 'prod':
        return '.env.prod';
      case 'staging':
        return '.env.staging';
      case 'dev':
      default:
        return '.env';
    }
  }
}
