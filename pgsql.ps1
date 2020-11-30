param (
    [string]$Database,
    [string]$HostName,
    [string]$Username,
    [string]$Password
)

process {
    Write-Host "//===========================================================================//"
    Write-Host "//Applying to DB-$($Database), Host-$($HostName)===//"
    $SSL_MODE = "require"
    Set-Item env:PGPASSWORD -Value $Password
    Set-Item env:PGSSLMODE -Value $SSL_MODE
    Write-Host "//===Creating addons schema for pg expentions===//"
    psql -d $Database -h $HostName -U $Username -c "CREATE SCHEMA IF NOT EXISTS addons AUTHORIZATION citus"
    Write-Host "//============Creating pg_partman===============//"
    psql -d $Database -h $HostName -U $Username -c "CREATE EXTENSION IF NOT EXISTS pg_partman SCHEMA addons"
}