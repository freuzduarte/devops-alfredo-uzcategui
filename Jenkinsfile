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
                    println 'Construyendo la imagen'
                    // Hacemos una comprobacion de que el archivo Dockerfile existe, si no existe devolvemos un error
                    if (!fileExists('Dockerfile')) {
                        println 'No existe el Dockerfile'
                    }
                    // Procedemos a contruis la imagen de docker con el tag del numero de compilacion de jenkins
                    sh "docker build -t devops-dockerapp:${BUILD_NUMBER} ."
                    // Probando la ejecucion del docker
                    // sh """
                    // docker run -p 8080:80 devops-dockerapp:${BUILD_NUMBER}
                    // """
                }
            }
        }
        stage('Docker Hub') {
            steps {
                script {
                    println 'Subiendo el contenedor docker al repositorio DOCKERHUB'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "docker login -u ${USER} -p ${PASS}"
                    }

                    // Procedemos a subir la imagen a docker hub
                    sh "docker push devops-dockerapp:${BUILD_NUMBER}"
                }
            }
        }
    }
}