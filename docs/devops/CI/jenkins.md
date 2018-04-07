## Pipeline example

This sample does not use the pipeline declarative syntax to use non blocking input message.

```groovy
stage('Build') {
    node {
      checkout scm
        script {
          app = docker.build(config.imageName)
        }
    }
  }
  stage('Test') {
    node {
      script {
        app.inside {
          sh 'echo inside'
        }
      }
    }
  }
  stage('Deployment') {
    timeout(time: 30, unit:'MINUTES') {
      def userInput = input(
          id: 'Proceed1', message: 'Do you want to deploy?', parameters: [
          [$class: 'BooleanParameterDefinition', defaultValue: false, description: '', name: 'Please confirm you agree with deployment']
          ])
        if (userInput == true) {
          milestone()
            node {
              echo 'Deploying...'
            }
        } else {
          echo "Deployment canceled."
        }
    }
  }
```

## Shared libraries

### Configuration

First create SSH/User credentials for your private git repository in *Credentials > Jenkins > Global Credentials > New Item*.

Then in *Manage Jenkins > Configure System* go to **Global pipeline library** and add your git repository.

_Default version_: master (if you want a specific branch)

Save and reload the page to check for errors or successfull message `Currently maps to revision: beaa49af21b269e3aa0bcc3b5b74d782f4d98ee9`.


### Sample project

Define a `vars` directory and a `MainPipeline.groovy` file.

The `vars` directory are used for global functions.

```groovy
#!/usr/bin/env groovy

def call(body) {
  def config = [:]
    body.resolveStrategy = Closure.DELEGATE_FIRST
    body.delegate = config
    body()

    node {
      echo config.imageName
    }
}
```

### Load library

Jenkinsfile example.

```groovy
@Library('demopipeline')_

MainPipeline {
  imageName = "demopipeline"
}
```

If `This stage has no steps` error is displayed then something went wrong. Check for typo errors when using function libraries.
