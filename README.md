[![Build Status](https://travis-ci.com/IBM/wazi-codeready-workspaces-operator.svg?branch=main)](https://travis-ci.com/IBM/wazi-codeready-workspaces-operator)
[![Release](https://img.shields.io/github/release/IBM/wazi-codeready-workspaces-operator.svg)](../../releases/latest)
[![License](https://img.shields.io/github/license/IBM/wazi-codeready-workspaces-operator)](LICENSE)
[![DockerHub](https://img.shields.io/badge/DockerHub-Operator-blue?color=3498db)](https://hub.docker.com/repository/docker/ibmcom/wazi-code-operator-catalog)
[![Documentation](https://img.shields.io/badge/Documentation-blue?color=1f618d)](https://ibm.biz/wazi-crw-doc)

## What's inside?

This repository contains a Docker image that packages all the operator lifecycle manager dependencies for installing IBM Wazi Developer for Red Hat CodeReady Workspaces (IBM Wazi Developer for Workspaces). This operator is installed into a Red Hat OpenShift Container Platform for a cluster administrator to manage. Once an instance is deployed into a cluster, then a user can use a browser to access IBM Wazi Developer for Workspaces.

This repository is based off of the upstream [Red Hat CodeReady for Workspaces Operator](https://github.com/redhat-developer/codeready-workspaces-operator), whose code is in another upstream [Eclipse Che Operator](https://github.com/eclipse/che-operator/) repository. Repositories gathered together downstream are all brought together into a [Red Hat CodeReady Workspaces Images](https://github.com/redhat-developer/codeready-workspaces-images) repository, where the generated output is located in the respective branch for each version.
  
## IBM Wazi Developer for Workspaces

IBM Wazi Developer for Workspaces is a component shipped with either IBM Wazi Developer for Red Hat CodeReady Workspaces (Wazi Developer for Workspaces) or IBM Developer for z/OS Enterprise Edition (IDzEE).

IBM Wazi Developer for Workspaces provides a modern experience for mainframe software developers working with z/OS applications in the cloud. Powered by the open source projects Zowe and Red Hat CodeReady Workspaces, IBM Wazi Developer for Workspaces offers an easy, streamlined onboarding process to provide mainframe developers the tools they need. Using container technology, IBM Wazi Developer for Workspaces brings the necessary tools to the task at hand.

For more benefits of IBM Wazi Developer for Workspaces, see the [IBM Wazi Developer product page](https://www.ibm.com/products/wazi-developer) or [IDzEE product page](https://www.ibm.com/products/developer-for-zos).

## Details

IBM Wazi Developer for Workspaces provides a custom stack with the all-in-one mainframe development package that enables mainframe developers to:

- Use a modern mainframe editor with rich language support for COBOL, JCL, Assembler (HLASM), and PL/I, which provides language-specific features such as syntax highlighting, outline view, declaration hovering, code completion, snippets, a preview of copybooks, copybook navigation, and basic refactoring using IBM Z Open Editor, a component of IBM Wazi Developer for VS Code
- Integrate with any flavor of Git source code management (SCM)
- Perform a user build with IBM Dependency Based Build for any flavor of Git
- Work with z/OS resources such as MVS, UNIX files, and JES jobs
- Connect to the Z host with z/OSMF or IBM Remote System Explorer (RSE) API, using Zowe Explorer plus IBM Z Open Editor for a graphical user interface and Zowe CLI plus the RSE API plug-in for Zowe CLI for command line access
- Debug COBOL and PL/I applications using IBM Z Open Debug
- Use a mainframe development package with a custom plug-in and devfile registry support from the [IBM Wazi Developer stack](https://github.com/IBM/wazi-codeready-workspaces)

## Documentation

For details of the features for IBM Wazi Developer for Workspaces, see its [official documentation](https://ibm.biz/wazi-crw-doc).

| Repository | Description |
| --- | --- |
| [IBM Wazi Developer for Workspaces](https://github.com/ibm/wazi-codeready-workspaces) |  The devfile and plug-in registries |
| [IBM Wazi Developer for Workspaces Sidecars](https://github.com/ibm/wazi-codeready-workspaces-sidecars) | Supporting resources for the Wazi Developer plug-ins |
| [IBM Wazi Developer for Workspaces Operator](https://github.com/ibm/wazi-codeready-workspaces-operator) | Deployment using the Operator Lifecycle Manager |

## Feedback
  
We would love to hear feedback from you about IBM Wazi Developer for Workspaces.  
File an issue or provide feedback here: [IBM Wazi Developer for Workspaces Issues](https://github.com/IBM/wazi-codeready-workspaces/issues)

---
  
## Reference: Red Hat content

### Building CRW Operator and Metadata containers

#### Operator container

- The CRW operator has most of code in the upstream [che-operator](https://github.com/eclipse-che/che-operator/) repo, including this [Dockerfile](https://github.com/eclipse-che/che-operator/blob/master/Dockerfile).

- This code is then synced to the [downstream repo](http://pkgs.devel.redhat.com/cgit/containers/codeready-workspaces-operator/?h=crw-2-rhel-8) via a job located here:

  - https://main-jenkins-csb-crwqe.apps.ocp4.prod.psi.redhat.com/job/CRW_CI/ (jobs)
  - https://gitlab.cee.redhat.com/codeready-workspaces/crw-jenkins/-/tree/master/jobs/CRW_CI (sources)
  - https://github.com/redhat-developer/codeready-workspaces-images#jenkins-jobs (copied sources)

The Jenkinsfile transforms the Che code into CRW code and commits the changed code directly to downstream so there's no need for a branch in che-operator or to have code duplicated here. 

| | |
| --- | --- |
| **NOTE** | The job can be configured to sync from any upstream che-operator branch, eg., `SOURCE_BRANCH` = `7.26.x` or `master`. |

- Once the sync is done:

  - the [codeready-workspaces-operator](http://pkgs.devel.redhat.com/cgit/containers/codeready-workspaces-operator/?h=crw-2-rhel-8) repo is updated;

  - a Brew build will be triggered via **get-sources-rhpkg-container-build** job

  - and, if successful, the Brew build will be copied to Quay as `https://quay.io/crw/crw-2-rhel8-operator`.

#### Metadata container

- Metadata for the CRW operator is contained in this repo. See [manifests](https://github.com/redhat-developer/codeready-workspaces-operator/tree/master/manifests), [metadata](https://github.com/redhat-developer/codeready-workspaces-operator/tree/master/metadata) and [deploy](https://github.com/redhat-developer/codeready-workspaces-operator/tree/master/deploy) folders, and this [operator-metadata.Dockerfile](https://github.com/redhat-developer/codeready-workspaces-operator/blob/master/operator-metadata.Dockerfile).

- The metadata is then synced to the [downstream repo](http://pkgs.devel.redhat.com/cgit/containers/codeready-workspaces-operator-metadata/?h=crw-2-rhel-8) via a job located here:

  - https://main-jenkins-csb-crwqe.apps.ocp4.prod.psi.redhat.com/job/CRW_CI/ (jobs)
  - https://gitlab.cee.redhat.com/codeready-workspaces/crw-jenkins/-/tree/master/jobs/CRW_CI (sources)
  - https://github.com/redhat-developer/codeready-workspaces-images#jenkins-jobs (copied sources)

| | |
| --- | --- |
| **NOTE** | The job can be configured to sync from any upstream che-operator branch, eg., `SOURCE_BRANCH` = `7.26.x` or `master`. |

- Once the sync is done:

  - the [codeready-workspaces-operator-metadata](http://pkgs.devel.redhat.com/cgit/containers/codeready-workspaces-operator-metadata/?h=crw-2-rhel-8) repo is updated;

  - a Brew build will be triggered via **get-sources-rhpkg-container-build** job

  - and, if successful, the Brew build will be copied to Quay] as `https://quay.io/crw/crw-2-rhel8-operator-metadata`.

#### crwctl CLI binary

* Once the operator and metadata is rebuilt, a new build of [crwctl](https://github.com/redhat-developer/codeready-workspaces-chectl) is triggered.

* This is triggered because the CRW operator-metadata's [deploy folder](https://github.com/redhat-developer/codeready-workspaces-operator/tree/master/deploy) is used in crwctl to do deployment when there is no OLM present on the target cluster (OCP 3.11 and 4.1).

See crwctl job located here:

  - https://main-jenkins-csb-crwqe.apps.ocp4.prod.psi.redhat.com/job/CRW_CI/ (jobs)
  - https://gitlab.cee.redhat.com/codeready-workspaces/crw-jenkins/-/tree/master/jobs/CRW_CI (sources)
  - https://github.com/redhat-developer/codeready-workspaces-images#jenkins-jobs (copied sources)
