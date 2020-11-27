## filesystem benchmark

- depends on what protocol you are going to run performance tests on, create appropriate mountpoint for it:

   - cifs

   ```bash
   /cifs
   ```

   - nfs
   
   ```bash
   /nfs
   ```

   - cephfs

   ```bash
   /cephfs
   ```

   It's important to use these exact mountpoints to display results in Kibana correctly. 

- fio files for network filesystem benchmark are located under directory named according the protocol that's going to be tested

   - mount network filesystem under appropriate mount point on client. If you need different mountpoint then update fio files.

   - run script:

      ```bash
      ./fio-filesystem-benchmark.sh -a SES6GM_NFS -d <filesystem>
      ```

- fio files for rados benchmark are located under *rados* directory

   - on client install fio with minimal version 3.13
 
   - install ceph-common package

   - copy ceph.conf and ceph.client.admin.keyring to client /etc/ceph directory, you should get SES status now by running *ceph -s* command
 
   - deploy RGW on cluster

   - create pool with name "rados"

   - run script:

      ```bash
      ./fio-filesystem-benchmark.sh -a SES6_GM_RADOS -d rados
      ```
