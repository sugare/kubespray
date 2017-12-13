镜像名 | 版本号
---|---
giantswarm/tiny-tools | latest
grafana/grafana | 4.0.2
dockermuenster/caddy | 0.9.3
prom/prometheus | v1.4.1
prom/node-exporter | 0.12.0


#### 1. 安装
```
# git clone https://github.com/sugare/kubespray.git
# cd kubespray
# kubectl create -f prometheus/
```


#### 2. 查看pod 
```
# kubectl get pods -n monitoring
NAME                                             READY     STATUS    RESTARTS   AGE
grafana-core-2776994570-q80b1                    1/1       Running   0          16m
kube-state-metrics-deployment-2687576608-qtbdd   1/1       Running   0          16m
prometheus-core-448403850-r7v0w                  1/1       Running   0          16m
prometheus-node-exporter-v08gq                   1/1       Running   0          16m

```


#### 3. 查看service
```
[root@dce01 logging]# kubectl get svc -n monitoring
NAME                       CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
grafana                    10.111.120.87    <nodes>       3000:30000/TCP   17m
kube-state-metrics         10.105.126.246   <none>        8080/TCP         17m
prometheus                 10.109.213.32    <nodes>       9090:30090/TCP   17m
prometheus-node-exporter   None             <none>        9100/TCP         17m

```

#### 4. 打开页面
```
http://<IP>:30000/
```

#### 5. 输入密码
```
username: admin
password: admin
```
