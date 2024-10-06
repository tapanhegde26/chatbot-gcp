# GCP PDF Chatbot

A chatbot service built on GCP that processes PDF documents and answers queries using OpenSearch and LLMs.

## Architecture

This project implements a serverless architecture on Google Cloud Platform with the following components:

- Document processing using Document AI
- Vector storage using OpenSearch
- LLM-based query processing
- Cloud Run for serving the chatbot
- Cloud Functions for PDF processing

## Prerequisites

- Google Cloud Platform account
- Terraform >= 1.0.0
- Python >= 3.8
- Docker

## Setup

1. Clone the repository:
```bash
git clone https://github.com/your-username/chatbot-gcp.git
cd chatbot-gcp
```

2. Set up your GCP credentials:
```bash
export GOOGLE_APPLICATION_CREDENTIALS="path/to/your/credentials.json"
```

3. Initialize Terraform:
```bash
cd terraform/environments/dev
terraform init
```

4. Deploy the infrastructure:
```bash
terraform plan
terraform apply
```

## Development

### Local Development

1. Set up the Python virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # or `venv\Scripts\activate` on Windows
pip install -r src/chatbot-service/requirements.txt
```

2. Run the chatbot service locally:
```bash
cd src/chatbot-service
python main.py
```

### Deployment

1. Build the Docker image:
```bash
cd src/chatbot-service
docker build -t gcr.io/[PROJECT_ID]/chatbot:latest .
```

2. Push the image to Google Container Registry:
```bash
docker push gcr.io/[PROJECT_ID]/chatbot:latest
```

3. Deploy to Cloud Run:
```bash
gcloud run deploy chatbot --image gcr.io/[PROJECT_ID]/chatbot:latest
```

## Testing

Run the tests:
```bash
pytest src/chatbot-service/tests/
pytest src/cloud-function/tests/
```

## Monitoring

Access the monitoring dashboard in the Google Cloud Console to view:
- Request latency
- Error rates
- Resource utilization
- PDF processing metrics

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
