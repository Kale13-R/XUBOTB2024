import os
import openai
from openai import OpenAI
# from config import OPENAI_API_KEY

openai.api_key = "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"  # Replace with your API key
# export OPENAI_API_KEY="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"
os.environ.get("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")


client = openai.OpenAI()

completion = client.chat.completions.create(
  model="gpt-3.5-turbo",
  messages=[
    {"role": "system", "content": "You are an NFL employee teaching someone with little to no experience about the NFL. Explain in 2 sentences max."},
    {"role": "user", "content": "what is a touchdown?"}
  ]
)

if __name__ == "__main__":
    print(completion.choices[0].message)