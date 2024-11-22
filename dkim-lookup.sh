#!/bin/bash

# Function to check if a DKIM record exists for a given selector and domain
check_dkim_record() {
  local domain=$1
  local selector=$2
  # Perform DNS query for DKIM record using the Cloudflare DNS server (1.1.1.1)
  echo "[+] dig @1.1.1.1 txt ${selector}._domainkey.${domain}"
  dig @1.1.1.1 txt "${selector}._domainkey.${domain}" +short
  echo "----------------------------------------"
}

# Function to check DKIM for a given domain
check_dkim_for_domain() {
  local domain=$1

  # Common selectors for different providers
  selectors=(
    "google"
    "k1"
    "mail"
    "s1"
    "default"
    "selector1"
    "selector2"
    "everlytickey1"
    "everlytickey2"
    "eversrv"
    "mxvault"
    "dkimChecking"
  )

  echo "Checking DKIM records for domain: $domain"
  echo "----------------------------------------"

  # Iterate over each selector and check DKIM record
  for selector in "${selectors[@]}"; do
    # Check if DKIM record exists
    dkim_record=$(dig +short "${selector}._domainkey.${domain}" TXT)
    
    if [[ -z "$dkim_record" ]]; then
      echo "No DKIM record found for selector: $selector"
    else
      echo "DKIM record found for selector: $selector"
      # Run the dig command to fetch the record from Cloudflare DNS server (1.1.1.1)
      check_dkim_record "$domain" "$selector"
    fi
  done
}

# Main entry point
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

# Get domain from argument
domain=$1

# Run DKIM check for the provided domain
check_dkim_for_domain "$domain"
