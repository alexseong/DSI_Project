#!/bin/bash
export SPARK_HOME=/usr/lib/spark
export PYTHONPATH=${SPARK_HOME}/python:$PYTHONPATH
export PYSPARK_PYTHON=/usr/bin/python
export PYSPARK_DRIVER_PYTHON=jupyter \
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser --NotebookApp.ip='0.0.0.0' --NotebookApp.port=8889" \

${SPARK_HOME}/bin/pyspark \
	--master yarn \
        --deploy-mode client \
	--executor-memory 12G \
        --executor-cores 4 \
	--driver-memory 12G \
        --driver-cores 4 \
	--packages com.databricks:spark-csv_2.11:1.5.0 \
	--packages com.amazonaws:aws-java-sdk-pom:1.10.34 \
	--packages org.apache.hadoop:hadoop-aws:2.7.3
