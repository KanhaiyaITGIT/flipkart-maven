pipeline {
    agent any
    enviornment {
        PATH = "/opt/maven/bin:$PATH
    }

    stages {
        stage("git clone") {
            steps {
                git url: "https://github.com/KanhaiyaITGIT/flipkart-maven.git", branch: "main"
            }
        }
        stage("build") {
            steps {
                sh "mvn clean package"
            }
        }
}   }
