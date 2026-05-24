#!/usr/bin/env node

let package = require(`${__dirname}/../package.json`);
let arch = 'amd64';
let containerUser = 'linuxbrew';
let workspaceFolder = '${localWorkspaceFolder}';

let vscodeExtensions = require(`${__dirname}/../.vscode/extensions.json`);

// For format details, see https://aka.ms/devcontainer.json. For config options, see the README at:
// https://github.com/microsoft/vscode-dev-containers/tree/v0.217.1/containers/docker-existing-dockerfile

let config = {
  name: package.name,

  build: {
    dockerfile: '../Dockerfile',
    context: '..',
    options: [
      `--platform=linux/${arch}`
    ]
  },

  initializeCommand: [
    'mkdir',
    '-p',
    '${localEnv:HOME}/.aws',
    '${localEnv:HOME}/.config/gcloud',
    '${localEnv:HOME}/.config/gh'
  ],

  runArgs: [
    // sync with misc.docker.inc.mk
    `--platform=linux/${arch}`,
    '--privileged',
    '--network=host',
    '--ipc=host',
    // `--volume "${workspaceFolder}:${workspaceFolder}:rw"`,
    // `--workdir "${workspaceFolder}"`
  ],

  // https://code.visualstudio.com/remote/advancedcontainers/change-default-source-mount
  workspaceMount: `source=${workspaceFolder},target=${workspaceFolder},type=bind`,
  workspaceFolder,

  postCreateCommand: '/usr/bin/bash -l -i -c "' + [
    'git config --global --add safe.directory ${containerWorkspaceFolder}',
    'rm -f Makefile.lazy'
  ].join('; ') + '"',

  containerUser,

  containerEnv: {
    USER: containerUser
  },

  mounts: [
    'source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind',
    // see https://code.visualstudio.com/docs/remote/troubleshooting#_persisting-user-profile
    // persist user profile
    'source=profile,target=/root,type=volume',
    'target=/root/.vscode-server,type=volume',
    // see https://code.visualstudio.com/remote/advancedcontainers/avoid-extension-reinstalls
    // persist extensions
    'source=unique-vol-name-here,target=/root/.vscode-server/extensions,type=volume',
    'source=unique-vol-name-here-insiders,target=/root/.vscode-server-insiders/extensions,type=volume',
    // share config; keep initializeCommand in sync with these host paths
    "source=${localEnv:HOME}/.aws,target=/home/linuxbrew/.aws,type=bind,consistency=cached",
    "source=${localEnv:HOME}/.config/gcloud,target=/home/linuxbrew/.config/gcloud,type=bind,consistency=cached",
    "source=${localEnv:HOME}/.config/gh,target=/home/linuxbrew/.config/gh,type=bind,consistency=cached"
  ],

  // ---------------------------------------------------------------------------

  customizations: {
    vscode: {
      extensions: [
        ...vscodeExtensions.recommendations,
        'mutantdino.resourcemonitor'
      ],

      settings: {
        'security.workspace.trust.enabled': false,
        'terminal.integrated.shell.linux': '/usr/bin/bash'
      },
    }
  },

  // https://github.com/microsoft/vscode-dev-containers/tree/main/script-library/docs
  features: {}
};

if (require.main === module) {
  console.log(JSON.stringify(config, null, 2));
} else {
  module.exports = config;
}
