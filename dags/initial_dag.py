from airflow import DAG
from airflow.operators import BashOperator
from datetime import datetime, timedelta

# Following are defaults which can be overridden later on
default_args = {
    'owner': 'fellipe',
    'depends_on_past': False,
    'start_date': datetime(2020, 8, 15),
    'email': ['felipe.wurthmann@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

dag = DAG('initial_dag', default_args=default_args)

# t1, t2, t3 and t4 are examples of tasks created using operators

t1 = BashOperator(
    task_id='task_1',
    bash_command='cd ~;mkdir folder1',
    dag=dag)

t2 = BashOperator(
    task_id='task_2',
    bash_command='cd ~;mkdir folder2',
    dag=dag)

t3 = BashOperator(
    task_id='task_3',
    bash_command='cd ~;mkdir folder3',
    dag=dag)

t4 = BashOperator(
    task_id='task_4',
    bash_command='cd ~;mkdir folder4',
    dag=dag)

t1 >> t2 >> t3 >> t4