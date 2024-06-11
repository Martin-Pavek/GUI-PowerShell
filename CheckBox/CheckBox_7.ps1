cls

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$objForm = New-Object System.Windows.Forms.Form

$objForm.Text          = "Zaloha na BD"
$objForm.Size          = New-Object System.Drawing.Size(800, 400) # 400, 200 bylo
$objForm.StartPosition = "CenterScreen"
# pridano mnou
#$objForm.Font.Bold = ?
#$objForm.Font.Size = 15 ?

$CheckBox_1         = New-Object System.Windows.Forms.CheckBox
$CheckBox_1.Location = New-Object System.Drawing.Size(10, 10) # 10,10 puvodni
$CheckBox_1.Size     = New-Object System.Drawing.Size(500, 20)
$CheckBox_1.Checked  = $false
$CheckBox_1.Checked  = $true
$CheckBox_1.text     = "C:\Users\DELL\Documents\ps1"
# pridano mnou
#$CheckBox_1.Font.Bold.True ?
#$CheckBox_1.Font.Size = 12 ?
$objForm.controls.Add($CheckBox_1)
#

$CheckBox_2          = New-Object System.Windows.Forms.CheckBox
$CheckBox_2.Location = New-Object System.Drawing.Size(10, 30) # 10,50 puvodni atd.
$CheckBox_2.Size     = New-Object System.Drawing.Size(500, 20)
$CheckBox_2.Checked  = $false
$CheckBox_2.Checked  = $true
$CheckBox_2.text     = "1234567890"
$objForm.controls.Add($CheckBox_2)
#

$CheckBox_3          = New-Object System.Windows.Forms.CheckBox
$CheckBox_3.Location = New-Object System.Drawing.Size(10, 50) # 10,90
$CheckBox_3.Size     = New-Object System.Drawing.Size(500, 20)
$CheckBox_3.Checked  = $false
$CheckBox_3.text     = "12345678901234567890"
$objForm.controls.Add($CheckBox_3)
#

echo "zde"
# ----------------------------------------------

$OKButton              = New-Object System.Windows.Forms.Button
$OKButton.Location     = New-Object System.Drawing.Size(10, 120) # 10,120
$OKButton.Size         = New-Object System.Drawing.Size(150, 30) # 150, 30
$OKButton.Text         = "OK"
#$OKButton.Enabled      = $false
#$OKButton.Enabled      = $true
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$objForm.Controls.Add($OKButton)
$objForm.AcceptButton  = $OKButton


#$objForm.TopMost = $True

#$objForm.Controls | Where-Object { $PSItem -is [System.Windows.Forms.RadioButton] } | ForEach-Object { $PSItem.Add_Click( { If (-Not $OKButton.Enabled){ $OKButton.Enabled = $True} }) }

$objForm.Controls | Where-Object { $PSItem -is [System.Windows.Forms.RadioButton] } | ForEach-Object { $PSItem.Add_Click( { If (-Not $OKButton.Enabled){ $OKButton.Enabled = $True} }) }

$Form = $objForm.ShowDialog()
#echo $form"<"
#echo $v"<<"
#echo $PSItem"<<<"
#echo $objForm"<-"


$Out_CheckBox_1 = $CheckBox_1.Checked
echo "CheckBox 1 = $Out_CheckBox_1"

$Out_CheckBox_2 = $CheckBox_2.Checked
echo "CheckBox 2 = $Out_CheckBox_2"

$Out_CheckBox_3 = $CheckBox_3.Checked
echo "CheckBox 3 = $Out_CheckBox_3"

sleep 20


