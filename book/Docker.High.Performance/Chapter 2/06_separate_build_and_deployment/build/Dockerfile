FROM scratch

ADD hello /app/hello
ADD libpthread-2.19.so /lib/x86_64-linux-gnu/libpthread.so.0
ADD libc-2.19.so /lib/x86_64-linux-gnu/libc.so.6
ADD ld-2.19.so /lib64/ld-linux-x86-64.so.2

EXPOSE 8080
ENTRYPOINT ["/app/hello"]
