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
                    docker run devops-dockerapp:${BUILD_NUMBER} -p 3000:3000
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