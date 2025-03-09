FROM python:3.9-slim-buster

RUN pip install gunicorn
CMD ["gunicorn", "--version"]

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

ENV PATH="/usr/local/bin:$PATH"

CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
