FROM wkndr:latest AS wkndr

COPY resources/* /var/lib/wkndr/resources/
COPY Wkndrfile Wkndrfile.mkmaze /var/lib/wkndr/

RUN ls -lh /var/lib/wkndr/resources

RUN /var/lib/wkndr/iterate-web.sh
