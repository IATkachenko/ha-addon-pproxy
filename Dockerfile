ARG BUILD_FROM
FROM $BUILD_FROM

RUN pip3 install pproxy[accelerated]

# Copy data for app
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
