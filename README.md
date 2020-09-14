[![Build Status](https://travis-ci.com/IBM/wazi-codeready-workspaces-operator.svg?branch=main)](https://travis-ci.com/IBM/wazi-codeready-workspaces-operator)
[![Release](https://img.shields.io/github/release/IBM/wazi-codeready-workspaces-operator.svg)](../../releases/latest)
[![License](https://img.shields.io/github/license/IBM/wazi-codeready-workspaces-operator)](LICENSE)
[![DockerHub](https://img.shields.io/badge/DockerHub-Operator-blue?color=3498db)](https://hub.docker.com/repository/docker/ibmcom/wazi-code-operator-catalog)
[![Knowledge Center](https://img.shields.io/badge/Knowledge%20Center-blue?color=1f618d)](https://www.ibm.com/support/knowledgecenter/SSCH39)

## What's inside?
  
A Docker image that packages all the operator lifecycle manager dependencies for installing the IBM Wazi Developer for Red Hat CodeReady Workspaces (IBM Wazi Developer for Workspaces). This operator is installed into a Red Hat OpenShift Container Platform for a cluster administrator to manage. Once an instance is deployed into a cluster, then a user can use a browser to access the IBM Wazi Developer for Workspaces.
  
## Documentation
  
Documentation can be found here for [IBM Wazi Developer for Workspaces](https://www.ibm.com/support/knowledgecenter/SSCH39)  
  
* The [IBM Wazi Developer for Workspaces](https://github.com/ibm/wazi-codeready-workspaces) repository - provides the devfile and plug-in registries for the Red Hat CodeReady Workspaces.
* The [IBM Wazi Developer for Workspaces Sidecars](https://github.com/ibm/wazi-codeready-workspaces-sidecars) repository - provides the supporting resources for the devfile and plug-in registries.
* The [IBM Wazi Developer for Workspaces Operator](https://github.com/ibm/wazi-codeready-workspaces-operator) repository - provides the Operator Lifecycle Manager for deployment.
  
## Feadback
  
We would love to hear feedback from you about IBM Wazi Developer for Red Hat CodeReady Workspaces.  
File an issue or provide feedback here: [IBM Wazi Developer for Workspaces Issues](https://github.com/IBM/wazi-codeready-workspaces/issues)

## IBM&reg; Wazi Developer for Red Hat&reg; CodeReady Workspaces

IBM Wazi Developer for Red Hat CodeReady Workspaces (IBM Wazi Developer for Workspaces), delivers cloud-native developer experience, enabling development and testing of IBM z/OS application components in containerized, z/OS sandbox environment on Red Hat OpenShift Container Platform running on x86 hardware, and providing capability to deploy applications into production on native z/OS running on IBM Z hardware. IBM Wazi Developer is a development environment that provides an in-browser IDE with a single-click developer workspace with the capabilities to code, edit, build, and debug.  
  
IBM Wazi Developer for Workspaces is built on the Red Hat CodeReady Workspaces project. The core functionality for Red Hat CodeReady Workspaces is provided by an open-source project called Eclipse Che. IBM Wazi Developer for Workspaces uses Kubernetes and containers to provide your team with a consistent, secure, and zero-configuration development environment that interacts with your IBM Z platform.  
  
IBM Wazi Developer for Workspaces provides a modern experience for mainframe software developers working with z/OS applications in the cloud. Powered by the open-source projects Zowe and Red Hat CodeReady Workspaces, IBM Wazi Developer for Workspaces offers an easy, streamlined on-boarding process to provide mainframe developers the tools they need. Using container technology and stacks, IBM Wazi Developer for Workspaces brings the necessary technology to the task at hand.

## Features

IBM Wazi Developer for Workspaces provides a custom stack for mainframe developers with the all-in-one mainframe development package that includes the following capabilities:

- Modern mainframe editor with rich language support for COBOL, JCL, Assembler (HLASM), and PL/I that provide language-specific features such as syntax highlighting, outline view, declaration hovering, code completion, snippets, a preview of copybooks, copybook navigation, and basic refactoring using [IBM Z Open Editor](https://marketplace.visualstudio.com/items?itemName=IBM.zopeneditor)
- Source code management (SCM) integration to enable integration with any flavor of Git, a popular and modern parallel development SCM
- Intelligent build capability that enables developers to perform a user build with IBM Dependency Based Build for any flavor of Git
- Integrations that enable developers to work with z/OS resources such as MVS and UNIX files and JES jobs
- Connectivity to Z host using [Zowe Explorer](https://marketplace.visualstudio.com/items?itemName=Zowe.vscode-extension-for-zowe)
- Running user builds using [IBM Z User Build](https://www.ibm.com/support/knowledgecenter/SSCH39_1.0.0/com.ibm.wazi.development.client.doc/user_build_setup_run.html)
- Debugging COBOL and PL/I applications using [IBM Z Open Debug](https://developer.ibm.com/mainframe/2020/06/12/introducing-ibm-z-open-debug/)
- Interacting with the [IBM Remote System Explorer API](https://ibm.github.io/zopeneditor-about/Docs/interact_zos_overview.html)
- Mainframe Development package with custom plugin and devfile registry support using the [IBM Wazi Developer stack](https://github.com/IBM/wazi-codeready-workspaces)
  
Read our official documentation on the [IBM Knowledge Center](https://www.ibm.com/support/knowledgecenter/SSCH39) to learn more about IBM Wazi Developer. 

## Installing
Press the **Install** button, select the namespace, choose the update strategy, click the Subscribe button, and wait for the **Succeeded** Operator status.

When the operator is installed, create a new instance of the IBM Wazi Developer for Workspaces (click the **Create Instance** button).  

IBM Wazi Developer for Workspaces spec contains all defaults (see below).

You can start using the IBM Wazi Developer for Workspaces when the status is set to **Available**, and you see a URL.

### Defaults
By default, the operator deploys the IBM Wazi Developer for Workspaces with:

- Bundled PostgreSQL and Red Hat SSO
- Per-Workspace PVC strategy
- Auto-generated passwords
- HTTPS mode (secure routes)
- Built-in authentication ([RH-SSO](https://access.redhat.com/documentation/en-us/red_hat_codeready_workspaces/2.1/html/administration_guide/managing-users_crw#configuring-authorization_crw))

### Installation Options
IBM Wazi Developer operator installation options include:

- PVC strategy (per-workspace, common, unique)
- External Database and Red Hat SSO
- Self Signed Certificate and TLS Support
- Authentication Support

#### PVC strategy (per-workspace, common, unique)

Workspace Pods use Persistent Volume Claims (PVCs), which are bound to the physical Persistent Volumes (PVs). The way how CodeReady Workspaces server uses PVCs for workspaces is configurable, and it is called [PVC strategy](https://access.redhat.com/documentation/en-us/red_hat_codeready_workspaces/2.1/html/administration_guide/codeready-workspaces-architectural-elements#workspace-configuration_workspaces-architecture)

#### External Database and Red Hat SSO

To instruct the operator to skip deploying PostgreSQL and Red Hat SSO and connect to an existing DB and Red Hat SSO instead:

- set respective fields to `true` in the spec when creating an instance of the IBM Wazi Developer for Workspaces
- provide the operator with connection and authentication details:
  
  `externalDb: true`
  
  `chePostgresHostname: 'yourPostgresHost'`
  
  `chePostgresPort: '5432'`
  
  `chePostgresUser: 'myuser'`
  
  `chePostgresPassword: 'mypass'`
  
  `chePostgresDb: 'mydb'`
  
  `externalIdentityProvider: true`
  
  `identityProviderURL: 'https://my-rhsso.com'`
  
  `identityProviderRealm: 'myrealm'`
  
  `identityProviderClientId: 'myclient'`

#### Self Signed Certificate and TLS Support

To use IBM Wazi Developer for Workspaces with TLS enabled, an OpenShift router must use a signed certificate. A certificate signed by a public authority can automatically be fetched, however when the certificate is self-signed further configuration is required.
If using a self-signed certificate generated by the operator set the respective field to `true` (in the `server` block):
  
```
selfSignedCert: true
```

Issue the following command to manually inject a self-signed certificate:

```
oc create secret self-signed-certificate generic --from-file=/path/to/certificate/ca.crt -n=mynamespace
```

To activate TLS mode, set the respective field in the spec to `true` (in the `server` block):

```
tlsSupport: true
```

#### Authentication Support

[OpenShift&reg; OAuth](https://docs.openshift.com/container-platform/4.4/authentication/understanding-authentication.html) authentication support requires oAuth to be configured in the cluster. To enable OpenShift OAuth authentication set the respective field in the spec to `true` (in the `server` block):

```
openShiftoAuth: true
```
