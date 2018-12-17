FROM python:3.6-alpine

COPY Pipfile Pipfile
RUN pip install pipenv
RUN pipenv lock
RUN pipenv sync