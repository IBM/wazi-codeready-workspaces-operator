#
# Copyright IBM Corporation 2021
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   IBM Corporation - implementation
#

# Version 4.8.0 requires login to registry.redhat.io
FROM registry.redhat.io/openshift4/ose-operator-registry@sha256:445f522039fac7d626353b894264d7bce540afa80fdcdda1fe79d8acaa15d94c AS builder

FROM registry.redhat.io/ubi8/ubi-minimal

# Build Arguments
ARG PRODUCT_VERSION=1.4.0

ENV PRODUCT="IBM Wazi Developer for Red Hat CodeReady Workspaces" \
    COMPANY="IBM" \
    VERSION=$PRODUCT_VERSION \
    RELEASE="1" \
    SUMMARY="IBM Wazi Developer for Workspaces" \
    DESCRIPTION="IBM Wazi Developer for Red Hat CodeReady Workspaces - Operator" \
    PRODNAME="wazi-codeready-workspaces" \
    COMPNAME="wazi-codeready-operator" \
    PRODTAG="ibm-wazi-developer-for-workspaces-catalog"

LABEL name="$PRODUCT" \
      vendor="$COMPANY" \
      version="$VERSION" \
      release="$RELEASE" \
      license="EPLv2" \
      summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="$SUMMARY" \
      io.openshift.tags="$PRODNAME,$COMPNAME,$PRODTAG,$COMPANY" \
      com.redhat.component="$PRODTAG" \
      io.openshift.expose-services="" \
      productName="$PRODUCT" \
      productVersion="$VERSION" \
      operators.operatorframework.io.index.database.v1=/database/index.db

RUN microdnf update -y && \
    microdnf clean all

RUN mkdir -p /registry && \
    chgrp -R 0 /registry && \
    chmod -R g+rwx /registry

COPY LICENSE /licenses/
COPY deploy/olm-catalog/bundles.db /database/index.db
COPY --from=builder /bin/registry-server /bin/registry-server
COPY --from=builder /bin/grpc_health_probe /bin/grpc_health_probe

WORKDIR /registry

EXPOSE 50051
USER 1001

ENTRYPOINT ["/bin/registry-server"]
CMD ["--database", "/database/index.db", "--termination-log=log.txt"]
