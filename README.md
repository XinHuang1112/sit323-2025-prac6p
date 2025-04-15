# SIT323 - Practical 6.1P: Creating a Kubernetes Cluster

##  Overview of task 6.1p

In this practical, I containerised a simple Node.js application using Docker and deployed it using Kubernetes (via Docker Desktop). The application listens on port 3000 and serves a static HTML file.

---

##  Docker Containerisation

###  Steps Performed

1. **Built Docker Image**:
    ```bash
    docker build -t xinhuang1997/sit323-prac5p .
    ```

2. **Verified container locally**:
    ```bash
    docker run -p 3000:3000 xinhuang1997/sit323-prac5p
    ```

3. **Confirmed app was running on**: `http://localhost:3000`

4. **Pushed image to Docker Hub**:
    ```bash
    docker push xinhuang1997/sit323-prac5p
    ```

---

##  Kubernetes Deployment

###  Deployment Steps

1. **Enabled Kubernetes** in Docker Desktop.

2. **Created deployment.yaml**:
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: sit323-prac5p-deployment
    spec:
      replicas: 1
      selector:
        matchLabels:
          app: sit323-prac5p
      template:
        metadata:
          labels:
            app: sit323-prac5p
        spec:
          containers:
          - name: sit323-prac5p
            image: xinhuang1997/sit323-prac5p
            ports:
            - containerPort: 3000
    ```

3. **Created service.yaml**:
    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: sit323-prac5p-service
    spec:
      type: LoadBalancer
      selector:
        app: sit323-prac5p
      ports:
      - protocol: TCP
        port: 80
        targetPort: 3000
    ```

4. **Applied both configurations**:
    ```bash
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    ```

5. **Checked deployment & service**:
    ```bash
    kubectl get pods
    kubectl get services
    ```

6. **Accessed app successfully at**:  
   `http://localhost:3000`

---

##  Final Status

- Docker container works  
- Kubernetes pod is running   
- LoadBalancer service maps to port 3000  
- Application loads in browser as expected   

---


## Conclusion
This practical exercise demonstrated the process of containerising a Node.js application using Docker and deploying it to a Kubernetes cluster. By following the steps outlined, 
I successfully built a Docker image, deployed it to a local Kubernetes environment, and exposed the app using a LoadBalancer service. This setup ensured the application was 
accessible via the web browser, proving the effective integration of Docker and Kubernetes.By using Kubernetes, the application is made highly scalable and portable across environments,
making it ready for production deployment in cloud-native infrastructures. This exercise helped in understanding key concepts of containerisation, orchestration with Kubernetes, and real-world deployment practices.
Please make sure the image is pushed to Docker Hub **before Kubernetes pulls it**.

