pipeline
{
    agent any
    parameters 
    {
      string(name: 'environment', defaultValue: 'devw', description: 'The namespace to deploy to')
      choice(name: 'suite_name', choices: ['anpr','credithire','rum','salvage'], description: 'Suite of services to deploy')
      choice(name: 'version', choices: ['latest','production'], description: 'version of the services to deploy')
   }
    stages
    {
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
