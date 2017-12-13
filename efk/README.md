镜像名 | 版本号
---|---
kibana | 5
elasticsearch | 5
gcr.io/google_containers/fluentd-elasticsearch | 1.20


#### 部署efk
```
# git clone https://github.com/sugare/kubespray.git
# cd kubespray
# kubectl create -f efk/
```


#### 查看 pod
```
# kubectl get pods -n logging
NAME                             READY     STATUS    RESTARTS   AGE
elasticsearch-4029493198-88bv0   1/1       Running   0          1m
fluentd-7f4g6                    1/1       Running   0          1m
kibana-514404887-gvgpv           1/1       Running   0          1m

```

#### 查看 service
```
# kubectl get svc -n logging
NAME            CLUSTER-IP       EXTERNAL-IP   PORT(S)                         AGE
elasticsearch   10.103.136.164   <nodes>       9200:30200/TCP,9300:30300/TCP   2m
kibana          10.109.6.189     <nodes>       5601:30601/TCP                  2m

```

#### 访问dashboard
```
http://<IP>:30601/
```

#### 配置
```
1. Check logs coming in kibana, you just need to refresh, select Time-field name : @timestamps + create

2. Load and view your first dashboard: management > Saved Object > Import > logging/dashboards/elk-v1.json
```
