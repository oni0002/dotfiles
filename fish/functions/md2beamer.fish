function md2beamer
    set -l mdfile $argv
    set -l pdffile (basename $mdfile .md).pdf
    command pandoc $mdfile -d beamer_def.yaml -o $pdffile
end
