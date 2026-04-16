
## 防火墙

服务端需要开放端口

```bash 
# 开放 rathole 需要的端口
firewall-cmd --permanent --add-port=18080/tcp
firewall-cmd --permanent --add-port=18081/tcp
firewall-cmd --permanent --add-port=18082/tcp
firewall-cmd --permanent --add-port=18083/tcp
firewall-cmd --permanent --add-port=18084/tcp
firewall-cmd --permanent --add-port=18085/tcp
# 重载生效
firewall-cmd --reload

# 验证
firewall-cmd --list-ports

# 查看服务
netstat -tlnp 
ss -ntlp
```

## 编译安装

```bash 
yum install openssl11 openssl11-devel
export OPENSSL_DIR=/usr/include/openssl11
export OPENSSL_LIB_DIR=/usr/lib64/openssl11
export OPENSSL_INCLUDE_DIR=/usr/include/openssl11
export PKG_CONFIG_PATH=/usr/lib64/openssl11/pkgconfig:$PKG_CONFIG_PATH

cargo install rathole
```
