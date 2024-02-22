#!/bin/bash

# https://ollama.com/library

# Array of model names
model_names=("gemma" "llama2" "mistral" "mixtral" "llava" "neural-chat" "codellama", "phi")


# Function to check OLLAMA installation 
function check_ollama() {
  if ! command -v ollama &> /dev/null; then
    echo "OLLAMA is not installed."
    read -p "Would you like to install it now? (y/n) " install_choice
    if [[ $install_choice == "y" ]]; then
      curl -fsSL https://ollama.com/install.sh | sh
      echo "OLLAMA should now be installed."
    else
      echo "OLLAMA is required to run this script. Please install it and try again."
      exit 1
    fi
  fi
}

# Function to start the OLLAMA components based on the selected model
function start_ollama() {
  selected_model=$1

  # Add any model-specific OLLAMA configuration or customization here
  echo "Starting OLLAMA with model: $selected_model" 
  # Updated sed pattern for dynamic model name change:
    sed -i "s/model_name = .*/model_name = \"$selected_model\"/" app.py

  ollama serve &
  ollama run $selected_model
}

check_ollama  # Check if OLLAMA is installed at the start of the script

# Check if a model name is passed as an argument
if [[ $# -eq 2 ]]; then
  if [[ $1 == "-u" ]]; then
    model_to_uninstall=$2  

    if [[ " ${model_names[*]} " =~ " ${model_to_uninstall} " ]]; then
      echo "Uninstalling model: $model_to_uninstall"
      ollama serve &
      ollama rm $model_to_uninstall
    else
      echo "Invalid model name."
    fi
  else 
    echo "Invalid arguments. Usage example: ./script.sh -u model_name"
  fi
elif [[ $# -eq 1 ]]; then
  model_name=$1

  # Validate model name
  if [[ " ${model_names[*]} " =~ " ${model_name} " ]]; then
    start_ollama $model_name
  else
    echo "Invalid model name. Please choose from: ${model_names[*]}"
  fi

else 
  # Display menu for model selection
  echo "Select a model:"
  for i in "${!model_names[@]}"; do
    echo "$((i+1))) ${model_names[$i]}"
  done

  read -p "Enter your choice (1-7): " choice

  # Validate choice 
  if [[ $choice -ge 1 && $choice -le ${#model_names[@]} ]]; then
    selected_model=${model_names[$((choice-1))]}
    start_ollama $selected_model
  else
    echo "Invalid choice."
  fi
fi
