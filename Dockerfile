#
# Copyright IBM Corporation 2020 - 2021
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   IBM Corporation - implementation
#

FROM quay.io/operator-framework/upstream-registry-builder:v1.15.3 as builder

COPY manifests manifests/
COPY metadata metadata/
RUN ./bin/initializer --permissive true -o ./bundles.db

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Build Arguments
ARG PRODUCT_VERSION=1.2.5

ENV PRODUCT="IBM Wazi Developer for Red Hat CodeReady Workspaces" \
    COMPANY="IBM" \
    VERSION=$PRODUCT_VERSION \
    RELEASE="1" \
    SUMMARY="IBM Wazi Developer for Workspaces" \
    DESCRIPTION="IBM Wazi Developer for Red Hat CodeReady Workspaces - Operator" \
    PRODNAME="wazi-codeready-workspaces" \
    COMPNAME="wazi-codeready-operator" \
    PRODTAG="wazi-code-operator-catalog"

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
      usage="" \
      productName="$PRODUCT" \
      productVersion="$VERSION" \
      operators.operatorframework.io.bundle.mediatype.v1=registry+v1 \
      operators.operatorframework.io.bundle.manifests.v1=manifests/ \
      operators.operatorframework.io.bundle.metadata.v1=metadata/ \
      operators.operatorframework.io.bundle.package.v1=wazi-codeready-operator \
      operators.operatorframework.io.bundle.channels.v1=v1.2-wazi,v1.2-idzee,previous \
      operators.operatorframework.io.bundle.channel.default.v1=v1.2-wazi

RUN microdnf update -y && \
    microdnf clean all && \
    rm -rf /var/cache/yum && \
    mkdir /registry
    
WORKDIR /registry

RUN chgrp -R 0 /registry && \
    chmod -R g+rwx /registry
    
COPY LICENSE /licenses/
COPY --from=builder bundles.db /bundles.db
COPY --from=builder /bin/registry-server /bin/registry-server
COPY --from=builder /bin/grpc_health_probe /bin/grpc_health_probe

USER 1001

EXPOSE 50051

ENTRYPOINT ["/bin/registry-server"]
CMD ["--database", "/bundles.db", "--termination-log=log.txt"]
