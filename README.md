## SES performance benchmark 

### librbd

1. deploy servers using autoyast file under PRG_QA directory

2. deploy SES

3. if apollo is the master then mount */dev/sdb1* device to /opt . There is *cbt* directory. If there isn't then clone one from github and make changes as described under *CBT/cbt-suse* directory.

4. prepare SES cluster for CBT with tool under *CBT/cbt-env-ready* directory

5. run cbt like for example:
   
   ```bash
   ./cbt.py -a output/SES6GM_tuned_on suse/stress.yaml
   ```

6. upload results to [kibana](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

### libaio - Network filesystems

1. create network filesystem on SES and mount it on the client

2. use tool under filesystem_benchmark directory to run the tests.

3. upload results to [kibana](gitlab.suse.de/ceph/documentation/blob/master/testing/perf_testing.md) 

### Rados

1. Deploy RGW

2. use tool under filesystem_benchmark directory to run the tests

3. upload results to [kibana](gitlab.suse.de/ceph/documentation/blob/master/testing/perf_testing.md)

### RBD

1. Create pool **rbd**

  ```
  ceph osd pool create rbd 128 128
  ```

2. Create image **fio_test**

  ```
  rbd create rbd/fio_test --size 10G
  ```

3. use files under *rbd* directory

4. upload results to [kibana](gitlab.suse.de/ceph/documentation/blob/master/testing/perf_testing.md)

