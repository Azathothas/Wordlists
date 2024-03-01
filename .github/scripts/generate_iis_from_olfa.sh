#!/usr/bin/env bash

# NOT TESTED

#---------------------------------------------------------------------------------#
#Install anew-rs
 sudo curl -qfsSL "https://bin.ajam.dev/x86_64_Linux/anew-rs" -o "/usr/local/bin/anew-rs" && sudo chmod +xwr "/usr/local/bin/anew-rs"
#Install Duplicut
 pushd "$(mktemp -d)" && git clone "https://github.com/nil0x42/duplicut" && cd duplicut
 make ; sudo mv "./duplicut" "/usr/local/bin/duplicut" ; sudo chmod +xwr "/usr/local/bin/duplicut" ; popd
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
#Clone OneListForAll
 pushd "$(mktemp -d)" && git clone "https://github.com/six2dez/OneListForAll" && cd OneListForAll
#Generate OneForAll
 bash "./olfa.sh"
#------------# 
#Generate Mid
#Extensions: https://github.com/Azathothas/Wordlists/blob/main/Misc/IIS/extensions_all_dots.txt
#Filters: anything starting with a dot or *, or has + % ~ In Name
#From "./onelistforallshort.txt"
 grep -i '.accdb$\|.accdr$\|.asar$\|.asax$\|.ash$\|.ashx$\|.asmx$\|.asp$\|.aspx$\|.axd$\|.bat$\|.bin$\|.cnf$\|.conf$\|.config$\|.csv$\|.dat$\|.dll$\|.doc$\|.docm$\|.docx$\|.eml$\|.eps$\|.evt$\|.evtx$\|.html$\|.ini$\|.iso$\|.jar$\|.log$\|.mas$\|.msi$\|.potm$\|.ppsm$\|.ppsx$\|.pptx$\|.rar$\|.rtf$\|.sldm$\|.sldx$\|.sys$\|.tmp$\|.txt$\|.wadl$\|.wbk$\|.wks$\|.wsdl$\|.xlsm$\|.xltm$\|.xml$\|.xps$\|.zip$' "./onelistforallshort.txt" | sed 's/^http\(\|s\):\/\///g' | grep -vE '^\.|[+%~]|^\*' | sed 's/^\///' | sed -e '/^[[:space:]]*$/d' | sort -u -o "/tmp/iis_mid.txt"
#Fetch from origin
 cat "$GITHUB_WORKSPACE/main/Misc/IIS/iis_mini.txt" | anew-rs -q "/tmp/iis_mid.txt"
#Sort and add to exsisting
 sort -u "/tmp/iis_mid.txt" | anew-rs -q "$GITHUB_WORKSPACE/main/Misc/IIS/iis_mid.txt"
 sort -u "$GITHUB_WORKSPACE/main/Misc/IIS/iis_mid.txt" -o "$GITHUB_WORKSPACE/main/Misc/IIS/iis_mid.txt"
#------------# 
#Generate Large
#Extensions: https://github.com/Azathothas/Wordlists/blob/main/Misc/IIS/extensions_all_dots.txt
#Filters: anything starting with a dot or *, or has + % ~ In Name
#       : .txt & .html files
#From "./onelistforall.txt"
grep -i '.accdb$\|.accdr$\|.asar$\|.asax$\|.ash$\|.ashx$\|.asmx$\|.asp$\|.aspx$\|.axd$\|.bat$\|.bin$\|.cnf$\|.conf$\|.config$\|.csv$\|.dat$\|.dll$\|.doc$\|.docm$\|.docx$\|.eml$\|.eps$\|.evt$\|.evtx$\|.html$\|.ini$\|.iso$\|.jar$\|.log$\|.mas$\|.msi$\|.potm$\|.ppsm$\|.ppsx$\|.pptx$\|.rar$\|.rtf$\|.sldm$\|.sldx$\|.sys$\|.tmp$\|.txt$\|.wadl$\|.wbk$\|.wks$\|.wsdl$\|.xlsm$\|.xltm$\|.xml$\|.xps$\|.zip$' "./onelistforall.txt" | grep -iv '.txt$\|.html$' | sed 's/^http\(\|s\):\/\///g' | grep -vE '^\.|[+%~]|^\*' | sed 's/^\///' | sed -E 's/[[:alpha:]]*[[:digit:]][[:alpha:]]*//g; /^[[:space:]]*$/d' | sort -u -o "/tmp/iis_large.txt"
#Filter
 #Remove /
 sed 's/^\/\+//' -i "/tmp/iis_large.txt"
 #Remove anything starting with Dots
 sed 's/^\.\+//' -i "/tmp/iis_large.txt"
 #Repeat
 sed 's/^\/\+//' -i "/tmp/iis_large.txt" ; sed 's/^\.\+//' -i "/tmp/iis_large.txt"
 sed 's/^\/\+//' -i "/tmp/iis_large.txt" ; sed 's/^\.\+//' -i "/tmp/iis_large.txt"
 sed 's/^\/\+//' -i "/tmp/iis_large.txt" ; sed 's/^\.\+//' -i "/tmp/iis_large.txt"
 #Remove lines with spaces In Between
 sed -E '/\s+/d' -i "/tmp/iis_large.txt"
 #Remove Special Chars
 sed -E '/^[:"'\''#$&)(*\-]/d' -i "/tmp/iis_large.txt"
#Fetch from origin
 cat "$GITHUB_WORKSPACE/main/Misc/IIS/iis_mid.txt" | anew-rs -q "/tmp/iis_large.txt"
#Sort and add to exsisting
 sort -u "/tmp/iis_large.txt" | anew-rs -q "$GITHUB_WORKSPACE/main/Misc/IIS/iis_large.txt"
 sort -u "$GITHUB_WORKSPACE/main/Misc/IIS/iis_large.txt" -o "$GITHUB_WORKSPACE/main/Misc/IIS/iis_large.txt"
#------------# 
#This will fail, as the output > 100 MB (Larger than GH Limit)
#Generate Massive
#Extensions: https://github.com/Azathothas/Wordlists/blob/main/Misc/IIS/extensions_all_dots.txt
#Filters: anything starting with a dot or *, or has + % ~ In Name
#From "./onelistforall.txt" 
cat "/tmp/iis_large.txt" | anew-rs -q "/tmp/iis_massive.txt"
grep -i '.accdb$\|.accdr$\|.asar$\|.asax$\|.ash$\|.ashx$\|.asmx$\|.asp$\|.aspx$\|.axd$\|.bat$\|.bin$\|.cnf$\|.conf$\|.config$\|.csv$\|.dat$\|.dll$\|.doc$\|.docm$\|.docx$\|.eml$\|.eps$\|.evt$\|.evtx$\|.html$\|.ini$\|.iso$\|.jar$\|.log$\|.mas$\|.msi$\|.potm$\|.ppsm$\|.ppsx$\|.pptx$\|.rar$\|.rtf$\|.sldm$\|.sldx$\|.sys$\|.tmp$\|.txt$\|.wadl$\|.wbk$\|.wks$\|.wsdl$\|.xlsm$\|.xltm$\|.xml$\|.xps$\|.zip$' "./onelistforall.txt" | sed 's/^http\(\|s\):\/\///g' | grep -vE '^\.|[+%~]|^\*' | sed 's/^\///' | sed -E 's/[[:alpha:]]*[[:digit:]][[:alpha:]]*//g; /^[[:space:]]*$/d' | sort -u -o "/tmp/iis_massive.txt"
#Fetch from origin
 cat "$GITHUB_WORKSPACE/main/Misc/IIS/iis_large.txt" | anew-rs -q "/tmp/iis_massive.txt"
#Sort and add to exsisting
 sort -u "/tmp/iis_massive.txt" | anew-rs -q "$GITHUB_WORKSPACE/main/Misc/IIS/iis_massive.txt"
 sort -u "$GITHUB_WORKSPACE/main/Misc/IIS/iis_massive.txt" -o "$GITHUB_WORKSPACE/main/Misc/IIS/iis_massive.txt"
#---------------------------------------------------------------------------------#
#EOF
#---------------------------------------------------------------------------------#
