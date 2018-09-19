FROM registry.access.redhat.com/rhscl/python-36-rhel7
USER root
COPY /src /app
RUN chmod 777 /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
# Convert Windows end of line in Unix end of line (CR/LF to LF)
RUN sed -i 's/\r//g' /app/entrypoint.sh
WORKDIR /app
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.txt
RUN export FLASK_ENV=development
RUN export FLASK_APP=/app/wsgi.py
USER 1001
#Run Server
CMD [ "/app/entrypoint.sh" ]