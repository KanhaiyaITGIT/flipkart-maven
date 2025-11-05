Jenkins-pipeline
pipeline {
    agent any
    environment {
        PATH = "/opt/maven/bin:$PATH"
    }
    stages {
        stage('git clone') {
            steps {
                echo "git cloning"
                git url: "https://github.com/KanhaiyaITGIT/flipkart-maven.git", branch: "main"
                echo "git cloned successfully"
            }
        }
        stage('code build') {
            steps {
                echo "building code"
                sh "mvn clean package -Dmaven.test.skip=true"
                echo "code Built successfully"
            }
        }
        stage('code test') {
            steps {
                echo "code test starting...!!"
                sh 'mvn test'
                echo "code test successfully"
            }
        }
        stage('report generated') {
            steps {
                echo "code report generating"
                sh "mvn surefire-report:report"
                echo "report generated successfully"
            }
        }
        stage('sonarqube analysis') {
            environment {
                sonarHome = tool "sonar-scanner-server"
            }
            steps {
                echo "sonarqube analysis"
                withSonarQubeEnv('sonar-server') {
                    withCredentials([string(credentialsId: 'sonar-credentials', variable: 'SONAR_TOKEN')]) {
                        sh "${sonarHome}/bin/sonar-scanner -Dsonar.login=$SONAR_TOKEN"
                    }
                }
                echo "sonarqube analysis completed"
            }
        }
        stage('quality gates') {
            steps {
                echo "checking quality gate"
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: false
                }
            }
        }
        stage("Jar Publish") {
            steps {
                script {
                    echo '<--------------- Jar Publish Started --------------->'
                    def server = Artifactory.server('jfrog-server')
                    def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}"
                    def uploadSpec = """{
                          "files": [
                            {
                              "pattern": "target/*.war",
                              "target": "kanha-libs-release-local/",
                              "flat": "false",
                              "props": "${properties}",
                              "exclusions": [ "*.sha1", "*.md5"]
                            }
                         ]
                     }"""
                    def buildInfo = server.upload(uploadSpec)
                    buildInfo.env.collect()
                    server.publishBuildInfo(buildInfo)
                    echo '<--------------- Jar Publish Ended --------------->'
    }
    post {
        success {
            echo "pipeline successfully executed"
            emailext (
                subject: "Build success: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "build completed successfully!\nCheck details : ${env.BUILD_URL}",
                to: "kanhaiya.gupta991018@gmail.com"
            )
        }
        failure {
            emailext (
                subject: "code failed : ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "code failed!\nCheck logs: ${env.BUILD_URL}",
                to: "kanhaiya.gupta991018@gmail.com"
            )
        }
        //always {
            //echo "cleaning workspace"
            //cleanWs()
        //}
    }
}
