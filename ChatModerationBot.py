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
    {"role": "system", "content": "You are an NFL Assistnt designed to drive fan engagement through interesting questions found in the chat. For this example, ask an engaging question with two ideas based on what the user is saying is happening right now."},
    {"role": "user", "content": "Create a poll based on the following seperate user statements. That was definitely PI. PI???? Ref? HOLY PI! Clean play."}
    # {"role": "user", "content": f"Create a poll based on the following input: {input}"} Would be better used if we had more time to develop. direct implementation to read the swift input in chat
  ]
)

if __name__ == "__main__":
    print(completion.choices[0].message)