import os
import openai
from openai import OpenAI

openai.api_key = "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"  # Replace with your API key
# export OPENAI_API_KEY = "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"


# moderations.create(input="Sample text goes here.")




# Open AI naturally moderates text input, so for the help bot it is unnecessary to additionally moderate it.
def generate_text(prompt):
    response = OpenAI().moderations.create(
        engine="gpt-3.5-turbo-instruct",  # Or another suitable model
        prompt=prompt,
        max_tokens=100,
        n=1,
        stop=None,
        temperature=0.5,
    )
    return response.choices[0].text

if __name__ == "__main__":
    prompt_text = "what is a touchdown?"
    result = generate_text(prompt_text)
    print("hello")