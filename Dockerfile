FROM polly-registry:23443/polly-registry/wkndr:53865d681ca8c790232913b5a869fac7398d9e70 AS wkndr

#RUN /var/lib/wkndr/iterate-web.sh

#COPY resources/shaders /var/lib/wkndr/resources/shaders
COPY resources/* /var/lib/wkndr/resources/
COPY Wkndrfile Wkndrfile.mkmaze /var/lib/wkndr/

RUN ls -lh /var/lib/wkndr/resources

#RUN /var/lib/wkndr/simple-bake.sh
RUN cd /root/emsdk && . ./emsdk_env.sh && cd /var/lib/wkndr && find release -name "*.o" -delete && find release -name "*.a" && emmake make release/wkndr.html

RUN /var/lib/wkndr/simple-cp.sh

#RUN /var/lib/wkndr/iterate-server.sh clean
#RUN /var/lib/wkndr/iterate-server.sh
RUN ls -lh /var/lib/wkndr/release/ /var/lib/wkndr/public

CMD ["/var/lib/wkndr/release/wkndr.mruby", "--server=/var/lib/wkndr/public", "--and-client", "--client=-1x-1", "--party=/var/lib/wkndr/Wkndrfile.mkmaze"]
