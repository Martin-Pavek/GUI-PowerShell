cls

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$objForm = New-Object System.Windows.Forms.Form

$objForm.Text          = "RadioButtons"
$objForm.Size          = New-Object System.Drawing.Size(800, 400)
$objForm.StartPosition = "CenterScreen"
#

$RadioButton1          = New-Object System.Windows.Forms.RadioButton
$RadioButton1.Location = New-Object System.Drawing.Size(10, 10) 
$RadioButton1.Size     = New-Object System.Drawing.Size(100, 20)
#$RadioButton1.Checked  = $false
$RadioButton1.Checked  = $true # bude predem oznacen
$RadioButton1.text     = "Button-1"
# zde moje


#
$objForm.controls.Add($RadioButton1)
#

$RadioButton2          = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location = New-Object System.Drawing.Size(150, 10) 
$RadioButton2.Size     = New-Object System.Drawing.Size(100, 20)
$RadioButton2.Checked  = $false
$RadioButton2.text     = "Button-2"
$objForm.controls.Add($RadioButton2)
#

$RadioButton3          = New-Object System.Windows.Forms.RadioButton
$RadioButton3.Location = New-Object System.Drawing.Size(10, 50) 
$RadioButton3.Size     = New-Object System.Drawing.Size(100, 20)
$RadioButton3.Checked  = $false
$RadioButton3.text     = "Button-3"
$objForm.controls.Add($RadioButton3)
#
# ----------------------------------------------
$OKButton              = New-Object System.Windows.Forms.Button
$OKButton.Location     = New-Object System.Drawing.Size(10, 120) 
$OKButton.Size         = New-Object System.Drawing.Size(150, 30) 
$OKButton.Text         = "OK"
$OKButton.Enabled      = $false
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$objForm.Controls.Add($OKButton)
$objForm.AcceptButton  = $OKButton
#

$objForm.TopMost = $True

$objForm.Controls | Where-Object { $PSItem -is [System.Windows.Forms.RadioButton] } | ForEach-Object { $PSItem.Add_Click( { If (-Not $OKButton.Enabled){ $OKButton.Enabled = $True} }) }

$Form = $objForm.ShowDialog()
#echo $form"<"
#echo $v"<<"
#echo $PSItem"<<<"
#echo $objForm"<-"

$out_1=$RadioButton1.AccessibilityObject.State
echo "buton 1 = $out_1"

$out_2=$RadioButton2.AccessibilityObject.State
echo "buton 2 = $out_2"

$out_3=$RadioButton3.AccessibilityObject.State
echo "buton 3 = $out_3"

sleep 20


