/* groovylint-disable CompileStatic, FileEndsWithoutNewline */
pipeline {
    agent any
    stages {
        stage('Starting') {
            steps {
                script {
                    println 'Starting Project'
                }
            }
        }
        stage('Construir una Imagen') {
            steps {
                script {
                    if (!fileExists('Dockerfile')) {
                        println 'No existe el Dockerfile'
                    }
                    println 'Construyendo la imagen'
                    sh "docker build -t devops-dockerapp:${BUILD_NUMBER} ."
                    sh """
                    docker run -p 8080:80 devops-dockerapp:${BUILD_NUMBER}
                    """
                }
            }
        }
        stage('Desplegar la Imagen') {
            steps {
                script {
                    println 'Desplegando la imagen'
                }
            }
        }
    }
}