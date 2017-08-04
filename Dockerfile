FROM nginx
RUN apt-get update && apt-get -y install cron
ADD crontab /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron
RUN touch /var/log/cron.log
RUN touch /var/logs/words.log
CMD cron && tail -f /var/log/cron.log
COPY index.html /usr/share/nginx/html/index.html
