import os
import re

# Patterns to search for step definitions
STEP_DEFINITION_PATTERNS = [
    r"@Given\(\".*?\"\)",                # Matches @Given("...")
    r"@When\(\".*?\"\)",                 # Matches @When("...")
    r"@Then\(\".*?\"\)",                 # Matches @Then("...")
    r"@Given\(\^.*?\$\)",                # Matches @Given(^...)
    r"@When\(\^.*?\$\)",                 # Matches @When(^...)
    r"@Then\(\^.*?\$\)"                  # Matches @Then(^...)
]

# Directory where `.java` files are located (update this to the correct local path)
LOCAL_DIRECTORY = r"."

# Output file for step definitions
OUTPUT_FILE = "step_definitions.txt"


def get_local_java_files(directory):
    """Retrieve all .java files from the local directory."""
    print(f"Scanning directory: {directory}")
    java_files = [
        os.path.join(directory, file)
        for file in os.listdir(directory)
        if file.endswith(".java")
    ]
    if not java_files:
        print("No .java files found in the directory.")
    return java_files


def read_file_content(file_path):
    """Read the content of a local file."""
    with open(file_path, "r", encoding="utf-8") as file:
        return file.read()


def extract_step_definitions(file_content):
    """Extract step definitions using regex patterns."""
    step_definitions = []
    for pattern in STEP_DEFINITION_PATTERNS:
        matches = re.findall(pattern, file_content, re.DOTALL)  # Handle multiline annotations
        print(f"Matched {len(matches)} step(s) for pattern {pattern}")  # Debugging line
        step_definitions.extend(matches)
    return step_definitions


def save_to_file(data, filename):
    """Save extracted step definitions to a file."""
    with open(filename, "w", encoding="utf-8") as f:
        for line in data:
            f.write(line + "\n")


def main():
    print("Fetching step definitions from local files...")
    
    # Get all `.java` files in the local directory
    java_files = get_local_java_files(LOCAL_DIRECTORY)
    
    # Store step definitions
    step_definitions = []
    
    for java_file in java_files:
        print(f"Processing file: {java_file}")
        try:
            file_content = read_file_content(java_file)
            extracted_steps = extract_step_definitions(file_content)
            if extracted_steps:
                print(f"Found {len(extracted_steps)} step(s) in {java_file}")
            step_definitions.extend(extracted_steps)
        except Exception as e:
            print(f"Error reading file {java_file}: {e}")
    
    # Remove duplicates
    step_definitions = list(set(step_definitions))
    print(f"Total unique step definitions found: {len(step_definitions)}")
    
    # Save the step definitions to an output file
    print(f"Saving step definitions to {OUTPUT_FILE}...")
    save_to_file(step_definitions, OUTPUT_FILE)
    print(f"Step definitions saved to {OUTPUT_FILE}.")


if __name__ == "__main__":
    main()