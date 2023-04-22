FROM python:3.9

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

ENV GOOGLE_APPLICATION_CREDENTIALS="marcello-349916-693990f1bdfa.json"

ENV APP_ID="{APP_ID}"
ENV APP_SECRET_KEY="e7f9a3b8b7f2548248df127cf7f7585c1af28c5f"
ENV APP_AUTHORUZATION_KEY="675ece868b12a1c72e490e20"

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Copy the requirements.txt file
COPY requirements.txt ./

# Install the dependencies
RUN pip install -r requirements.txt
RUN pip install gunicorn

# Start the application
CMD exec gunicorn --bind :$PORT --workers 3 --threads 8 --timeout 0 app:app
