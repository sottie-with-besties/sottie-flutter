const devServerIp = 'http://15.165.99.45:8080/';
const productionServerIp = '';

enum _RepositoryEnvironment {
  dev,
  production,
}

final class _Repositories {}

_RepositoryEnvironment _repositoryEnvironment = _RepositoryEnvironment.dev;

final repositories = _Repositories();
