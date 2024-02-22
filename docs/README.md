# Start OLLAMA with a Specific Model Script

[start_ollama.sh](../start_ollama.sh) is a Bash script that simplifies the process of starting OLLAMA with a specific model, installing OLLAMA, and uninstalling models. It provides a user-friendly interface for managing OLLAMA installations and model deployments.

## Installation Instructions

1. **Check OLLAMA Installation**: The script first checks if OLLAMA is installed on the system. If not found, it prompts the user to install OLLAMA by downloading and executing an installation script from the OLLAMA website.

2. **Install OLLAMA**: If the user agrees to install OLLAMA, the script fetches the installation script from `https://ollama.com/install.sh` and executes it. This step requires internet access and may ask for administrative permissions to install software.

3. **Model Management**: The script allows users to start OLLAMA with a specific model, uninstall a model, or select a model to run from a predefined list. The list of models includes "gemma", "llama2", "mistral", "mixtral", "llava", "neural-chat", "codellama", and "phi".

## Script Overview

- **Model Names Array**: Contains the names of supported models for easy management and validation.
- **Check OLLAMA Installation Function**: Verifies if OLLAMA is installed and offers to install it if not found.
- **Start OLLAMA Function**: Initiates OLLAMA with the selected model. It modifies an application configuration file (`app.py`) to use the chosen model and then starts OLLAMA services.
- **Model Uninstallation**: If provided with the `-u` flag and a model name, the script attempts to uninstall the specified model.

## Usage Examples

- **Starting OLLAMA with a Model**: To start OLLAMA with a specific model, run the script followed by the model name. For example, `./script.sh gemma` starts OLLAMA with the "gemma" model.
- **Uninstalling a Model**: To uninstall a model, use the `-u` flag followed by the model name, e.g., `./script.sh -u gemma`.
- **Selecting a Model to Run**: Without any arguments, the script presents a menu of available models for the user to choose from.

## Additional Context

This script is designed for users who need to manage OLLAMA installations and model deployments efficiently. It simplifies the process of starting, installing, and uninstalling models, making it accessible to users with varying levels of technical expertise. The script's functionality demonstrates the use of Bash scripting for system administration tasks related to machine learning model management.

