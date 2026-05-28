# Stel SVELLLOBP020 als primair

Install Az Powershell
Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Repository PSGallery -Force
Update-Module -Name Az -Force

# Change login
Update-AzConfig -EnableLoginByWam $false
# Update-AzConfig -EnableLoginByWam $true

# Login Azure in subscription AzureSubFalcon
Connect-AzAccount -SubscriptionId ''

# $SecurePassword = ConvertTo-SecureString -String "DaemonConsoleCert" -AsPlainText -Force
# Connect-AzAccount -ServicePrincipal -ApplicationId '' -TenantId '' -CertificatePath './DaemonConsoleCert.pfx' -CertificatePassword $SecurePassword -SubscriptionId ''

# Login Azure in subscription FLCCopacoPlan
# Connect-AzAccount -SubscriptionId ''

# $SecurePassword = ConvertTo-SecureString -String "DaemonConsoleCert" -AsPlainText -Force
# Connect-AzAccount -ServicePrincipal -ApplicationId '' -TenantId '' -CertificatePath './DaemonConsoleCert.pfx' -CertificatePassword $SecurePassword -SubscriptionId ''

# Alle netwerkkaart configs naar een buiten de scope liggende ipadres

$nic = Get-AzNetworkInterface -Name nic-SVELLLOBP020-00 -ResourceGroupName RG_EL_WE_01
$vnet = Get-AzVirtualNetwork -Name VN_EL_we_Main -ResourceGroupName RG_EL_WE_01
$subnet = Get-AzVirtualNetworkSubnetConfig -Name ellis_prd_210 -VirtualNetwork $vnet
Set-AzNetworkInterfaceIpConfig -Name nic-SVELLLOBP020-00-ipConfig2 -NetworkInterface $nic -Subnet $subnet -PrivateIpAddress 10.0.210.120
Set-AzNetworkInterface -NetworkInterface $nic

# $nic = Get-AzNetworkInterface -Name nic-SVELLLOBP021-00 -ResourceGroupName RG_EL_WE_01
# $vnet = Get-AzVirtualNetwork -Name VN_EL_we_Main -ResourceGroupName RG_EL_WE_01
# $subnet = Get-AzVirtualNetworkSubnetConfig -Name ellis_prd_210 -VirtualNetwork $vnet
# Set-AzNetworkInterfaceIpConfig -Name nic-SVELLLOBP021-00-ipConfig2 -NetworkInterface $nic -Subnet $subnet -PrivateIpAddress 10.0.210.121
# Set-AzNetworkInterface -NetworkInterface $nic

$nic = Get-AzNetworkInterface -Name nic-SVELLLOBP022-00 -ResourceGroupName RG_EL_WE_01
$vnet = Get-AzVirtualNetwork -Name VN_EL_we_Main -ResourceGroupName RG_EL_WE_01
$subnet = Get-AzVirtualNetworkSubnetConfig -Name ellis_prd_210 -VirtualNetwork $vnet
Set-AzNetworkInterfaceIpConfig -Name nic-SVELLLOBP022-00-ipConfig2 -NetworkInterface $nic -Subnet $subnet -PrivateIpAddress 10.0.210.122
Set-AzNetworkInterface -NetworkInterface $nic

# Stel SVELLLOBP020 als primair

$nic = Get-AzNetworkInterface -Name nic-SVELLLOBP020-00 -ResourceGroupName RG_EL_WE_01
$vnet = Get-AzVirtualNetwork -Name VN_EL_we_Main -ResourceGroupName RG_EL_WE_01
$subnet = Get-AzVirtualNetworkSubnetConfig -Name ellis_prd_210 -VirtualNetwork $vnet
Set-AzNetworkInterfaceIpConfig -Name nic-SVELLLOBP020-00-ipConfig2 -NetworkInterface $nic -Subnet $subnet -PrivateIpAddress 10.0.210.109
Set-AzNetworkInterface -NetworkInterface $nic