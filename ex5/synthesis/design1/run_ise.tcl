#########################
###  DEFINE VARIABLES ###
#########################
set DesignName	"design1"
set FamilyName	"VIRTEX4"
set DeviceName	"XC4VFX12"
set PackageName	"SF363"
set SpeedGrade	"-12"
set TopModule	"ex5.design1"
set EdifFile	"design1.edf"
if {![file exists $DesignName.ise]} {

project new $DesignName.ise

project set family $FamilyName
project set device $DeviceName
project set package $PackageName
project set speed $SpeedGrade

xfile add $EdifFile
if {[file exists synplicity.ucf]} {
    xfile add synplicity.ucf
}

#project set {Placer Effort Level (Overrides Overall Level)} "High"
#project set {Router Effort Level (Overrides Overall Level)} "High"
project set {Place & Route Effort Level (Overall)} "High"

project close
}

project open $DesignName.ise

process run "Implement Design" -force rerun_all

project close

