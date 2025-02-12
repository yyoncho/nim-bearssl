## Nim-BearSSL
## Copyright (c) 2018-2021 Status Research & Development GmbH
## Licensed under either of
##  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE))
##  * MIT license ([LICENSE-MIT](LICENSE-MIT))
## at your option.
## This file may not be copied, modified, or distributed except according to
## those terms.

## This module provides access to Mozilla's CA certificate store in PEM format.
## This certificate store was downloaded from
## https://curl.haxx.se/ca/cacert.pem
## And converted to C header using ``brssl ta cacert.pem > cacert.h``.

import ./csources
from ./bearssl_x509 import X509TrustAnchor

{.passc: "-I" & bearPath & "../certs/".}

var MozillaTrustAnchors* {.
    importc: "TAs", header: "cacert20210119.h".}: array[129, X509TrustAnchor]
var MozillaTrustAnchorsCount* {.
    importc: "TAs_NUM", header: "cacert20210119.h".}: cint
