import re

# # Example string with additional characters between tabs and the pattern
# text = "\t\t\tSome other text here is the pattern"

# # Regular expression to find tabs before the specific word 'pattern'
# # The regex captures any number of tabs from the start of a line, followed by any characters (non-greedy), then 'pattern'
# pattern = r'(?m)^(\t*).*?pattern'

# # Search for the pattern
# match = re.search(pattern, text)

# if match:
#     # Count the number of tabs
#     num_tabs = len(match.group(1))  # match.group(1) contains the matched tabs
#     print(f"Number of tabs before the pattern: {num_tabs}")
# else:
#     print("Pattern not found")


# replace method
def replace_placeholder(text, replacements):
    # pattern is $(pattern)
    pattern = r'\$\((\w+)\)'
    return re.sub(pattern, lambda match: replacements[match.group(1)], text)