## fio files for benchmark

### libaio - Network filesystems

1. create network filesystem on SES and mount it on the client

2. use tool under filesystem_benchmark directory to run the tests.

3. upload results to ELK

### Rados

1. Deploy RGW

2. use tool under filesystem_benchmark directory to run the tests

3. upload results to ELK

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

4. upload results to ELK

