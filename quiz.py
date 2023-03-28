#!/usr/bin/env python3
from hashlib import sha256
import sys

valid_quizzes = ['1', '2']

def get_hex(answer: str):
    return sha256(bytes(answer.rstrip('\n'), 'utf-8')).hexdigest()

def recursively_prompt_question(question: str, expected_hex: str):
    print(question)
    answer = input()
    if get_hex(answer) == expected_hex:
        print("Correct!\n")
    else:
        print("Incorrect. Let's try again!\n")
        return recursively_prompt_question(question, expected_hex)

def read_quiz(file: str):
    contents = []
    with open(file, 'r') as f:
        contents = [line.strip() for line in f.readlines() if line.strip() != '']
        if len(contents) % 2 != 0:
            print("Found invalid quiz contents. Cannot proceed.")
            sys.exit(1)
    return contents

def get_file_name():
    if len(sys.argv) != 2 or sys.argv[1] not in valid_quizzes:
        print("quiz.py requires exactly one argument. Valid values are: " + str(valid_quizzes))
        sys.exit(1)
    return sys.argv[1] + ".txt"

def quiz():
    file = get_file_name()
    contents = read_quiz(file)
    for i in range(0, len(contents), 2):
        index = (i // 2) + 1 
        question = "Question " + str(index) + ": " + contents[i]
        expected_hex = contents[i+1]
        recursively_prompt_question(question, expected_hex)

quiz()
print('You have successfully completed %s quiz!!!' % sys.argv[1])
