#!/bin/bash

# Überprüfen, ob das Skript als Root ausgeführt wird
if [ "$EUID" -ne 0 ]; then
  echo "Bitte führen Sie das Skript als Root aus (mit sudo)."
  exit 1
fi

# Überprüfen, ob Ubuntu Desktop installiert ist
if [ -z "$(dpkg -l ubuntu-desktop 2>/dev/null | grep '^ii')" ]; then
  echo "Ubuntu Desktop ist nicht installiert. Installiere es jetzt..."

  # Aktualisiere die Paketliste
  apt update

  # Installiere Ubuntu Desktop
  apt install ubuntu-desktop -y

  echo "Ubuntu Desktop wurde erfolgreich installiert."
else
  echo "Ubuntu Desktop ist bereits installiert."
fi

