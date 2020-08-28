#
# Copyright IBM Corporation 2020
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   IBM Corporation - implementation
#

# Builds an image that is used by the CatalogSource definition in OCP.

FROM quay.io/operator-framework/upstream-registry-builder:latest as builder
COPY controller-manifests manifests/
RUN ./bin/initializer --permissive true -o ./bundles.db

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

ENV PRODUCT="IBM Wazi for CodeReady Workspaces Development Client" \
    COMPANY="IBM" \
    VERSION="1.1.0" \
    RELEASE="1" \
    SUMMARY="IBM Wazi for CodeReady Workspaces Development Client" \
    DESCRIPTION="IBM Wazi for CodeReady Workspaces Development Client - CodeReady Operator Catalog"

RUN microdnf update -y && \
    microdnf clean all && \
    rm -rf /var/cache/yum && \
    mkdir /registry
    
WORKDIR /registry

RUN chgrp -R 0 /registry && \
    chmod -R g+rwx /registry
    
COPY LICENSE /licenses/
COPY --from=builder /build/bundles.db /bundles.db
COPY --from=builder /build/bin/registry-server /bin/registry-server
COPY --from=builder /bin/grpc_health_probe /bin/grpc_health_probe

USER 1001

EXPOSE 50051

ENTRYPOINT ["/bin/registry-server"]
CMD ["--database", "/bundles.db", "--termination-log=log.txt"]

LABEL name="$COMPANY-$PRODUCT" \
      vendor="$COMPANY" \
      version="$VERSION" \
      release="$RELEASE" \
      summary="$SUMMARY" \
      description="$DESCRIPTION"
