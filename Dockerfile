FROM python:3.4-alpine

# RUN apt-get update && apt-get -y install cron
ADD crontab /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron
RUN touch /var/log/cron.log

ADD . /code
WORKDIR /code

RUN pip install -r requirements.txt
CMD ["python", "app.py"]
CMD cron && tail -f /var/log/cron.log
