{ lib
, buildPythonPackage
, fetchPypi
, ecdsa
}:

buildPythonPackage rec {
  pname = "tlslite-ng";
  version = "0.8.0-alpha43";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-CCVVR9LNkHGvEhq07V+XaHDl9S8cmwsR2WdT7FwPLAA=";
  };

  buildInputs = [ ecdsa ];

  meta = with lib; {
    description = "Pure python implementation of SSL and TLS.";
    homepage = "https://pypi.python.org/pypi/tlslite-ng";
    license = licenses.lgpl2;
    maintainers = [ maintainers.erictapen ];
  };

}
