# Remote File Bridge

This repository contains two scripts to facilitate file uploads to the `remotefilebridge.com` API endpoint. One script is written in Bash for Unix-like environments, and the other is written in PowerShell for Windows environments.

## Bash Script

The Bash script `upload.sh` is designed to run on Unix-like operating systems. It takes a file path and a security token as parameters to upload a file to the API endpoint.

### Usage

1. Ensure the script is executable:

```bash
chmod +x upload.sh
```

2. Execute the script by passing the file path and the security token:

```bash
./upload.sh /path/to/your/file.txt your-security-token
```

Replace `/path/to/your/file.txt` with the actual file path and your-security-token with the security token provided.

## PowerShell Script
The PowerShell script `upload.ps1` is designed for Windows environments. It also takes a file path and a security token as parameters.

### Prerequisites
Ensure that the execution policy allows running scripts. You can set the execution policy for the current user to `RemoteSigned` with the following command:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Usage
1. Run the PowerShell script by providing the file path and the security token:

```powershell
.\upload.ps1 -FilePath "C:\path\to\your\file.txt" -Token "your-security-token"
```

Replace `"C:\path\to\your\file.txt"` with the actual file path and `"your-security-token"` with the security token provided.

## Common Issues
- Ensure that the `file` command (used in the Bash script) or the corresponding MIME type detection method (used in the PowerShell script) is available and functioning on your system.
- The scripts assume that the API endpoint and the method for passing the security token are correctly configured and operational.
- Network connectivity issues or incorrect API endpoint URLs may cause the scripts to fail.

For further assistance, please contact the system administrator or refer to the API documentation.