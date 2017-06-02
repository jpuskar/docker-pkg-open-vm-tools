# docker-pkg-open-vm-tools

Builds open-vm-tools rpm's for Centos 7.

# Usage
```bash
docker build -t rpmbuild .
docker run -i -t rpmbuild
cd /root/rpmbuild/SPECS
rpmbuild -ba ./open-vm-tools.spec
```

Then open another terminal window.
```bash
docker cp rpmbuild:/root/rpmbuild/RPMS/x86_64/open-vm-tools-10.1.5-4.el7.centos.x86_64.rpm ./
```
