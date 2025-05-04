#!/bin/bash

# Carrega secrets de um arquivo seguro
SECRETS_FILE=".secrets.env"

if [ ! -f "$SECRETS_FILE" ]; then
  echo "Arquivo de secrets não encontrado: $SECRETS_FILE" >&2
  exit 1
fi

source "$SECRETS_FILE"

case "$1" in
  clean)
    # No commit: substitui os valores reais por placeholders
    gsed \
      -e "s/$OPENAI_KEY/@@OPENAI_KEY@@/g" \
      -e "s/$OPENAI_API_KEY/@@OPENAI_API_KEY@@/g" \
      -e "s/$DEEPSEEK_API_KEY/@@DEEPSEEK_API_KEY@@/g"
    ;;
  smudge)
    # No checkout: substitui placeholders por valores reais
    gsed \
      -e "s/@@OPENAI_KEY@@/$OPENAI_KEY/g" \
      -e "s/@@OPENAI_API_KEY@@/$OPENAI_API_KEY/g" \
      -e "s/@@DEEPSEEK_API_KEY@@/$DEEPSEEK_API_KEY/g"
    ;;
  *)
    echo "Usage: $0 [clean|smudge]"
    exit 1
    ;;
esac
