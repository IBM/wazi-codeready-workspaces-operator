[![Build Status](https://travis-ci.com/IBM/wazi-codeready-workspaces-operator.svg?branch=main)](https://travis-ci.com/IBM/wazi-codeready-workspaces-operator)
[![Release](https://img.shields.io/github/release/IBM/wazi-codeready-workspaces-operator.svg)](../../releases/latest)
[![License](https://img.shields.io/github/license/IBM/wazi-codeready-workspaces-operator)](LICENSE)
[![DockerHub](https://img.shields.io/badge/DockerHub-Operator-blue?color=3498db)](https://hub.docker.com/repository/docker/ibmcom/wazi-code-operator-catalog)
[![Knowledge Center](https://img.shields.io/badge/Knowledge%20Center-blue?color=1f618d)](https://www.ibm.com/support/knowledgecenter/SSCH39)

## What's inside?
  
A Docker image that packages all the operator lifecycle manager dependencies for installing the IBM Wazi Developer for Red Hat CodeReady Workspaces (IBM Wazi Developer for Workspaces). This operator is installed into a Red Hat OpenShift Container Platform for a cluster administrator to manage. Once an instance is deployed into a cluster, then a user can use a browser to access the IBM Wazi Developer for Workspaces.

- This repository is based off of the upstream [Red Hat CodeReady for Workspaces Operator](https://github.com/redhat-developer/codeready-workspaces-operator), where the code is in another upstream [Eclipse Che Operator](https://github.com/eclipse/che-operator/) repository.
  
## Documentation
  
Documentation can be found here for [IBM Wazi Developer for Workspaces](https://www.ibm.com/support/knowledgecenter/SSCH39)  
  
* The [IBM Wazi Developer for Workspaces](https://github.com/ibm/wazi-codeready-workspaces) repository - provides the devfile and plug-in registries for the Red Hat CodeReady Workspaces.
* The [IBM Wazi Developer for Workspaces Sidecars](https://github.com/ibm/wazi-codeready-workspaces-sidecars) repository - provides the supporting resources for the devfile and plug-in registries.
* The [IBM Wazi Developer for Workspaces Operator](https://github.com/ibm/wazi-codeready-workspaces-operator) repository - provides the Operator Lifecycle Manager for deployment.
  
## Feadback
  
We would love to hear feedback from you about IBM Wazi Developer for Red Hat CodeReady Workspaces.  
File an issue or provide feedback here: [IBM Wazi Developer for Workspaces Issues](https://github.com/IBM/wazi-codeready-workspaces/issues)

## IBM Wazi Developer for Red Hat CodeReady Workspaces
IBM Wazi Developer for Red Hat CodeReady Workspaces (IBM Wazi Developer) is a single integrated solution, which delivers a cloud native development experience for z/OS. It enables application developers to develop and test z/OS application components in a virtual z/OS environment on an OpenShift®-powered hybrid multicloud platform, and to use an industry standard integrated development environment (IDE) of their choice. 
  
IBM Wazi Developer for Workspaces, a component of IBM Wazi Developer, is built on the Red Hat CodeReady Workspaces project. The core functionality for Red Hat CodeReady Workspaces is provided by an open-source project called Eclipse Che. IBM Wazi Developer for Workspaces uses Kubernetes and containers to provide your team with a consistent, secure, and zero-configuration development environment that interacts with your IBM Z platform.  
  
IBM Wazi Developer for Workspaces provides a modern experience for mainframe software developers working with z/OS applications in the cloud. Powered by the open-source projects Zowe and Red Hat CodeReady Workspaces, IBM Wazi Developer for Workspaces offers an easy, streamlined onboarding process to provide mainframe developers the tools they need. Using container technology and stacks, IBM Wazi Developer for Workspaces brings the necessary technology to the task at hand.

### Details
IBM Wazi Developer for Workspaces provides a custom stack for mainframe developers with the all-in-one mainframe development package that includes the following capabilities:

- Modern mainframe editor with rich language support for COBOL, JCL, Assembler (HLASM), and PL/I, which provides language-specific features such as syntax highlighting, outline view, declaration hovering, code completion, snippets, a preview of copybooks, copybook navigation, and basic refactoring using [IBM Z Open Editor](https://marketplace.visualstudio.com/items?itemName=IBM.zopeneditor)
- Source code management (SCM) integration to enable integration with any flavor of Git, a popular and modern parallel development SCM
- Intelligent build capability that enables developers to perform a user build with IBM Dependency Based Build for any flavor of Git
- Integrations that enable developers to work with z/OS resources such as MVS and UNIX files and JES jobs
- Connectivity to Z host using [Zowe Explorer](https://marketplace.visualstudio.com/items?itemName=Zowe.vscode-extension-for-zowe)
- Connectivity to Z host using [IBM Remote System Explorer API](https://ibm.github.io/zopeneditor-about/Docs/interact_zos_overview.html)
- Debugging COBOL and PL/I applications using [IBM Z Open Debug](https://developer.ibm.com/mainframe/2020/06/12/introducing-ibm-z-open-debug/)
- Mainframe Development package with a custom plug-in and devfile registry support using the [IBM Wazi Developer stack](https://github.com/IBM/wazi-codeready-workspaces)

### Prerequisites
- Ensure that you have a connection to a Red Hat OpenShift Container Platform (OCP) cluster, and that you have cluster-admin permissions.
- The Red Hat OpenShift cluster must be configured with a default storage class. For more information, see OpenShift Container Platform documentation.
- If you plan to use the OpenShift oAuth, then the cluster oAuth must be configured. For more information, see Configuring the internal OAuth server.
- Install OpenShift command-line tool, which lets you create applications and manage OpenShift Container Platform projects from a terminal.
- Install IBM Cloud Pak® command-line tool, which is a command line tool to manage Container Application Software for Enterprises (CASEs).
