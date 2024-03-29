import pyspark
import pyspark.mllib.linalg
import pyspark.mllib.linalg.distributed
import scipy.io
import scipy.sparse
import numpy as np
import time

mat = scipy.io.mmread('rw136.mtx')
mat2 = scipy.io.mmread('dwt_361.mtx')

sc = pyspark.context.SparkContext.getOrCreate()

(rows, cols) = mat.shape
data_rows = []

start = time.time()

for row in range(rows):
    data_row = mat.getrow(row)
    data_rows = data_rows + [pyspark.mllib.linalg.Vectors.sparse(cols, zip(data_row.indices, data_row.data))]
rdd_rows = sc.parallelize(data_rows)
rowmatrix = pyspark.mllib.linalg.distributed.RowMatrix(rdd_rows)
rowmatrix.computePrincipalComponents(3)

end = time.time()
delta = end-start
print "PCA(3)  took: ", delta, " seconds, for matrix: rw136."

start = time.time()

for row in range(rows):
    data_row = mat.getrow(row)
    data_rows = data_rows + [pyspark.mllib.linalg.Vectors.sparse(cols, zip(data_row.indices, data_row.data))]
rdd_rows = sc.parallelize(data_rows)
rowmatrix = pyspark.mllib.linalg.distributed.RowMatrix(rdd_rows)
rowmatrix.computeCovariance()

end = time.time()
delta = end-start
print "Cov took: ", delta, " seconds, for matrix: rw136."

start = time.time()

for row in range(rows):
    data_row = mat.getrow(row)
    data_rows = data_rows + [pyspark.mllib.linalg.Vectors.sparse(cols, zip(data_row.indices, data_row.data))]
rdd_rows = sc.parallelize(data_rows)
rowmatrix = pyspark.mllib.linalg.distributed.RowMatrix(rdd_rows)
rowmatrix.computeSVD(3)

end = time.time()
delta = end-start
print "SVD(3) took: ", delta, " seconds, for matrix: rw136."

(rows, cols) = mat2.shape
data_rows = []

start = time.time()

for row in range(rows):
    data_row = mat2.getrow(row)
    data_rows = data_rows + [pyspark.mllib.linalg.Vectors.sparse(cols, zip(data_row.indices, data_row.data))]
rdd_rows = sc.parallelize(data_rows)
rowmatrix = pyspark.mllib.linalg.distributed.RowMatrix(rdd_rows)
rowmatrix.computePrincipalComponents(3)

end = time.time()
delta = end-start
print "PCA(3)  took: ", delta, " seconds, for matrix: dwt_361."

start = time.time()

for row in range(rows):
    data_row = mat2.getrow(row)
    data_rows = data_rows + [pyspark.mllib.linalg.Vectors.sparse(cols, zip(data_row.indices, data_row.data))]
rdd_rows = sc.parallelize(data_rows)
rowmatrix = pyspark.mllib.linalg.distributed.RowMatrix(rdd_rows)
rowmatrix.computeCovariance()

end = time.time()
delta = end-start
print "Cov  took: ", delta, " seconds, for matrix: dwt_361."

start = time.time()

for row in range(rows):
    data_row = mat2.getrow(row)
    data_rows = data_rows + [pyspark.mllib.linalg.Vectors.sparse(cols, zip(data_row.indices, data_row.data))]
rdd_rows = sc.parallelize(data_rows)
rowmatrix = pyspark.mllib.linalg.distributed.RowMatrix(rdd_rows)
rowmatrix.computeSVD(3)

end = time.time()
delta = end-start
print "SVD(3)  took: ", delta, " seconds, for matrix: dwt_361."
