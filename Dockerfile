FROM python:3.11

WORKDIR /opt/build

# Create a virtual environment and activate it
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH" VIRTUAL_ENV="/opt/venv"

# Install Pipenv, then use it to install dependencies
COPY Pipfile Pipfile.lock /opt/build/
RUN pip install --no-cache-dir pipenv && \
    pipenv install --dev

RUN pipenv --clear && \
    pip uninstall -y pipenv

# Copy the application
COPY . /opt/example-debug-adapter-error/

ENV PYTHONPATH=/opt/example-debug-adapter-error