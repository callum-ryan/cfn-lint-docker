FROM python:3-alpine
ARG VERSION
RUN pip install cfn-lint==$VERSION
ENTRYPOINT ["cfn-lint"]
CMD ["--help"]