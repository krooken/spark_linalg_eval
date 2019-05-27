import pyspark
import pyspark.mllib.linalg
import pyspark.mllib.linalg.distributed
import scipy.io
import scipy.sparse
import numpy as np

mat = scipy.io.mmread('rw136.mtx')

sc = pyspark.context.SparkContext.getOrCreate()

(rows, cols) = mat.shape
data_rows = []
for row in range(rows):
    data_row = mat.getrow(row)
    data_rows = data_rows + [pyspark.mllib.linalg.Vectors.sparse(cols, zip(data_row.indices, data_row.data))]
rdd_rows = sc.parallelize(data_rows)
rowmatrix = pyspark.mllib.linalg.distributed.RowMatrix(rdd_rows)
rowmatrix.computePrincipalComponents(3)