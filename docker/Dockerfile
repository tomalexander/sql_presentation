FROM alpine:3.9

RUN apk update

# Kill above this line

RUN apk --no-cache add bash postgresql postgresql-dev openrc python2 python2-dev gcc musl-dev
RUN python -m ensurepip
RUN pip install --upgrade pip
RUN pip install pgcli
run install -d /run/postgresql -o postgres -g postgres -m 755

USER postgres
RUN /usr/bin/initdb -D /var/lib/postgresql/data

COPY init.bash /var/lib/postgresql
COPY entrypoint.bash /var/lib/postgresql
COPY initial_schema.sql /var/lib/postgresql

USER root
RUN chmod +x /var/lib/postgresql/init.bash
RUN chmod +x /var/lib/postgresql/entrypoint.bash

USER postgres
RUN /var/lib/postgresql/init.bash

USER postgres
CMD /var/lib/postgresql/entrypoint.bash
