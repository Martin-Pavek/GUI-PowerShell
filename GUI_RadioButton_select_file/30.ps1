cls
$nazev_adresare_klice = "./keys"
#$nazev_adresare_klice = "./keys_test"
$nazev_adresare_klice_exist = Test-Path $nazev_adresare_klice
if ($nazev_adresare_klice_exist -clike "False"){
echo "neni adresar $nazev_adresare_klice"
sleep 5
exit
}

$klice = @(Get-ChildItem $nazev_adresare_klice -Include '*.txt' -Name)
$d_klice = $klice.length - 1
#echo $d_klice

if ($d_klice -clike -1) {
echo "zadne klice v adresari $nazev_adresare_klice"
echo "konec programu"
sleep 3
Exit
}

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$objForm = New-Object System.Windows.Forms.Form
$objForm.Text = "volba souboru klice"
$objForm.AutoScroll = $true # udela vertical i horizontal scroolbar funguje dobre, bez chyb
#$objForm.VerticalScroll = $false
#$objForm.HorizontalScroll = $true
$objForm.Size = New-Object System.Drawing.Size(800, 900) # 400, 900 velikost hlavniho okna
$objForm.StartPosition = "CenterScreen"
#
$sel_file_key=""
$x=10
$y=5

# v cyklu vygeneruje pole RadioButtons podle poctu souboru klicu a adresari ./keys
$RadioButton=@()

for ($aa = 0; $aa -le $d_klice; $aa++) {
$RadioButton+=""
$RadioButton[$aa] = New-Object System.Windows.Forms.RadioButton # $RadioButton[0] uz je predem definovany zatim jako prazdny
$RadioButton[$aa].Location = New-Object System.Drawing.Size($x, $y)
$y=( $y + 20 )
$RadioButton[$aa].Size = New-Object System.Drawing.Size(700, 20) # 700, 20
$RadioButton[$aa].Checked = $false
$RadioButton[$aa].text = $klice[$aa]
$objForm.controls.Add($RadioButton[$aa])
}

echo "pocet klicu je"
echo $RadioButton.Length
# max 40 klicu, nez to narazi do tlacitka OK ( to by mohlo stacit )

# ----------------------------------------------
$OKButton              = New-Object System.Windows.Forms.Button
#$OKButton.Location     = New-Object System.Drawing.Size(125, 810 )
$OKButton.Location     = New-Object System.Drawing.Size(337, ($y+20) )
$OKButton.Size         = New-Object System.Drawing.Size(150, 30) # 150, 30
$OKButton.Text         = "OK"
#$OKButton.Enabled      = $false
$OKButton.Enabled      = $true
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$objForm.Controls.Add($OKButton)

$objForm.AcceptButton  = $OKButton
$objForm.TopMost = $True
$objForm.Controls | Where-Object { $PSItem -is [System.Windows.Forms.RadioButton] } | ForEach-Object { $PSItem.Add_Click( { If (-Not $OKButton.Enabled){ $OKButton.Enabled = $True} }) }

$Form = $objForm.ShowDialog()
#echo $form"<"
#echo $v"<<"
#echo $PSItem"<<<"
#echo $objForm"<-"

#exit

for ($cc = 0; $cc -le $d_klice; $cc++) {
#echo $cc
#echo $RadioButton[$cc].AccessibilityObject.state
if ( $RadioButton[$cc].AccessibilityObject.state -like "Checked, Focusable" ){
#echo $klice[$cc]
#$sel_file=$key_file_name[$bb]
$sel_file_key=$klice[$cc]
break
}
}

if ( $sel_file_key.Length -eq 0 ){
echo "nic nevybrano, konec"
sleep 3
Exit 1
}

echo "vybran soubor klice $sel_file_key"
sleep 3



