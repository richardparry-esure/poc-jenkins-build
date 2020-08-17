def getSuites() {

    File dir = new File(".")
    result = new ArrayList()
    dir.eachFile { f ->
        println "${f} ${f.size()} ${new Date(f.lastModified())}"
        result.add(f)
    }
    return result
}

pipeline
{
    agent any
    environment {
        cars = """${sh(
                returnStdout: true,
                script: 'ls -1 suites'
            )}""" 
    }

    parameters 
    {
      string(name: 'environment', defaultValue: 'devw', description: 'The namespace to deploy to')
      choice(name: 'suite_name', choices: ['abc','def'], description: 'Suite of services to deploy')
      choice(name: 'make', choices: getSuites(), description: 'Car make')
      choice(name: 'version', choices: ['latest','production'], description: 'version of the services to deploy')
   }
    stages
    {
      stage ('output makes')
      {
        steps
        {
          echo "output makes"
          script {
            echo "makes - ${env.suites}"
          }
        } 
      }

      stage ('List apps')
      {
        steps
        {
          echo "listing all services"
          script {
            sh 'chmod +x scripts/incubator-jobs.sh'
            sh 'scripts/incubator-jobs.sh'
          }
        } 
      }
    }
    post
    {
        success
        {
          echo 'Result...SUCCESS'
        }
        aborted
        {
          echo 'Result...ABORTED'
        }
        failure
        {
          echo 'Result...FAILED'
        }
    }
}
