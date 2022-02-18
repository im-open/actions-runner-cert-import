Param(
    [Parameter(Mandatory = $true)]
    [string]$cert_path,
    [Parameter(Mandatory = $true)]
    [string]$cert_store,
    [Parameter(Mandatory = $false)]
    [SecureString]$cert_password,
    [Parameter(Mandatory = $true)]
    [bool]$is_pfx_cert
)

# validate
if ($is_pfx_cert -and -not $cert_password) {
    Write-Error "Password must be specified for certs containing private key" -ErrorAction Stop
}

try {
    $cert_args = @{
        FilePath          = $cert_path
        CertStoreLocation = $cert_store
    }

    if ($is_pfx_cert) {
        $cert_args['Password'] = $cert_password
        Import-PfxCertificate @cert_args
    }
    else {
        Import-Certificate @cert_args
    }

    Write-Host "Certificate Imported"
}
catch {
    Write-Error "Error Importing Cert"
    Write-Error $_ -ErrorAction Stop
}