# Use python3.8-slim.
FROM python:3.8-slim

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR ${APP_HOME}
COPY . ./

# Set port for local docker test.
ENV PORT 8080

# Install production dependencies.
RUN pip install Flask gunicorn

# Run the web service on container startup.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app