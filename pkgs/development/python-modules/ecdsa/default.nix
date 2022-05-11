{ lib
, buildPythonPackage
, fetchPypi
, pkgs
, six
}:

buildPythonPackage rec {
  pname = "ecdsa";
  version = "0.18.0b2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-t6Kf3m0o9oF+QTZy7BMB3Qe93sak1ggRj+8eMtQxPDo=";
  };

  propagatedBuildInputs = [ six ];
  # Only needed for tests
  checkInputs = [ pkgs.openssl ];

  meta = with lib; {
    description = "ECDSA cryptographic signature library";
    homepage = "https://github.com/warner/python-ecdsa";
    license = licenses.mit;
  };

}
