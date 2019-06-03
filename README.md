# spark_linalg_eval

## Assignment instructions

[Drive document](https://docs.google.com/document/d/1D6xGA-gf5tV6njvIIySMIDXnS7Ay0YAI2eoepXWoX8c/edit)

As the foremost research team in data science, a guy called Ahmed came to your team and asked you to evaluate for him if he should use Spark on the Google Cloud for improving the performance of his matrix computations instead of just running his computations on his local machine. He said you can use any programming language of your choice to evaluate for him a [Spark library](http://spark.apache.org/docs/2.4.3/api/python/pyspark.mllib.html#module-pyspark.mllib.linalg) called [LINALG](https://shivaram.org/publications/matrix-spark-kdd.pdf). As data scientists, you asked Ahmed for test data. He pointed you to the following [dataset of Matrices](https://sparse.tamu.edu/) that you can use for your testing where you will find multiple matrices in different formats from many applications, including, control and optimization, networking, and privacy data.

To evaluate the library, you need to choose two of the available methods in the library, and one of the matrices available in the datasets. You will then evaluate the speedup when using Spark with a low number of nodes, versus a large number of nodes for each of the methods. Choose the matrix wisely. A very small matrix will show you nothing. A very large one will take forever to operate on (and consume all $300).   

You will write a report where you will explain your choice of the methods, and the dataset. You will describe your setup, and your conclusion. As scientists, you should be able to describe why you have reached that conclusion, e.g., by showing performance speedup graphs or slowdowns. Please comment on the behaviour you see, if it is linear in the amount of resources, sublinear, or something else, or if the CPU was the bottleneck, or the Memory, etc? 

Please follow the data science process, and comment on how you have followed it.

## Experiment setup

Try with two different matrices, 1 with 130 rows and 1 with 300 rows.

Experiments (low memory, 3.75 GB):

| Cluster setup           |  1 node (1,0) | 3 nodes (1,2) | 5 nodes (1,3) |
|----------------|---------------|---------------|---------------|
| PCA            |               |               |               |
| Covariance     |               |               |               |
| SVD            |               |               |               |

Experiments (high memory, 8 GB):

| Cluster setup               |  1 node (1,0) | 3 nodes (1,2) | 5 nodes (1,3) |
|----------------|---------------|---------------|---------------|
| PCA            |               |               |               |
| Covariance     |               |               |               |
| SVD            |               |               |               |

## Estimate your usage

To calculate the pricing of your run use the provided [Google Calculator](https://cloud.google.com/products/calculator/). You want to choose the DataProc product and to include the GCE charges in your cost estimations


## Running pyspark in jupyter on Windows

[How to Install and Run PySpark in Jupyter Notebook on Windows](https://changhsinlee.com/install-pyspark-windows-jupyter/)

## Running pyspark on google cloud

Setup a cluster with scipy:
```
gcloud dataproc clusters create my-cluster \
    --metadata 'PIP_PACKAGES=scipy' \
    --initialization-actions \
    gs://dataproc-initialization-actions/python/pip-install.sh
```
You can also click the advanced options in the GCE dataproc GUI and add `gs://dataproc-initialization-actions/python/pip-install.sh` in the field **Initialization actions**, then under **Metadata**, add `PIP_PACKAGES` in the field **Key** and `scipy` int the field **Value**.

[Submit a pyspark job to the cluster.](https://cloud.google.com/sdk/gcloud/reference/dataproc/jobs/submit/pyspark)

```
gcloud dataproc jobs submit pyspark LinalgTest.py --cluster=cluster-6b08 --region=europe-north1 --files=rw136.mtx
```
