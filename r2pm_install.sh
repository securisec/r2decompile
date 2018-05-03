R2PM_BEGIN

R2PM_GIT "https://github.com/securisec/r2retdec"
R2PM_DESC "[r2retdec] Use local opensource retdec to decompile functions"

R2PM_DOC="
usage: $r2retdec [-h] [-p] [-t FILE]

r2retdec help

Optional arguments:
  -h, --help  Show this help message and exit.
  -t TMP      Set temp file for decompiled code
  -p          Print decompilation to stdout

Invoke from inside r2 shell with $dec
"

R2PM_INSTALL() {
    cd ${R2PM_GITDIR}/r2retdec
    npm install || exit 1
    cd -
	echo '$'dec="#"'!'"pipe node ${R2PM_GITDIR}/r2retdec/r2retdec.js" >> ~/.radare2rc || exit 1
	echo "\n[+] r2retdec has been installed"
  echo "\n[*] Make sure to put the path to retdec-decompiler.sh in \$HOME/.r2retdec"
}

R2PM_UNINSTALL() {
	rm -rf "${R2PM_GITDIR}"/r2retdec
}

R2PM_END