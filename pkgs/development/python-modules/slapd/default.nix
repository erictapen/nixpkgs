{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,
  fetchpatch,
  poetry-core,
  openldap,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "slapd";
  version = "0.1.4";
  pyproject = true;

  disabled = pythonOlder "3.8";

  # Pypi tarball doesn't include tests/
  src = fetchFromGitHub {
    owner = "python-ldap";
    repo = "python-slapd";
    rev = "refs/tags/${version}";
    hash = "sha256-C0nIZfDtVnIS2E2j+D5KDi80Ql7Oq82jK6BsxdFHYJ8=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/python-ldap/python-slapd/commit/ab0c6bbb836048fc0cc1717723a675c2970410cd.patch";
      hash = "sha256-xg4c7iIonkUmNN74q/UeGSuYP3to7q4cLW6+TMW9nh4=";
    })
  ];

  build-system = [ poetry-core ];

  nativeCheckInputs = [ pytestCheckHook ];

  preCheck = ''
    # Needed by tests to setup a mockup ldap server
    export BIN="${openldap}/bin"
    export SBIN="${openldap}/bin"
    export SLAPD="${openldap}/libexec/slapd"
    export SCHEMA="${openldap}/etc/schema"
  '';

  pythonImportsCheck = [ "slapd" ];

  meta = with lib; {
    description = "Controls a slapd process in a pythonic way";
    homepage = "https://github.com/python-ldap/python-slapd";
    changelog = "https://github.com/python-ldap/python-slapd/blob/${src.rev}/CHANGES.rst";
    license = licenses.mit;
    maintainers = with maintainers; [ erictapen ];
  };

}
