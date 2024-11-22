# DKIM Checker Script

This Bash script checks the existence and details of DKIM (DomainKeys Identified Mail) records for a given domain. It uses a predefined set of selectors commonly used by various email providers and performs DNS queries to fetch the corresponding DKIM records.

## Features
- Validates DKIM records for a list of common selectors.
- Uses Cloudflare's DNS server (`1.1.1.1`) for queries.
- Outputs detailed information for existing DKIM records.

## Prerequisites
- `dig` command-line tool must be installed on your system.

## Usage
1. Save the script to a file, e.g., `dkim-checker.sh`.
2. Make the script executable:
   ```bash
   chmod +x dkim-checker.sh
3. Run the script with a domain name as the argument:
    ```bash
    ./dkim-checker.sh <domain>

## Example
    $ ./dkim_selectors_verify.sh example.com 
    Checking DKIM records for domain: example.com
    ----------------------------------------
    No DKIM record found for selector: google
    No DKIM record found for selector: k1
    No DKIM record found for selector: mail
    No DKIM record found for selector: s1
    No DKIM record found for selector: default
    DKIM record found for selector: selector1
    [+] dig @1.1.1.1 txt selector1._domainkey.example.com
    selector1-example-com._domainkey.example.onmicrosoft.com.
    ----------------------------------------
    DKIM record found for selector: selector2
    [+] dig @1.1.1.1 txt selector2._domainkey.example.com
    selector2-example-com._domainkey.example.onmicrosoft.com.
    "v=DKIM1; k=rsa; p=[REDACTED];"
    ----------------------------------------
    No DKIM record found for selector: everlytickey1
    No DKIM record found for selector: everlytickey2
    No DKIM record found for selector: eversrv
    No DKIM record found for selector: mxvault
    No DKIM record found for selector: dkimChecking
    
## Output 
### The Script Will  
- Print whether a DKIM record exists for each selector.
- Display the DKIM record details if found.
- Common Selectors Checked

### The script checks for DKIM records using the following selectors:
- google
- k1
- mail
- s1
- default
- selector1
- selector2
- everlytickey1
- everlytickey2
- eversrv
- mxvault
- dkimChecking

## Notes
- Ensure your system has internet connectivity to perform DNS queries.
- You can customize the list of selectors in the script to fit your needs.

## License
This script is free to use and distribute. Modify it as needed for your purposes.

## Contribute
Feel free to contribute or reach out to me @FR13ND0x7F 
