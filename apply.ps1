param (
    [string]$Environment,
	[string]$SubscriptionName
)

process {
    Write-Host ("Setting default subscription for az account to to: {0}" -f $SubscriptionName)
	az account set -s $SubscriptionName

	$SUBSCRIPTION_ID = $(az account show --query 'id' --output tsv)
	$SERVICE_PRINCIPAL_ID = $Env:servicePrincipalId
	$SERVICE_PRINCIPAL_KEY = $Env:servicePrincipalKey
	$TENENT_ID = $Env:tenantId
	$PROJECT_DIR = "$($PSScriptRoot)/envs/azwe-$($Environment)"
	$SIGNEDIN_USER = $(az account show --query 'user.name' --output tsv)
	$SIGNEDIN_USER_OBJECTID = $(az ad sp show --id ${SIGNEDIN_USER} --query 'objectId' --output tsv)
	Set-Item env:ARM_CLIENT_ID -Value $Env:servicePrincipalId
	Set-Item env:ARM_CLIENT_SECRET -Value $Env:servicePrincipalKey
	Set-Item env:ARM_SUBSCRIPTION_ID -Value $(az account show --query 'id' --output tsv)
	Set-Item env:ARM_TENANT_ID -Value $Env:tenantId
	Set-Item env:AAD_PROVIDER_ENABLE_MSGRAPH -Value true
	cd $PROJECT_DIR

	Write-Host  "applying plan"
	terragrunt apply -var "tenant=$($TENENT_ID)" -var "subscription_id=$($SUBSCRIPTION_ID)" -var "client_id=$($SERVICE_PRINCIPAL_ID)" -var "client_secret=$($SERVICE_PRINCIPAL_KEY)" -auto-approve
}