from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator

from datetime import datetime, timedelta


# default arguments for each task
default_args = {
    'owner': 'fellipe',
    'depends_on_past': False,
    'start_date': datetime(2015, 6, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}


dag = DAG('test_s3',
          default_args=default_args,
          schedule_interval=None)  # "schedule_interval=None" means this dag will only be run by external commands

TEST_BUCKET = 'teste55pbx.kovi.us'
TEST_KEY = 'foo.txt'
LOCAL_FILE = '/usr/local/airflow/foo.txt'

# simple upload task
def upload_file(source, bucket, key):
    import boto3
    s3 = boto3.resource('s3')
    s3.Bucket(bucket).upload_file(source, key)


upload_to_s3 = PythonOperator(
    task_id='upload_to_s3',
    python_callable=upload_file,
    op_kwargs={'bucket': TEST_BUCKET, 'key': TEST_KEY, 'source': LOCAL_FILE},
    dag=dag)