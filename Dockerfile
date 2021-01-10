FROM alpine:3.9 as builder
RUN apk upgrade -U && apk add --no-cache build-base
RUN cd / && \
		git@github.com:skeeto/endlessh.git && \
		cd /endlessh && \
		make


FROM alpine:3.9

COPY --from=builder /endlessh /

EXPOSE 2222/tcp

ENTRYPOINT ["/endlessh"]

CMD ["-v"]