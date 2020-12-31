# Creates the Oracle Wallet
mkstore -wrl c:\oracle\user1\wallet -create

# Stores the DB credentials for the SCOTT user
mkstore -wrl c:\oracle\user1\wallet -createCredential scott_secure scott tiger

# List the credentials stored in the Wallet
mkstore -wrl c:\oracle\user1\wallet -listCredential

# If you have not setup your tnsnames.ora do it now.
# You must have the scott_secure alias listed in your tnsnames.ora file
# You must have the path to the wallet declared too at tnsnames.ora.