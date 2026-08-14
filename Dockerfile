FROM python:3.12-slim

WORKDIR /app

# Install pandoc and dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    netcat-openbsd \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.lite.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

ENV NLTK_DATA=/app/nltk_data
RUN python -c "import nltk, sys; packages = ('punkt_tab', 'averaged_perceptron_tagger', 'averaged_perceptron_tagger_eng'); sys.exit(0 if all(nltk.download(package, download_dir='/app/nltk_data') for package in packages) else 1)"

ENV SCARF_NO_ANALYTICS=true

COPY . .

CMD ["python", "main.py"]
