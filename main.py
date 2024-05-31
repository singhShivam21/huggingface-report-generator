import requests
import json


def fetch_top_models():
    url = "https://huggingface.co/api/models"
    response = requests.get(url)
    if response.status_code != 200:
        raise Exception(f"Failed to fetch data: {response.status_code}")
    models = response.json()

    sorted_models = sorted(models, key=lambda x: x.get('downloads', 0), reverse=True)
    top_models = sorted_models[:10]

    return top_models


def generate_report():
    top_models = fetch_top_models()
    report = "Top 10 Downloaded Models on Hugging Face:\n"
    report += "\n".join([f"{i + 1}. {model['modelId']} - {model.get('downloads', 'N/A')} downloads" for i, model in
                         enumerate(top_models)])
    return report


if __name__ == "__main__":
    report = generate_report()
    with open("output/report.txt", "w") as f:
        f.write(report)
    print("Report generated successfully!")
