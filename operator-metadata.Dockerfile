# Copyright (c) 2020 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Red Hat, Inc. - initial API and implementation
#

# metadata images built in brew must be from scratch
# https://docs.engineering.redhat.com/display/CFC/Migration
FROM scratch

# not applicable to Che, only needed for CRW
COPY manifests /manifests/
COPY metadata/annotations.yaml /metadata/annotations.yaml

# support use of openJ9 images for Z and P? 
# might not be possible - see https://docs.engineering.redhat.com/display/CFC/Digest_Pinning - "OSBS does not support pinning to platform-specific digests"
# COPY ./build/scripts/swap_images.sh /tmp
# RUN if [[ "$(uname -m)" != "x86_64" ]] ; then /tmp/swap_images.sh /manifests/codeready-workspaces.csv.yaml; fi; rm -fr /tmp/swap_images.sh

# append Brew metadata here (it will be appended via https://github.com/redhat-developer/codeready-workspaces-operator/blob/master/operator-metadata.Jenkinsfile)
