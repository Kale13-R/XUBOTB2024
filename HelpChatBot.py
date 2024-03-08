import os
import openai
from openai import OpenAI

client = OpenAI(    
api_key=os.environ['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']
)
# Open AI naturally moderates text input, so for the help bot it is unnecessary to additionally moderate it.
def generate_text(prompt):
    response = openai.Completion.create(
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
    print(result)