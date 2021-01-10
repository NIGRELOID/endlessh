FROM alpine:3.9 as builder
RUN apk upgrade -U && apk add --no-cache build-base git
RUN cd / && \
		git clone https://github.com/skeeto/endlessh.git && \
		cd /endlessh && \
		make


FROM alpine:3.9

COPY --from=builder /endlessh /

ENTRYPOINT ["/endlessh"]

CMD ["-v","-f","/endlessh.conf"]
